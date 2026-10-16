local ChatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local Parent = ChatLineReporting.Parent
local CoreGui = game:GetService("CoreGui")
local Provider = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider
local LocalizationService = game:GetService("LocalizationService")
local Localization = require(Parent.InExperienceLocales).Localization
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local RoactModule = require(Parent.Roact)
local StyleProviderWithDefaultTheme = require(Parent.Style).StyleProviderWithDefaultTheme
local LayerCollectorProvider = require(Parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local ChatLineReportStepHandlerModule = require(ChatLineReporting.Components.ChatLineReportStepHandler)
local FoundationProvider = require(Parent.Foundation).FoundationProvider
local NewResult = nil
local ChatLineReportRoot = nil

local function Unmount() --[[ Line: 26 ]]
	-- upvalues: ChatLineReportRoot (ref), RoactModule (copy), NewResult (ref)
	if ChatLineReportRoot then
		RoactModule.unmount(ChatLineReportRoot)
		NewResult:teardown()
	end
end

return {
	initialize = function(Messages) --[[ Line: 33 ]]
		-- upvalues: ReactModule (copy), LayerCollectorProvider (copy), RoactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), FoundationProvider (copy), StyleProviderWithDefaultTheme (copy), ChatLineReportStepHandlerModule (copy), Unmount (copy), NewResult (ref), ReactFocusNavigationModule (copy), ChatLineReportRoot (ref), Provider (copy), CoreGui (copy)
		NewResult = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
		ChatLineReportRoot = RoactModule.mount(ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = NewResult }, {
			FocusNavigationRegistryProvider = ReactModule.createElement(Provider, nil, {
				ChatLineReportRoot = ReactModule.createElement("ScreenGui", {
					IgnoreGuiInset = true,
					OnTopOfCoreBlur = false,
					ZIndexBehavior = Enum.ZIndexBehavior.Sibling
				}, {
					LayerCollector = ReactModule.createElement(LayerCollectorProvider, {}, {
						LocalizationProvider = RoactModule.createElement(LocalizationProvider, {
							localization = Localization.new(LocalizationService.RobloxLocaleId)
						}, {
							FoundationProvider = ReactModule.createElement(FoundationProvider, { colorMode = "Dark" }, {
								StyleProvider = ReactModule.createElement(StyleProviderWithDefaultTheme, { withDarkTheme = true }, {
									ChatLineReportStepHandler = ReactModule.createElement(ChatLineReportStepHandlerModule, { unmount = Unmount, messages = Messages })
								})
							})
						})
					})
				})
			})
		}), CoreGui, "ChatLineReportRoot")
	end
}