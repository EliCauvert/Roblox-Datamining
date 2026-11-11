local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local IXPService = game:GetService("IXPService")
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local ConstantsModule = require(Modules.LuaApp.Constants)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local GetPurchaseErrorTypeFromErrorResponseModule = require(Modules.LuaApp.getPurchaseErrorTypeFromErrorResponse)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local TModule = require(CorePackages.Packages.t)
local IAPExperienceModule = require(CorePackages.Workspace.Packages.IAPExperience)
local EconomicRestrictionsCounter = IAPExperienceModule.Counters.EconomicRestrictionsCounter
local UniversalEconomicRestrictionsCounter = EconomicRestrictionsCounter.UniversalEconomicRestrictionsCounter
local EconomicRestrictionsSurface = EconomicRestrictionsCounter.EconomicRestrictionsSurface
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local ParseEconomicRestrictionsFailureReasonFunction = IAPExperienceModule.Utility.parseEconomicRestrictionsFailureReason
local ParseEconomicRestrictionsExpirationTimeInMinutesFunction = IAPExperienceModule.Utility.parseEconomicRestrictionsExpirationTimeInMinutes
local FFlagAddUnifiedPurchaseFlowTTIToEDP = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAddUnifiedPurchaseFlowTTIToEDP
local PurchasePromptLiteModule = require(CorePackages.Workspace.Packages.PurchasePromptLite)
local GetTTIEventNameFunction = PurchasePromptLiteModule.getTTIEventName
local TimeToInteractiveTracker = require(CorePackages.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker
local ProductPurchaseSurface = PurchasePromptLiteModule.Enums.ProductPurchaseSurface
local PromiseModule = require(CorePackages.Packages.Promise)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local PurchaseErrorsModule = require(Modules.LuaApp.Enum.PurchaseErrors)
local NumberLocalization = require(CorePackages.Workspace.Packages.Localization).NumberLocalization
local DataHydrationModule = require(CorePackages.Workspace.Packages.DataHydration)
local AlertWindowModule = require(Modules.LuaApp.Components.AlertWindow)
local ApiFetchGamePassesModule = require(Modules.LuaApp.Thunks.Games.ApiFetchGamePasses)
local FFlagLuaAppGamePassesDataHydrationMigrationEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppGamePassesDataHydrationMigrationEnabled
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local OpenCentralOverlayForPurchasePassInsufficientRobuxModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForPurchasePassInsufficientRobux)
local OpenCentralOverlayForEconomicRestrictionPromptModule = require(Modules.LuaApp.Thunks.Fraud.OpenCentralOverlayForEconomicRestrictionPrompt)
local NavigateDownToRobuxUpsellModule = require(Modules.LuaApp.Thunks.Economy.NavigateDownToRobuxUpsell)
local RobuxUpsellTriggerContextModule = require(Modules.LuaApp.Components.RobuxUpsell.Enum.RobuxUpsellTriggerContext)
local PurchaseGamePassModule = require(Modules.LuaApp.Thunks.Games.PurchaseGamePass)
local SetPurchaseErrorToastModule = require(Modules.LuaApp.Thunks.SetPurchaseErrorToast)
local GamepassRobuxUpsellIXPTestModule = require(Modules.LuaApp.Flags.GamepassRobuxUpsellIXPTest)
local PurchasePassPrompt = RoactModule.PureComponent:extend("PurchasePassPrompt")
PurchasePassPrompt.validateProps = TModule.strictInterface({
	universeId = TModule.string,
	pass = TModule.table,
	containerWidth = TModule.number,
	defaultChildRef = TModule.optional(TModule.any),
	focusController = TModule.optional(TModule.any),
	localization = TModule.any,
	networking = TModule.callback,
	analytics = TModule.any,
	gamepassRobuxUpsellEnabled = TModule.optional(TModule.boolean),
	purchaseStatus = TModule.optional(TModule.any),
	userRobux = TModule.optional(TModule.number),
	setCurrentToastMessage = TModule.callback,
	navigateDownToRobuxUpsell = TModule.callback,
	openPurchasePassInsufficientRobux = TModule.callback,
	purchasePass = TModule.callback,
	economicRestrictionErrorHandler = TModule.callback,
	closePrompt = TModule.callback,
	apiFetchGamePasses = if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then nil else TModule.callback,
	setPurchaseErrorToast = TModule.callback
})

