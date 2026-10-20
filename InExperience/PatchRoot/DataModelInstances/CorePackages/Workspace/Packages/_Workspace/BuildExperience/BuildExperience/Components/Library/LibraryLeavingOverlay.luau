local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Loading = FoundationModule.Loading
local View = FoundationModule.View

return function(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), View (copy), Loading (copy)
	return ReactModule.createElement(View, {
		tag = "size-full row align-x-center align-y-center",
		testId = "Library.Leaving",
		ZIndex = p1.ZIndex,
		backgroundStyle = FoundationModule.Hooks.useTokens().Color.Common.Backdrop,
		onActivated = function() end,
		selection = { Selectable = false },
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		}
	}, { Spinner = ReactModule.createElement(Loading, {}) })
end