local parent = script:FindFirstAncestor("InterventionShared").Parent
local reactModule = require(parent.React)
local useStyle = require(parent.UIBlox).Core.Style.useStyle

return function(p1)
	-- upvalues: useStyle (ref), reactModule (ref)
	local var1 = useStyle()
	
	return reactModule.createElement("TextButton", {
		AutoButtonColor = false,
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = var1.Tokens.Color.Common.Scrim.Color3,
		BackgroundTransparency = var1.Tokens.Color.Common.Scrim.Transparency,
		BorderSizePixel = 0,
		Text = "",
		[reactModule.Event.Activated] = p1.onDismiss
	}, p1.children)
end