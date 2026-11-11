local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Functional = require(CorePackages.Workspace.Packages.AppCommonLib).Functional
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local ToastRoduxModule = require(CorePackages.Workspace.Packages.ToastRodux)
local ToastType = ToastRoduxModule.Enums.ToastType
local SetCurrentToastMessageFunction = ToastRoduxModule.Actions.SetCurrentToastMessage
local FetchGamePlayabilityAndProductInfo = require(CorePackages.Workspace.Packages.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local CloseCentralOverlayFunction = require(CorePackages.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local GetPurchaseErrorTypeFromErrorResponseModule = require(Modules.LuaApp.getPurchaseErrorTypeFromErrorResponse)
local ThemeContextDEPRECATEDModule = require(Modules.LuaApp.ThemeContext_DEPRECATED)
local WithThemeDEPRECATEDModule = require(Modules.LuaApp.withTheme_DEPRECATED)
local PurchaseErrorsModule = require(Modules.LuaApp.Enum.PurchaseErrors)
local AlertWindowModule = require(Modules.LuaApp.Components.AlertWindow)
local OpenCentralOverlayForPurchaseGameRobuxShortfallModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForPurchaseGameRobuxShortfall)
local PurchaseProductModule = require(Modules.LuaApp.Thunks.PurchaseProduct)
local SetPurchaseErrorToastModule = require(Modules.LuaApp.Thunks.SetPurchaseErrorToast)
local GetFFlagLuaAppUseWithLocalizationModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization)
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local FFlagSignalsNavP3fGameDetails = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3fGameDetails
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3fGameDetails then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local PurchaseGamePrompt = RoactModule.PureComponent:extend("PurchaseGamePrompt")
PurchaseGamePrompt.defaultProps = {
	expectedCurrency = require(Modules.LuaApp.Constants).Currency.Robux
}

function PurchaseGamePrompt.init(p1)
	-- upvalues: GetPurchaseErrorTypeFromErrorResponseModule (copy), PurchaseErrorsModule (copy), GetFFlagLuaAppUseWithLocalizationModule (copy), ToastType (copy)
	function p1.onPurchaseFailedWithRobuxShortfall(p2)
		-- upvalues: p1 (copy)
		p1.props.openPurchaseGameRobuxShortfallPrompt(p1.props.gameName, p2.shortfallPrice, p1.props.appTheme, { p1.props.currentPage })
	end
	
	function p1.onPurchaseFailedWhenOwned(p2)
		-- upvalues: p1 (copy)
		p1.props.fetchPlayabilityAndProductInfo(p1.props.networking, p1.props.universeId)
		p1.props.setPurchaseErrorToast(p2)
		p1.props.closePrompt()
	end
	
	function p1.customPurchaseErrorHandler(p2): boolean
		-- upvalues: GetPurchaseErrorTypeFromErrorResponseModule (upval), PurchaseErrorsModule (upval), p1 (copy)
		local Flag = false
		local PurchaseErrorTypeFromErrorResponseModule = GetPurchaseErrorTypeFromErrorResponseModule(p2)
		
		if PurchaseErrorTypeFromErrorResponseModule == PurchaseErrorsModule.NotEnoughRobux then
			p1.onPurchaseFailedWithRobuxShortfall(p2)
			Flag = true
		end
		if PurchaseErrorTypeFromErrorResponseModule == PurchaseErrorsModule.AlreadyOwn then
			p1.onPurchaseFailedWhenOwned(p2)
			Flag = true
		end
		return Flag
	end
	
	function p1.purchaseGame()
		-- upvalues: p1 (copy), GetFFlagLuaAppUseWithLocalizationModule (upval), ToastType (upval)
		local Networking = p1.props.networking
		p1.props.purchaseGame(Networking, p1.props.productId, {
			expectedCurreny = p1.props.expectedCurrency,
			expectedPrice = p1.props.price,
			expectedSellerId = p1.props.sellerId
		}, p1.customPurchaseErrorHandler):andThen(function()
			-- upvalues: p1 (upval), Networking (copy), GetFFlagLuaAppUseWithLocalizationModule (upval), ToastType (upval)
			p1.props.fetchPlayabilityAndProductInfo(Networking, p1.props.universeId)
			
			if GetFFlagLuaAppUseWithLocalizationModule() then
				p1.props.setCurrentToastMessage(ToastType.PurchaseMessage, "Feature.Toast.Heading.PurchaseMessage.Success", {
					"Feature.Toast.Message.PurchaseMessage.SuccessV3",
					{ gameName = p1.props.gameName, price = p1.props.price }
				}, false)
			else
				local Localization = p1.props.localization
				p1.props.setCurrentToastMessage(ToastType.PurchaseMessage, Localization:Format("Feature.Toast.Heading.PurchaseMessage.Success"), Localization:Format("Feature.Toast.Message.PurchaseMessage.SuccessV3", { gameName = p1.props.gameName, price = p1.props.price }), true)
			end
			p1.props.closePrompt()
		end)
	end
end

function PurchaseGamePrompt.didMount(p1)
	-- upvalues: Functional (copy)
	local PageFilter = p1.props.pageFilter
	local CurrentPage = p1.props.currentPage
	local ClosePromptFunction: () -> () = p1.props.closePrompt
	
	if PageFilter and not Functional.Find(PageFilter, CurrentPage) then
		ClosePromptFunction()
	end
end

