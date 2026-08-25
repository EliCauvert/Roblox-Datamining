local list = {
	"ThumbnailCharacterRotation", "ThumbnailHorizontalOffset", "ThumbnailKeyframe",
	"ThumbnailVerticalOffset", "ThumbnailZoom", "ThumbnailTime",
	"ThumbnailFieldOfView"
}

return function()
	-- upvalues: list (ref)
	local t = { ClassName = "Animation", _children = {} }
	
	for i, v in list do
		table.insert(t._children, { ClassName = "NumberValue", _optional = true, Name = v })
	end
	return t
end