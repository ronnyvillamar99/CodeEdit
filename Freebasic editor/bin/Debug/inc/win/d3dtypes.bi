''
''
'' d3dtypes -- header translated with help of SWIG FB wrapper
''
'' NOTICE: This file is part of the FreeBASIC Compiler package and can't
''         be included in other distributions without authorization.
''
''
#ifndef __win_d3dtypes_bi__
#define __win_d3dtypes_bi__

#include once "windows.bi"
#include once "win/ddraw.bi"

type D3DVALUE as single
type LPD3DVALUE as single ptr
type D3DFIXED as LONG

#define D3DENUMRET_CANCEL 0
#define D3DENUMRET_OK 1

#define D3DDivide(a, b) csng(cdbl(a) / cdbl(b))
#define D3DMultiply(a, b) ((a) * (b))

#ifndef RGB_MAKE
#define CI_GETALPHA(ci) ((ci) shr 24)
#define CI_GETINDEX(ci) (((ci) shr 8) and &hffff)
#define CI_GETFRACTION(ci) ((ci) and &hff)
#define CI_ROUNDINDEX(ci) CI_GETINDEX((ci) + &h80)
#define CI_MASKALPHA(ci) ((ci) and &hffffff)
#define CI_MAKE(a, i, f) (((a) shl 24) or ((i) shl 8) or (f))

#define RGBA_GETALPHA(rgb_) ((rgb_) shr 24)
#define RGBA_GETRED(rgb_) (((rgb_) shr 16) and &hff)
#define RGBA_GETGREEN(rgb_) (((rgb_) shr 8) and &hff)
#define RGBA_GETBLUE(rgb_) ((rgb_) and &hff)
#define RGBA_MAKE(r, g, b, a) (cast(D3DCOLOR,((a) shl 24) or ((r) shl 16) or ((g) shl 8) or (b)))

#define D3DRGB(r, g, b) (&hff000000L or ( (((r) * 255)) shl 16) or ((((g) * 255)) shl 8) or ((b) * 255))
#define D3DRGBA(r, g, b, a) (((((a) * 255)) shl 24) or ((((r) * 255)) shl 16) or ((((g) * 255)) shl 8) or ((b) * 255))

#define RGB_GETRED(rgb_) (((rgb_) shr 16) and &hff)
#define RGB_GETGREEN(rgb_) (((rgb_) shr 8) and &hff)
#define RGB_GETBLUE(rgb_) ((rgb_) and &hff)
#define RGBA_SETALPHA(rgba_, x) (((x) shl 24) or ((rgba_) and &h00ffffff))
#define RGB_MAKE(r, g, b) (cast(D3DCOLOR,((r) shl 16) or ((g) shl 8) or (b)))
#define RGBA_TORGB(rgba_) (cast(D3DCOLOR,(rgba_) and &hffffff))
#define RGB_TORGBA(rgb_) (cast(D3DCOLOR,(rgb_) or &hff000000))
#endif

type LPD3DVALIDATECALLBACK as function(byval as LPVOID, byval as DWORD) as HRESULT
type LPD3DENUMTEXTUREFORMATSCALLBACK as function(byval as LPDDSURFACEDESC, byval as LPVOID) as HRESULT
type LPD3DENUMPIXELFORMATSCALLBACK as function(byval as LPDDPIXELFORMAT, byval as LPVOID) as HRESULT

type D3DCOLOR as DWORD
type LPD3DCOLOR as DWORD ptr
type D3DMATERIALHANDLE as DWORD
type LPD3DMATERIALHANDLE as DWORD ptr
type D3DTEXTUREHANDLE as DWORD
type LPD3DTEXTUREHANDLE as DWORD ptr
type D3DMATRIXHANDLE as DWORD
type LPD3DMATRIXHANDLE as DWORD ptr

type D3DCOLORVALUE
    union
    	as D3DVALUE r
    	as D3DVALUE dvR
    end union
    union
    	as D3DVALUE g
    	as D3DVALUE dvG
    end union
    union
    	as D3DVALUE b
    	as D3DVALUE dvB
    end union
    union
    	as D3DVALUE a
    	as D3DVALUE dvA
    end union
end type

type LPD3DCOLORVALUE as D3DCOLORVALUE ptr

type D3DRECT
    union
	    as LONG x1
	    as LONG lX1
    end union
    union
	    as LONG y1
	    as LONG lY1
    end union
    union
	    as LONG x2
	    as LONG lX2
    end union
    union
	    as LONG y2
	    as LONG lY2
    end union
end type

type LPD3DRECT as D3DRECT ptr

type D3DVECTOR
    union
	    as D3DVALUE x
	    as D3DVALUE dvX
    end union
    union
	    as D3DVALUE y
	    as D3DVALUE dvY
    end union
    union
	    as D3DVALUE z
	    as D3DVALUE dvZ
    end union
end type

type LPD3DVECTOR as D3DVECTOR ptr

type D3DHVERTEX
	dwFlags as DWORD
    union
		as D3DVALUE hx
		as D3DVALUE dvHX
    end union
    union
		as D3DVALUE hy
		as D3DVALUE dvHY
    end union
    union
		as D3DVALUE hz
		as D3DVALUE dvHZ
    end union
end type

type LPD3DHVERTEX as D3DHVERTEX ptr

type D3DTLVERTEX
    union
		as D3DVALUE sx
		as D3DVALUE dvSX
    end union
    union
		as D3DVALUE sy
		as D3DVALUE dvSY
    end union
    union
		as D3DVALUE sz
		as D3DVALUE dvSZ
    end union
    union
		as D3DVALUE rhw
		as D3DVALUE dvRHW
    end union
    union
    	as D3DCOLOR color
    	as D3DCOLOR dcColor
    end union
    union
    	as D3DCOLOR specular
    	as D3DCOLOR dcSpecular
    end union
    union
		as D3DVALUE tu       
		as D3DVALUE dvTU
    end union
    union
		as D3DVALUE tv
		as D3DVALUE dvTV
    end union
end type

type LPD3DTLVERTEX as D3DTLVERTEX ptr

type D3DLVERTEX
    union
		as D3DVALUE x       
		as D3DVALUE dvX
    end union
    union
		as D3DVALUE y
		as D3DVALUE dvY
    end union
    union
		as D3DVALUE z
		as D3DVALUE dvZ
    end union
	dwReserved as DWORD
    union
    	as D3DCOLOR color   
    	as D3DCOLOR dcColor
    end union
    union
    	as D3DCOLOR specular
    	as D3DCOLOR dcSpecular
    end union
    union
		as D3DVALUE tu      
		as D3DVALUE dvTU
    end union
    union
		as D3DVALUE tv
		as D3DVALUE dvTV
    end union
