local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local ConstantsModule = require(Modules.LuaApp.Constants)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local TModule = require(CorePackages.Packages.t)
local PromiseModule = require(CorePackages.Packages.Promise)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local NumberLocalization = require(CorePackages.Workspace.Packages.Localization).NumberLocalization
local IAPExperienceModule = require(CorePackages.Workspace.Packages.IAPExperience)
local UniversalEconomicRestrictionsCounter = IAPExperienceModule.Counters.EconomicRestrictionsCounter.UniversalEconomicRestrictionsCounter
local EconomicRestrictionsSurface = IAPExperienceModule.Counters.EconomicRestrictionsCounter.EconomicRestrictionsSurface
local ParseEconomicRestrictionsFailureReasonFunction = IAPExperienceModule.Utility.parseEconomicRestrictionsFailureReason
local ParseEconomicRestrictionsExpirationTimeInMinutesFunction = IAPExperienceModule.Utility.parseEconomicRestrictionsExpirationTimeInMinutes
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local AlertWindowModule = require(Modules.LuaApp.Components.AlertWindow)
local ApiFetchGameDeveloperProductsModule = require(Modules.LuaApp.Thunks.DeveloperProduct.ApiFetchGameDeveloperProducts)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local PurchaseDeveloperProductModule = require(Modules.LuaApp.Thunks.DeveloperProduct.PurchaseDeveloperProduct)
local OpenCentralOverlayForPurchaseDeveloperProductPendingProductsLimitExceededModule = require(Modules.LuaApp.Thunks.DeveloperProduct.OpenCentralOverlayForPurchaseDeveloperProductPendingProductsLimitExceeded)
local OpenCentralOverlayForPurchaseDeveloperProductSuccessModule = require(Modules.LuaApp.Thunks.DeveloperProduct.OpenCentralOverlayForPurchaseDeveloperProductSuccess)
local OpenCentralOverlayForEconomicRestrictionPromptModule = require(Modules.LuaApp.Thunks.Fraud.OpenCentralOverlayForEconomicRestrictionPrompt)
local PurchaseDeveloperProductPrompt = RoactModule.PureComponent:extend("PurchaseDeveloperProductPrompt")
PurchaseDeveloperProductPrompt.validateProps = TModule.strictInterface({
	universeId = TModule.string,
	developerProduct = TModule.table,
	containerWidth = TModule.number,
	defaultChildRef = TModule.optional(TModule.any),
	focusController = TModule.optional(TModule.any),
	closeCentralOverlayThunk = TModule.optional(TModule.callback),
	localization = TModule.any,
	networking = TModule.callback,
	purchaseStatus = TModule.optional(TModule.any),
	creatorName = TModule.optional(TModule.string),
	rootPlaceId = TModule.optional(TModule.string),
	localUserId = TModule.optional(TModule.string),
	openPendingProductsLimitExceededPrompt = TModule.callback,
	openPurchaseDeveloperProductSuccessPrompt = TModule.callback,
	purchaseDeveloperProduct = TModule.callback,
	closePrompt = TModule.callback,
	apiFetchGameDeveloperProducts = TModule.callback,
	economicRestrictionErrorHandler = TModule.callback
})

function PurchaseDeveloperProductPrompt.init(p1)
	-- upvalues: ConstantsModule (copy), PromiseModule (copy)
	function p1.customPurchaseErrorHandler(p2)
		-- upvalues: p1 (copy)
		if p2.errorCode == "PendingProductsLimitExceeded" then
			p1.props.openPendingProductsLimitExceededPrompt()
		end
	end
	
	function p1.purchaseDeveloperProduct()
		-- upvalues: p1 (copy), ConstantsModule (upval), PromiseModule (upval)
		local Networking = p1.props.networking
		local DeveloperProduct = p1.props.developerProduct
		local UniverseId = p1.props.universeId
		p1.props.purchaseDeveloperProduct(Networking, DeveloperProduct.productId, {
			expectedCurrency = ConstantsModule.Currency.Robux,
			expectedPrice = DeveloperProduct.priceInRobux,
			saleLocationId = UniverseId
		}, p1.customPurchaseErrorHandler, p1.props.economicRestrictionErrorHandler):finally(function(Rejected)
			-- upvalues: PromiseModule (upval), p1 (upval), Networking (copy), UniverseId (copy), DeveloperProduct (copy)
			if Rejected ~= PromiseModule.Status.Rejected and p1.isMounted then
				p1.props.apiFetchGameDeveloperProducts(Networking, UniverseId, p1.props.rootPlaceId, p1.props.localUserId)
				p1.props.closePrompt()
				p1.props.openPurchaseDeveloperProductSuccessPrompt(DeveloperProduct.name)
			end
		end)
	end
end

