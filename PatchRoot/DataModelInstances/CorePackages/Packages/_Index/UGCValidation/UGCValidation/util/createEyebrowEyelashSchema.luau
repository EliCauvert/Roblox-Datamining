-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:38 2026 Pacific Standard Time.

return function(p0) --[[ line: 2 | named "createEyebrowEyelashSchema" ]]
	assert(p0, "attachmentName cannot be nil")
	
	return {
		ClassName = "Accessory",
		_children = {
			{
				Name = "ThumbnailConfiguration",
				ClassName = "Configuration",
				_optional = true,
				_children = { { Name = "SkinColorValue", ClassName = "Color3Value" } }
			},
			{
				Name = "Handle",
				ClassName = "MeshPart",
				_children = {
					{ ClassName = "Attachment", Name = p0 },
					{ ClassName = "WrapLayer" },
					{ ClassName = "SurfaceAppearance", _optional = true },
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