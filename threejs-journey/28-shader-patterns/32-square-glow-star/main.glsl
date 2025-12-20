// Square glow star

#define PI 3.1415926535897932384626433832795

vec2 rotate(vec2 uv, float rotation, vec2 mid)
{
    return vec2(
      cos(rotation) * (uv.x - mid.x) + sin(rotation) * (uv.y - mid.y) + mid.x,
      cos(rotation) * (uv.y - mid.y) - sin(rotation) * (uv.x - mid.x) + mid.y
    );
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;

    // float strength = 0.15 / (distance(vec2(uv.x, ((uv.y + uv.x) - 1.0) * 5.0 + 0.5), vec2(0.5)));
    // strength *= 0.15 / (distance(vec2(uv.y, (uv.x - uv.y) * 5.0 + 0.5), vec2(0.5)));
    
    vec2 rotatedUv = rotate(uv, PI * 0.25, vec2(0.5));
    float strength = 0.15 / (distance(vec2(rotatedUv.x, (rotatedUv.y - 0.5) * 5.0 + 0.5), vec2(0.5)));
    strength *= 0.15 / (distance(vec2(rotatedUv.y, (rotatedUv.x - 0.5) * 5.0 + 0.5), vec2(0.5)));

    // Output to screen
    fragColor = vec4(vec3(strength), 1.0);
}