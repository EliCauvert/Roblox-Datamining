local Songbird = script:FindFirstAncestor("Songbird")
local CryoModule = require(Songbird.Parent.Cryo)
local ReactModule = require(Songbird.Parent.React)
local AnimatedBarModule = require(Songbird.Components.AnimatedBar)
local config = { numAnimatedBars = 5, isMoving = true }
local list = { 0.4, 0.3, 0.75, 0.55 }

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), AnimatedBarModule (copy), list (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local Offset = 8 / JoinResult.numAnimatedBars
	local Elements = {}
	
	for i = 1, JoinResult.numAnimatedBars do
		Elements[`Bar{i}`] = ReactModule.createElement(AnimatedBarModule, {
			layoutOrder = i,
			width = UDim.new(1 / (JoinResult.numAnimatedBars * 1.3), -Offset),
			heightRange = JoinResult.heightRange,
			isMoving = JoinResult.isMoving,
			staticHeight = list[i]
		})
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ZIndex = JoinResult.zIndex
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, Offset)
		})
	}, Elements)
end