function PurchasePassPrompt.init(p1)
	-- upvalues: GamepassRobuxUpsellIXPTestModule (copy), IXPService (copy), AppUserLayers (copy), ConstantsModule (copy), FFlagLuaAppGamePassesDataHydrationMigrationEnabled (copy), DataHydrationModule (copy), GetPurchaseErrorTypeFromErrorResponseModule (copy), PurchaseErrorsModule (copy), PromiseModule (copy), ToastTypeModule (copy)
	function p1:onPurchaseFailedWithRobuxShortfall()
		-- upvalues: GamepassRobuxUpsellIXPTestModule (upval), IXPService (upval), AppUserLayers (upval), p1 (copy), ConstantsModule (upval)
		if GamepassRobuxUpsellIXPTestModule.isEnabled() then
			IXPService:LogUserLayerExposure(AppUserLayers.GamepassRobuxUpsellLayer)
			local Diag = p1.props.analytics.Diag
			p1.props.analytics.EventStream:setRBXEventStream("ua", "GamepassRobuxUpsellIXP", { isVariant = p1.props.gamepassRobuxUpsellEnabled })
			
			if p1.props.gamepassRobuxUpsellEnabled then
				Diag:reportCounter("UAGamepassRobuxUpsellVariant", 1)
			else
				Diag:reportCounter("UAGamepassRobuxUpsellControl", 1)
			end
		end
		if p1.props.gamepassRobuxUpsellEnabled then
			local Networking = p1.props.networking
			local Pass = p1.props.pass
			local PurchasePassFunction = p1.props.purchasePass
			local config = {
				expectedCurrency = ConstantsModule.Currency.Robux,
				expectedPrice = Pass.price
			}
			p1.props.navigateDownToRobuxUpsell(Pass.price, p1.props.userRobux, Pass.displayName, nil, function()
				-- upvalues: PurchasePassFunction (copy), Networking (copy), Pass (copy), config (copy)
				return PurchasePassFunction(Networking, Pass.productId, config)
			end, Pass.productId)
			
			return
		else
			p1.props.openPurchasePassInsufficientRobux()
		end
	end
	
	function p1.onPurchaseFailedWhenOwned(p2)
		-- upvalues: FFlagLuaAppGamePassesDataHydrationMigrationEnabled (upval), DataHydrationModule (upval), p1 (copy)
		if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then
			DataHydrationModule.Game.getGamePassStore(false).fetchPassesForUniverse(p1.props.universeId)
		else
			p1.props.apiFetchGamePasses(p1.props.networking, p1.props.universeId)
		end
		p1.props.setPurchaseErrorToast(p2)
		p1.props.closePrompt()
	end
	
	function p1.customPurchaseErrorHandler(p2): boolean
		-- upvalues: p1 (copy), GetPurchaseErrorTypeFromErrorResponseModule (upval), PurchaseErrorsModule (upval)
		local Flag = false
		
		if p1.isMounted then
			local PurchaseErrorTypeFromErrorResponseModule = GetPurchaseErrorTypeFromErrorResponseModule(p2)
			
			if PurchaseErrorTypeFromErrorResponseModule == PurchaseErrorsModule.NotEnoughRobux then
				p1.onPurchaseFailedWithRobuxShortfall(p2)
				Flag = true
			end
			if PurchaseErrorTypeFromErrorResponseModule == PurchaseErrorsModule.AlreadyOwn then
				p1.onPurchaseFailedWhenOwned(p2)
				Flag = true
			end
		end
		return Flag
	end
	
	function p1.purchasePass()
		-- upvalues: p1 (copy), ConstantsModule (upval), PromiseModule (upval), ToastTypeModule (upval)
		local Networking = p1.props.networking
		local Pass = p1.props.pass
		local UniverseId = p1.props.universeId
		p1.props.purchasePass(Networking, Pass.productId, {
			expectedCurrency = ConstantsModule.Currency.Robux,
			expectedPrice = Pass.price
		}, p1.customPurchaseErrorHandler, p1.props.economicRestrictionErrorHandler):finally(function(Rejected)
			-- upvalues: PromiseModule (upval), p1 (upval), Networking (copy), UniverseId (copy), ToastTypeModule (upval)
			if Rejected ~= PromiseModule.Status.Rejected and p1.isMounted then
				p1.props.apiFetchGamePasses(Networking, UniverseId)
				local Localization = p1.props.localization
				p1.props.setCurrentToastMessage(ToastTypeModule.PurchaseMessage, Localization:Format("Feature.AccountSecurityPrompt.Header.Success"), Localization:Format("Feature.Catalog.Label.Purchased"), true)
				p1.props.closePrompt()
			end
		end)
	end
