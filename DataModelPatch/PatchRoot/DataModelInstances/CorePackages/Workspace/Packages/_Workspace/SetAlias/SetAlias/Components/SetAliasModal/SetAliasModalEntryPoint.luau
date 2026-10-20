local Parent = script.Parent.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local React = DependenciesModule.React
local UseLocalUserIdFunction = DependenciesModule.Hooks.useLocalUserId
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Common.Constants)
local DefaultAnalyticsService = require(Parent.Parent.SocialLuaAnalytics).Analytics.DefaultAnalyticsService
local SetAliasModalContainerModule = require(script.Parent.SetAliasModalContainer)

return function(p1)
	-- upvalues: UseLocalUserIdFunction (copy), React (copy), AnalyticsModule (copy), DefaultAnalyticsService (copy), ConstantsModule (copy), SetAliasModalContainerModule (copy)
	return React.createElement(AnalyticsModule.Context.Provider, {
		value = {
			fireAnalyticsEvent = AnalyticsModule.setupFireAnalyticsEvents({
				analytics = DefaultAnalyticsService,
				infoForAllEvents = {
					uid = UseLocalUserIdFunction(),
					origin = p1.navigation.getParam(ConstantsModule.ORIGIN)
				}
			})
		}
	}, { React.createElement(SetAliasModalContainerModule, p1) })
end