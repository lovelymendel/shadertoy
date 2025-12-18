// Glow star

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;

    float strength = 0.15 / (distance(vec2(uv.x, (uv.y - 0.5) * 5.0 + 0.5), vec2(0.5)));
    strength *= 0.15 / (distance(vec2(uv.y, (uv.x - 0.5) * 5.0 + 0.5), vec2(0.5)));

    // Output to screen
    fragColor = vec4(vec3(strength), 1.0);
}