end

function PurchasePassPrompt.render(p1)
	-- upvalues: RetrievalStatusModule (copy), WithStyleFunction (copy), WithLocalizationModule (copy), NumberLocalization (copy), RoactModule (copy), AlertWindowModule (copy)
	local ContainerWidth = p1.props.containerWidth
	local ClosePrompt = p1.props.closePrompt
	local Localization = p1.props.localization
	local Pass = p1.props.pass
	local DisplayName = Pass.displayName
	local Name = Pass.creator.name
	local Price = Pass.price
	local IsPurchaseStatusMatch = p1.props.purchaseStatus == RetrievalStatusModule.Fetching
	
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationModule (upval), DisplayName (copy), Name (copy), NumberLocalization (upval), Price (copy), Localization (copy), RoactModule (upval), AlertWindowModule (upval), ContainerWidth (copy), p1 (copy), IsPurchaseStatusMatch (copy), ClosePrompt (copy)
		return WithLocalizationModule({
			buyItem = "IAPExperience.PurchasePrompt.Title.BuyItem",
			buy = "Feature.Catalog.Action.Buy",
			message = {
				"Feature.Catalog.Label.PurchaseConfirmation",
				itemName = DisplayName,
				creatorName = Name,
				itemPrice = NumberLocalization.localize(Price, Localization:GetLocale())
			}
		})(function(p3)
			-- upvalues: RoactModule (upval), AlertWindowModule (upval), ContainerWidth (upval), p2 (copy), p1 (upval), IsPurchaseStatusMatch (upval), ClosePrompt (upval)
			return RoactModule.createElement(AlertWindowModule, {
				hasCancelButton = true,
				containerWidth = ContainerWidth,
				titleText = p3.buyItem,
				titleFont = p2.Font.Header1.Font,
				messageText = p3.message,
				messageFont = p2.Font.Body.Font,
				buttonFont = p2.Font.Header2.Font,
				confirmButtonText = p3.buy,
				onConfirm = p1.purchasePass,
				isConfirming = IsPurchaseStatusMatch,
				onCancel = ClosePrompt
			})
		end)
	end)
end

function PurchasePassPrompt.didMount(p1)
	-- upvalues: FFlagAddUnifiedPurchaseFlowTTIToEDP (copy), GetTTIEventNameFunction (copy), ProductPurchaseSurface (copy), TimeToInteractiveTracker (copy)
	p1.isMounted = true
	
	if FFlagAddUnifiedPurchaseFlowTTIToEDP then
		TimeToInteractiveTracker.trackEnd((GetTTIEventNameFunction(ProductPurchaseSurface.EDP)))
	end
end

function PurchasePassPrompt.willUnmount(p1)
	p1.isMounted = false
end

