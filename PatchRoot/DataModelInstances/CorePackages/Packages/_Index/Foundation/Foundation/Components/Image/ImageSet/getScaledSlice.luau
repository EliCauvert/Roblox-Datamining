-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:04 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.Types)
local foundationImagesModule = require(foundation.Parent.FoundationImages)

return function(p0, p1) --[[ line: 9 | named "getScaledSlice" ]]
	-- upvalues: foundationImagesModule (ref)
	local resolutionScale = foundationImagesModule.getResolutionScale()
	
	if p0 then
		p0 = Rect.new(p0.Min * resolutionScale, p0.Max * resolutionScale)
		p1 = (p1 or 1) / resolutionScale
	end
	return { center = p0, scale = p1 }
end