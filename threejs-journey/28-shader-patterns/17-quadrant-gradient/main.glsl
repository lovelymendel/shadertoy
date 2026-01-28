// Quadrant gradient
//
// self link: https://www.shadertoy.com/view/3ccfzj

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;
    
    float strength = min(abs(uv.x - 0.5) , abs(uv.y - 0.5));

    // Output to screen
    fragColor = vec4(vec3(strength), 1.0);
}