local v1 = RoactServices.connect({
	networking = RoactNetworkingModule,
	localization = RoactLocalizationModule,
	analytics = RoactAnalyticsModule
})((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: PurchaseGamePassModule (copy)
	return {
		purchaseStatus = PurchaseGamePassModule.GetPostingStatus(p1, p2.pass.productId),
		userRobux = p1.UserRobux[p1.LocalUserId]
	}
end, function(Callback)
	-- upvalues: SetCurrentToastMessageModule (copy), OpenCentralOverlayForPurchasePassInsufficientRobuxModule (copy), CloseCentralOverlayModule (copy), NavigateDownToRobuxUpsellModule (copy), RobuxUpsellTriggerContextModule (copy), PurchaseGamePassModule (copy), ParseEconomicRestrictionsFailureReasonFunction (copy), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (copy), Default (copy), UniversalEconomicRestrictionsCounter (copy), EconomicRestrictionsSurface (copy), OpenCentralOverlayForEconomicRestrictionPromptModule (copy), FFlagLuaAppGamePassesDataHydrationMigrationEnabled (copy), ApiFetchGamePassesModule (copy), SetPurchaseErrorToastModule (copy)
	return {
		setCurrentToastMessage = function(ToastType, ToastMessage, ToastSubMessage, IsLocalized)
			-- upvalues: Callback (copy), SetCurrentToastMessageModule (upval)
			return Callback(SetCurrentToastMessageModule({
				toastType = ToastType,
				toastMessage = ToastMessage,
				toastSubMessage = ToastSubMessage,
				isLocalized = IsLocalized
			}))
		end,
		openPurchasePassInsufficientRobux = function()
			-- upvalues: Callback (copy), OpenCentralOverlayForPurchasePassInsufficientRobuxModule (upval)
			return Callback(OpenCentralOverlayForPurchasePassInsufficientRobuxModule())
		end,
		navigateDownToRobuxUpsell = function(p1, p2, p3, p4, p5, p6)
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval), NavigateDownToRobuxUpsellModule (upval), RobuxUpsellTriggerContextModule (upval)
			Callback(CloseCentralOverlayModule())
			
			return Callback(NavigateDownToRobuxUpsellModule(RobuxUpsellTriggerContextModule.UAGamepass, p1, p2, p3, p4, p5, p6))
		end,
		purchasePass = function(p1, p2, p3, p4, p5)
			-- upvalues: Callback (copy), PurchaseGamePassModule (upval)
			return Callback(PurchaseGamePassModule.Post(p1, p2, p3, p4, p5))
		end,
		economicRestrictionErrorHandler = function(p1)
			-- upvalues: ParseEconomicRestrictionsFailureReasonFunction (upval), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (upval), Default (upval), UniversalEconomicRestrictionsCounter (upval), EconomicRestrictionsSurface (upval), Callback (copy), CloseCentralOverlayModule (upval), OpenCentralOverlayForEconomicRestrictionPromptModule (upval)
			local ParseEconomicRestrictionsFailureReasonResult = ParseEconomicRestrictionsFailureReasonFunction(p1)
			local ParseEconomicRestrictionsExpirationTimeInMinutesResult = ParseEconomicRestrictionsExpirationTimeInMinutesFunction(p1)
			Default:logRobloxTelemetryCounter(UniversalEconomicRestrictionsCounter, 1, {
				surface = EconomicRestrictionsSurface.Gamepass,
				failureReason = ParseEconomicRestrictionsFailureReasonResult
			})
			Callback(CloseCentralOverlayModule())
			
			return Callback(OpenCentralOverlayForEconomicRestrictionPromptModule(ParseEconomicRestrictionsFailureReasonResult, ParseEconomicRestrictionsExpirationTimeInMinutesResult))
		end,
		closePrompt = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			return Callback(CloseCentralOverlayModule())
		end,
		apiFetchGamePasses = if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then nil else function(p1, p2)
			-- upvalues: Callback (copy), ApiFetchGamePassesModule (upval)
			return Callback(ApiFetchGamePassesModule(p1, p2))
		end,
		setPurchaseErrorToast = function(p1)
			-- upvalues: Callback (copy), SetPurchaseErrorToastModule (upval)
			return Callback(SetPurchaseErrorToastModule(p1))
		end
	}
end)(PurchasePassPrompt)))

if GamepassRobuxUpsellIXPTestModule.isEnabled() then
	v1 = RoactAppExperimentModule.connectUserLayer({ AppUserLayers.GamepassRobuxUpsellLayer }, function(p1, _)
		-- upvalues: GamepassRobuxUpsellIXPTestModule (copy)
		return {
			gamepassRobuxUpsellEnabled = GamepassRobuxUpsellIXPTestModule.isUserEnrolled(p1)
		}
	end, false)(v1)
end
return v1