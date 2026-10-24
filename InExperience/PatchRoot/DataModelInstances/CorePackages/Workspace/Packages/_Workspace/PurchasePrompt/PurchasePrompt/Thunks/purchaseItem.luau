local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local HttpService = game:GetService("HttpService")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local ExperienceAuthService = game:GetService("ExperienceAuthService")
local Parent = PurchasePrompt.Parent
local IAPExperienceModule = require(Parent.IAPExperience)
local IsEconomicRestrictionResponseFunction = IAPExperienceModule.Utility.isEconomicRestrictionResponse
local ParseEconomicRestrictionsFailureReasonFunction = IAPExperienceModule.Utility.parseEconomicRestrictionsFailureReason
local ParseEconomicRestrictionsExpirationTimeInMinutesFunction = IAPExperienceModule.Utility.parseEconomicRestrictionsExpirationTimeInMinutes
local SetPromptStateModule = require(PurchasePrompt.Actions.SetPromptState)
local StartPurchaseModule = require(PurchasePrompt.Actions.StartPurchase)
local ErrorOccurredModule = require(PurchasePrompt.Actions.ErrorOccurred)
local SetEconomicRestrictionErrorModule = require(PurchasePrompt.Actions.SetEconomicRestrictionError)
local PurchaseFlowModule = require(PurchasePrompt.Enums.PurchaseFlow)
local PromptStateModule = require(PurchasePrompt.Enums.PromptState)
local ItemTypeModule = require(PurchasePrompt.Enums.ItemType)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local RequestTypeModule = require(PurchasePrompt.Enums.RequestType)
local GetToolAssetModule = require(PurchasePrompt.Network.getToolAsset)
local PerformPurchaseModule = require(PurchasePrompt.Network.performPurchase)
local PerformPurchaseV2Module = require(PurchasePrompt.Network.performPurchaseV2)
local PerformCreatorStorePurchaseModule = require(PurchasePrompt.Network.performCreatorStorePurchase)
local NetworkModule = require(PurchasePrompt.Services.Network)
local AnalyticsModule = require(PurchasePrompt.Services.Analytics)
local ExternalSettingsModule = require(PurchasePrompt.Services.ExternalSettings)
local IsCreatorStoreAssetTypeModule = require(PurchasePrompt.Utils.isCreatorStoreAssetType)
local ThunkModule = require(PurchasePrompt.Thunk)
local PromiseModule = require(PurchasePrompt.Promise)
local _ = require(PurchasePrompt.types)
local ProductTypeEnum = require(PurchasePrompt.types).ProductTypeEnum
local SelectProductPriceModule = require(PurchasePrompt.Selectors.selectProductPrice)
local DerivePurchaseOptionsFromCartPricingResponseModule = require(PurchasePrompt.Utils.derivePurchaseOptionsFromCartPricingResponse)
local MergeOfferIdsIntoPurchasePayloadModule = require(PurchasePrompt.Utils.mergeOfferIdsIntoPurchasePayload)
local PerformLuaPurchaseModule = require(PurchasePrompt.Thunks.performLuaPurchase)
local HandlePriceChangedErrorModule = require(PurchasePrompt.Utils.handlePriceChangedError)
local CompletePurchaseModule = require(script.Parent.completePurchase)
local GetFFlagEnableCreatorStorePurchasingCutoverModule = require(PurchasePrompt.Flags.GetFFlagEnableCreatorStorePurchasingCutover)
local LogUnifiedPurchaseTelemetryCounterModule = require(PurchasePrompt.Utils.logUnifiedPurchaseTelemetryCounter)
local ReportPurchasePromptNonCollectiblePurchaseModule = require(PurchasePrompt.Telemetry.reportPurchasePromptNonCollectiblePurchase)
local UnifiedPurchaseTelemetryModule = require(PurchasePrompt.Events.UnifiedPurchaseTelemetry)
local FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = require(Parent.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local FFlagEnablePurchasePayloadInExperienceShop = require(Parent.SharedFlags).FFlagEnablePurchasePayloadInExperienceShop
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local FFlagMockDevSubPurchaseInStudioModule = require(PurchasePrompt.Flags.FFlagMockDevSubPurchaseInStudio)
local FFlagEnableMarketplacePurchaseDeepLinkAttribution = require(Parent.SharedFlags).FFlagEnableMarketplacePurchaseDeepLinkAttribution
local FFlagEnableNonCollectiblePurchaseCountersLua = require(Parent.SharedFlags).FFlagEnableNonCollectiblePurchaseCountersLua
local FFlagLuaAppsEnablePromptVIPServerPurchase = require(Parent.SharedFlags).FFlagLuaAppsEnablePromptVIPServerPurchase
local list = { NetworkModule, AnalyticsModule, ExternalSettingsModule }

function isLuaPurchase(p1): boolean
	-- upvalues: ProductTypeEnum (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy)
	return p1 ~= nil and (p1.kind == ProductTypeEnum.Product and p1.universeId ~= nil or (p1.kind == ProductTypeEnum.Experience or (p1.kind == ProductTypeEnum.Look or FFlagEnableUnifiedPurchaseFlowForDevSubs and p1.kind == ProductTypeEnum.DeveloperSubscription)))
end

return function()
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), ExternalSettingsModule (copy), AnalyticsModule (copy), FFlagLuaAppsEnablePromptVIPServerPurchase (copy), RequestTypeModule (copy), LogUnifiedPurchaseTelemetryCounterModule (copy), UnifiedPurchaseTelemetryModule (copy), StartPurchaseModule (copy), Workspace (copy), ExperienceAuthService (copy), CompletePurchaseModule (copy), PurchaseFlowModule (copy), SetPromptStateModule (copy), PromptStateModule (copy), HttpService (copy), SelectProductPriceModule (copy), DerivePurchaseOptionsFromCartPricingResponseModule (copy), FFlagEnableMarketplacePurchaseDeepLinkAttribution (copy), FFlagMockDevSubPurchaseInStudioModule (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), ProductTypeEnum (copy), PerformLuaPurchaseModule (copy), GetFFlagEnableCreatorStorePurchasingCutoverModule (copy), IsCreatorStoreAssetTypeModule (copy), PerformCreatorStorePurchaseModule (copy), PromiseModule (copy), ErrorOccurredModule (copy), PerformPurchaseV2Module (copy), IsEconomicRestrictionResponseFunction (copy), ParseEconomicRestrictionsFailureReasonFunction (copy), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (copy), SetEconomicRestrictionErrorModule (copy), PurchaseErrorModule (copy), HandlePriceChangedErrorModule (copy), FFlagEnableNonCollectiblePurchaseCountersLua (copy), ReportPurchasePromptNonCollectiblePurchaseModule (copy), FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (copy), FFlagEnablePurchasePayloadInExperienceShop (copy), MergeOfferIdsIntoPurchasePayloadModule (copy), PerformPurchaseModule (copy), ItemTypeModule (copy), GetToolAssetModule (copy), Players (copy)
	return ThunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: NetworkModule (upval), ExternalSettingsModule (upval), AnalyticsModule (upval), FFlagLuaAppsEnablePromptVIPServerPurchase (upval), RequestTypeModule (upval), LogUnifiedPurchaseTelemetryCounterModule (upval), UnifiedPurchaseTelemetryModule (upval), StartPurchaseModule (upval), Workspace (upval), ExperienceAuthService (upval), CompletePurchaseModule (upval), PurchaseFlowModule (upval), SetPromptStateModule (upval), PromptStateModule (upval), HttpService (upval), SelectProductPriceModule (upval), DerivePurchaseOptionsFromCartPricingResponseModule (upval), FFlagEnableMarketplacePurchaseDeepLinkAttribution (upval), FFlagMockDevSubPurchaseInStudioModule (upval), FFlagEnableUnifiedPurchaseFlowForDevSubs (upval), ProductTypeEnum (upval), PerformLuaPurchaseModule (upval), GetFFlagEnableCreatorStorePurchasingCutoverModule (upval), IsCreatorStoreAssetTypeModule (upval), PerformCreatorStorePurchaseModule (upval), PromiseModule (upval), ErrorOccurredModule (upval), PerformPurchaseV2Module (upval), IsEconomicRestrictionResponseFunction (upval), ParseEconomicRestrictionsFailureReasonFunction (upval), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (upval), SetEconomicRestrictionErrorModule (upval), PurchaseErrorModule (upval), HandlePriceChangedErrorModule (upval), FFlagEnableNonCollectiblePurchaseCountersLua (upval), ReportPurchasePromptNonCollectiblePurchaseModule (upval), FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (upval), FFlagEnablePurchasePayloadInExperienceShop (upval), MergeOfferIdsIntoPurchasePayloadModule (upval), PerformPurchaseModule (upval), ItemTypeModule (upval), GetToolAssetModule (upval), Players (upval)
		local v1 = p2[NetworkModule]
		local v2 = p2[ExternalSettingsModule]
		local v3 = p2[AnalyticsModule]
		local State = p1:getState()
		local PurchaseFlow = State.purchaseFlow
		local RequestType = State.promptRequest.requestType
		
		if FFlagLuaAppsEnablePromptVIPServerPurchase and RequestType == RequestTypeModule.VIPServer then return end
		if State.cartPricing ~= nil and State.cartPricing.isFetching then
			local PurchaseAnalyticsMetadata = State.purchaseAnalyticsMetadata
			LogUnifiedPurchaseTelemetryCounterModule(UnifiedPurchaseTelemetryModule.UnifiedCartPricingBuyBlockedWhileFetchingCounter, PurchaseAnalyticsMetadata and PurchaseAnalyticsMetadata.surface, PurchaseAnalyticsMetadata and PurchaseAnalyticsMetadata.productType)
			
			return
		end
		local Platform = v2.getPlatform()
		p1:dispatch(StartPurchaseModule(Workspace.DistributedGameTime))
		
		if p1:getState().isUserEligibleForUnifiedPurchaseFlow then
			LogUnifiedPurchaseTelemetryCounterModule(UnifiedPurchaseTelemetryModule.UnifiedProductPurchaseModalPurchaseAttemptedCounter, State.purchaseAnalyticsMetadata.surface, State.purchaseAnalyticsMetadata.productType)
			
			if State.purchaseCallbacks and State.purchaseCallbacks.onPurchaseAttempt then
				State.purchaseCallbacks.onPurchaseAttempt()
			end
		end
		if RequestType == RequestTypeModule.AvatarCreationFee then
			ExperienceAuthService:ScopeCheckUIComplete(State.promptRequest.id, { [1] = Enum.ExperienceAuthScope.CreatorAssetsCreate }, Enum.ScopeCheckResult.ConsentAccepted, {
				avatarName = State.productInfo.name,
				avatarDescription = State.productInfo.description,
				priceFromToken = State.productInfo.price
			})
			v3.signalAvatarCreationPurchaseSubmit()
			p1:dispatch(CompletePurchaseModule())
			
			return
		end
		if PurchaseFlow == PurchaseFlowModule.RobuxUpsellV2 or PurchaseFlow == PurchaseFlowModule.LargeRobuxUpsell then
			p1:dispatch(SetPromptStateModule(PromptStateModule.PurchaseInProgress))
		end
		local State1 = p1:getState()
		local Guid = HttpService:GenerateGUID(false)
		local Id = State1.promptRequest.id
		local InfoType = State1.promptRequest.infoType
		local EquipIfPurchased = State1.promptRequest.equipIfPurchased
		local IsRobloxPurchase = State1.promptRequest.isRobloxPurchase
		local PurchaseAuthToken = State1.promptRequest.purchaseAuthToken
		local IdempotencyKey = State1.promptRequest.idempotencyKey
		local CollectibleItemId = State1.promptRequest.collectibleItemId
		local CollectibleItemInstanceId = State1.promptRequest.collectibleItemInstanceId
		local CollectibleProductId = State1.promptRequest.collectibleProductId
		local SelectProductPriceModuleResult = SelectProductPriceModule(State1)
		local AssetTypeId = State1.productInfo.assetTypeId
		local AssetType = State1.productInfo.assetType
		local ProductId = State1.productInfo.productId
		local CollectibleItemId1 = State1.productInfo.collectibleItemId
		local CollectibleProductId1 = State1.productInfo.collectibleProductId
		local DerivePurchaseOptionsFromCartPricingResponseModuleResult = DerivePurchaseOptionsFromCartPricingResponseModule(State1.cartPricing and State1.cartPricing.response)
		
		if FFlagEnableMarketplacePurchaseDeepLinkAttribution then
			local DeepLinkId = State1.productPayload and State1.productPayload.deepLinkId
			
			if DeepLinkId ~= nil and DeepLinkId ~= "" then
				DerivePurchaseOptionsFromCartPricingResponseModuleResult = DerivePurchaseOptionsFromCartPricingResponseModuleResult or {}
				DerivePurchaseOptionsFromCartPricingResponseModuleResult.DeepLinkId = DeepLinkId
			end
		end
		local ItemType = State1.productInfo.itemType
		v3.signalProductPurchaseConfirmed(ProductId, State1.requestType)
		local IsInfoTypeMatch: boolean = CollectibleItemId and (CollectibleItemId ~= "" and InfoType == Enum.InfoType.Bundle)
		
		if not isLuaPurchase(State1.productPayload) then
			if GetFFlagEnableCreatorStorePurchasingCutoverModule() and IsCreatorStoreAssetTypeModule(AssetType) then
				return PerformCreatorStorePurchaseModule(v1, ProductId, AssetType):andThen(function(Result)
					-- upvalues: p1 (copy), CompletePurchaseModule (upval), v3 (copy), Id (copy), InfoType (copy), SelectProductPriceModuleResult (copy), PromiseModule (upval)
					p1:dispatch(CompletePurchaseModule())
					v3.signalPurchaseSuccess(Id, InfoType, SelectProductPriceModuleResult, Result)
					
					return PromiseModule.resolve()
				end):catch(function(Err)
					-- upvalues: p1 (copy), ErrorOccurredModule (upval)
					p1:dispatch(ErrorOccurredModule(Err))
				end)
			end
			if IsInfoTypeMatch or CollectibleItemInstanceId and CollectibleItemInstanceId ~= "" then
				return PerformPurchaseV2Module(v1, InfoType, ProductId, SelectProductPriceModuleResult, Guid, IsRobloxPurchase, CollectibleItemId, CollectibleProductId, IdempotencyKey, PurchaseAuthToken, CollectibleItemInstanceId, DerivePurchaseOptionsFromCartPricingResponseModuleResult):andThen(function(Result)
					-- upvalues: p1 (copy), CompletePurchaseModule (upval), v3 (copy), Id (copy), InfoType (copy), SelectProductPriceModuleResult (copy), PromiseModule (upval)
					p1:dispatch(CompletePurchaseModule(Result))
					v3.signalPurchaseSuccess(Id, InfoType, SelectProductPriceModuleResult, Result)
					
					return PromiseModule.resolve()
				end):catch(function(Err)
					-- upvalues: IsEconomicRestrictionResponseFunction (upval), ParseEconomicRestrictionsFailureReasonFunction (upval), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (upval), p1 (copy), SetEconomicRestrictionErrorModule (upval), ErrorOccurredModule (upval), PurchaseErrorModule (upval), HandlePriceChangedErrorModule (upval), State1 (copy), v3 (copy), ProductId (copy), InfoType (copy), Platform (copy)
					if IsEconomicRestrictionResponseFunction(Err) then
						p1:dispatch(SetEconomicRestrictionErrorModule(ParseEconomicRestrictionsFailureReasonFunction(Err), (ParseEconomicRestrictionsExpirationTimeInMinutesFunction(Err))))
						p1:dispatch(ErrorOccurredModule(PurchaseErrorModule.EconomicRestriction))
						
						return
					end
					if HandlePriceChangedErrorModule(p1, Err, State1.productPayload and State1.productPayload.kind) then return end
					if Err == PurchaseErrorModule.TwoFactorNeeded then
						v3.signalTwoSVSettingsErrorShown(ProductId, InfoType)
						
						if Platform == Enum.Platform.Windows or Platform == Enum.Platform.OSX then
							Err = PurchaseErrorModule.TwoFactorNeededSettings
						end
					end
					p1:dispatch(ErrorOccurredModule(Err))
				end)
			end
			if FFlagEnableNonCollectiblePurchaseCountersLua and (CollectibleItemId1 == nil or CollectibleItemId1 == "") then
				ReportPurchasePromptNonCollectiblePurchaseModule(InfoType, State1.productInfo)
			end
			local TimedOptionDays = if FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow then State1.productPayload and State1.productPayload.timedOptionDays else nil
			local MergeOfferIdsIntoPurchasePayloadModuleResult = if FFlagEnablePurchasePayloadInExperienceShop then MergeOfferIdsIntoPurchasePayloadModule(State1.productPayload and State1.productPayload.purchasePayload, DerivePurchaseOptionsFromCartPricingResponseModuleResult) else nil
			
			return PerformPurchaseModule(v1, InfoType, ProductId, SelectProductPriceModuleResult, Guid, IsRobloxPurchase, CollectibleItemId1, CollectibleProductId1, IdempotencyKey, PurchaseAuthToken, if FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow then TimedOptionDays else nil, if FFlagEnablePurchasePayloadInExperienceShop then MergeOfferIdsIntoPurchasePayloadModuleResult else nil, DerivePurchaseOptionsFromCartPricingResponseModuleResult):andThen(function(Result)
				-- upvalues: p1 (copy), CompletePurchaseModule (upval), ItemType (copy), ItemTypeModule (upval), v3 (copy), Id (copy), InfoType (copy), SelectProductPriceModuleResult (copy), EquipIfPurchased (copy), AssetTypeId (copy), GetToolAssetModule (upval), v1 (copy), Players (upval), PromiseModule (upval)
				p1:dispatch(CompletePurchaseModule(Result))
				
				if ItemType ~= ItemTypeModule.Bundle then
					v3.signalPurchaseSuccess(Id, InfoType, SelectProductPriceModuleResult, Result)
				end
				return if EquipIfPurchased and AssetTypeId == 19 then GetToolAssetModule(v1, Id):andThen(function(Result)
					-- upvalues: Players (upval)
					if Result then
						Result.Parent = Players.LocalPlayer.Backpack
					end
				end) else PromiseModule.resolve()
			end):catch(function(Err)
				-- upvalues: IsEconomicRestrictionResponseFunction (upval), ParseEconomicRestrictionsFailureReasonFunction (upval), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (upval), p1 (copy), SetEconomicRestrictionErrorModule (upval), ErrorOccurredModule (upval), PurchaseErrorModule (upval), HandlePriceChangedErrorModule (upval), State1 (copy), v3 (copy), ProductId (copy), InfoType (copy), Platform (copy)
				if IsEconomicRestrictionResponseFunction(Err) then
					p1:dispatch(SetEconomicRestrictionErrorModule(ParseEconomicRestrictionsFailureReasonFunction(Err), (ParseEconomicRestrictionsExpirationTimeInMinutesFunction(Err))))
					p1:dispatch(ErrorOccurredModule(PurchaseErrorModule.EconomicRestriction))
					
					return
				end
				if HandlePriceChangedErrorModule(p1, Err, State1.productPayload and State1.productPayload.kind) then return end
				if Err == PurchaseErrorModule.TwoFactorNeeded then
					v3.signalTwoSVSettingsErrorShown(ProductId, InfoType)
					
					if Platform == Enum.Platform.Windows or Platform == Enum.Platform.OSX then
						Err = PurchaseErrorModule.TwoFactorNeededSettings
					end
				end
				p1:dispatch(ErrorOccurredModule(Err))
			end)
		elseif FFlagMockDevSubPurchaseInStudioModule and FFlagEnableUnifiedPurchaseFlowForDevSubs and State1.productPayload.kind == ProductTypeEnum.DeveloperSubscription and v2.isStudio() then
			p1:dispatch(CompletePurchaseModule())
			
			return
		else
			p1:dispatch(PerformLuaPurchaseModule())
		end
	end)
end