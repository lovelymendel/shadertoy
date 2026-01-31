void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    int i = int(fragCoord.x);

    vec4 old = texelFetch(iChannel0, ivec2(i,0), 0);

    // Detect new click
    bool click = (iMouse.z > 0.0) &&
                 (texelFetch(iChannel0, ivec2(0,0), 0).g <= 0.0);

    vec4 value = old;

    if (click)
    {
        if (i == 0)
        {
            // Store new click
            value = vec4(
                iTime,
                iMouse.z,
                iMouse.x / iResolution.x,
                iMouse.y / iResolution.y
            );
        }
        else
        {
            // Shift older clicks
            value = texelFetch(iChannel0, ivec2(i-1,0), 0);
        }
    }

    // Ensure G channel is updated for click detection
    if (i == 0)
    {
        fragColor = vec4(value.r, iMouse.z, value.b, value.a);
    }
    else
    {
        fragColor = value;
    }
}
