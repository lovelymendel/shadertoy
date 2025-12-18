// Skewed TV noise

float random(vec2 st)
{
    return fract(sin(dot(st.xy, vec2(12.9898,78.233))) * 43758.5453123);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;

    float gridU = floor(uv.x * 10.0) / 10.0;
    float gridV = floor((uv.y + uv.x * 0.5) * 10.0) / 10.0;
    float rnd = random(vec2(gridU, gridV));

    // Output to screen
    fragColor = vec4(vec3(rnd), 1.0);
}