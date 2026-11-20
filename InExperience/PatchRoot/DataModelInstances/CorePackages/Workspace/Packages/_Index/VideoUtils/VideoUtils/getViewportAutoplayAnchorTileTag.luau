local ViewportAutoplayAnchorTileTagModule = require(script.Parent.ViewportAutoplayAnchorTileTag)
local LuaAppVideoAutoplayAnchorTileCount = game:DefineFastInt("LuaAppVideoAutoplayAnchorTileCount", 2)

return function(p1)
	-- upvalues: LuaAppVideoAutoplayAnchorTileCount (copy), ViewportAutoplayAnchorTileTagModule (copy)
	return if p1 <= LuaAppVideoAutoplayAnchorTileCount then ViewportAutoplayAnchorTileTagModule else nil
end