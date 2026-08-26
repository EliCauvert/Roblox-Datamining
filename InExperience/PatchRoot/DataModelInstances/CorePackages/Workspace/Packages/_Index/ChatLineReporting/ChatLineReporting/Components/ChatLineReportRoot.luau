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
local var1 = nil
local var2 = nil

local var3 = function()
	-- upvalues: var2 (write), roactModule (ref), fFlagChatLineReportingFocusFixesEnabled (ref), var1 (write)
	if var2 then
		roactModule.unmount(var2)
		
		if fFlagChatLineReportingFocusFixesEnabled then
			var1:teardown()
		end
	end
end

return {
	initialize = function(p1)
		-- upvalues: reactModule (ref), layerCollectorProvider (ref), roactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), foundationProvider (ref), styleProviderWithDefaultTheme (ref), chatLineReportStepHandlerModule (ref), var3 (ref), fFlagChatLineReportingFocusFixesEnabled (ref), var1 (write), reactFocusNavigationModule (ref), var2 (write), provider (ref), coreGuiService (ref)
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
							ChatLineReportStepHandler = reactModule.createElement(chatLineReportStepHandlerModule, { unmount = var3, messages = p1 })
						})
					})
				})
			})
		})
		
		if fFlagChatLineReportingFocusFixesEnabled then
			var1 = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
			var2 = roactModule.mount(reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var1 }, {
				FocusNavigationRegistryProvider = reactModule.createElement(provider, nil, { ChatLineReportRoot = screenGui })
			}), coreGuiService, "ChatLineReportRoot")
			
			return
		end
		var2 = roactModule.mount(screenGui, coreGuiService, "ChatLineReportRoot")
	end
}