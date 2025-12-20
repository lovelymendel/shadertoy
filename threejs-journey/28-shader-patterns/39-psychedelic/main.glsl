// Psychedelic

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;
    
    vec2 wavedUv = vec2(
        uv.x + sin(uv.y * 100.0) * 0.1,
        uv.y + sin(uv.x * 100.0) * 0.1
    );
    float strength = 1.0 - step(0.02, abs(distance(wavedUv, vec2(0.5)) - 0.25));
    
    // Output to screen
    fragColor = vec4(vec3(strength), 1.0);
}