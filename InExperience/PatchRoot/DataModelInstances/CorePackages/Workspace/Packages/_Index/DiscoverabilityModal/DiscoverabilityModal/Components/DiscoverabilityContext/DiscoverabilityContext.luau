local parent = script.Parent.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local constantsModule = require(parent.Common.Constants)
local react = dependenciesModule.React
local discoverabilityModalAnalyticsContextModule = require(parent.Analytics.DiscoverabilityModalAnalyticsContext)
local setupFireAnalyticsEventsModule = require(parent.Analytics.setupFireAnalyticsEvents)
local analyticsServiceModule = require(parent.Analytics.AnalyticsService)
local useSelector = dependenciesModule.Hooks.useSelector

return function(p1)
	-- upvalues: useSelector (ref), react (ref), discoverabilityModalAnalyticsContextModule (ref), setupFireAnalyticsEventsModule (ref), analyticsServiceModule (ref), constantsModule (ref)
	return function(p2)
		-- upvalues: useSelector (copy), react (copy), discoverabilityModalAnalyticsContextModule (copy), setupFireAnalyticsEventsModule (copy), analyticsServiceModule (copy), constantsModule (copy), p1 (ref)
		return react.createElement(discoverabilityModalAnalyticsContextModule.Provider, {
			value = {
				fireAnalyticsEvent = setupFireAnalyticsEventsModule({
					analytics = analyticsServiceModule,
					defaultAnalyticsInfo = {
						uid = useSelector(function(p3)
							return p3.LocalUserId
						end),
						entry = if p2.navigation then p2.navigation.getParam(constantsModule.ENTRY_POINT) else p2.entryPoint
					}
				})
			}
		}, { react.createElement(p1, p2) })
	end
end