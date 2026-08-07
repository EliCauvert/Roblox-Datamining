local parent = script.Parent.Parent.Parent
local socialLuaAnalyticsModule = require(parent.Parent.SocialLuaAnalytics)
local dependenciesModule = require(parent.dependencies)
local react = dependenciesModule.React
local useLocalUserId = dependenciesModule.Hooks.useLocalUserId
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Common.Constants)
local defaultAnalyticsService = socialLuaAnalyticsModule.Analytics.DefaultAnalyticsService
local setAliasModalContainerModule = require(script.Parent.SetAliasModalContainer)

return function(p0) --[[ line: 15 ]]
	-- upvalues: useLocalUserId (ref), react (ref), analyticsModule (ref), defaultAnalyticsService (ref), constantsModule (ref), setAliasModalContainerModule (ref)
	return react.createElement(analyticsModule.Context.Provider, {
		value = {
			fireAnalyticsEvent = analyticsModule.setupFireAnalyticsEvents({
				analytics = defaultAnalyticsService,
				infoForAllEvents = {
					uid = useLocalUserId(),
					origin = p0.navigation.getParam(constantsModule.ORIGIN)
				}
			})
		}
	}, { react.createElement(setAliasModalContainerModule, p0) })
end