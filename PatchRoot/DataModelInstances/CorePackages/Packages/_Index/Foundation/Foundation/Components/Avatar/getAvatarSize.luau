-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:59 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local avatarSizeModule = require(foundation.Enums.AvatarSize)
local _ = require(foundation.Providers.Style.Tokens)

return function(p0, p1, p2) --[[ line: 9 | named "getAvatarSize" ]]
	-- upvalues: avatarSizeModule (ref)
	return if p2 then ({
		[avatarSizeModule.XSmall] = p0.Size.Size_300,
		[avatarSizeModule.Small] = p0.Size.Size_400,
		[avatarSizeModule.Medium] = p0.Size.Size_500,
		[avatarSizeModule.Large] = p0.Size.Size_600,
		[avatarSizeModule.XLarge] = p0.Size.Size_600
	})[p1] else ({
		[avatarSizeModule.XSmall] = p0.Size.Size_600,
		[avatarSizeModule.Small] = p0.Size.Size_800,
		[avatarSizeModule.Medium] = p0.Size.Size_1000,
		[avatarSizeModule.Large] = p0.Size.Size_1200,
		[avatarSizeModule.XLarge] = p0.Size.Size_1400,
		[avatarSizeModule.Pictogram] = p0.Size.Size_2400
	})[p1]
end