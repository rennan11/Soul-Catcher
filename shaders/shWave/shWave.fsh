//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float pixelH;
uniform float pixelW;
uniform float time;

void main()
{
	vec2 p = v_vTexcoord;
	float py = 1.0 - p.y;
	float pixelsIn = (p.x / pixelW);
	p.y = p.y + ((sin((pixelsIn*0.2) + time)*(2.5*pixelH)) * py);
	p.y = p.y + ((sin((pixelsIn*0.35) - time*1.2)*(1.5*pixelH)) * py);
	p.y = max(p.y,0.0);
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, p );
}
