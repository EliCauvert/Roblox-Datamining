local Foundation = script:FindFirstAncestor("Foundation")
local AvatarSizeModule = require(Foundation.Enums.AvatarSize)
local _ = require(Foundation.Providers.Style.Tokens)

return function(p1, p2, p3) --[[ Line: 9 | Named "getAvatarSize" ]]
	-- upvalues: AvatarSizeModule (copy)
	return if p3 then ({
		[AvatarSizeModule.XSmall] = p1.Size.Size_300,
		[AvatarSizeModule.Small] = p1.Size.Size_400,
		[AvatarSizeModule.Medium] = p1.Size.Size_500,
		[AvatarSizeModule.Large] = p1.Size.Size_600,
		[AvatarSizeModule.XLarge] = p1.Size.Size_600
	})[p2] else ({
		[AvatarSizeModule.XSmall] = p1.Size.Size_600,
		[AvatarSizeModule.Small] = p1.Size.Size_800,
		[AvatarSizeModule.Medium] = p1.Size.Size_1000,
		[AvatarSizeModule.Large] = p1.Size.Size_1200,
		[AvatarSizeModule.XLarge] = p1.Size.Size_1400,
		[AvatarSizeModule.Pictogram] = p1.Size.Size_2400
	})[p2]
end