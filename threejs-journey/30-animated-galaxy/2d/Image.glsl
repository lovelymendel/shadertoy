// A 2D spiral galaxy whirling up until it reaches a pre-defined critical point
//
// * self link: https://www.shadertoy.com/view/tfdBDf
//
// * inspired by:
//   * https://www.shadertoy.com/view/NsVfWD
//   * https://www.shadertoy.com/view/3sSXDc
//   * Lesson 30 Animated Galaxy in Three.js Journey (https://threejs-journey.com/).

#define ARM_COUNT 4.
#define START_WHIRL 5.0
#define END_WHIRL 20.0
#define WHIRL_SPEED 2.0
#define SPEED_UP_TIME (END_WHIRL - START_WHIRL) / WHIRL_SPEED
#define PI 3.14159265

#define saturate(x) clamp(x, 0.0, 1.0);

float rand(highp vec2 c){	
	return fract(sin(dot(c ,vec2(12.9898,78.233))) * 43758.5453);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord/iResolution.xy - 0.5;
    uv.x *= iResolution.x/iResolution.y;
   
    float angleOffset = - iTime * WHIRL_SPEED;
    
    if (iTime > SPEED_UP_TIME) {
        angleOffset = - SPEED_UP_TIME * WHIRL_SPEED - (iTime - SPEED_UP_TIME) * WHIRL_SPEED / PI;
    } 
        
    vec2 pos = vec2((atan(uv.y,uv.x)) + angleOffset, sqrt(uv.x*uv.x + uv.y*uv.y));
    float g = pow(1.-pos.y, 10.)*10.;
    
    float whirl = START_WHIRL + iTime * WHIRL_SPEED;
    whirl = clamp(whirl, START_WHIRL, END_WHIRL);
    float gal = saturate(((sin((pos.x + pow(pos.y, 0.2)*whirl) * ARM_COUNT)*0.5+0.5) + g - pos.y*2.2)/6.0);
    

    float stars = step(rand(uv), gal);
    
    vec3 col = mix(vec3(1.0, 1.0, 0.4), vec3(0.1, 0.0, 1.0), length(uv)*4.0);
    fragColor = vec4((gal*col)+(stars*0.5),1.0);
}