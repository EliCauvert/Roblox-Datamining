local parent = script.Parent.Parent.Parent.Parent.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local t = { size = UDim2.fromScale(1, 1) }

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = var1.size,
		Position = var1.position,
		AnchorPoint = var1.anchorPoint,
		LayoutOrder = var1.layoutOrder
	}, var1.children)
end