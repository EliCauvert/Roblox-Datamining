-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:22 2026 Pacific Standard Time.

local UIBlox = require(script:FindFirstAncestor("SocialLibraries").dependencies).UIBlox

return function(p0) --[[ line: 5 ]]
	-- upvalues: UIBlox (ref)
	local var0 = UIBlox.App.ImageSet.Images[p0]
	
	return {
		Image = var0.Image,
		ImageRectSize = var0.ImageRectSize,
		ImageRectOffset = var0.ImageRectOffset
	}
end