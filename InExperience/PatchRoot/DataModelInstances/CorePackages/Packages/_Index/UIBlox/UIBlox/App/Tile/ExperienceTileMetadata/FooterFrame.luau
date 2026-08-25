local parent = script.Parent.Parent.Parent.Parent.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local t = { size = UDim2.fromScale(1, 1) }

return function(p0)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref)
	local var3 = cryoModule.Dictionary.join(t, p0)
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = var3.size,
		Position = var3.position,
		AnchorPoint = var3.anchorPoint,
		LayoutOrder = var3.layoutOrder
	}, var3.children)
end