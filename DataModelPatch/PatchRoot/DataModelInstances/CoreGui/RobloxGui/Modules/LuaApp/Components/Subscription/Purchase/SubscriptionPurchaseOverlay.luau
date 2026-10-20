local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseScreenSizeFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useScreenSize
local UseLocalUserIdFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useLocalUserId
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local PostReportSubscriptionModule = require(Modules.LuaApp.Http.Requests.EconomyAPI.PostReportSubscription)
local AbuseVectorModule = require(CorePackages.Workspace.Packages.GenericAbuseReporting.AbuseVector)
local OpenDynamicAbuseReportModule = require(CorePackages.Workspace.Packages.GenericAbuseReporting.OpenDynamicAbuseReport)
local CloseCentralOverlayFunction = require(CorePackages.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay
local FFlagEnableReportingFlowForDevSubs = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableReportingFlowForDevSubs
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local Default = require(CorePackages.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local UrlBuilderModule = require(CorePackages.Packages.UrlBuilder)
local UrlBuilder = UrlBuilderModule.UrlBuilder
local UrlBase = UrlBuilderModule.UrlBase
local HttpRequestModule = require(CorePackages.Packages.HttpRequest)
local IAPExperienceModule = require(CorePackages.Workspace.Packages.IAPExperience)
local SubscriptionPurchaseFlow = IAPExperienceModule.PurchaseFlow.SubscriptionPurchaseFlow
local SubscriptionPurchaseFlowState = IAPExperienceModule.PurchaseFlow.SubscriptionPurchaseFlowState
local PurchaseErrorType = IAPExperienceModule.PurchaseFlow.PurchaseErrorType
local VPCModalTypeModule = require(Modules.LuaApp.Components.BuyRobux.Enum.VPCModalType)
local NativePurchaseProductTypeEnumModule = require(Modules.LuaApp.Enum.NativePurchaseProductTypeEnum)
local NativePurchaseStatusModule = require(Modules.LuaApp.Enum.NativePurchaseStatus)
local SetNativePurchaseResultModule = require(Modules.LuaApp.Actions.SetNativePurchaseResult)
local ClearNativePurchaseResultModule = require(Modules.LuaApp.Actions.ClearNativePurchaseResult)
local PaymentPlatformModule = require(Modules.LuaApp.Enum.PaymentPlatform)
local GetPaymentPlatformModule = require(Modules.LuaApp.Util.getPaymentPlatform)
local _ = require(Modules.LuaApp.Models.SubscriptionApi.SubscriptionProductInfoModel)
local GetFFlagEnableVpcForInAppSubscriptionPurchaseModule = require(Modules.LuaApp.Flags.GetFFlagEnableVpcForInAppSubscriptionPurchase)
local IsErrorReasonPrefixWithEconomicRestrictionsFunction = IAPExperienceModule.Utility.isErrorReasonPrefixWithEconomicRestrictions
local ParseErrorReasonToEconomicRestrictionFunction = IAPExperienceModule.Utility.parseErrorReasonToEconomicRestriction

local function parseSubscriptionError(Code)
	-- upvalues: PurchaseErrorType (copy)
	return if Code == "UserHasSpendLimitSet" then PurchaseErrorType.SubscriptionExceededUserSpendLimit elseif Code == "UnsupportedLocale" then PurchaseErrorType.SubscriptionUnsupportedLocale elseif Code == "RestrictedUser" then PurchaseErrorType.RestrictedUser elseif Code == "PurchasePlatformNotSupported" then PurchaseErrorType.SubscriptionPurchasePlatformNotSupported elseif Code == "InvalidSaleLocation" then PurchaseErrorType.SubscriptionInvalidSaleLocation elseif Code == "UserAlreadySubscribed" then PurchaseErrorType.AlreadySubscribed elseif Code == "ProductNotForSale" then PurchaseErrorType.SubscriptionNotForSale elseif Code == "VpcRequired" then PurchaseErrorType.VpcRequired elseif Code == "ExceedParentalSpendLimit" then PurchaseErrorType.ExceedParentalSpendLimit elseif Code == "EconomicRestriction" then PurchaseErrorType.EconomicRestriction else PurchaseErrorType.Unknown
end

local function _(): boolean
	-- upvalues: GetPaymentPlatformModule (copy), PaymentPlatformModule (copy)
	local PaymentPlatformModule1 = GetPaymentPlatformModule()
	
	return PaymentPlatformModule1 == PaymentPlatformModule.Google or (PaymentPlatformModule1 == PaymentPlatformModule.Apple or (PaymentPlatformModule1 == PaymentPlatformModule.UWP or PaymentPlatformModule1 == PaymentPlatformModule.Amazon))
end

local _ = function()
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), ClearNativePurchaseResultModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), ClearNativePurchaseResultModule (upval)
		return function()
			-- upvalues: UseDispatchResult (upval), ClearNativePurchaseResultModule (upval)
			UseDispatchResult(ClearNativePurchaseResultModule())
		end
	end, {})
