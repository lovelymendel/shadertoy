// Vertical lines

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;

    float strength = mod(uv.x * 10.0, 1.0);
    strength = step(0.8, strength);

    // Output to screen
    fragColor = vec4(vec3(strength), 1.0);
}