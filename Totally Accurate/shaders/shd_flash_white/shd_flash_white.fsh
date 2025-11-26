varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float flash_amount;  // 0.0 = normal, 1.0 = full white

void main()
{
    vec4 base_colour = texture2D(gm_BaseTexture, v_vTexcoord);
    
    // Mix between original color and white based on flash_amount
    vec3 white = vec3(1.0, 1.0, 1.0);
    vec3 flashed = mix(base_colour.rgb, white, flash_amount);
    
    gl_FragColor = vec4(flashed, base_colour.a) * v_vColour;
}
