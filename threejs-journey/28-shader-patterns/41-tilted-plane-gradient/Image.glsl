// Tilted plane gradient
//
// self link: https://www.shadertoy.com/view/tfcBzj

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;
    
    float angle = atan(uv.x - 0.5, uv.y - 0.5);
    float strength = angle;
    
    // Output to screen
    fragColor = vec4(vec3(strength), 1.0);
}