local foundation = script:FindFirstAncestor("Foundation")
local avatarSizeModule = require(foundation.Enums.AvatarSize)
local _ = require(foundation.Providers.Style.Tokens)

return function(p1, p2, p3)
	-- upvalues: avatarSizeModule (ref)
	return if p3 then ({
		[avatarSizeModule.XSmall] = p1.Size.Size_300,
		[avatarSizeModule.Small] = p1.Size.Size_400,
		[avatarSizeModule.Medium] = p1.Size.Size_500,
		[avatarSizeModule.Large] = p1.Size.Size_600,
		[avatarSizeModule.XLarge] = p1.Size.Size_600
	})[p2] else ({
		[avatarSizeModule.XSmall] = p1.Size.Size_600,
		[avatarSizeModule.Small] = p1.Size.Size_800,
		[avatarSizeModule.Medium] = p1.Size.Size_1000,
		[avatarSizeModule.Large] = p1.Size.Size_1200,
		[avatarSizeModule.XLarge] = p1.Size.Size_1400,
		[avatarSizeModule.Pictogram] = p1.Size.Size_2400
	})[p2]
end