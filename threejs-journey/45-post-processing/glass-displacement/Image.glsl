// Glass displacement 
// 
// * self link: https://www.shadertoy.com/view/WXKyWc
//
// * inspired by 
//   * Lesson 45 Post-processing in Three.js Journey (https://threejs-journey.com/).
//
// * to test
//   * drag around on the canvas.
//   * try a normal map, in your browser console, run 
//     * gShaderToy.SetTexture(1, {mSrc:'https://raw.githubusercontent.com/lovelymendel/shadertoy/refs/heads/mendel/threejs-journey/45-post-processing/normal.png', mType:'texture', mID:1, mSampler:{ filter: 'mipmap', wrap: 'repeat', vflip:'true', srgb:'false', internal:'byte' }});


void mainImage( out vec4 fragColor, in vec2 fragCoord ) {
    vec2 uv = fragCoord / iResolution.xy;

    vec3 normalColor = texture(iChannel1, uv).xyz * 2.0 - 1.0;
    vec2 newUv = uv + normalColor.xy * 0.1;
    vec4 color = texture(iChannel0, newUv);

    vec3 lightDirection = normalize(vec3(- 1.0, 1.0, 0.0));
    float lightness = clamp(dot(normalColor, lightDirection), 0.0, 1.0);
    color.rgb += lightness * 2.0;

    fragColor = color;
}