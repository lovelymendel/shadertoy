// UV up white down black

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;

    float strength = uv.y;

    // Output to screen
    fragColor = vec4(vec3(strength), 1.0);
}