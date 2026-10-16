return function(Name) --[[ Line: 2 | Named "createAccessorySchema" ]]
	assert(Name, "attachmentName cannot be nil")
	
	return {
		ClassName = "Accessory",
		_children = {
			{
				Name = "ThumbnailConfiguration",
				ClassName = "Configuration",
				_optional = true,
				_children = {
					{
						Name = "ThumbnailCameraTarget",
						ClassName = "ObjectValue"
					},
					{ Name = "ThumbnailCameraValue", ClassName = "CFrameValue" }
				}
			},
			{
				Name = "Handle",
				ClassName = "Part",
				_children = {
					{ ClassName = "Attachment", Name = Name },
					{ ClassName = "SpecialMesh" },
					{
						ClassName = "StringValue",
						Name = "AvatarPartScaleType",
						_optional = true
					},
					{ ClassName = "TouchTransmitter", _optional = true }
				}
			}
		}
	}
end