end type

type LPD3DLVERTEX as D3DLVERTEX ptr

type D3DVERTEX
    union
		as D3DVALUE x   
		as D3DVALUE dvX
    end union
    union
		as D3DVALUE y
		as D3DVALUE dvY
    end union
    union
		as D3DVALUE z
		as D3DVALUE dvZ
    end union
    union
		as D3DVALUE nx  
		as D3DVALUE dvNX
    end union
    union
		as D3DVALUE ny
		as D3DVALUE dvNY
    end union
    union
		as D3DVALUE nz
		as D3DVALUE dvNZ
    end union
    union
		as D3DVALUE tu  
		as D3DVALUE dvTU
    end union
    union
		as D3DVALUE tv
		as D3DVALUE dvTV
    end union
end type

type LPD3DVERTEX as D3DVERTEX ptr

union D3DMATRIX
	type
		as D3DVALUE _11, _12, _13, _14
        as D3DVALUE _21, _22, _23, _24
        as D3DVALUE _31, _32, _33, _34
        as D3DVALUE _41, _42, _43, _44
	end type
end union

type LPD3DMATRIX as D3DMATRIX ptr

type D3DVIEWPORT
	dwSize as DWORD
	dwX as DWORD
	dwY as DWORD
	dwWidth as DWORD
	dwHeight as DWORD
	dvScaleX as D3DVALUE
	dvScaleY as D3DVALUE
	dvMaxX as D3DVALUE
	dvMaxY as D3DVALUE
	dvMinZ as D3DVALUE
	dvMaxZ as D3DVALUE
end type

type LPD3DVIEWPORT as D3DVIEWPORT ptr

type D3DVIEWPORT2
	dwSize as DWORD
	dwX as DWORD
	dwY as DWORD
	dwWidth as DWORD
	dwHeight as DWORD
	dvClipX as D3DVALUE
	dvClipY as D3DVALUE
	dvClipWidth as D3DVALUE
	dvClipHeight as D3DVALUE
	dvMinZ as D3DVALUE
	dvMaxZ as D3DVALUE
end type

type LPD3DVIEWPORT2 as D3DVIEWPORT2 ptr

type D3DVIEWPORT7
	dwX as DWORD
	dwY as DWORD
	dwWidth as DWORD
	dwHeight as DWORD
	dvMinZ as D3DVALUE
	dvMaxZ as D3DVALUE
end type

type LPD3DVIEWPORT7 as D3DVIEWPORT7 ptr

#define D3DMAXUSERCLIPPLANES 32
#define D3DCLIPPLANE0 (1 shl 0)
#define D3DCLIPPLANE1 (1 shl 1)
#define D3DCLIPPLANE2 (1 shl 2)
#define D3DCLIPPLANE3 (1 shl 3)
#define D3DCLIPPLANE4 (1 shl 4)
#define D3DCLIPPLANE5 (1 shl 5)
#define D3DCLIP_LEFT &h00000001L
#define D3DCLIP_RIGHT &h00000002L
#define D3DCLIP_TOP &h00000004L
#define D3DCLIP_BOTTOM &h00000008L
#define D3DCLIP_FRONT &h00000010L
#define D3DCLIP_BACK &h00000020L
#define D3DCLIP_GEN0 &h00000040L
#define D3DCLIP_GEN1 &h00000080L
#define D3DCLIP_GEN2 &h00000100L
#define D3DCLIP_GEN3 &h00000200L
#define D3DCLIP_GEN4 &h00000400L
#define D3DCLIP_GEN5 &h00000800L
#define D3DSTATUS_CLIPUNIONLEFT &h00000001L
#define D3DSTATUS_CLIPUNIONRIGHT &h00000002L
#define D3DSTATUS_CLIPUNIONTOP &h00000004L
#define D3DSTATUS_CLIPUNIONBOTTOM &h00000008L
#define D3DSTATUS_CLIPUNIONFRONT &h00000010L
#define D3DSTATUS_CLIPUNIONBACK &h00000020L
#define D3DSTATUS_CLIPUNIONGEN0 &h00000040L
#define D3DSTATUS_CLIPUNIONGEN1 &h00000080L
#define D3DSTATUS_CLIPUNIONGEN2 &h00000100L
#define D3DSTATUS_CLIPUNIONGEN3 &h00000200L
#define D3DSTATUS_CLIPUNIONGEN4 &h00000400L
#define D3DSTATUS_CLIPUNIONGEN5 &h00000800L
#define D3DSTATUS_CLIPINTERSECTIONLEFT &h00001000L
#define D3DSTATUS_CLIPINTERSECTIONRIGHT &h00002000L
#define D3DSTATUS_CLIPINTERSECTIONTOP &h00004000L
#define D3DSTATUS_CLIPINTERSECTIONBOTTOM &h00008000L
#define D3DSTATUS_CLIPINTERSECTIONFRONT &h00010000L
#define D3DSTATUS_CLIPINTERSECTIONBACK &h00020000L
#define D3DSTATUS_CLIPINTERSECTIONGEN0 &h00040000L
#define D3DSTATUS_CLIPINTERSECTIONGEN1 &h00080000L
#define D3DSTATUS_CLIPINTERSECTIONGEN2 &h00100000L
#define D3DSTATUS_CLIPINTERSECTIONGEN3 &h00200000L
#define D3DSTATUS_CLIPINTERSECTIONGEN4 &h00400000L
#define D3DSTATUS_CLIPINTERSECTIONGEN5 &h00800000L
#define D3DSTATUS_ZNOTVISIBLE &h01000000L
#define D3DSTATUS_CLIPUNIONALL (&h00000001L or &h00000002L or &h00000004L or &h00000008L or &h00000010L or &h00000020L or &h00000040L or &h00000080L or &h00000100L or &h00000200L or &h00000400L or &h00000800L)
#define D3DSTATUS_CLIPINTERSECTIONALL (&h00001000L or &h00002000L or &h00004000L or &h00008000L or &h00010000L or &h00020000L or &h00040000L or &h00080000L or &h00100000L or &h00200000L or &h00400000L or &h00800000L)
#define D3DSTATUS_DEFAULT ((&h00001000L or &h00002000L or &h00004000L or &h00008000L or &h00010000L or &h00020000L or &h00040000L or &h00080000L or &h00100000L or &h00200000L or &h00400000L or &h00800000L) or &h01000000L)
#define D3DTRANSFORM_CLIPPED &h00000001l
#define D3DTRANSFORM_UNCLIPPED &h00000002l

