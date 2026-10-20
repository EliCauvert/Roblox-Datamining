local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local EventNamesModule = require(Parent.Analytics.EventNames)
local MenuButtonModule = require(Parent.Components.Common.MenuButton)
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)

return function(Frame)
	-- upvalues: UseAnalyticsModule (copy), UseLocalizationFunction (copy), ReactModule (copy), EventNamesModule (copy), MenuButtonModule (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	
	return ReactModule.createElement(MenuButtonModule, {
		buttonHeight = Frame.buttonHeight,
		LayoutOrder = Frame.LayoutOrder,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), Frame (copy)
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesShowMoreInGameMenu)
			Frame.onActivated()
		end, { Frame.onActivated }),
		text = UseLocalizationFunction({ showMore = "Feature.Avatar.Action.ShowMore" }).showMore
	})
end