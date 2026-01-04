// 2D fireworks 
// 
// * self link: https://www.shadertoy.com/view/Wc3BDX
//
// * inspired by 
//   * Lesson 34 Fireworks in Three.js Journey (https://threejs-journey.com/).
//
// * to test
//   * click the canvas to spawn a firework.

#define PI 3.14159
#define DURATION 3.
#define MAX_CILCK_NUM 10
#define PROGRESS 0.003

#define PARTICAL_CNT 100

float remap(float value, float originMin, float originMax, float destinationMin, float destinationMax)
{
    return destinationMin + (value - originMin) * (destinationMax - destinationMin) / (originMax - originMin);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 p = (2.*fragCoord-iResolution.xy)/iResolution.y;
    
    vec3 col = vec3(0.0);
    
    for (int i = MAX_CILCK_NUM; i >= 0; --i)
    {
        vec4 click = texelFetch(iChannel0, ivec2(i,0), 0);
        
        if(i == MAX_CILCK_NUM){
            float clickTime = iTime - mod(iTime, DURATION) + 0.5;
            click = vec4(clickTime, 1.0, hash21(clickTime));
        }
        
        
        float clickTime = click.r;
        
        if (clickTime < 0.0) continue;

        float t = iTime - clickTime; 
        
        vec2 clickUV = click.ba;  // normalized [0,1]
        vec2 clickPos = (clickUV * iResolution.xy * 2.0 - iResolution.xy) / iResolution.y;

        vec3 sparkColor = hash31(clickTime);
        vec2 originPos = clickPos;
        float maxRadius = 0.5 + 0.5 * sparkColor.z;
        
        float fade = 1. - smoothstep(0.0, DURATION, t);
        
        int particle_cnt = int(float(PARTICAL_CNT) * (2. + hash11(clickTime)));

        for (int i = 0; i < particle_cnt; ++i){
            vec3 h = hash31(float(i)+clickTime);
            
            float r = pow(h.x, 0.3) * maxRadius;
            
            float progress = smoothstep(0.0, DURATION, t);
            progress *= (1. + h.y);
            
            float explodingProgress = remap(progress, 0.0, 0.1, 0.0, 1.0);
            explodingProgress = clamp(explodingProgress, 0.0, 1.0);
            explodingProgress = 1.0 - pow(1.0 - explodingProgress, 3.0);
            r *= explodingProgress;
            
            float theta = h.z * PI * 2.;

            vec2 sparkPos = originPos + vec2(r * sin(theta), r * cos(theta));
            
            // Falling
            float fallingProgress = remap(progress, 0.1, 1.0, 0.0, 1.0);
            fallingProgress = clamp(fallingProgress, 0.0, 1.0);
            fallingProgress = 1.0 - pow(1.0 - fallingProgress, 3.0);
            sparkPos.y -= fallingProgress * 0.1;

            // Distance from pixel to spark
            float d = length(p - sparkPos);
            
            // Scaling
            float sizeOpeningProgress = remap(progress, 0.0, 0.125, 0.0, 1.0);
            float sizeClosingProgress = remap(progress, 0.125, 1.0, 1.0, 0.0);
            float sizeProgress = min(sizeOpeningProgress, sizeClosingProgress);
            sizeProgress = clamp(sizeProgress, 0.0, 1.0);
            
            // Twinkling
            float twinklingProgress = remap(progress, 0.2, 0.8, 0.0, 1.0);
            twinklingProgress = clamp(twinklingProgress, 0.0, 1.0);
            float sizeTwinkling = sin(progress * 30.0) * 0.5 + 0.5;
            sizeTwinkling = 1.0 - sizeTwinkling * twinklingProgress;

            // Spark brightness
            float spark = smoothstep(0.05 * sizeProgress * sizeTwinkling, 0.0, d);
            spark = spark + pow(spark, 2.0);
            
            col += spark * fade * sparkColor;
            col = min(col, vec3(1.0));
        }
    }
    
    // Output to screen
    fragColor = vec4(col, 1.0);
}