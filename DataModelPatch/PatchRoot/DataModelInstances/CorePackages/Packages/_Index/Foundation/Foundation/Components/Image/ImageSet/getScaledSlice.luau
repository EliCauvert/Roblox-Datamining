local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Components.Types)
local FoundationImagesModule = require(Foundation.Parent.FoundationImages)

return function(Center: Rect, Scale)
	-- upvalues: FoundationImagesModule (copy)
	local ResolutionScale = FoundationImagesModule.getResolutionScale()
	
	if Center then
		Center = Rect.new(Center.Min * ResolutionScale, Center.Max * ResolutionScale)
		Scale = (Scale or 1) / ResolutionScale
	end
	return { center = Center, scale = Scale }
end