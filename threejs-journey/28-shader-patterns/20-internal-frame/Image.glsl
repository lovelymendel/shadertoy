// Internal frame
//
// self link: https://www.shadertoy.com/view/3fcBR2

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;
    
    float innerWhite = 1.0 - step(0.25, max(abs(uv.x - 0.5), abs(uv.y - 0.5)));
    float outerWhite = step(0.2, max(abs(uv.x - 0.5), abs(uv.y - 0.5)));
    float strength = innerWhite * outerWhite;
     
    // Output to screen
    fragColor = vec4(vec3(strength), 1.0);
}