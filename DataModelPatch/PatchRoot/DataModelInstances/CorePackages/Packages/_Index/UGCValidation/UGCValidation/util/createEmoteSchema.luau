local Names = {
	"ThumbnailCharacterRotation", "ThumbnailHorizontalOffset", "ThumbnailKeyframe",
	"ThumbnailVerticalOffset", "ThumbnailZoom", "ThumbnailTime",
	"ThumbnailFieldOfView"
}

return function()
	-- upvalues: Names (copy)
	local config = { ClassName = "Animation", _children = {} }
	
	for _, name in Names do
		table.insert(config._children, { ClassName = "NumberValue", _optional = true, Name = name })
	end
	return config
end