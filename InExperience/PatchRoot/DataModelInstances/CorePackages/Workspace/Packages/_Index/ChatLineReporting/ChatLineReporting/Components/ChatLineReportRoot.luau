local chatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local parent = chatLineReporting.Parent
local coreGuiService = game:GetService("CoreGui")
local provider = require(parent.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider
local localizationService = game:GetService("LocalizationService")
local localization = require(parent.InExperienceLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local roactModule = require(parent.Roact)
local styleProviderWithDefaultTheme = require(parent.Style).StyleProviderWithDefaultTheme
local layerCollectorProvider = require(parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local fFlagChatLineReportingFocusFixesEnabled = require(parent.SharedFlags).FFlagChatLineReportingFocusFixesEnabled
local chatLineReportStepHandlerModule = require(chatLineReporting.Components.ChatLineReportStepHandler)
local foundationProvider = require(parent.Foundation).FoundationProvider
local var7 = nil
local var8 = nil

local var9 = function() --[[ line: 28 ]]
	-- upvalues: var8 (write), roactModule (ref), fFlagChatLineReportingFocusFixesEnabled (ref), var7 (write)
	if var8 then
		roactModule.unmount(var8)
		
		if fFlagChatLineReportingFocusFixesEnabled then
			var7:teardown()
		end
	end
end

return {
	initialize = function(p0) --[[ line: 38 ]]
		-- upvalues: reactModule (ref), layerCollectorProvider (ref), roactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), foundationProvider (ref), styleProviderWithDefaultTheme (ref), chatLineReportStepHandlerModule (ref), var9 (ref), fFlagChatLineReportingFocusFixesEnabled (ref), var7 (write), reactFocusNavigationModule (ref), var8 (write), provider (ref), coreGuiService (ref)
		local screenGui = reactModule.createElement("ScreenGui", {
			IgnoreGuiInset = true,
			OnTopOfCoreBlur = false,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			LayerCollector = reactModule.createElement(layerCollectorProvider, {}, {
				LocalizationProvider = roactModule.createElement(localizationProvider, {
					localization = localization.new(localizationService.RobloxLocaleId)
				}, {
					FoundationProvider = reactModule.createElement(foundationProvider, { colorMode = "Dark" }, {
						StyleProvider = reactModule.createElement(styleProviderWithDefaultTheme, { withDarkTheme = true }, {
							ChatLineReportStepHandler = reactModule.createElement(chatLineReportStepHandlerModule, { unmount = var9, messages = p0 })
						})
					})
				})
			})
		})
		
		if fFlagChatLineReportingFocusFixesEnabled then
			var7 = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
			var8 = roactModule.mount(reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var7 }, {
				FocusNavigationRegistryProvider = reactModule.createElement(provider, nil, { ChatLineReportRoot = screenGui })
			}), coreGuiService, "ChatLineReportRoot")
			
			return
		end
		var8 = roactModule.mount(screenGui, coreGuiService, "ChatLineReportRoot")
	end
}