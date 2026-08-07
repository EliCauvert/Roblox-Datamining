local _ = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local purchasePromptDepsModule = require(parent.PurchasePromptDeps)
local loggingProtocolModule = require(parent.LoggingProtocol)
local roact = purchasePromptDepsModule.Roact
local _ = purchasePromptDepsModule.Rodux
local roactRodux = purchasePromptDepsModule.RoactRodux
local _ = purchasePromptDepsModule.UIBlox.Style.Provider
local localeProvider = require(parent.IAPExperience).Locale.LocaleProvider
local toast = require(parent.ToastLite).Components.Toast
local _ = require(purchasePrompt.Reducers.Reducer)
local _ = require(purchasePrompt.Services.ABTest)
local _ = require(purchasePrompt.Services.Network)
local _ = require(purchasePrompt.Services.Analytics)
local _ = require(purchasePrompt.Services.PlatformInterface)
local externalSettingsModule = require(purchasePrompt.Services.ExternalSettings)
local _ = require(purchasePrompt.Thunk)
local eventConnectionsModule = require(script.Parent.Connection.EventConnections)
local layoutValuesProviderModule = require(script.Parent.Connection.LayoutValuesProvider)
local provideRobloxLocaleModule = require(script.Parent.Connection.provideRobloxLocale)
local purchasePromptPolicyModule = require(purchasePrompt.Components.Connection.PurchasePromptPolicy)
local productPurchaseContainerModule = require(script.Parent.ProductPurchase.ProductPurchaseContainer)
local robuxUpsellContainerModule = require(script.Parent.RobuxUpsell.RobuxUpsellContainer)
local premiumUpsellContainerModule = require(script.Parent.PremiumUpsell.PremiumUpsellContainer)
local subscriptionPurchaseContainerModule = require(script.Parent.SubscriptionPurchase.SubscriptionPurchaseContainer)
local renderWithCoreScriptsStyleProviderModule = require(script.Parent.Connection.renderWithCoreScriptsStyleProvider)
local focusNavigationOptimizationTelemetryModule = require(purchasePrompt.Events.FocusNavigationOptimizationTelemetry)
local selectionCursorProvider = require(parent.UIBlox).App.SelectionImage.SelectionCursorProvider
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local var16 = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local provider = focusNavigationUtilsModule.FocusNavigableSurfaceRegistry.Provider
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local getFFlagEnableToastLiteRenderModule = require(purchasePrompt.Flags.GetFFlagEnableToastLiteRender)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAddCursorProviderToPurchasePromptApp = sharedFlagsModule.FFlagAddCursorProviderToPurchasePromptApp
local fFlagPurchasePromptSubtitleForTimedOptions = sharedFlagsModule.FFlagPurchasePromptSubtitleForTimedOptions
local fFlagPurchasePromptCartPricingEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local requestTypeModule = require(purchasePrompt.Enums.RequestType)
local promptStateModule = require(purchasePrompt.Enums.PromptState)
local purchasePromptAppConditionalFocusNavigation = game:DefineFastFlag("PurchasePromptAppConditionalFocusNavigation", false)
local purchasePromptAppTrackRenderPerformance = game:DefineFastFlag("PurchasePromptAppTrackRenderPerformance", false)
local purchasePromptAppFixStyleLink = game:DefineFastFlag("PurchasePromptAppFixStyleLink", false)
local purchasePromptApp = roact.Component:extend("PurchasePromptApp")

function purchasePromptApp.init(p0) --[[ line: 65 ]]
	-- upvalues: externalSettingsModule (ref)
	p0.state = {
		isTenFootInterface = externalSettingsModule.new().isTenFootInterface()
	}
	p0.renderCount = 0
	p0.lastRenderTime = 0
end

function purchasePromptApp.hasAnyActivePrompt(p1) --[[ line: 77 ]]
	-- upvalues: purchasePromptAppConditionalFocusNavigation (ref), promptStateModule (ref), requestTypeModule (ref)
	if not purchasePromptAppConditionalFocusNavigation then
		return true
	elseif p1.props.store then
		local state = p1.props.store:getState()
		
		return not (state.promptState == promptStateModule.None and state.promptRequest.requestType == requestTypeModule.None)
	end
	return false
end

function purchasePromptApp.trackRenderPerformance(p2) --[[ line: 96 ]]
	-- upvalues: purchasePromptAppTrackRenderPerformance (ref), loggingProtocolModule (ref), focusNavigationOptimizationTelemetryModule (ref), purchasePromptAppConditionalFocusNavigation (ref)
	if not purchasePromptAppTrackRenderPerformance then return end
	p2.renderCount += 1
	local currentTime = tick()
	local var29 = currentTime - p2.lastRenderTime
	
	if p2.renderCount > 1 then
		loggingProtocolModule.default:logRobloxTelemetryStat(focusNavigationOptimizationTelemetryModule.RerenderTimingStat, var29 * 1000, {
			optimizationEnabled = tostring(purchasePromptAppConditionalFocusNavigation)
		})
	end
	p2.lastRenderTime = currentTime
