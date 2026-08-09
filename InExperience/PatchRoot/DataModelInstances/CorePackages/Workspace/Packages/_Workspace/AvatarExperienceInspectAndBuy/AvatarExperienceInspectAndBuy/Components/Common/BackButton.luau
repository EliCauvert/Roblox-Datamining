local parent = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local fFlagAXUseNewChevronIcon = require(parent.AvatarExperienceFlags).FFlagAXUseNewChevronIcon

return function(p0) --[[ line: 21 ]]
	-- upvalues: useTokens (ref), reactModule (ref), foundationModule (ref), fFlagAXUseNewChevronIcon (ref)
	return reactModule.createElement(foundationModule.IconButton, {
		LayoutOrder = 1,
		icon = if fFlagAXUseNewChevronIcon then "chevron-large-left" else "icons/actions/cycleLeft",
		Size = p0.Size or UDim2.new(0, useTokens().Size.Size_1000, 1, 0),
		Position = p0.Position,
		onActivated = p0.onBackButtonClick or function() --[[ line: 30 ]] end
	})
end