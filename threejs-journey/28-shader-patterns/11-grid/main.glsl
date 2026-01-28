// Grid
//
// * self link: https://www.shadertoy.com/view/3ccBRj

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;

    float strength = step(0.8, mod(uv.x * 10.0, 1.0));
    strength += step(0.8, mod(uv.y * 10.0, 1.0));

    // Output to screen
    fragColor = vec4(vec3(strength), 1.0);
}