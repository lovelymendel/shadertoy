// Bright fan
//
// self link: https://www.shadertoy.com/view/wccfR2

#define PI 3.1415926535897932384626433832795

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;
    
    float angle = atan(uv.x - 0.5, uv.y - 0.5) / (PI * 2.0) + 0.5;
    float strength = mod(angle * 20.0, 1.0);
    
    // Output to screen
    fragColor = vec4(vec3(strength), 1.0);
}