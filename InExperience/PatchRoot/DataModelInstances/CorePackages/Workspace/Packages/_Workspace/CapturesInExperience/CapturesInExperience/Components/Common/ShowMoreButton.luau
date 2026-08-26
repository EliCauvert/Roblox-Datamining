local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local useLocalization = require(parent_1.Localization).Hooks.useLocalization
local eventNamesModule = require(parent.Analytics.EventNames)
local menuButtonModule = require(parent.Components.Common.MenuButton)
local useAnalyticsModule = require(parent.Analytics.useAnalytics)

return function(p1)
	-- upvalues: useAnalyticsModule (ref), useLocalization (ref), reactModule (ref), eventNamesModule (ref), menuButtonModule (ref)
	local var1 = useAnalyticsModule()
	
	return reactModule.createElement(menuButtonModule, {
		buttonHeight = p1.buttonHeight,
		LayoutOrder = p1.LayoutOrder,
		onActivated = reactModule.useCallback(function()
			-- upvalues: var1 (ref), eventNamesModule (copy), p1 (ref)
			var1.fireEvent(eventNamesModule.CapturesShowMoreInGameMenu)
			p1.onActivated()
		end, { p1.onActivated }),
		text = useLocalization({ showMore = "Feature.Avatar.Action.ShowMore" }).showMore
	})
end