end

function SubscriptionPurchaseOverlay(p1)
	-- upvalues: ReactModule (copy), SubscriptionPurchaseFlowState (copy), PurchaseErrorType (copy), UseDispatchFunction (copy), UseLocalizationFunction (copy), UseScreenSizeFunction (copy), UseLocalUserIdFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), UseSelectorFunction (copy), NativePurchaseStatusModule (copy), ClearNativePurchaseResultModule (copy), FFlagEnableReportingFlowForDevSubs (copy), OpenDynamicAbuseReportModule (copy), AbuseVectorModule (copy), CloseCentralOverlayFunction (copy), PostReportSubscriptionModule (copy), SetCurrentToastMessageModule (copy), ToastTypeModule (copy), UrlBuilder (copy), UrlBase (copy), HttpService (copy), HttpRequestModule (copy), Default (copy), IsErrorReasonPrefixWithEconomicRestrictionsFunction (copy), ParseErrorReasonToEconomicRestrictionFunction (copy), parseSubscriptionError (copy), SetNativePurchaseResultModule (copy), NativePurchaseProductTypeEnumModule (copy), GetFFlagEnableVpcForInAppSubscriptionPurchaseModule (copy), SubscriptionPurchaseFlow (copy), VPCModalTypeModule (copy), GetPaymentPlatformModule (copy), PaymentPlatformModule (copy)
	local EndPurchase = p1.endPurchase
	local UseStateResult, UseStateResult2 = ReactModule.useState(SubscriptionPurchaseFlowState.PurchaseModal)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(PurchaseErrorType.None)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState({})
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		subscribed = "Feature.Subscription.Text.Subscribed",
		perMonth = "Feature.Subscription.Text.PerMonth",
		disclaimerText = "Feature.Subscription.Text.DisclaimerTextMonthly",
		reportSubscriptionSubmitted = "Feature.Subscription.Message.ReportSubmitted",
		somethingIsWrong = "Feature.Toast.NetworkingError.SomethingIsWrong"
	})
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local SubscriptionTargetKey = p1.subscriptionPurchaseProductInfo.subscriptionTargetKey
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.NativePurchase
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), NativePurchaseStatusModule (upval), UseStateResult2 (copy), SubscriptionPurchaseFlowState (upval), p1 (copy), UseStateResult2_1 (copy), PurchaseErrorType (upval)
		if UseSelectorResult == nil or UseSelectorResult.purchaseStatus == nil then return end
		local PurchaseStatus = UseSelectorResult.purchaseStatus
		
		if PurchaseStatus == NativePurchaseStatusModule.Pending then
			UseStateResult2(SubscriptionPurchaseFlowState.None)
			
			return
		end
		if PurchaseStatus == NativePurchaseStatusModule.Success then
			p1.onPurchaseSuccess()
			
			return
		end
		if PurchaseStatus == NativePurchaseStatusModule.Failed then
			UseStateResult2(SubscriptionPurchaseFlowState.Error)
			UseStateResult2_1(PurchaseErrorType.Unknown)
		end
	end, { UseSelectorResult, p1.onPurchaseSuccess })
	local UseDispatchResult1 = UseDispatchFunction()
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult1 (copy), ClearNativePurchaseResultModule (upval)
		return function()
			-- upvalues: UseDispatchResult1 (upval), ClearNativePurchaseResultModule (upval)
			UseDispatchResult1(ClearNativePurchaseResultModule())
		end
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagEnableReportingFlowForDevSubs (upval), UseDispatchResult (copy), OpenDynamicAbuseReportModule (upval), AbuseVectorModule (upval), SubscriptionTargetKey (copy), p1 (copy), CloseCentralOverlayFunction (upval), PostReportSubscriptionModule (upval), UseRoactServiceModuleResult (copy), UseLocalUserIdResult (copy), SetCurrentToastMessageModule (upval), UseLocalizationResult (copy), ToastTypeModule (upval)
		if FFlagEnableReportingFlowForDevSubs then
			UseDispatchResult(OpenDynamicAbuseReportModule({
				abuseVector = AbuseVectorModule.Subscription,
				targetId = {
					subscriptionTargetKey = SubscriptionTargetKey,
					imageAssetId = tostring(p1.subscriptionPurchaseProductInfo.iconImageAssetId)
				},
				onClose = function()
					-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
					UseDispatchResult(CloseCentralOverlayFunction())
				end
			}))
			
			return
		else
			PostReportSubscriptionModule(UseRoactServiceModuleResult, SubscriptionTargetKey, UseLocalUserIdResult):andThen(function()
				-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageModule (upval), UseLocalizationResult (upval), ToastTypeModule (upval)
				UseDispatchResult(SetCurrentToastMessageModule({
					isLocalized = true,
					toastMessage = UseLocalizationResult.reportSubscriptionSubmitted,
					toastType = ToastTypeModule.SuccessConfirmation
				}))
			end, function()
				-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageModule (upval), UseLocalizationResult (upval), ToastTypeModule (upval)
				UseDispatchResult(SetCurrentToastMessageModule({
					isLocalized = true,
					toastMessage = UseLocalizationResult.somethingIsWrong,
					toastType = ToastTypeModule.NetworkingError
				}))
			end)
		end
	end, {
		UseRoactServiceModuleResult, SubscriptionTargetKey, UseLocalUserIdResult,
		UseDispatchResult, UseLocalizationResult,
		p1.subscriptionPurchaseProductInfo.iconImageAssetId
	})
	local SubscriptionProviderId = p1.subscriptionPurchaseProductInfo.subscriptionProviderId
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: SubscriptionProviderId (copy), UrlBuilder (upval), UrlBase (upval), HttpService (upval), HttpRequestModule (upval), Default (upval), UseDispatchResult (copy), SetCurrentToastMessageModule (upval), UseLocalizationResult (copy), ToastTypeModule (upval)
		if SubscriptionProviderId then
			HttpRequestModule.config({
				requestFunction = HttpRequestModule.requestFunctions.RequestInternal
			})(UrlBuilder.new({
				path = "sharelinks/v1/get-or-create-link",
				base = UrlBase.APIS
			})(), "POST", {
				postBody = HttpService:JSONEncode({
					linkType = "ExperienceDetails",
					data = HttpService:JSONEncode({ universeId = tostring(SubscriptionProviderId) })
				})
			}):andThen(function(Result)
				-- upvalues: UrlBuilder (upval), Default (upval)
				local ResponseBody = Result.responseBody or Result.result
				
				if ResponseBody and ResponseBody.linkId then
					local ShortUrlResult = UrlBuilder.sharelinks.shortUrl({
						type = "ExperienceDetails",
						linkId = ResponseBody.linkId,
						stamp = tostring(DateTime.now().UnixTimestampMillis)
					})
					
					if Default then
						Default:shareUrl({
							context = "SubscriptionPurchaseShare",
							url = ShortUrlResult
						})
					end
				end
			end):catch(function()
				-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageModule (upval), UseLocalizationResult (upval), ToastTypeModule (upval)
				UseDispatchResult(SetCurrentToastMessageModule({
					isLocalized = true,
					toastMessage = UseLocalizationResult.somethingIsWrong,
					toastType = ToastTypeModule.NetworkingError
				}))
			end)
			
			return
		end
	end, {
		SubscriptionProviderId,
		UseDispatchResult,
		UseLocalizationResult
	})
	local CreateElementFunction = ReactModule.createElement
	local config = {
		eventPrefix = "EDP",
		screenSize = UseScreenSizeResult,
		purchaseState = UseStateResult,
		errorType = UseStateResult1,
		economicRestrictionError = UseStateResult3,
		purchaseVPCType = if UseStateResult == SubscriptionPurchaseFlowState.PurchaseVPCModal then VPCModalTypeModule.toRawValue(VPCModalTypeModule.EnablePurchase) else VPCModalTypeModule.toRawValue(VPCModalTypeModule.None),
		shouldUseNewModalDesign = p1.shouldUseNewModalDesign,
		isRobuxSubscription = p1.isRobuxSubscription,
		creatorName = p1.creatorName,
		creatorVerified = p1.creatorVerified,
		subscriptionId = SubscriptionTargetKey,
		name = p1.subscriptionPurchaseProductInfo.name,
		subscriptionProviderId = p1.subscriptionPurchaseProductInfo.subscriptionProviderId,
		subscriptionProviderName = p1.subscriptionPurchaseProductInfo.subscriptionProviderName,
		priceTier = p1.subscriptionPurchaseProductInfo.priceTier,
		displayPrice = p1.subscriptionPurchaseProductInfo.displayPrice,
		period = UseLocalizationResult.perMonth,
		description = p1.subscriptionPurchaseProductInfo.description,
		disclaimerText = UseLocalizationResult.disclaimerText,
		itemIcon = p1.thumbnailString,
		disablePurchase = p1.isSubscribed,
		disablePurchaseText = if p1.isSubscribed then UseLocalizationResult.subscribed else nil,
		purchaseSubscription = function()
			-- upvalues: p1 (copy), SubscriptionTargetKey (copy), HttpService (upval), IsErrorReasonPrefixWithEconomicRestrictionsFunction (upval), UseStateResult2_1 (copy), PurchaseErrorType (upval), UseStateResult2 (copy), SubscriptionPurchaseFlowState (upval), UseStateResult2_2 (copy), ParseErrorReasonToEconomicRestrictionFunction (upval), parseSubscriptionError (upval), UseDispatchResult (copy), SetNativePurchaseResultModule (upval), NativePurchaseStatusModule (upval), NativePurchaseProductTypeEnumModule (upval), GetFFlagEnableVpcForInAppSubscriptionPurchaseModule (upval)
			if p1.isRobuxSubscription then
				p1.promptSubscriptionPurchase(SubscriptionTargetKey, p1.subscriptionPurchaseProductInfo.priceInRobux):andThen(function()
					-- upvalues: p1 (upval)
					p1.onPurchaseSuccess()
				end):catch(function(Err)
					-- upvalues: HttpService (upval), IsErrorReasonPrefixWithEconomicRestrictionsFunction (upval), UseStateResult2_1 (upval), PurchaseErrorType (upval), UseStateResult2 (upval), SubscriptionPurchaseFlowState (upval), UseStateResult2_2 (upval), ParseErrorReasonToEconomicRestrictionFunction (upval), parseSubscriptionError (upval)
					local Code = nil
					
					if type(Err) == "string" then
						Code = Err
					elseif type(Err) == "table" and Err.Body then
						local Success, Result = pcall(function()
							-- upvalues: HttpService (upval), Err (copy)
							return HttpService:JSONDecode(Err.Body)
						end)
						
						if Success and Result and Result.errors and Result.errors[1] then
							Code = Result.errors[1].code or Result.errors[1].message
						end
					end
					if Code and IsErrorReasonPrefixWithEconomicRestrictionsFunction(Code) then
						UseStateResult2_1(PurchaseErrorType.EconomicRestriction)
						UseStateResult2(SubscriptionPurchaseFlowState.Error)
						UseStateResult2_2(ParseErrorReasonToEconomicRestrictionFunction(Code))
						
						return
					else
						UseStateResult2_1((parseSubscriptionError(Code)))
						UseStateResult2(SubscriptionPurchaseFlowState.Error)
					end
				end)
				
				return
			else
				UseDispatchResult(SetNativePurchaseResultModule(SubscriptionTargetKey, NativePurchaseStatusModule.Pending, NativePurchaseProductTypeEnumModule.Subscription))
				p1.promptSubscriptionPurchase(SubscriptionTargetKey):catch(function(Err)
					-- upvalues: IsErrorReasonPrefixWithEconomicRestrictionsFunction (upval), UseStateResult2_1 (upval), PurchaseErrorType (upval), UseStateResult2 (upval), SubscriptionPurchaseFlowState (upval), UseStateResult2_2 (upval), ParseErrorReasonToEconomicRestrictionFunction (upval), parseSubscriptionError (upval), GetFFlagEnableVpcForInAppSubscriptionPurchaseModule (upval)
					if IsErrorReasonPrefixWithEconomicRestrictionsFunction(Err) then
						UseStateResult2_1(PurchaseErrorType.EconomicRestriction)
						UseStateResult2(SubscriptionPurchaseFlowState.Error)
						UseStateResult2_2(ParseErrorReasonToEconomicRestrictionFunction(Err))
						
						return
					else
						local ParseSubscriptionErrorResult = parseSubscriptionError(Err)
						UseStateResult2_1(ParseSubscriptionErrorResult)
						UseStateResult2(if GetFFlagEnableVpcForInAppSubscriptionPurchaseModule() and ParseSubscriptionErrorResult == PurchaseErrorType.VpcRequired then SubscriptionPurchaseFlowState.PurchaseVPCModal else SubscriptionPurchaseFlowState.Error)
					end
				end)
			end
		end,
		cancelPurchase = EndPurchase,
		flowComplete = EndPurchase,
		openSettingsPage = if IsPaymentPlatformModuleMatch then p1.openSettingsPage else nil,
		onReport = if p1.shouldUseNewModalDesign then UseResult else nil,
		onShare = if p1.shouldUseNewModalDesign then UseResult1 else nil,
		onAnalyticEvent = function(p2, p3)
			-- upvalues: p1 (copy)
			p1.onAnalyticEvent("EDPSubscriptionPurchase", p2, p3)
		end
	}
	local PaymentPlatformModule1 = GetPaymentPlatformModule()
	local IsPaymentPlatformModuleMatch: boolean = PaymentPlatformModule1 == PaymentPlatformModule.Google or (PaymentPlatformModule1 == PaymentPlatformModule.Apple or (PaymentPlatformModule1 == PaymentPlatformModule.UWP or PaymentPlatformModule1 == PaymentPlatformModule.Amazon))
	
	return CreateElementFunction(SubscriptionPurchaseFlow, config)
end

return SubscriptionPurchaseOverlay