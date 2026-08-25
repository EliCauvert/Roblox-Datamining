local parent = script:FindFirstAncestor("SocialCommon").Parent
local reactModule = require(parent.React)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector

return function()
	-- upvalues: useStyle (ref), useSelector (ref), reactModule (ref)
	local var1 = useStyle()
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		ZIndex = 3,
		BackgroundColor3 = var1.Theme.BackgroundDefault.Color,
		BackgroundTransparency = var1.Theme.BackgroundDefault.Transparency,
		Position = UDim2.new(0, 0, 1, 0),
		Size = UDim2.new(1, 0, 0, useSelector(function(p0)
			return if p0.GlobalGuiInset then p0.GlobalGuiInset.bottom else 0
		end))
	})
end