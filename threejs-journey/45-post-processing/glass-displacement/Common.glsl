// Over 1.0 decreases FOV, below 1.0 increases FOV, 0.0 = 180deg
#define FOV_SCALE 1.0

#define PI  3.141592653589793238462643383279
#define TAU 6.283185307179586476925286766559

/*
    https://en.wikipedia.org/wiki/UV_mapping#Finding_UV_on_a_sphere
*/
vec2 uv_project_sphere(vec3 pos) {
    float u = 0.5 + atan(pos.z, pos.x) / TAU;
    float v = 0.5 + asin(pos.y) / PI;

    return vec2(u, v);
}

struct Ray {
    vec3 origin;
    vec3 dir;
};

struct Camera {
    vec3 position;
    vec3 front;
};

Ray generate_ray(vec2 p, Camera cam) {
    vec3 dir = normalize(cam.front);
    vec3 u = normalize(cross(vec3(0.0, 1.0, 0.0), dir));
    vec3 v = normalize(cross(dir, u));

    vec3 screen_world = cam.position + dir * FOV_SCALE + u * p.x + v * p.y;

    return Ray(
        cam.position,
        normalize(screen_world - cam.position)
    );
}