end

function purchasePromptApp.renderWithStyle(_, p3) --[[ line: 120 ]]
	-- upvalues: renderWithCoreScriptsStyleProviderModule (ref)
	return renderWithCoreScriptsStyleProviderModule(p3)
end

function purchasePromptApp.render(p4) --[[ line: 124 ]]
	-- upvalues: provideRobloxLocaleModule (ref), roact (ref), localeProvider (ref), localizationService (ref), productPurchaseContainerModule (ref), fFlagPurchasePromptSubtitleForTimedOptions (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), robuxUpsellContainerModule (ref), premiumUpsellContainerModule (ref), subscriptionPurchaseContainerModule (ref), eventConnectionsModule (ref), getFFlagEnableToastLiteRenderModule (ref), toast (ref), fFlagAddCursorProviderToPurchasePromptApp (ref), purchasePromptAppFixStyleLink (ref), selectionCursorProvider (ref), reactFocusNavigationModule (ref), var16 (ref), provider (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), roactRodux (ref), layoutValuesProviderModule (ref), purchasePromptPolicyModule (ref)
	return provideRobloxLocaleModule(function() --[[ line: 125 ]]
		-- upvalues: roact (copy), localeProvider (copy), localizationService (copy), productPurchaseContainerModule (copy), fFlagPurchasePromptSubtitleForTimedOptions (copy), p4 (ref), fFlagPurchasePromptCartPricingEnabledModule (copy), robuxUpsellContainerModule (copy), premiumUpsellContainerModule (copy), subscriptionPurchaseContainerModule (copy), eventConnectionsModule (copy), getFFlagEnableToastLiteRenderModule (copy), toast (copy), fFlagAddCursorProviderToPurchasePromptApp (copy), purchasePromptAppFixStyleLink (copy), selectionCursorProvider (copy), reactFocusNavigationModule (copy), var16 (copy), provider (copy), focusRoot (copy), focusNavigableSurfaceIdentifierEnum (copy), roactRodux (copy), layoutValuesProviderModule (copy), purchasePromptPolicyModule (copy)
		local t = {
			LocaleProvider = roact.createElement(localeProvider, { locale = localizationService.RobloxLocaleId }, {
				ProductPurchaseContainer = roact.createElement(productPurchaseContainerModule, {
					subtitleView = if fFlagPurchasePromptSubtitleForTimedOptions then p4.props.subtitleView else nil,
					network = if fFlagPurchasePromptCartPricingEnabledModule then p4.props.network else nil
				}),
				RobuxUpsellContainer = roact.createElement(robuxUpsellContainerModule, {
					network = if fFlagPurchasePromptCartPricingEnabledModule then p4.props.network else nil
				}),
				PremiumUpsellContainer = roact.createElement(premiumUpsellContainerModule),
				SubscriptionPurchaseContainer = roact.createElement(subscriptionPurchaseContainerModule)
			}),
			EventConnections = roact.createElement(eventConnectionsModule),
			Toast = if getFFlagEnableToastLiteRenderModule() then roact.createElement(toast) else nil
		}
		local var31 = fFlagAddCursorProviderToPurchasePromptApp and p4:hasAnyActivePrompt()
		
		if purchasePromptAppFixStyleLink then
			t = roact.createElement("Folder", nil, t)
		end
		if var31 then
			p4:trackRenderPerformance()
			t = {
				CursorProvider = roact.createElement(selectionCursorProvider, {}, {
					FocusNavigationProvider = roact.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var16 }, {
						FocusNavigationRegistryProvider = roact.createElement(provider, nil, {
							FocusNavigationCoreScriptsWrapper = roact.createElement(focusRoot, {
								isIsolated = true,
								isAutoFocusRoot = true,
								surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
							}, t)
						})
					})
				})
			}
		end
		return roact.createElement(roactRodux.StoreProvider, { store = p4.props.store }, {
			StyleProvider = p4:renderWithStyle({
				LayoutValuesProvider = roact.createElement(layoutValuesProviderModule, { isTenFootInterface = p4.state.isTenFootInterface }, {
					PolicyProvider = roact.createElement(purchasePromptPolicyModule.Provider, { policy = { purchasePromptPolicyModule.Mapper } }, t)
				})
			})
		})
	end)
end

return purchasePromptApp