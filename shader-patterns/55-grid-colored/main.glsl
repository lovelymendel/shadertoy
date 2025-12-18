// Colored grid

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;

    float strength = step(0.8, mod(uv.x * 10.0, 1.0));
    strength += step(0.8, mod(uv.y * 10.0, 1.0));
    strength = clamp(strength, 0.0, 1.0);

    vec3 blackColor = vec3(0.0);
    vec3 uvColor = vec3(uv, 1.0);
    vec3 mixedColor = mix(blackColor, uvColor, strength);

    // Output to screen
    fragColor = vec4(vec3(mixedColor), 1.0);
}