// Colored corner grid

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;

    float barX = step(0.4, mod(uv.x * 10.0, 1.0)) * step(0.8, mod(uv.y * 10.0, 1.0));
    float barY = step(0.8, mod(uv.x * 10.0, 1.0)) * step(0.4, mod(uv.y * 10.0, 1.0));
    float strength = barX + barY;
    strength = clamp(strength, 0.0, 1.0);

    vec3 blackColor = vec3(0.0);
    vec3 uvColor = vec3(uv, 1.0);
    vec3 mixedColor = mix(blackColor, uvColor, strength);

    // Output to screen
    fragColor = vec4(vec3(mixedColor), 1.0);
}