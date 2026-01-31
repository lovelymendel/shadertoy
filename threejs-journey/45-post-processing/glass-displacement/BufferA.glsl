void mainImage( out vec4 fragColor, in vec2 fragCoord ) {
    vec2 uv = fragCoord / iResolution.xy;
        
    float yaw = 1.0; // [-PI, PI]
    float pitch = 1.0; // (-PI / 2.0, PI / 2.0)

    yaw = (-iMouse.x / iResolution.x) * 2.0 * PI;
    
    // 2.1 instead of 2.0 to avoid looking straight vertically
    pitch = ((iMouse.y / iResolution.y) * 2.0 - 1.0) * (PI / 2.1);
    
    vec3 target = vec3(
        cos(yaw) * cos(pitch),
        sin(pitch),
        sin(yaw) * cos(pitch)
    );
    Camera cam = Camera(vec3(0.0), target);
    
    vec2 ray_uv = uv * 2.0 - 1.0;
    Ray ray = generate_ray(ray_uv, cam);
    
    vec3 color = texture(iChannel0, ray.dir).rgb;
        
    fragColor = vec4(color, 1.0);
}