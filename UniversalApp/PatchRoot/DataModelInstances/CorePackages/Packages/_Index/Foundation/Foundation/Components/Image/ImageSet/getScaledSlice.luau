local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.Types)
local foundationImagesModule = require(foundation.Parent.FoundationImages)

return function(p0, p1)
	-- upvalues: foundationImagesModule (ref)
	local resolutionScale = foundationImagesModule.getResolutionScale()
	
	if p0 then
		p0 = Rect.new(p0.Min * resolutionScale, p0.Max * resolutionScale)
		p1 = (p1 or 1) / resolutionScale
	end
	return { center = p0, scale = p1 }
end