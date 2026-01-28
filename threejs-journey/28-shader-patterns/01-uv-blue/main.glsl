// UV blue
//
// * self link: https://www.shadertoy.com/view/wfdfRB

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;

    // Output to screen, with blue value being 1
    fragColor = vec4(uv, 1.0, 1.0);
}