type D3DTRANSFORMDATA
	dwSize as DWORD
	lpIn as LPVOID
	dwInSize as DWORD
	lpOut as LPVOID
	dwOutSize as DWORD
	lpHOut as LPD3DHVERTEX
	dwClip as DWORD
	dwClipIntersection as DWORD
	dwClipUnion as DWORD
	drExtent as D3DRECT
end type

type LPD3DTRANSFORMDATA as D3DTRANSFORMDATA ptr

type D3DLIGHTINGELEMENT
	dvPosition as D3DVECTOR
	dvNormal as D3DVECTOR
end type

type LPD3DLIGHTINGELEMENT as D3DLIGHTINGELEMENT ptr

type D3DMATERIAL
	dwSize as DWORD
    union
    	as D3DCOLORVALUE diffuse 
    	as D3DCOLORVALUE dcvDiffuse
    end union
    union
    	as D3DCOLORVALUE ambient 
    	as D3DCOLORVALUE dcvAmbient
    end union
    union
    	as D3DCOLORVALUE specular
    	as D3DCOLORVALUE dcvSpecular
    end union
    union
    	as D3DCOLORVALUE emissive
    	as D3DCOLORVALUE dcvEmissive
    end union
    union
    	as D3DVALUE power 
    	as D3DVALUE dvPower
    end union
	hTexture as D3DTEXTUREHANDLE
	dwRampSize as DWORD
end type

type LPD3DMATERIAL as D3DMATERIAL ptr

type D3DMATERIAL7
    union
    	as D3DCOLORVALUE diffuse  
    	as D3DCOLORVALUE dcvDiffuse
    end union
    union
    	as D3DCOLORVALUE ambient  
    	as D3DCOLORVALUE dcvAmbient
    end union
    union
    	as D3DCOLORVALUE specular 
    	as D3DCOLORVALUE dcvSpecular
    end union
    union
    	as D3DCOLORVALUE emissive 
    	as D3DCOLORVALUE dcvEmissive
    end union
    union
    	as D3DVALUE power  
    	as D3DVALUE dvPower
    end union
end type

type LPD3DMATERIAL7 as D3DMATERIAL7 ptr

enum D3DLIGHTTYPE
	D3DLIGHT_POINT = 1
	D3DLIGHT_SPOT = 2
	D3DLIGHT_DIRECTIONAL = 3
	D3DLIGHT_PARALLELPOINT = 4
	D3DLIGHT_FORCE_DWORD = &h7fffffff
end enum

type D3DLIGHT
	dwSize as DWORD
	dltType as D3DLIGHTTYPE
	dcvColor as D3DCOLORVALUE
	dvPosition as D3DVECTOR
	dvDirection as D3DVECTOR
	dvRange as D3DVALUE
	dvFalloff as D3DVALUE
	dvAttenuation0 as D3DVALUE
	dvAttenuation1 as D3DVALUE
	dvAttenuation2 as D3DVALUE
	dvTheta as D3DVALUE
	dvPhi as D3DVALUE
end type

type LPD3DLIGHT as D3DLIGHT ptr

type D3DLIGHT7
	dltType as D3DLIGHTTYPE
	dcvDiffuse as D3DCOLORVALUE
	dcvSpecular as D3DCOLORVALUE
	dcvAmbient as D3DCOLORVALUE
	dvPosition as D3DVECTOR
	dvDirection as D3DVECTOR
	dvRange as D3DVALUE
	dvFalloff as D3DVALUE
	dvAttenuation0 as D3DVALUE
	dvAttenuation1 as D3DVALUE
	dvAttenuation2 as D3DVALUE
	dvTheta as D3DVALUE
	dvPhi as D3DVALUE
end type

type LPD3DLIGHT7 as D3DLIGHT7 ptr

#define D3DLIGHT_ACTIVE &h00000001
#define D3DLIGHT_NO_SPECULAR &h00000002
#define D3DLIGHT_ALL (&h00000001 or &h00000002)

type D3DLIGHT2
	dwSize as DWORD
	dltType as D3DLIGHTTYPE
	dcvColor as D3DCOLORVALUE
	dvPosition as D3DVECTOR
	dvDirection as D3DVECTOR
	dvRange as D3DVALUE
	dvFalloff as D3DVALUE
	dvAttenuation0 as D3DVALUE
	dvAttenuation1 as D3DVALUE
	dvAttenuation2 as D3DVALUE
	dvTheta as D3DVALUE
	dvPhi as D3DVALUE
	dwFlags as DWORD
end type

type LPD3DLIGHT2 as D3DLIGHT2 ptr

type D3DLIGHTDATA
	dwSize as DWORD
	lpIn as LPD3DLIGHTINGELEMENT
	dwInSize as DWORD
	lpOut as LPD3DTLVERTEX
	dwOutSize as DWORD
end type

type LPD3DLIGHTDATA as D3DLIGHTDATA ptr

#define D3DCOLOR_MONO 1
#define D3DCOLOR_RGB 2

type D3DCOLORMODEL as DWORD

#define D3DCLEAR_TARGET &h00000001l
#define D3DCLEAR_ZBUFFER &h00000002l
#define D3DCLEAR_STENCIL &h00000004l

enum D3DOPCODE
	D3DOP_POINT = 1
	D3DOP_LINE = 2
	D3DOP_TRIANGLE = 3
	D3DOP_MATRIXLOAD = 4
	D3DOP_MATRIXMULTIPLY = 5
	D3DOP_STATETRANSFORM = 6
	D3DOP_STATELIGHT = 7
	D3DOP_STATERENDER = 8
	D3DOP_PROCESSVERTICES = 9
	D3DOP_TEXTURELOAD = 10
	D3DOP_EXIT = 11
	D3DOP_BRANCHFORWARD = 12
	D3DOP_SPAN = 13
	D3DOP_SETSTATUS = 14
	D3DOP_FORCE_DWORD = &h7fffffff
end enum

type D3DINSTRUCTION
	bOpcode as UBYTE
	bSize as UBYTE
	wCount as WORD
end type

type LPD3DINSTRUCTION as D3DINSTRUCTION ptr

type D3DTEXTURELOAD
	hDestTexture as D3DTEXTUREHANDLE
	hSrcTexture as D3DTEXTUREHANDLE
end type

type LPD3DTEXTURELOAD as D3DTEXTURELOAD ptr

