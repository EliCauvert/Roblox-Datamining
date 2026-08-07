return function() --[[ line: 2 | named "createMakeupSchema" ]]
	return {
		ClassName = "Decal",
		_children = {
			{
				Name = "ThumbnailConfiguration",
				ClassName = "Configuration",
				_optional = true,
				_children = { { Name = "SkinColorValue", ClassName = "Color3Value" } }
			},
			{
				Name = "WrapTextureTransfer",
				ClassName = "WrapTextureTransfer"
			}
		}
	}
end