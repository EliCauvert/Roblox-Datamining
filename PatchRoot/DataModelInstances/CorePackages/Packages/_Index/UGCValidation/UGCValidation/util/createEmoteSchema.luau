-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:38 2026 Pacific Standard Time.

local list = {
	"ThumbnailCharacterRotation", "ThumbnailHorizontalOffset", "ThumbnailKeyframe",
	"ThumbnailVerticalOffset", "ThumbnailZoom", "ThumbnailTime",
	"ThumbnailFieldOfView"
}

return function() --[[ line: 15 | named "createEmoteSchema" ]]
	-- upvalues: list (ref)
	local t = { ClassName = "Animation", _children = {} }
	
	for i, v in list do
		table.insert(t._children, { ClassName = "NumberValue", _optional = true, Name = v })
	end
	return t
end