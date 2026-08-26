local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.Types)
local foundationImagesModule = require(foundation.Parent.FoundationImages)

return function(p1, p2)
	-- upvalues: foundationImagesModule (ref)
	local resolutionScale = foundationImagesModule.getResolutionScale()
	
	if p1 then
		p1 = Rect.new(p1.Min * resolutionScale, p1.Max * resolutionScale)
		p2 = (p2 or 1) / resolutionScale
	end
	return { center = p1, scale = p2 }
end