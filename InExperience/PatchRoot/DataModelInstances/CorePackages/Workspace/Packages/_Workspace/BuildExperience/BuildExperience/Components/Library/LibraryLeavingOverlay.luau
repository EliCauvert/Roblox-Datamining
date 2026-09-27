local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local loading = foundationModule.Loading
local view = foundationModule.View

return function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), view (ref), loading (ref)
	return reactModule.createElement(view, {
		tag = "size-full row align-x-center align-y-center",
		testId = "Library.Leaving",
		ZIndex = p1.ZIndex,
		backgroundStyle = foundationModule.Hooks.useTokens().Color.Common.Backdrop,
		onActivated = function() end,
		selection = { Selectable = false },
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		}
	}, { Spinner = reactModule.createElement(loading, {}) })
end