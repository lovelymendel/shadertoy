// Wavy circle

#define PI 3.1415926535897932384626433832795

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;
    
    float angle = atan(uv.x - 0.5, uv.y - 0.5) / (PI * 2.0) + 0.5;
    float radius = 0.25 + sin(angle * 100.0) * 0.02;
    float strength = 1.0 - step(0.01, abs(distance(uv, vec2(0.5)) - radius));
    
    // Output to screen
    fragColor = vec4(vec3(strength), 1.0);
}