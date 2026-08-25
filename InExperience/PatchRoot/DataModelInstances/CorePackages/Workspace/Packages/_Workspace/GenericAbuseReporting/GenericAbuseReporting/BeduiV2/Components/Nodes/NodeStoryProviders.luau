local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local abuseReportAnalyticsProvider = require(genericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext).AbuseReportAnalyticsProvider
local arTranslationProvider = require(genericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).ArTranslationProvider
local layoutSlotsModule = require(genericAbuseReporting.BeduiV2.Components.LayoutSlots)
local loaderContextModule = require(genericAbuseReporting.BeduiV2.Loaders.LoaderContext)
local inlineSlots = layoutSlotsModule.inlineSlots
local layoutSlotsProvider = layoutSlotsModule.LayoutSlotsProvider
local overlaidControlsProvider = layoutSlotsModule.OverlaidControlsProvider
local loaderProvider = loaderContextModule.LoaderProvider
local uDim2 = UDim2.new(0, 468, 0, 560)
local t = {}
local t_1 = {}
local t_2 = {
	sendEvent = function(...)
		print("Analytics:", ...)
	end
}

return function(p0)
	-- upvalues: reactModule (ref), abuseReportAnalyticsProvider (ref), t_2 (ref), arTranslationProvider (ref), t_1 (ref), loaderProvider (ref), t (ref), layoutSlotsProvider (ref), inlineSlots (ref), overlaidControlsProvider (ref), view (ref), uDim2 (ref), foundationModule (ref)
	local var9, var10 = reactModule.useState(nil)
	
	return reactModule.createElement(abuseReportAnalyticsProvider, { analytics = t_2 }, {
		Translation = reactModule.createElement(arTranslationProvider, { translations = p0.translations or t_1 }, {
			LoaderCtx = reactModule.createElement(loaderProvider, { open = true, loaders = p0.loaders or t }, {
				Layout = reactModule.createElement(layoutSlotsProvider, { slots = inlineSlots }, {
					Orientation = reactModule.createElement(overlaidControlsProvider, { value = true }, {
						Container = reactModule.createElement(view, {
							ClipsDescendants = true,
							tag = "col",
							Size = p0.containerSize or uDim2,
							ref = var10
						}, {
							Overlay = var9 and reactModule.createElement(foundationModule.OverlayProvider, { gui = var9 }, p0.children) or nil
						})
					})
				})
			})
		})
	})
end