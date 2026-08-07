local parent = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens

return function(p0) --[[ line: 19 ]]
	-- upvalues: useTokens (ref), reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.IconButton, {
		icon = "chevron-large-left",
		LayoutOrder = 1,
		Size = p0.Size or UDim2.new(0, useTokens().Size.Size_1000, 1, 0),
		Position = p0.Position,
		onActivated = p0.onBackButtonClick or function() --[[ line: 28 ]] end
	})
end