type D3DPICKRECORD
	bOpcode as UBYTE
	bPad as UBYTE
	dwOffset as DWORD
	dvZ as D3DVALUE
end type

type LPD3DPICKRECORD as D3DPICKRECORD ptr

enum D3DSHADEMODE
	D3DSHADE_FLAT = 1
	D3DSHADE_GOURAUD = 2
	D3DSHADE_PHONG = 3
	D3DSHADE_FORCE_DWORD = &h7fffffff
end enum

enum D3DFILLMODE
	D3DFILL_POINT = 1
	D3DFILL_WIREFRAME = 2
	D3DFILL_SOLID = 3
	D3DFILL_FORCE_DWORD = &h7fffffff
end enum

type D3DLINEPATTERN
	wRepeatFactor as WORD
	wLinePattern as WORD
end type

enum D3DTEXTUREFILTER
	D3DFILTER_NEAREST = 1
	D3DFILTER_LINEAR = 2
	D3DFILTER_MIPNEAREST = 3
	D3DFILTER_MIPLINEAR = 4
	D3DFILTER_LINEARMIPNEAREST = 5
	D3DFILTER_LINEARMIPLINEAR = 6
	D3DFILTER_FORCE_DWORD = &h7fffffff
end enum

enum D3DBLEND
	D3DBLEND_ZERO = 1
	D3DBLEND_ONE = 2
	D3DBLEND_SRCCOLOR = 3
	D3DBLEND_INVSRCCOLOR = 4
	D3DBLEND_SRCALPHA = 5
	D3DBLEND_INVSRCALPHA = 6
	D3DBLEND_DESTALPHA = 7
	D3DBLEND_INVDESTALPHA = 8
	D3DBLEND_DESTCOLOR = 9
	D3DBLEND_INVDESTCOLOR = 10
	D3DBLEND_SRCALPHASAT = 11
	D3DBLEND_BOTHSRCALPHA = 12
	D3DBLEND_BOTHINVSRCALPHA = 13
	D3DBLEND_FORCE_DWORD = &h7fffffff
end enum

enum D3DTEXTUREBLEND
	D3DTBLEND_DECAL = 1
	D3DTBLEND_MODULATE = 2
	D3DTBLEND_DECALALPHA = 3
	D3DTBLEND_MODULATEALPHA = 4
	D3DTBLEND_DECALMASK = 5
	D3DTBLEND_MODULATEMASK = 6
	D3DTBLEND_COPY = 7
	D3DTBLEND_ADD = 8
	D3DTBLEND_FORCE_DWORD = &h7fffffff
end enum

enum D3DTEXTUREADDRESS
	D3DTADDRESS_WRAP = 1
	D3DTADDRESS_MIRROR = 2
	D3DTADDRESS_CLAMP = 3
	D3DTADDRESS_BORDER = 4
	D3DTADDRESS_FORCE_DWORD = &h7fffffff
end enum

enum D3DCULL
	D3DCULL_NONE = 1
	D3DCULL_CW = 2
	D3DCULL_CCW = 3
	D3DCULL_FORCE_DWORD = &h7fffffff
end enum

enum D3DCMPFUNC
	D3DCMP_NEVER = 1
	D3DCMP_LESS = 2
	D3DCMP_EQUAL = 3
	D3DCMP_LESSEQUAL = 4
	D3DCMP_GREATER = 5
	D3DCMP_NOTEQUAL = 6
	D3DCMP_GREATEREQUAL = 7
	D3DCMP_ALWAYS = 8
	D3DCMP_FORCE_DWORD = &h7fffffff
end enum

enum D3DSTENCILOP
	D3DSTENCILOP_KEEP = 1
	D3DSTENCILOP_ZERO = 2
	D3DSTENCILOP_REPLACE = 3
	D3DSTENCILOP_INCRSAT = 4
	D3DSTENCILOP_DECRSAT = 5
	D3DSTENCILOP_INVERT = 6
	D3DSTENCILOP_INCR = 7
	D3DSTENCILOP_DECR = 8
	D3DSTENCILOP_FORCE_DWORD = &h7fffffff
end enum

enum D3DFOGMODE
	D3DFOG_NONE = 0
	D3DFOG_EXP = 1
	D3DFOG_EXP2 = 2
	D3DFOG_LINEAR = 3
	D3DFOG_FORCE_DWORD = &h7fffffff
end enum

enum D3DZBUFFERTYPE
	D3DZB_FALSE = 0
	D3DZB_TRUE = 1
	D3DZB_USEW = 2
	D3DZB_FORCE_DWORD = &h7fffffff
end enum

enum D3DANTIALIASMODE
	D3DANTIALIAS_NONE = 0
	D3DANTIALIAS_SORTDEPENDENT = 1
	D3DANTIALIAS_SORTINDEPENDENT = 2
	D3DANTIALIAS_FORCE_DWORD = &h7fffffff
end enum

enum D3DVERTEXTYPE
	D3DVT_VERTEX = 1
	D3DVT_LVERTEX = 2
	D3DVT_TLVERTEX = 3
	D3DVT_FORCE_DWORD = &h7fffffff
end enum

enum D3DPRIMITIVETYPE
	D3DPT_POINTLIST = 1
	D3DPT_LINELIST = 2
	D3DPT_LINESTRIP = 3
	D3DPT_TRIANGLELIST = 4
	D3DPT_TRIANGLESTRIP = 5
	D3DPT_TRIANGLEFAN = 6
	D3DPT_FORCE_DWORD = &h7fffffff
end enum

#define D3DSTATE_OVERRIDE_BIAS 256

enum D3DTRANSFORMSTATETYPE
	D3DTRANSFORMSTATE_WORLD = 1
	D3DTRANSFORMSTATE_VIEW = 2
	D3DTRANSFORMSTATE_PROJECTION = 3
	D3DTRANSFORMSTATE_WORLD1 = 4
	D3DTRANSFORMSTATE_WORLD2 = 5
	D3DTRANSFORMSTATE_WORLD3 = 6
	D3DTRANSFORMSTATE_TEXTURE0 = 16
	D3DTRANSFORMSTATE_TEXTURE1 = 17
	D3DTRANSFORMSTATE_TEXTURE2 = 18
	D3DTRANSFORMSTATE_TEXTURE3 = 19
	D3DTRANSFORMSTATE_TEXTURE4 = 20
	D3DTRANSFORMSTATE_TEXTURE5 = 21
	D3DTRANSFORMSTATE_TEXTURE6 = 22
	D3DTRANSFORMSTATE_TEXTURE7 = 23
	D3DTRANSFORMSTATE_FORCE_DWORD = &h7fffffff
