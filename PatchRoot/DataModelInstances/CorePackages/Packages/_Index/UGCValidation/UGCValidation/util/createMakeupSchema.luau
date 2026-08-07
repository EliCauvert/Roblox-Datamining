-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:38 2026 Pacific Standard Time.

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