function PurchaseDeveloperProductPrompt.render(p1)
	-- upvalues: RetrievalStatusModule (copy), WithStyleFunction (copy), WithLocalizationModule (copy), NumberLocalization (copy), RoactModule (copy), AlertWindowModule (copy)
	local ContainerWidth = p1.props.containerWidth
	local ClosePrompt = p1.props.closePrompt
	local Localization = p1.props.localization
	local DeveloperProduct = p1.props.developerProduct
	local Name = DeveloperProduct.name
	local CreatorName = p1.props.creatorName
	local PriceInRobux = DeveloperProduct.priceInRobux
	local IsPurchaseStatusMatch = p1.props.purchaseStatus == RetrievalStatusModule.Fetching
	
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationModule (upval), Name (copy), CreatorName (copy), NumberLocalization (upval), PriceInRobux (copy), Localization (copy), RoactModule (upval), AlertWindowModule (upval), ContainerWidth (copy), p1 (copy), IsPurchaseStatusMatch (copy), ClosePrompt (copy)
		return WithLocalizationModule({
			buyItem = "IAPExperience.PurchasePrompt.Title.BuyItem",
			buy = "Feature.Catalog.Action.Buy",
			message = {
				"Feature.Catalog.Label.PurchaseConfirmation",
				itemName = Name,
				creatorName = CreatorName,
				itemPrice = NumberLocalization.localize(PriceInRobux, Localization:GetLocale())
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
				onConfirm = p1.purchaseDeveloperProduct,
				isConfirming = IsPurchaseStatusMatch,
				onCancel = ClosePrompt
			})
		end)
	end)
end

function PurchaseDeveloperProductPrompt.didMount(p1)
	p1.isMounted = true
end

function PurchaseDeveloperProductPrompt.willUnmount(p1)
	p1.isMounted = false
end

return (RoactServices.connect({
	networking = RoactNetworkingModule,
	localization = RoactLocalizationModule
})((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: PurchaseDeveloperProductModule (copy)
	return {
		purchaseStatus = PurchaseDeveloperProductModule.GetPostingStatus(p1, p2.developerProduct.productId),
		creatorName = p1.GameDetails[p2.universeId].creator.name,
		rootPlaceId = p1.GameDetails[p2.universeId].rootPlaceId,
		localUserId = p1.LocalUserId
	}
end, function(Callback)
	-- upvalues: OpenCentralOverlayForPurchaseDeveloperProductPendingProductsLimitExceededModule (copy), OpenCentralOverlayForPurchaseDeveloperProductSuccessModule (copy), PurchaseDeveloperProductModule (copy), CloseCentralOverlayModule (copy), ApiFetchGameDeveloperProductsModule (copy), ParseEconomicRestrictionsFailureReasonFunction (copy), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (copy), Default (copy), UniversalEconomicRestrictionsCounter (copy), EconomicRestrictionsSurface (copy), OpenCentralOverlayForEconomicRestrictionPromptModule (copy)
	return {
		openPendingProductsLimitExceededPrompt = function()
			-- upvalues: Callback (copy), OpenCentralOverlayForPurchaseDeveloperProductPendingProductsLimitExceededModule (upval)
			return Callback(OpenCentralOverlayForPurchaseDeveloperProductPendingProductsLimitExceededModule())
		end,
		openPurchaseDeveloperProductSuccessPrompt = function(p1)
			-- upvalues: Callback (copy), OpenCentralOverlayForPurchaseDeveloperProductSuccessModule (upval)
			return Callback(OpenCentralOverlayForPurchaseDeveloperProductSuccessModule(p1))
		end,
		purchaseDeveloperProduct = function(p1, p2, p3, p4, p5)
			-- upvalues: Callback (copy), PurchaseDeveloperProductModule (upval)
			return Callback(PurchaseDeveloperProductModule.Post(p1, p2, p3, p4, p5))
		end,
		closePrompt = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			return Callback(CloseCentralOverlayModule())
		end,
		apiFetchGameDeveloperProducts = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), ApiFetchGameDeveloperProductsModule (upval)
			return Callback(ApiFetchGameDeveloperProductsModule(p1, p2, p3, p4))
		end,
		economicRestrictionErrorHandler = function(p1)
			-- upvalues: ParseEconomicRestrictionsFailureReasonFunction (upval), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (upval), Default (upval), UniversalEconomicRestrictionsCounter (upval), EconomicRestrictionsSurface (upval), Callback (copy), CloseCentralOverlayModule (upval), OpenCentralOverlayForEconomicRestrictionPromptModule (upval)
			local ParseEconomicRestrictionsFailureReasonResult = ParseEconomicRestrictionsFailureReasonFunction(p1)
			local ParseEconomicRestrictionsExpirationTimeInMinutesResult = ParseEconomicRestrictionsExpirationTimeInMinutesFunction(p1)
			Default:logRobloxTelemetryCounter(UniversalEconomicRestrictionsCounter, 1, {
				surface = EconomicRestrictionsSurface.DeveloperProduct,
				failureReason = ParseEconomicRestrictionsFailureReasonResult
			})
			Callback(CloseCentralOverlayModule())
			
			return Callback(OpenCentralOverlayForEconomicRestrictionPromptModule(ParseEconomicRestrictionsFailureReasonResult, ParseEconomicRestrictionsExpirationTimeInMinutesResult))
		end
	}
end)(PurchaseDeveloperProductPrompt))))