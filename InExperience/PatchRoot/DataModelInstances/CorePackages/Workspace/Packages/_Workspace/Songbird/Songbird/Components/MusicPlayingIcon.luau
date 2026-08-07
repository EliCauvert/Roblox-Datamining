local songbird = script:FindFirstAncestor("Songbird")
local cryoModule = require(songbird.Parent.Cryo)
local reactModule = require(songbird.Parent.React)
local animatedBarModule = require(songbird.Components.AnimatedBar)
local t = { numAnimatedBars = 5, isMoving = true }
local list = { 0.4, 0.3, 0.75, 0.55 }

return function(p0) --[[ line: 27 | named "MusicPlayingIcon" ]]
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), animatedBarModule (ref), list (ref)
	local var6 = cryoModule.Dictionary.join(t, p0)
	local var7 = 8 / var6.numAnimatedBars
	local t_1 = {}
	
	for i = 1, var6.numAnimatedBars do
		t_1[`Bar{i}`] = reactModule.createElement(animatedBarModule, {
			layoutOrder = i,
			width = UDim.new(1 / (var6.numAnimatedBars * 1.3), -var7),
			heightRange = var6.heightRange,
			isMoving = var6.isMoving,
			staticHeight = list[i]
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ZIndex = var6.zIndex
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, var7)
		})
	}, t_1)
end