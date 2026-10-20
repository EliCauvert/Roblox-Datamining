local Parent = script:FindFirstAncestor("InterventionShared").Parent
local ReactModule = require(Parent.React)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle

return function(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy)
	local UseStyleResult = UseStyleFunction()
	
	return ReactModule.createElement("TextButton", {
		AutoButtonColor = false,
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = UseStyleResult.Tokens.Color.Common.Scrim.Color3,
		BackgroundTransparency = UseStyleResult.Tokens.Color.Common.Scrim.Transparency,
		BorderSizePixel = 0,
		Text = "",
		[ReactModule.Event.Activated] = p1.onDismiss
	}, p1.children)
end