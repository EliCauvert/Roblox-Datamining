local _ = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local PurchasePromptDepsModule = require(Parent.PurchasePromptDeps)
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local Roact = PurchasePromptDepsModule.Roact
local _ = PurchasePromptDepsModule.Rodux
local RoactRodux = PurchasePromptDepsModule.RoactRodux
local _ = PurchasePromptDepsModule.UIBlox.Style.Provider
local LocaleProvider = require(Parent.IAPExperience).Locale.LocaleProvider
local Toast = require(Parent.ToastLite).Components.Toast
local _ = require(PurchasePrompt.Reducers.Reducer)
local _ = require(PurchasePrompt.Services.ABTest)
local _ = require(PurchasePrompt.Services.Network)
local _ = require(PurchasePrompt.Services.Analytics)
local _ = require(PurchasePrompt.Services.PlatformInterface)
local ExternalSettingsModule = require(PurchasePrompt.Services.ExternalSettings)
local _ = require(PurchasePrompt.Thunk)
local EventConnectionsModule = require(script.Parent.Connection.EventConnections)
local LayoutValuesProviderModule = require(script.Parent.Connection.LayoutValuesProvider)
local ProvideRobloxLocaleModule = require(script.Parent.Connection.provideRobloxLocale)
local PurchasePromptPolicyModule = require(PurchasePrompt.Components.Connection.PurchasePromptPolicy)
local ProductPurchaseContainerModule = require(script.Parent.ProductPurchase.ProductPurchaseContainer)
local RobuxUpsellContainerModule = require(script.Parent.RobuxUpsell.RobuxUpsellContainer)
local SubscriptionPurchaseContainerModule = require(script.Parent.SubscriptionPurchase.SubscriptionPurchaseContainer)
local RenderWithCoreScriptsStyleProviderModule = require(script.Parent.Connection.renderWithCoreScriptsStyleProvider)
local FocusNavigationOptimizationTelemetryModule = require(PurchasePrompt.Events.FocusNavigationOptimizationTelemetry)
local SelectionCursorProvider = require(Parent.UIBlox).App.SelectionImage.SelectionCursorProvider
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local NewResult = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local Provider = FocusNavigationUtilsModule.FocusNavigableSurfaceRegistry.Provider
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local GetFFlagEnableToastLiteRenderModule = require(PurchasePrompt.Flags.GetFFlagEnableToastLiteRender)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAddCursorProviderToPurchasePromptApp = SharedFlagsModule.FFlagAddCursorProviderToPurchasePromptApp
local FFlagPurchasePromptSubtitleForTimedOptions = SharedFlagsModule.FFlagPurchasePromptSubtitleForTimedOptions
local RequestTypeModule = require(PurchasePrompt.Enums.RequestType)
local PromptStateModule = require(PurchasePrompt.Enums.PromptState)
local PurchasePromptAppConditionalFocusNavigation = game:DefineFastFlag("PurchasePromptAppConditionalFocusNavigation", false)
local PurchasePromptAppTrackRenderPerformance = game:DefineFastFlag("PurchasePromptAppTrackRenderPerformance", false)
local PurchasePromptAppFixStyleLink = game:DefineFastFlag("PurchasePromptAppFixStyleLink", false)
local PurchasePromptApp = Roact.Component:extend("PurchasePromptApp")

function PurchasePromptApp.init(p1)
	-- upvalues: ExternalSettingsModule (copy)
	p1.state = {
		isTenFootInterface = ExternalSettingsModule.new().isTenFootInterface()
	}
	p1.renderCount = 0
	p1.lastRenderTime = 0
end

function PurchasePromptApp.hasAnyActivePrompt(p1): boolean
	-- upvalues: PurchasePromptAppConditionalFocusNavigation (copy), PromptStateModule (copy), RequestTypeModule (copy)
	if not PurchasePromptAppConditionalFocusNavigation then
		return true
	elseif p1.props.store then
		local State = p1.props.store:getState()
		local RequestType = State.promptRequest.requestType
		
		return not (State.promptState == PromptStateModule.None and RequestType == RequestTypeModule.None)
	else
		return false
	end
end

