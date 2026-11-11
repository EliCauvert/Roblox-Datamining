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
local GetPlayerPriceModule = require(PurchasePrompt.Utils.getPlayerPrice)
local IsCreatorStoreAssetTypeModule = require(PurchasePrompt.Utils.isCreatorStoreAssetType)
local ThunkModule = require(PurchasePrompt.Thunk)
local PromiseModule = require(PurchasePrompt.Promise)
local _ = require(PurchasePrompt.types)
local ProductTypeEnum = require(PurchasePrompt.types).ProductTypeEnum
local SelectProductPriceModule = require(PurchasePrompt.Selectors.selectProductPrice)
local DerivePurchaseOptionsFromCartPricingResponseModule = require(PurchasePrompt.Utils.derivePurchaseOptionsFromCartPricingResponse)
local PerformLuaPurchaseModule = require(PurchasePrompt.Thunks.performLuaPurchase)
local HandlePriceChangedErrorModule = require(PurchasePrompt.Utils.handlePriceChangedError)
local CompletePurchaseModule = require(script.Parent.completePurchase)
local FFlagEnableUnifiedProductPurchaseFlow = require(Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local GetFFlagEnableCreatorStorePurchasingCutoverModule = require(PurchasePrompt.Flags.GetFFlagEnableCreatorStorePurchasingCutover)
local LogUnifiedPurchaseTelemetryCounterModule = require(PurchasePrompt.Utils.logUnifiedPurchaseTelemetryCounter)
local UnifiedPurchaseTelemetryModule = require(PurchasePrompt.Events.UnifiedPurchaseTelemetry)
local FFlagPurchasePromptPriceShouldUseProductInfoPriceModule = require(PurchasePrompt.Flags.FFlagPurchasePromptPriceShouldUseProductInfoPrice)
local FFlagPurchasePromptCartPricingEnabledModule = require(PurchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = require(Parent.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local FFlagEnablePurchasePayloadInExperienceShop = require(Parent.SharedFlags).FFlagEnablePurchasePayloadInExperienceShop
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local list = { NetworkModule, AnalyticsModule, ExternalSettingsModule }

function isLuaPurchase(p1): boolean
	-- upvalues: ProductTypeEnum (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy)
	return p1 ~= nil and (p1.kind == ProductTypeEnum.Product and p1.universeId ~= nil or (p1.kind == ProductTypeEnum.Experience or (p1.kind == ProductTypeEnum.Look or FFlagEnableUnifiedPurchaseFlowForDevSubs and p1.kind == ProductTypeEnum.DeveloperSubscription)))
end

return function()
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), ExternalSettingsModule (copy), AnalyticsModule (copy), FFlagPurchasePromptCartPricingEnabledModule (copy), LogUnifiedPurchaseTelemetryCounterModule (copy), UnifiedPurchaseTelemetryModule (copy), StartPurchaseModule (copy), Workspace (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), RequestTypeModule (copy), ExperienceAuthService (copy), CompletePurchaseModule (copy), PurchaseFlowModule (copy), SetPromptStateModule (copy), PromptStateModule (copy), HttpService (copy), FFlagPurchasePromptPriceShouldUseProductInfoPriceModule (copy), SelectProductPriceModule (copy), GetPlayerPriceModule (copy), FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (copy), DerivePurchaseOptionsFromCartPricingResponseModule (copy), PerformLuaPurchaseModule (copy), GetFFlagEnableCreatorStorePurchasingCutoverModule (copy), IsCreatorStoreAssetTypeModule (copy), PerformCreatorStorePurchaseModule (copy), PromiseModule (copy), ErrorOccurredModule (copy), PerformPurchaseV2Module (copy), IsEconomicRestrictionResponseFunction (copy), ParseEconomicRestrictionsFailureReasonFunction (copy), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (copy), SetEconomicRestrictionErrorModule (copy), PurchaseErrorModule (copy), HandlePriceChangedErrorModule (copy), FFlagEnablePurchasePayloadInExperienceShop (copy), PerformPurchaseModule (copy), ItemTypeModule (copy), GetToolAssetModule (copy), Players (copy)
	return ThunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: NetworkModule (upval), ExternalSettingsModule (upval), AnalyticsModule (upval), FFlagPurchasePromptCartPricingEnabledModule (upval), LogUnifiedPurchaseTelemetryCounterModule (upval), UnifiedPurchaseTelemetryModule (upval), StartPurchaseModule (upval), Workspace (upval), FFlagEnableUnifiedProductPurchaseFlow (upval), RequestTypeModule (upval), ExperienceAuthService (upval), CompletePurchaseModule (upval), PurchaseFlowModule (upval), SetPromptStateModule (upval), PromptStateModule (upval), HttpService (upval), FFlagPurchasePromptPriceShouldUseProductInfoPriceModule (upval), SelectProductPriceModule (upval), GetPlayerPriceModule (upval), FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (upval), DerivePurchaseOptionsFromCartPricingResponseModule (upval), PerformLuaPurchaseModule (upval), GetFFlagEnableCreatorStorePurchasingCutoverModule (upval), IsCreatorStoreAssetTypeModule (upval), PerformCreatorStorePurchaseModule (upval), PromiseModule (upval), ErrorOccurredModule (upval), PerformPurchaseV2Module (upval), IsEconomicRestrictionResponseFunction (upval), ParseEconomicRestrictionsFailureReasonFunction (upval), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (upval), SetEconomicRestrictionErrorModule (upval), PurchaseErrorModule (upval), HandlePriceChangedErrorModule (upval), FFlagEnablePurchasePayloadInExperienceShop (upval), PerformPurchaseModule (upval), ItemTypeModule (upval), GetToolAssetModule (upval), Players (upval)
		local v1 = p2[NetworkModule]
		local v2 = p2[ExternalSettingsModule]
		local v3 = p2[AnalyticsModule]
		local State = p1:getState()
		local PurchaseFlow = State.purchaseFlow
		local RequestType = State.promptRequest.requestType
		
		if FFlagPurchasePromptCartPricingEnabledModule and State.cartPricing ~= nil and State.cartPricing.isFetching then
			local PurchaseAnalyticsMetadata = State.purchaseAnalyticsMetadata
			LogUnifiedPurchaseTelemetryCounterModule(UnifiedPurchaseTelemetryModule.UnifiedCartPricingBuyBlockedWhileFetchingCounter, PurchaseAnalyticsMetadata and PurchaseAnalyticsMetadata.surface, PurchaseAnalyticsMetadata and PurchaseAnalyticsMetadata.productType)
			
			return
		end
		local Platform = v2.getPlatform()
		p1:dispatch(StartPurchaseModule(Workspace.DistributedGameTime))
		
		if FFlagEnableUnifiedProductPurchaseFlow and p1:getState().isUserEligibleForUnifiedPurchaseFlow then
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
		local SelectProductPriceModuleResult = nil
		
		if FFlagPurchasePromptPriceShouldUseProductInfoPriceModule then
			SelectProductPriceModuleResult = SelectProductPriceModule(State1)
		else
			local ExpectedPrice = State1.promptRequest.expectedPrice
			SelectProductPriceModuleResult = if CollectibleItemInstanceId and CollectibleItemInstanceId ~= "" then ExpectedPrice elseif FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow and State1.productPayload and State1.productPayload.timedOptionDays ~= nil then ExpectedPrice else GetPlayerPriceModule(State1.productInfo, State1.accountInfo.membershipType == 4)
		end
		local AssetTypeId = State1.productInfo.assetTypeId
		local AssetType = State1.productInfo.assetType
		local ProductId = State1.productInfo.productId
		local CollectibleItemId1 = State1.productInfo.collectibleItemId
		local CollectibleProductId1 = State1.productInfo.collectibleProductId
		local DerivePurchaseOptionsFromCartPricingResponseModuleResult = if FFlagPurchasePromptCartPricingEnabledModule then DerivePurchaseOptionsFromCartPricingResponseModule(State1.cartPricing and State1.cartPricing.response) else nil
		local ItemType = State1.productInfo.itemType
		v3.signalProductPurchaseConfirmed(ProductId, State1.requestType)
		local IsInfoTypeMatch: boolean = CollectibleItemId and (CollectibleItemId ~= "" and InfoType == Enum.InfoType.Bundle)
		
		if FFlagEnableUnifiedProductPurchaseFlow and isLuaPurchase(State1.productPayload) then
			p1:dispatch(PerformLuaPurchaseModule())
			
			return
		end
		if GetFFlagEnableCreatorStorePurchasingCutoverModule() and IsCreatorStoreAssetTypeModule(AssetType) then
			return PerformCreatorStorePurchaseModule(v1, ProductId, AssetType):andThen(function(Result)
				-- upvalues: p1 (copy), CompletePurchaseModule (upval), v3 (copy), Id (copy), InfoType (copy), SelectProductPriceModuleResult (ref), PromiseModule (upval)
				p1:dispatch(CompletePurchaseModule())
				v3.signalPurchaseSuccess(Id, InfoType, SelectProductPriceModuleResult, Result)
				
				return PromiseModule.resolve()
			end):catch(function(Err)
				-- upvalues: p1 (copy), ErrorOccurredModule (upval)
				p1:dispatch(ErrorOccurredModule(Err))
			end)
		elseif IsInfoTypeMatch or CollectibleItemInstanceId and CollectibleItemInstanceId ~= "" then
			return PerformPurchaseV2Module(v1, InfoType, ProductId, SelectProductPriceModuleResult, Guid, IsRobloxPurchase, CollectibleItemId, CollectibleProductId, IdempotencyKey, PurchaseAuthToken, CollectibleItemInstanceId, if FFlagPurchasePromptCartPricingEnabledModule then DerivePurchaseOptionsFromCartPricingResponseModuleResult else nil):andThen(function(Result)
				-- upvalues: FFlagEnableUnifiedProductPurchaseFlow (upval), p1 (copy), CompletePurchaseModule (upval), v3 (copy), Id (copy), InfoType (copy), SelectProductPriceModuleResult (ref), PromiseModule (upval)
				if FFlagEnableUnifiedProductPurchaseFlow then
					p1:dispatch(CompletePurchaseModule(Result))
				else
					p1:dispatch(CompletePurchaseModule())
				end
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
		else
			local TimedOptionDays = if FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow then State1.productPayload and State1.productPayload.timedOptionDays else nil
			local PurchasePayload = if FFlagEnablePurchasePayloadInExperienceShop then State1.productPayload and State1.productPayload.purchasePayload else nil
			
			return PerformPurchaseModule(v1, InfoType, ProductId, SelectProductPriceModuleResult, Guid, IsRobloxPurchase, CollectibleItemId1, CollectibleProductId1, IdempotencyKey, PurchaseAuthToken, if FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow then TimedOptionDays else nil, if FFlagEnablePurchasePayloadInExperienceShop then PurchasePayload else nil, if FFlagPurchasePromptCartPricingEnabledModule then DerivePurchaseOptionsFromCartPricingResponseModuleResult else nil):andThen(function(Result)
				-- upvalues: FFlagEnableUnifiedProductPurchaseFlow (upval), p1 (copy), CompletePurchaseModule (upval), ItemType (copy), ItemTypeModule (upval), v3 (copy), Id (copy), InfoType (copy), SelectProductPriceModuleResult (ref), EquipIfPurchased (copy), AssetTypeId (copy), GetToolAssetModule (upval), v1 (copy), Players (upval), PromiseModule (upval)
				if FFlagEnableUnifiedProductPurchaseFlow then
					p1:dispatch(CompletePurchaseModule(Result))
				else
					p1:dispatch(CompletePurchaseModule())
				end
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
		end
	end)
end