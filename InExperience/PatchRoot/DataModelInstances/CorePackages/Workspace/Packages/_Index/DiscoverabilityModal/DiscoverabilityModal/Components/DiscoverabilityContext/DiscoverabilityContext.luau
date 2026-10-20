local Parent = script.Parent.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local ConstantsModule = require(Parent.Common.Constants)
local React = DependenciesModule.React
local DiscoverabilityModalAnalyticsContextModule = require(Parent.Analytics.DiscoverabilityModalAnalyticsContext)
local SetupFireAnalyticsEventsModule = require(Parent.Analytics.setupFireAnalyticsEvents)
local AnalyticsServiceModule = require(Parent.Analytics.AnalyticsService)
local UseSelectorFunction = DependenciesModule.Hooks.useSelector

return function(p1)
	-- upvalues: UseSelectorFunction (copy), React (copy), DiscoverabilityModalAnalyticsContextModule (copy), SetupFireAnalyticsEventsModule (copy), AnalyticsServiceModule (copy), ConstantsModule (copy)
	return function(p2)
		-- upvalues: UseSelectorFunction (upval), React (upval), DiscoverabilityModalAnalyticsContextModule (upval), SetupFireAnalyticsEventsModule (upval), AnalyticsServiceModule (upval), ConstantsModule (upval), p1 (copy)
		return React.createElement(DiscoverabilityModalAnalyticsContextModule.Provider, {
			value = {
				fireAnalyticsEvent = SetupFireAnalyticsEventsModule({
					analytics = AnalyticsServiceModule,
					defaultAnalyticsInfo = {
						uid = UseSelectorFunction(function(p3)
							return p3.LocalUserId
						end),
						entry = if p2.navigation then p2.navigation.getParam(ConstantsModule.ENTRY_POINT) else p2.entryPoint
					}
				})
			}
		}, { React.createElement(p1, p2) })
	end
end