function PurchasePromptApp.trackRenderPerformance(p1)
	-- upvalues: PurchasePromptAppTrackRenderPerformance (copy), LoggingProtocolModule (copy), FocusNavigationOptimizationTelemetryModule (copy), PurchasePromptAppConditionalFocusNavigation (copy)
	if not PurchasePromptAppTrackRenderPerformance then return end
	p1.renderCount += 1
	local CurrentTime = tick()
	local CurrentTimeDelta = CurrentTime - p1.lastRenderTime
	
	if p1.renderCount > 1 then
		LoggingProtocolModule.default:logRobloxTelemetryStat(FocusNavigationOptimizationTelemetryModule.RerenderTimingStat, CurrentTimeDelta * 1000, {
			optimizationEnabled = tostring(PurchasePromptAppConditionalFocusNavigation)
		})
	end
	p1.lastRenderTime = CurrentTime
end

function PurchasePromptApp:renderWithStyle(p1)
	-- upvalues: RenderWithCoreScriptsStyleProviderModule (copy)
	return RenderWithCoreScriptsStyleProviderModule(p1)
end

function PurchasePromptApp.render(p1)
	-- upvalues: ProvideRobloxLocaleModule (copy), Roact (copy), LocaleProvider (copy), LocalizationService (copy), ProductPurchaseContainerModule (copy), FFlagPurchasePromptSubtitleForTimedOptions (copy), RobuxUpsellContainerModule (copy), SubscriptionPurchaseContainerModule (copy), EventConnectionsModule (copy), GetFFlagEnableToastLiteRenderModule (copy), Toast (copy), FFlagAddCursorProviderToPurchasePromptApp (copy), PurchasePromptAppFixStyleLink (copy), SelectionCursorProvider (copy), ReactFocusNavigationModule (copy), NewResult (copy), Provider (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), RoactRodux (copy), LayoutValuesProviderModule (copy), PurchasePromptPolicyModule (copy)
	return ProvideRobloxLocaleModule(function()
		-- upvalues: Roact (upval), LocaleProvider (upval), LocalizationService (upval), ProductPurchaseContainerModule (upval), FFlagPurchasePromptSubtitleForTimedOptions (upval), p1 (copy), RobuxUpsellContainerModule (upval), SubscriptionPurchaseContainerModule (upval), EventConnectionsModule (upval), GetFFlagEnableToastLiteRenderModule (upval), Toast (upval), FFlagAddCursorProviderToPurchasePromptApp (upval), PurchasePromptAppFixStyleLink (upval), SelectionCursorProvider (upval), ReactFocusNavigationModule (upval), NewResult (upval), Provider (upval), FocusRoot (upval), FocusNavigableSurfaceIdentifierEnum (upval), RoactRodux (upval), LayoutValuesProviderModule (upval), PurchasePromptPolicyModule (upval)
		local Folder = {
			LocaleProvider = Roact.createElement(LocaleProvider, { locale = LocalizationService.RobloxLocaleId }, {
				ProductPurchaseContainer = Roact.createElement(ProductPurchaseContainerModule, {
					subtitleView = if FFlagPurchasePromptSubtitleForTimedOptions then p1.props.subtitleView else nil,
					network = p1.props.network
				}),
				RobuxUpsellContainer = Roact.createElement(RobuxUpsellContainerModule, { network = p1.props.network }),
				SubscriptionPurchaseContainer = Roact.createElement(SubscriptionPurchaseContainerModule)
			}),
			EventConnections = Roact.createElement(EventConnectionsModule),
			Toast = if GetFFlagEnableToastLiteRenderModule() then Roact.createElement(Toast) else nil
		}
		local HasAnyActivePrompt = FFlagAddCursorProviderToPurchasePromptApp and p1:hasAnyActivePrompt()
		
		if PurchasePromptAppFixStyleLink then
			Folder = Roact.createElement("Folder", nil, Folder)
		end
		if HasAnyActivePrompt then
			p1:trackRenderPerformance()
			Folder = {
				CursorProvider = Roact.createElement(SelectionCursorProvider, {}, {
					FocusNavigationProvider = Roact.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = NewResult }, {
						FocusNavigationRegistryProvider = Roact.createElement(Provider, nil, {
							FocusNavigationCoreScriptsWrapper = Roact.createElement(FocusRoot, {
								isIsolated = true,
								isAutoFocusRoot = true,
								surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
							}, Folder)
						})
					})
				})
			}
		end
		return Roact.createElement(RoactRodux.StoreProvider, { store = p1.props.store }, {
			StyleProvider = p1:renderWithStyle({
				LayoutValuesProvider = Roact.createElement(LayoutValuesProviderModule, { isTenFootInterface = p1.state.isTenFootInterface }, {
					PolicyProvider = Roact.createElement(PurchasePromptPolicyModule.Provider, { policy = { PurchasePromptPolicyModule.Mapper } }, Folder)
				})
			})
		})
	end)
end

return PurchasePromptApp