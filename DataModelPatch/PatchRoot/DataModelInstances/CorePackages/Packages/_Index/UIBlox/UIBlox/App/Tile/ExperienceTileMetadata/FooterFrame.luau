local Parent = script.Parent.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local config = { size = UDim2.fromScale(1, 1) }

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = JoinResult.size,
		Position = JoinResult.position,
		AnchorPoint = JoinResult.anchorPoint,
		LayoutOrder = JoinResult.layoutOrder
	}, JoinResult.children)
end