function PurchaseGamePrompt.render(p1)
	-- upvalues: RetrievalStatus (copy), RoactModule (copy), ThemeContextDEPRECATEDModule (copy), AlertWindowModule (copy), GetFFlagLuaAppUseWithLocalizationModule (copy), WithLocalizationFunction (copy)
	local AppTheme = p1.props.appTheme
	local ContainerWidth = p1.props.containerWidth
	local ClosePrompt = p1.props.closePrompt
	local Localization = p1.props.localization
	local GameName = p1.props.gameName
	local Price = p1.props.price
	local IsPurchaseStatusMatch = p1.props.purchaseStatus == RetrievalStatus.Fetching
	
	local function v42(p2)
		-- upvalues: RoactModule (upval), ThemeContextDEPRECATEDModule (upval), AppTheme (copy), AlertWindowModule (upval), ContainerWidth (copy), p1 (copy), IsPurchaseStatusMatch (copy), ClosePrompt (copy)
		return RoactModule.createElement(ThemeContextDEPRECATEDModule.Provider, { value = AppTheme }, {
			AlertWindow = RoactModule.createElement(AlertWindowModule, {
				hasCancelButton = true,
				containerWidth = ContainerWidth,
				titleText = p2.titleText,
				titleFont = AppTheme.GameDetails.Text.BoldFont,
				messageText = p2.messageText,
				messageFont = AppTheme.GameDetails.Text.Font,
				buttonFont = AppTheme.GameDetails.Text.Font,
				confirmButtonText = p2.confirmButtonText,
				onConfirm = p1.purchaseGame,
				isConfirming = IsPurchaseStatusMatch,
				onCancel = ClosePrompt
			})
		})
	end
	
	return if GetFFlagLuaAppUseWithLocalizationModule() then WithLocalizationFunction({
		titleText = "Feature.GameDetails.Heading.PurchaseGame",
		confirmButtonText = "Feature.GameDetails.Action.Unlock",
		messageText = {
			"Feature.GameDetails.Message.PurchaseGameV2",
			gameName = GameName,
			X = Price
		}
	})(v42) else v42({
		titleText = Localization:Format("Feature.GameDetails.Heading.PurchaseGame"),
		messageText = Localization:Format("Feature.GameDetails.Message.PurchaseGameV2", { gameName = GameName, X = Price }),
		confirmButtonText = Localization:Format("Feature.GameDetails.Action.Unlock")
	})
end

local v1 = if FFlagSignalsNavP3fGameDetails then function(p1)
	-- upvalues: GetLegacyNavigationStore (copy), UseSignalState (copy), RoactModule (copy), v1 (copy), CryoModule (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.union(p1, {
		currentPage = UseSignalState(GetLegacyNavigationStore(false).getCurrentPage).name
	}))
end else RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: FFlagSignalsNavP3fGameDetails (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), PurchaseProductModule (copy)
	local SelectCurrentLegacyRouteResult = if FFlagSignalsNavP3fGameDetails then nil elseif FFlagUseNavigationSelectors then Selectors.selectCurrentLegacyRoute(p1) else p1.Navigation.history[#p1.Navigation.history]
	
	return {
		purchaseStatus = PurchaseProductModule.GetPostingStatus(p1, p2.productId),
		currentPage = if FFlagSignalsNavP3fGameDetails then nil else SelectCurrentLegacyRouteResult[#SelectCurrentLegacyRouteResult].name
	}
end, function(Callback)
	-- upvalues: SetCurrentToastMessageFunction (copy), OpenCentralOverlayForPurchaseGameRobuxShortfallModule (copy), PurchaseProductModule (copy), CloseCentralOverlayFunction (copy), FetchGamePlayabilityAndProductInfo (copy), SetPurchaseErrorToastModule (copy)
	return {
		setCurrentToastMessage = function(ToastType, ToastMessage, ToastSubMessage, IsLocalized)
			-- upvalues: Callback (copy), SetCurrentToastMessageFunction (upval)
			return Callback(SetCurrentToastMessageFunction({
				toastType = ToastType,
				toastMessage = ToastMessage,
				toastSubMessage = ToastSubMessage,
				isLocalized = IsLocalized
			}))
		end,
		openPurchaseGameRobuxShortfallPrompt = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), OpenCentralOverlayForPurchaseGameRobuxShortfallModule (upval)
			return Callback(OpenCentralOverlayForPurchaseGameRobuxShortfallModule(p1, p2, p3, p4))
		end,
		purchaseGame = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), PurchaseProductModule (upval)
			return Callback(PurchaseProductModule.Post(p1, p2, p3, p4))
		end,
		closePrompt = function()
			-- upvalues: Callback (copy), CloseCentralOverlayFunction (upval)
			return Callback(CloseCentralOverlayFunction())
		end,
		fetchPlayabilityAndProductInfo = function(p1, p2)
			-- upvalues: Callback (copy), FetchGamePlayabilityAndProductInfo (upval)
			return Callback(FetchGamePlayabilityAndProductInfo.Fetch(p1, p2))
		end,
		setPurchaseErrorToast = function(p1)
			-- upvalues: Callback (copy), SetPurchaseErrorToastModule (upval)
			return Callback(SetPurchaseErrorToastModule(p1))
		end
	}
end)(PurchaseGamePrompt)

return (RoactServices.connect({
	networking = RoactNetworking,
	localization = RoactLocalizationModule
})((WithThemeDEPRECATEDModule(v1))))