end enum

enum D3DLIGHTSTATETYPE
	D3DLIGHTSTATE_MATERIAL = 1
	D3DLIGHTSTATE_AMBIENT = 2
	D3DLIGHTSTATE_COLORMODEL = 3
	D3DLIGHTSTATE_FOGMODE = 4
	D3DLIGHTSTATE_FOGSTART = 5
	D3DLIGHTSTATE_FOGEND = 6
	D3DLIGHTSTATE_FOGDENSITY = 7
	D3DLIGHTSTATE_COLORVERTEX = 8
	D3DLIGHTSTATE_FORCE_DWORD = &h7fffffff
end enum

enum D3DRENDERSTATETYPE
	D3DRENDERSTATE_ANTIALIAS = 2
	D3DRENDERSTATE_TEXTUREPERSPECTIVE = 4
	D3DRENDERSTATE_ZENABLE = 7
	D3DRENDERSTATE_FILLMODE = 8
	D3DRENDERSTATE_SHADEMODE = 9
	D3DRENDERSTATE_LINEPATTERN = 10
	D3DRENDERSTATE_ZWRITEENABLE = 14
	D3DRENDERSTATE_ALPHATESTENABLE = 15
	D3DRENDERSTATE_LASTPIXEL = 16
	D3DRENDERSTATE_SRCBLEND = 19
	D3DRENDERSTATE_DESTBLEND = 20
	D3DRENDERSTATE_CULLMODE = 22
	D3DRENDERSTATE_ZFUNC = 23
	D3DRENDERSTATE_ALPHAREF = 24
	D3DRENDERSTATE_ALPHAFUNC = 25
	D3DRENDERSTATE_DITHERENABLE = 26
	D3DRENDERSTATE_ALPHABLENDENABLE = 27
	D3DRENDERSTATE_FOGENABLE = 28
	D3DRENDERSTATE_SPECULARENABLE = 29
	D3DRENDERSTATE_ZVISIBLE = 30
	D3DRENDERSTATE_STIPPLEDALPHA = 33
	D3DRENDERSTATE_FOGCOLOR = 34
	D3DRENDERSTATE_FOGTABLEMODE = 35
	D3DRENDERSTATE_FOGSTART = 36
	D3DRENDERSTATE_FOGEND = 37
	D3DRENDERSTATE_FOGDENSITY = 38
	D3DRENDERSTATE_EDGEANTIALIAS = 40
	D3DRENDERSTATE_COLORKEYENABLE = 41
	D3DRENDERSTATE_ZBIAS = 47
	D3DRENDERSTATE_RANGEFOGENABLE = 48
	D3DRENDERSTATE_STENCILENABLE = 52
	D3DRENDERSTATE_STENCILFAIL = 53
	D3DRENDERSTATE_STENCILZFAIL = 54
	D3DRENDERSTATE_STENCILPASS = 55
	D3DRENDERSTATE_STENCILFUNC = 56
	D3DRENDERSTATE_STENCILREF = 57
	D3DRENDERSTATE_STENCILMASK = 58
	D3DRENDERSTATE_STENCILWRITEMASK = 59
	D3DRENDERSTATE_TEXTUREFACTOR = 60
	D3DRENDERSTATE_WRAP0 = 128
	D3DRENDERSTATE_WRAP1 = 129
	D3DRENDERSTATE_WRAP2 = 130
	D3DRENDERSTATE_WRAP3 = 131
	D3DRENDERSTATE_WRAP4 = 132
	D3DRENDERSTATE_WRAP5 = 133
	D3DRENDERSTATE_WRAP6 = 134
	D3DRENDERSTATE_WRAP7 = 135
	D3DRENDERSTATE_CLIPPING = 136
	D3DRENDERSTATE_LIGHTING = 137
	D3DRENDERSTATE_EXTENTS = 138
	D3DRENDERSTATE_AMBIENT = 139
	D3DRENDERSTATE_FOGVERTEXMODE = 140
	D3DRENDERSTATE_COLORVERTEX = 141
	D3DRENDERSTATE_LOCALVIEWER = 142
	D3DRENDERSTATE_NORMALIZENORMALS = 143
	D3DRENDERSTATE_COLORKEYBLENDENABLE = 144
	D3DRENDERSTATE_DIFFUSEMATERIALSOURCE = 145
	D3DRENDERSTATE_SPECULARMATERIALSOURCE = 146
	D3DRENDERSTATE_AMBIENTMATERIALSOURCE = 147
	D3DRENDERSTATE_EMISSIVEMATERIALSOURCE = 148
	D3DRENDERSTATE_VERTEXBLEND = 151
	D3DRENDERSTATE_CLIPPLANEENABLE = 152
	D3DRENDERSTATE_TEXTUREHANDLE = 1
	D3DRENDERSTATE_TEXTUREADDRESS = 3
	D3DRENDERSTATE_WRAPU = 5
	D3DRENDERSTATE_WRAPV = 6
	D3DRENDERSTATE_MONOENABLE = 11
	D3DRENDERSTATE_ROP2 = 12
	D3DRENDERSTATE_PLANEMASK = 13
	D3DRENDERSTATE_TEXTUREMAG = 17
	D3DRENDERSTATE_TEXTUREMIN = 18
	D3DRENDERSTATE_TEXTUREMAPBLEND = 21
	D3DRENDERSTATE_SUBPIXEL = 31
	D3DRENDERSTATE_SUBPIXELX = 32
	D3DRENDERSTATE_STIPPLEENABLE = 39
	D3DRENDERSTATE_BORDERCOLOR = 43
	D3DRENDERSTATE_TEXTUREADDRESSU = 44
	D3DRENDERSTATE_TEXTUREADDRESSV = 45
	D3DRENDERSTATE_MIPMAPLODBIAS = 46
	D3DRENDERSTATE_ANISOTROPY = 49
	D3DRENDERSTATE_FLUSHBATCH = 50
	D3DRENDERSTATE_TRANSLUCENTSORTINDEPENDENT = 51
	D3DRENDERSTATE_STIPPLEPATTERN00 = 64
	D3DRENDERSTATE_STIPPLEPATTERN01 = 65
	D3DRENDERSTATE_STIPPLEPATTERN02 = 66
	D3DRENDERSTATE_STIPPLEPATTERN03 = 67
	D3DRENDERSTATE_STIPPLEPATTERN04 = 68
	D3DRENDERSTATE_STIPPLEPATTERN05 = 69
	D3DRENDERSTATE_STIPPLEPATTERN06 = 70
	D3DRENDERSTATE_STIPPLEPATTERN07 = 71
	D3DRENDERSTATE_STIPPLEPATTERN08 = 72
	D3DRENDERSTATE_STIPPLEPATTERN09 = 73
	D3DRENDERSTATE_STIPPLEPATTERN10 = 74
	D3DRENDERSTATE_STIPPLEPATTERN11 = 75
	D3DRENDERSTATE_STIPPLEPATTERN12 = 76
	D3DRENDERSTATE_STIPPLEPATTERN13 = 77
	D3DRENDERSTATE_STIPPLEPATTERN14 = 78
	D3DRENDERSTATE_STIPPLEPATTERN15 = 79
	D3DRENDERSTATE_STIPPLEPATTERN16 = 80
	D3DRENDERSTATE_STIPPLEPATTERN17 = 81
	D3DRENDERSTATE_STIPPLEPATTERN18 = 82
	D3DRENDERSTATE_STIPPLEPATTERN19 = 83
	D3DRENDERSTATE_STIPPLEPATTERN20 = 84
	D3DRENDERSTATE_STIPPLEPATTERN21 = 85
	D3DRENDERSTATE_STIPPLEPATTERN22 = 86
	D3DRENDERSTATE_STIPPLEPATTERN23 = 87
	D3DRENDERSTATE_STIPPLEPATTERN24 = 88
	D3DRENDERSTATE_STIPPLEPATTERN25 = 89
	D3DRENDERSTATE_STIPPLEPATTERN26 = 90
	D3DRENDERSTATE_STIPPLEPATTERN27 = 91
	D3DRENDERSTATE_STIPPLEPATTERN28 = 92
	D3DRENDERSTATE_STIPPLEPATTERN29 = 93
	D3DRENDERSTATE_STIPPLEPATTERN30 = 94
	D3DRENDERSTATE_STIPPLEPATTERN31 = 95
	D3DRENDERSTATE_FOGTABLESTART = 36
	D3DRENDERSTATE_FOGTABLEEND = 37
	D3DRENDERSTATE_FOGTABLEDENSITY = 38
	D3DRENDERSTATE_FORCE_DWORD = &h7fffffff
