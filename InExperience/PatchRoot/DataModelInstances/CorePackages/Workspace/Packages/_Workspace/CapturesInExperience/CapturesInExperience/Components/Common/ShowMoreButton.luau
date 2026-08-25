local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local useLocalization = require(parent_1.Localization).Hooks.useLocalization
local eventNamesModule = require(parent.Analytics.EventNames)
local menuButtonModule = require(parent.Components.Common.MenuButton)
local useAnalyticsModule = require(parent.Analytics.useAnalytics)

return function(p0)
	-- upvalues: useAnalyticsModule (ref), useLocalization (ref), reactModule (ref), eventNamesModule (ref), menuButtonModule (ref)
	local var4 = useAnalyticsModule()
	
	return reactModule.createElement(menuButtonModule, {
		buttonHeight = p0.buttonHeight,
		LayoutOrder = p0.LayoutOrder,
		onActivated = reactModule.useCallback(function()
			-- upvalues: var4 (ref), eventNamesModule (copy), p0 (ref)
			var4.fireEvent(eventNamesModule.CapturesShowMoreInGameMenu)
			p0.onActivated()
		end, { p0.onActivated }),
		text = useLocalization({ showMore = "Feature.Avatar.Action.ShowMore" }).showMore
	})
end