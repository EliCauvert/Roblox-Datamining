local Parent = script:FindFirstAncestor("AvatarWorkshop").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Toast = FoundationModule.Toast

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Toast (copy)
	local UseTokensResult = UseTokensFunction()
	local OnDismiss = p1.onDismiss
	ReactModule.useEffect(function()
		-- upvalues: OnDismiss (copy)
		local DelayedThread = task.delay(5, OnDismiss)
		
		return function()
			-- upvalues: DelayedThread (copy)
			task.cancel(DelayedThread)
		end
	end, { OnDismiss })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 10,
		AutomaticSize = Enum.AutomaticSize.Y,
		AnchorPoint = Vector2.new(0.5, 1),
		Position = UDim2.new(0.5, 0, 1, -UseTokensResult.Padding.Large),
		Size = UDim2.new(1, -2 * UseTokensResult.Padding.Large, 0, 0)
	}, {
		MaxWidth = ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(400, 1e999) }),
		Toast = ReactModule.createElement(Toast, {
			title = p1.title,
			actions = p1.actions,
			width = UDim.new(1, 0),
			testId = p1.testId
		})
	})
end