end enum

enum D3DMATERIALCOLORSOURCE
	D3DMCS_MATERIAL = 0
	D3DMCS_COLOR1 = 1
	D3DMCS_COLOR2 = 2
	D3DMCS_FORCE_DWORD = &h7fffffff
end enum

#define D3DRENDERSTATE_WRAPBIAS 128UL
#define D3DWRAP_U &h00000001L
#define D3DWRAP_V &h00000002L
#define D3DWRAPCOORD_0 &h00000001L
#define D3DWRAPCOORD_1 &h00000002L
#define D3DWRAPCOORD_2 &h00000004L
#define D3DWRAPCOORD_3 &h00000008L

type D3DSTATE
    union
    	as D3DTRANSFORMSTATETYPE dtstTransformStateType
    	as D3DLIGHTSTATETYPE dlstLightStateType
    	as D3DRENDERSTATETYPE drstRenderStateType
    end union
    union
    	as DWORD dwArg(0)
    	as D3DVALUE dvArg(0)
    end union
end type

type LPD3DSTATE as D3DSTATE ptr

type D3DMATRIXLOAD
	hDestMatrix as D3DMATRIXHANDLE
	hSrcMatrix as D3DMATRIXHANDLE
end type

type LPD3DMATRIXLOAD as D3DMATRIXLOAD ptr

type D3DMATRIXMULTIPLY
	hDestMatrix as D3DMATRIXHANDLE
	hSrcMatrix1 as D3DMATRIXHANDLE
	hSrcMatrix2 as D3DMATRIXHANDLE
end type

type LPD3DMATRIXMULTIPLY as D3DMATRIXMULTIPLY ptr

type D3DPROCESSVERTICES
	dwFlags as DWORD
	wStart as WORD
	wDest as WORD
	dwCount as DWORD
	dwReserved as DWORD
end type

type LPD3DPROCESSVERTICES as D3DPROCESSVERTICES ptr

#define D3DPROCESSVERTICES_TRANSFORMLIGHT &h00000000L
#define D3DPROCESSVERTICES_TRANSFORM &h00000001L
#define D3DPROCESSVERTICES_COPY &h00000002L
#define D3DPROCESSVERTICES_OPMASK &h00000007L
#define D3DPROCESSVERTICES_UPDATEEXTENTS &h00000008L
#define D3DPROCESSVERTICES_NOCOLOR &h00000010L

enum D3DTEXTURESTAGESTATETYPE
	D3DTSS_COLOROP = 1
	D3DTSS_COLORARG1 = 2
	D3DTSS_COLORARG2 = 3
	D3DTSS_ALPHAOP = 4
	D3DTSS_ALPHAARG1 = 5
	D3DTSS_ALPHAARG2 = 6
	D3DTSS_BUMPENVMAT00 = 7
	D3DTSS_BUMPENVMAT01 = 8
	D3DTSS_BUMPENVMAT10 = 9
	D3DTSS_BUMPENVMAT11 = 10
	D3DTSS_TEXCOORDINDEX = 11
	D3DTSS_ADDRESS = 12
	D3DTSS_ADDRESSU = 13
	D3DTSS_ADDRESSV = 14
	D3DTSS_BORDERCOLOR = 15
	D3DTSS_MAGFILTER = 16
	D3DTSS_MINFILTER = 17
	D3DTSS_MIPFILTER = 18
	D3DTSS_MIPMAPLODBIAS = 19
	D3DTSS_MAXMIPLEVEL = 20
	D3DTSS_MAXANISOTROPY = 21
	D3DTSS_BUMPENVLSCALE = 22
	D3DTSS_BUMPENVLOFFSET = 23
	D3DTSS_TEXTURETRANSFORMFLAGS = 24
	D3DTSS_FORCE_DWORD = &h7fffffff
end enum

#define D3DTSS_TCI_PASSTHRU &h00000000
#define D3DTSS_TCI_CAMERASPACENORMAL &h00010000
#define D3DTSS_TCI_CAMERASPACEPOSITION &h00020000
#define D3DTSS_TCI_CAMERASPACEREFLECTIONVECTOR &h00030000

