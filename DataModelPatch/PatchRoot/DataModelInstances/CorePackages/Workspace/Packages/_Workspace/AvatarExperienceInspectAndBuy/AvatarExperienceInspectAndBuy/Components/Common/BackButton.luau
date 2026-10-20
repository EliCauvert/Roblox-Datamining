local Parent = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(FoundationModule.IconButton, {
		icon = "chevron-large-left",
		LayoutOrder = 1,
		Size = p1.Size or UDim2.new(0, UseTokensResult.Size.Size_1000, 1, 0),
		Position = p1.Position,
		onActivated = p1.onBackButtonClick or function() end
	})
end