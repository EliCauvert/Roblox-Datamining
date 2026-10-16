local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local AbuseReportAnalyticsProvider = require(GenericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext).AbuseReportAnalyticsProvider
local ArTranslationProvider = require(GenericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).ArTranslationProvider
local LayoutSlotsModule = require(GenericAbuseReporting.BeduiV2.Components.LayoutSlots)
local InlineSlots = LayoutSlotsModule.inlineSlots
local LayoutSlotsProvider = LayoutSlotsModule.LayoutSlotsProvider
local OverlaidControlsProvider = LayoutSlotsModule.OverlaidControlsProvider
local LoaderProvider = require(GenericAbuseReporting.BeduiV2.Loaders.LoaderContext).LoaderProvider
local _UDim2 = UDim2.new(0, 468, 0, 560)
local t = {}
local t1 = {}
local Analytics = {
	sendEvent = function(...) --[[ Line: 25 ]]
		print("Analytics:", ...)
	end
}

return function(p1) --[[ Line: 37 | Named "NodeStoryProviders" ]]
	-- upvalues: ReactModule (copy), AbuseReportAnalyticsProvider (copy), Analytics (copy), ArTranslationProvider (copy), t1 (copy), LoaderProvider (copy), t (copy), LayoutSlotsProvider (copy), InlineSlots (copy), OverlaidControlsProvider (copy), View (copy), _UDim2 (copy), FoundationModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	
	return ReactModule.createElement(AbuseReportAnalyticsProvider, { analytics = Analytics }, {
		Translation = ReactModule.createElement(ArTranslationProvider, { translations = p1.translations or t1 }, {
			LoaderCtx = ReactModule.createElement(LoaderProvider, { open = true, loaders = p1.loaders or t }, {
				Layout = ReactModule.createElement(LayoutSlotsProvider, { slots = InlineSlots }, {
					Orientation = ReactModule.createElement(OverlaidControlsProvider, { value = true }, {
						Container = ReactModule.createElement(View, {
							ClipsDescendants = true,
							tag = "col",
							Size = p1.containerSize or _UDim2,
							ref = UseStateResult2
						}, {
							Overlay = UseStateResult and ReactModule.createElement(FoundationModule.OverlayProvider, { gui = UseStateResult }, p1.children) or nil
						})
					})
				})
			})
		})
	})
end