enum D3DTEXTUREOP
	D3DTOP_DISABLE = 1
	D3DTOP_SELECTARG1 = 2
	D3DTOP_SELECTARG2 = 3
	D3DTOP_MODULATE = 4
	D3DTOP_MODULATE2X = 5
	D3DTOP_MODULATE4X = 6
	D3DTOP_ADD = 7
	D3DTOP_ADDSIGNED = 8
	D3DTOP_ADDSIGNED2X = 9
	D3DTOP_SUBTRACT = 10
	D3DTOP_ADDSMOOTH = 11
	D3DTOP_BLENDDIFFUSEALPHA = 12
	D3DTOP_BLENDTEXTUREALPHA = 13
	D3DTOP_BLENDFACTORALPHA = 14
	D3DTOP_BLENDTEXTUREALPHAPM = 15
	D3DTOP_BLENDCURRENTALPHA = 16
	D3DTOP_PREMODULATE = 17
	D3DTOP_MODULATEALPHA_ADDCOLOR = 18
	D3DTOP_MODULATECOLOR_ADDALPHA = 19
	D3DTOP_MODULATEINVALPHA_ADDCOLOR = 20
	D3DTOP_MODULATEINVCOLOR_ADDALPHA = 21
	D3DTOP_BUMPENVMAP = 22
	D3DTOP_BUMPENVMAPLUMINANCE = 23
	D3DTOP_DOTPRODUCT3 = 24
	D3DTOP_FORCE_DWORD = &h7fffffff
end enum

#define D3DTA_SELECTMASK &h0000000f
#define D3DTA_DIFFUSE &h00000000
#define D3DTA_CURRENT &h00000001
#define D3DTA_TEXTURE &h00000002
#define D3DTA_TFACTOR &h00000003
#define D3DTA_SPECULAR &h00000004
#define D3DTA_COMPLEMENT &h00000010
#define D3DTA_ALPHAREPLICATE &h00000020

enum D3DTEXTUREMAGFILTER
	D3DTFG_POINT = 1
	D3DTFG_LINEAR = 2
	D3DTFG_FLATCUBIC = 3
	D3DTFG_GAUSSIANCUBIC = 4
	D3DTFG_ANISOTROPIC = 5
	D3DTFG_FORCE_DWORD = &h7fffffff
end enum

enum D3DTEXTUREMINFILTER
	D3DTFN_POINT = 1
	D3DTFN_LINEAR = 2
	D3DTFN_ANISOTROPIC = 3
	D3DTFN_FORCE_DWORD = &h7fffffff
end enum

enum D3DTEXTUREMIPFILTER
	D3DTFP_NONE = 1
	D3DTFP_POINT = 2
	D3DTFP_LINEAR = 3
	D3DTFP_FORCE_DWORD = &h7fffffff
end enum

#define D3DTRIFLAG_START &h00000000L
#define D3DTRIFLAG_ODD &h0000001eL
#define D3DTRIFLAG_EVEN &h0000001fL
#define D3DTRIFLAG_EDGEENABLE1 &h00000100L
#define D3DTRIFLAG_EDGEENABLE2 &h00000200L
#define D3DTRIFLAG_EDGEENABLE3 &h00000400L
#define D3DTRIFLAG_EDGEENABLETRIANGLE (&h00000100L or &h00000200L or &h00000400L)

type D3DTRIANGLE
    union
		as WORD v1
		as WORD wV1
    end union
    union
		as WORD v2
		as WORD wV2
    end union
    union
		as WORD v3
		as WORD wV3
    end union
	wFlags as WORD
end type

type LPD3DTRIANGLE as D3DTRIANGLE ptr

type D3DLINE
    union
		as WORD v1 
		as WORD wV1
    end union
    union
		as WORD v2
		as WORD wV2
    end union
end type

type LPD3DLINE as D3DLINE ptr

type D3DSPAN
	wCount as WORD
	wFirst as WORD
end type

type LPD3DSPAN as D3DSPAN ptr

type D3DPOINT
	wCount as WORD
	wFirst as WORD
end type

type LPD3DPOINT as D3DPOINT ptr

type D3DBRANCH
	dwMask as DWORD
	dwValue as DWORD
	bNegate as BOOL
	dwOffset as DWORD
end type

type LPD3DBRANCH as D3DBRANCH ptr

type D3DSTATUS
	dwFlags as DWORD
	dwStatus as DWORD
	drExtent as D3DRECT
end type

type LPD3DSTATUS as D3DSTATUS ptr

#define D3DSETSTATUS_STATUS &h00000001L
#define D3DSETSTATUS_EXTENTS &h00000002L
#define D3DSETSTATUS_ALL (&h00000001L or &h00000002L)

type D3DCLIPSTATUS
	dwFlags as DWORD
	dwStatus as DWORD
	minx as single
	maxx as single
	miny as single
	maxy as single
	minz as single
	maxz as single
end type

type LPD3DCLIPSTATUS as D3DCLIPSTATUS ptr

#define D3DCLIPSTATUS_STATUS &h00000001L
#define D3DCLIPSTATUS_EXTENTS2 &h00000002L
#define D3DCLIPSTATUS_EXTENTS3 &h00000004L

type D3DSTATS
	dwSize as DWORD
	dwTrianglesDrawn as DWORD
	dwLinesDrawn as DWORD
	dwPointsDrawn as DWORD
	dwSpansDrawn as DWORD
	dwVerticesProcessed as DWORD
end type

type LPD3DSTATS as D3DSTATS ptr

#define D3DEXECUTE_CLIPPED &h00000001l
#define D3DEXECUTE_UNCLIPPED &h00000002l

type D3DEXECUTEDATA
	dwSize as DWORD
	dwVertexOffset as DWORD
	dwVertexCount as DWORD
	dwInstructionOffset as DWORD
	dwInstructionLength as DWORD
	dwHVertexOffset as DWORD
	dsStatus as D3DSTATUS
end type

type LPD3DEXECUTEDATA as D3DEXECUTEDATA ptr

#define D3DPAL_FREE &h00
#define D3DPAL_READONLY &h40
#define D3DPAL_RESERVED &h80

type D3DVERTEXBUFFERDESC
	dwSize as DWORD
	dwCaps as DWORD
	dwFVF as DWORD
	dwNumVertices as DWORD
end type

type LPD3DVERTEXBUFFERDESC as D3DVERTEXBUFFERDESC ptr

