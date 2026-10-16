local Parent = script:FindFirstAncestor("SocialCommon").Parent
local ReactModule = require(Parent.React)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function() --[[ Line: 16 ]]
	-- upvalues: UseStyleFunction (copy), UseSelectorFunction (copy), ReactModule (copy)
	local UseStyleResult = UseStyleFunction()
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		ZIndex = 3,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
		BackgroundTransparency = UseStyleResult.Theme.BackgroundDefault.Transparency,
		Position = UDim2.new(0, 0, 1, 0),
		Size = UDim2.new(1, 0, 0, (UseSelectorFunction(function(p1) --[[ Line: 18 ]]
			return if p1.GlobalGuiInset then p1.GlobalGuiInset.bottom else 0
		end)))
	})
end