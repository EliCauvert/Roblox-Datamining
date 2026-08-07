local parent = script.Parent.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local constantsModule = require(parent.Common.Constants)
local react = dependenciesModule.React
local discoverabilityModalAnalyticsContextModule = require(parent.Analytics.DiscoverabilityModalAnalyticsContext)
local setupFireAnalyticsEventsModule = require(parent.Analytics.setupFireAnalyticsEvents)
local analyticsServiceModule = require(parent.Analytics.AnalyticsService)
local useSelector = dependenciesModule.Hooks.useSelector

return function(p0) --[[ line: 11 | named "Container" ]]
	-- upvalues: useSelector (ref), react (ref), discoverabilityModalAnalyticsContextModule (ref), setupFireAnalyticsEventsModule (ref), analyticsServiceModule (ref), constantsModule (ref)
	return function(p1) --[[ line: 12 ]]
		-- upvalues: useSelector (copy), react (copy), discoverabilityModalAnalyticsContextModule (copy), setupFireAnalyticsEventsModule (copy), analyticsServiceModule (copy), constantsModule (copy), p0 (ref)
		return react.createElement(discoverabilityModalAnalyticsContextModule.Provider, {
			value = {
				fireAnalyticsEvent = setupFireAnalyticsEventsModule({
					analytics = analyticsServiceModule,
					defaultAnalyticsInfo = {
						uid = useSelector(function(p2) --[[ line: 13 ]]
							return p2.LocalUserId
						end),
						entry = if p1.navigation then p1.navigation.getParam(constantsModule.ENTRY_POINT) else p1.entryPoint
					}
				})
			}
		}, { react.createElement(p0, p1) })
	end
end