#define D3DVBCAPS_SYSTEMMEMORY &h00000800l
#define D3DVBCAPS_WRITEONLY &h00010000l
#define D3DVBCAPS_OPTIMIZED &h80000000l
#define D3DVBCAPS_DONOTCLIP &h00000001l
#define D3DVOP_LIGHT (1 shl 10)
#define D3DVOP_TRANSFORM (1 shl 0)
#define D3DVOP_CLIP (1 shl 2)
#define D3DVOP_EXTENTS (1 shl 3)
#define D3DMAXNUMVERTICES ((1 shl 16) -1)
#define D3DMAXNUMPRIMITIVES ((1 shl 16) -1)
#define D3DPV_DONOTCOPYDATA (1 shl 0)
#define D3DFVF_RESERVED0 &h001
#define D3DFVF_POSITION_MASK &h00E
#define D3DFVF_XYZ &h002
#define D3DFVF_XYZRHW &h004
#define D3DFVF_XYZB1 &h006
#define D3DFVF_XYZB2 &h008
#define D3DFVF_XYZB3 &h00a
#define D3DFVF_XYZB4 &h00c
#define D3DFVF_XYZB5 &h00e
#define D3DFVF_NORMAL &h010
#define D3DFVF_RESERVED1 &h020
#define D3DFVF_DIFFUSE &h040
#define D3DFVF_SPECULAR &h080
#define D3DFVF_TEXCOUNT_MASK &hf00
#define D3DFVF_TEXCOUNT_SHIFT 8
#define D3DFVF_TEX0 &h000
#define D3DFVF_TEX1 &h100
#define D3DFVF_TEX2 &h200
#define D3DFVF_TEX3 &h300
#define D3DFVF_TEX4 &h400
#define D3DFVF_TEX5 &h500
#define D3DFVF_TEX6 &h600
#define D3DFVF_TEX7 &h700
#define D3DFVF_TEX8 &h800
#define D3DFVF_RESERVED2 &hf000
#define D3DFVF_VERTEX (&h002 or &h010 or &h100)
#define D3DFVF_LVERTEX (&h002 or &h020 or &h040 or &h080 or &h100)
#define D3DFVF_TLVERTEX (&h004 or &h040 or &h080 or &h100)

type D3DDP_PTRSTRIDE
	lpvData as LPVOID
	dwStride as DWORD
end type

#define D3DDP_MAXTEXCOORD 8

type D3DDRAWPRIMITIVESTRIDEDDATA
	position as D3DDP_PTRSTRIDE
	normal as D3DDP_PTRSTRIDE
	diffuse as D3DDP_PTRSTRIDE
	specular as D3DDP_PTRSTRIDE
	textureCoords(0 to 8-1) as D3DDP_PTRSTRIDE
end type

type LPD3DDRAWPRIMITIVESTRIDEDDATA as D3DDRAWPRIMITIVESTRIDEDDATA ptr

#define D3DVIS_INSIDE_FRUSTUM 0
#define D3DVIS_INTERSECT_FRUSTUM 1
#define D3DVIS_OUTSIDE_FRUSTUM 2
#define D3DVIS_INSIDE_LEFT 0
#define D3DVIS_INTERSECT_LEFT (1 shl 2)
#define D3DVIS_OUTSIDE_LEFT (2 shl 2)
#define D3DVIS_INSIDE_RIGHT 0
#define D3DVIS_INTERSECT_RIGHT (1 shl 4)
#define D3DVIS_OUTSIDE_RIGHT (2 shl 4)
#define D3DVIS_INSIDE_TOP 0
#define D3DVIS_INTERSECT_TOP (1 shl 6)
#define D3DVIS_OUTSIDE_TOP (2 shl 6)
#define D3DVIS_INSIDE_BOTTOM 0
#define D3DVIS_INTERSECT_BOTTOM (1 shl 8)
#define D3DVIS_OUTSIDE_BOTTOM (2 shl 8)
#define D3DVIS_INSIDE_NEAR 0
#define D3DVIS_INTERSECT_NEAR (1 shl 10)
#define D3DVIS_OUTSIDE_NEAR (2 shl 10)
#define D3DVIS_INSIDE_FAR 0
#define D3DVIS_INTERSECT_FAR (1 shl 12)
#define D3DVIS_OUTSIDE_FAR (2 shl 12)
#define D3DVIS_MASK_FRUSTUM (3 shl 0)
#define D3DVIS_MASK_LEFT (3 shl 2)
#define D3DVIS_MASK_RIGHT (3 shl 4)
#define D3DVIS_MASK_TOP (3 shl 6)
#define D3DVIS_MASK_BOTTOM (3 shl 8)
#define D3DVIS_MASK_NEAR (3 shl 10)
#define D3DVIS_MASK_FAR (3 shl 12)
#define D3DDEVINFOID_TEXTUREMANAGER 1
#define D3DDEVINFOID_D3DTEXTUREMANAGER 2
#define D3DDEVINFOID_TEXTURING 3

enum D3DSTATEBLOCKTYPE
	D3DSBT_ALL = 1
	D3DSBT_PIXELSTATE = 2
	D3DSBT_VERTEXSTATE = 3
	D3DSBT_FORCE_DWORD = &hffffffff
end enum

enum D3DVERTEXBLENDFLAGS
	D3DVBLEND_DISABLE = 0
	D3DVBLEND_1WEIGHT = 1
	D3DVBLEND_2WEIGHTS = 2
	D3DVBLEND_3WEIGHTS = 3
end enum

enum D3DTEXTURETRANSFORMFLAGS
	D3DTTFF_DISABLE = 0
	D3DTTFF_COUNT1 = 1
	D3DTTFF_COUNT2 = 2
	D3DTTFF_COUNT3 = 3
	D3DTTFF_COUNT4 = 4
	D3DTTFF_PROJECTED = 256
	D3DTTFF_FORCE_DWORD = &h7fffffff
end enum

#define D3DFVF_TEXTUREFORMAT2 0
#define D3DFVF_TEXTUREFORMAT1 3
#define D3DFVF_TEXTUREFORMAT3 1
#define D3DFVF_TEXTUREFORMAT4 2

#define D3DFVF_TEXCOORDSIZE3(CoordIndex) (D3DFVF_TEXTUREFORMAT3 shl (CoordIndex*2 + 16))
#define D3DFVF_TEXCOORDSIZE2(CoordIndex) (D3DFVF_TEXTUREFORMAT2)
#define D3DFVF_TEXCOORDSIZE4(CoordIndex) (D3DFVF_TEXTUREFORMAT4 shl (CoordIndex*2 + 16))
#define D3DFVF_TEXCOORDSIZE1(CoordIndex) (D3DFVF_TEXTUREFORMAT1 shl (CoordIndex*2 + 16))

#endif
