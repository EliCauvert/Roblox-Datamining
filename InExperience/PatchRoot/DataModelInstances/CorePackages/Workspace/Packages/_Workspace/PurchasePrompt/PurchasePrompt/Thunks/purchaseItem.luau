local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local httpService = game:GetService("HttpService")
local workspaceService = game:GetService("Workspace")
local playersService = game:GetService("Players")
local experienceAuthService = game:GetService("ExperienceAuthService")
local parent = purchasePrompt.Parent
local IAPExperienceModule = require(parent.IAPExperience)
local isEconomicRestrictionResponse = IAPExperienceModule.Utility.isEconomicRestrictionResponse
local parseEconomicRestrictionsFailureReason = IAPExperienceModule.Utility.parseEconomicRestrictionsFailureReason
local parseEconomicRestrictionsExpirationTimeInMinutes = IAPExperienceModule.Utility.parseEconomicRestrictionsExpirationTimeInMinutes
local setPromptStateModule = require(purchasePrompt.Actions.SetPromptState)
local startPurchaseModule = require(purchasePrompt.Actions.StartPurchase)
local errorOccurredModule = require(purchasePrompt.Actions.ErrorOccurred)
local setEconomicRestrictionErrorModule = require(purchasePrompt.Actions.SetEconomicRestrictionError)
local purchaseFlowModule = require(purchasePrompt.Enums.PurchaseFlow)
local promptStateModule = require(purchasePrompt.Enums.PromptState)
local itemTypeModule = require(purchasePrompt.Enums.ItemType)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local requestTypeModule = require(purchasePrompt.Enums.RequestType)
local getToolAssetModule = require(purchasePrompt.Network.getToolAsset)
local performPurchaseModule = require(purchasePrompt.Network.performPurchase)
local performPurchaseV2Module = require(purchasePrompt.Network.performPurchaseV2)
local performCreatorStorePurchaseModule = require(purchasePrompt.Network.performCreatorStorePurchase)
local networkModule = require(purchasePrompt.Services.Network)
local analyticsModule = require(purchasePrompt.Services.Analytics)
local externalSettingsModule = require(purchasePrompt.Services.ExternalSettings)
local getPlayerPriceModule = require(purchasePrompt.Utils.getPlayerPrice)
local isCreatorStoreAssetTypeModule = require(purchasePrompt.Utils.isCreatorStoreAssetType)
local thunkModule = require(purchasePrompt.Thunk)
local promiseModule = require(purchasePrompt.Promise)
local _ = require(purchasePrompt.types)
local productTypeEnum = require(purchasePrompt.types).ProductTypeEnum
local selectProductPriceModule = require(purchasePrompt.Selectors.selectProductPrice)
local derivePurchaseOptionsFromCartPricingResponseModule = require(purchasePrompt.Utils.derivePurchaseOptionsFromCartPricingResponse)
local performLuaPurchaseModule = require(purchasePrompt.Thunks.performLuaPurchase)
local handlePriceChangedErrorModule = require(purchasePrompt.Utils.handlePriceChangedError)
local completePurchaseModule = require(script.Parent.completePurchase)
local fFlagEnableUnifiedProductPurchaseFlow = require(parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local getFFlagEnableCreatorStorePurchasingCutoverModule = require(purchasePrompt.Flags.GetFFlagEnableCreatorStorePurchasingCutover)
local logUnifiedPurchaseTelemetryCounterModule = require(purchasePrompt.Utils.logUnifiedPurchaseTelemetryCounter)
local unifiedPurchaseTelemetryModule = require(purchasePrompt.Events.UnifiedPurchaseTelemetry)
local fFlagPurchasePromptPriceShouldUseProductInfoPriceModule = require(purchasePrompt.Flags.FFlagPurchasePromptPriceShouldUseProductInfoPrice)
local fFlagPurchasePromptCartPricingEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = require(parent.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local fFlagEnablePurchasePayloadInExperienceShop = require(parent.SharedFlags).FFlagEnablePurchasePayloadInExperienceShop
local fFlagEnableUnifiedPurchaseFlowForDevSubs = require(parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local fFlagMockDevSubPurchaseInStudioModule = require(purchasePrompt.Flags.FFlagMockDevSubPurchaseInStudio)
local list = { networkModule, analyticsModule, externalSettingsModule }

function isLuaPurchase(p1)
	-- upvalues: productTypeEnum (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref)
	local var1
	if p1 == nil then
		return false
	elseif p1.kind == productTypeEnum.Product then
		var1 = true
		
		if p1.universeId == nil then
			var1 = if p1.kind ~= productTypeEnum.Experience then if p1.kind ~= productTypeEnum.Look then fFlagEnableUnifiedPurchaseFlowForDevSubs and p1.kind == productTypeEnum.DeveloperSubscription else true else true
		end
		return var1
	end
end

return function()
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), externalSettingsModule (ref), analyticsModule (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), logUnifiedPurchaseTelemetryCounterModule (ref), unifiedPurchaseTelemetryModule (ref), startPurchaseModule (ref), workspaceService (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), requestTypeModule (ref), experienceAuthService (ref), completePurchaseModule (ref), purchaseFlowModule (ref), setPromptStateModule (ref), promptStateModule (ref), httpService (ref), fFlagPurchasePromptPriceShouldUseProductInfoPriceModule (ref), selectProductPriceModule (ref), getPlayerPriceModule (ref), fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (ref), derivePurchaseOptionsFromCartPricingResponseModule (ref), fFlagMockDevSubPurchaseInStudioModule (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), productTypeEnum (ref), performLuaPurchaseModule (ref), getFFlagEnableCreatorStorePurchasingCutoverModule (ref), isCreatorStoreAssetTypeModule (ref), performCreatorStorePurchaseModule (ref), promiseModule (ref), errorOccurredModule (ref), performPurchaseV2Module (ref), isEconomicRestrictionResponse (ref), parseEconomicRestrictionsFailureReason (ref), parseEconomicRestrictionsExpirationTimeInMinutes (ref), setEconomicRestrictionErrorModule (ref), purchaseErrorModule (ref), handlePriceChangedErrorModule (ref), fFlagEnablePurchasePayloadInExperienceShop (ref), performPurchaseModule (ref), itemTypeModule (ref), getToolAssetModule (ref), playersService (ref)
	return thunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: networkModule (copy), externalSettingsModule (copy), analyticsModule (copy), fFlagPurchasePromptCartPricingEnabledModule (copy), logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), startPurchaseModule (copy), workspaceService (copy), fFlagEnableUnifiedProductPurchaseFlow (copy), requestTypeModule (copy), experienceAuthService (copy), completePurchaseModule (copy), purchaseFlowModule (copy), setPromptStateModule (copy), promptStateModule (copy), httpService (copy), fFlagPurchasePromptPriceShouldUseProductInfoPriceModule (copy), selectProductPriceModule (copy), getPlayerPriceModule (copy), fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (copy), derivePurchaseOptionsFromCartPricingResponseModule (copy), fFlagMockDevSubPurchaseInStudioModule (copy), fFlagEnableUnifiedPurchaseFlowForDevSubs (copy), productTypeEnum (copy), performLuaPurchaseModule (copy), getFFlagEnableCreatorStorePurchasingCutoverModule (copy), isCreatorStoreAssetTypeModule (copy), performCreatorStorePurchaseModule (copy), promiseModule (copy), errorOccurredModule (copy), performPurchaseV2Module (copy), isEconomicRestrictionResponse (copy), parseEconomicRestrictionsFailureReason (copy), parseEconomicRestrictionsExpirationTimeInMinutes (copy), setEconomicRestrictionErrorModule (copy), purchaseErrorModule (copy), handlePriceChangedErrorModule (copy), fFlagEnablePurchasePayloadInExperienceShop (copy), performPurchaseModule (copy), itemTypeModule (copy), getToolAssetModule (copy), playersService (copy)
		local var1 = p2[networkModule]
		local var2 = p2[externalSettingsModule]
		local var3 = p2[analyticsModule]
		local state = p1:getState()
		local purchaseFlow = state.purchaseFlow
		local requestType = state.promptRequest.requestType
		
		if fFlagPurchasePromptCartPricingEnabledModule and state.cartPricing ~= nil and state.cartPricing.isFetching then
			local purchaseAnalyticsMetadata = state.purchaseAnalyticsMetadata
			logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedCartPricingBuyBlockedWhileFetchingCounter, purchaseAnalyticsMetadata and purchaseAnalyticsMetadata.surface, purchaseAnalyticsMetadata and purchaseAnalyticsMetadata.productType)
			
			return
		end
		local platform = var2.getPlatform()
		p1:dispatch(startPurchaseModule(workspaceService.DistributedGameTime))
		
		if fFlagEnableUnifiedProductPurchaseFlow and p1:getState().isUserEligibleForUnifiedPurchaseFlow then
			logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedProductPurchaseModalPurchaseAttemptedCounter, state.purchaseAnalyticsMetadata.surface, state.purchaseAnalyticsMetadata.productType)
			
			if state.purchaseCallbacks and state.purchaseCallbacks.onPurchaseAttempt then
				state.purchaseCallbacks.onPurchaseAttempt()
			end
		end
		if requestType == requestTypeModule.AvatarCreationFee then
			experienceAuthService:ScopeCheckUIComplete(state.promptRequest.id, { [1] = Enum.ExperienceAuthScope.CreatorAssetsCreate }, Enum.ScopeCheckResult.ConsentAccepted, {
				avatarName = state.productInfo.name,
				avatarDescription = state.productInfo.description,
				priceFromToken = state.productInfo.price
			})
			var3.signalAvatarCreationPurchaseSubmit()
			p1:dispatch(completePurchaseModule())
			
			return
		elseif purchaseFlow == purchaseFlowModule.RobuxUpsellV2 or purchaseFlow == purchaseFlowModule.LargeRobuxUpsell then
			p1:dispatch(setPromptStateModule(promptStateModule.PurchaseInProgress))
		end
		local state_1 = p1:getState()
		local var4 = httpService:GenerateGUID(false)
		local id = state_1.promptRequest.id
		local infoType = state_1.promptRequest.infoType
		local equipIfPurchased = state_1.promptRequest.equipIfPurchased
		local isRobloxPurchase = state_1.promptRequest.isRobloxPurchase
		local purchaseAuthToken = state_1.promptRequest.purchaseAuthToken
		local idempotencyKey = state_1.promptRequest.idempotencyKey
		local collectibleItemId = state_1.promptRequest.collectibleItemId
		local collectibleItemInstanceId = state_1.promptRequest.collectibleItemInstanceId
		local collectibleProductId = state_1.promptRequest.collectibleProductId
		local _ = nil
		local var5 = if fFlagPurchasePromptPriceShouldUseProductInfoPriceModule then selectProductPriceModule(state_1) elseif collectibleItemInstanceId and collectibleItemInstanceId ~= "" or fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow and state_1.productPayload and state_1.productPayload.timedOptionDays ~= nil then state_1.promptRequest.expectedPrice else getPlayerPriceModule(state_1.productInfo, state_1.accountInfo.membershipType == 4)
		local assetTypeId = state_1.productInfo.assetTypeId
		local assetType = state_1.productInfo.assetType
		local productId = state_1.productInfo.productId
		local collectibleItemId_1 = state_1.productInfo.collectibleItemId
		local collectibleProductId_1 = state_1.productInfo.collectibleProductId
		local var6 = if fFlagPurchasePromptCartPricingEnabledModule then derivePurchaseOptionsFromCartPricingResponseModule(state_1.cartPricing and state_1.cartPricing.response) else nil
		local itemType = state_1.productInfo.itemType
		var3.signalProductPurchaseConfirmed(productId, state_1.requestType)
		local var7 = collectibleItemId and (collectibleItemId ~= "" and infoType == Enum.InfoType.Bundle)
		
		if fFlagEnableUnifiedProductPurchaseFlow and isLuaPurchase(state_1.productPayload) then
			if fFlagMockDevSubPurchaseInStudioModule and fFlagEnableUnifiedPurchaseFlowForDevSubs and (state_1.productPayload.kind == productTypeEnum.DeveloperSubscription and var2.isStudio()) then
				p1:dispatch(completePurchaseModule())
				
				return
			end
			p1:dispatch(performLuaPurchaseModule())
			
			return
		elseif getFFlagEnableCreatorStorePurchasingCutoverModule() and isCreatorStoreAssetTypeModule(assetType) then
			return performCreatorStorePurchaseModule(var1, productId, assetType):andThen(function(p3)
				-- upvalues: p1 (ref), completePurchaseModule (copy), var3 (ref), id (ref), infoType (ref), var5 (write), promiseModule (copy)
				p1:dispatch(completePurchaseModule())
				var3.signalPurchaseSuccess(id, infoType, var5, p3)
				
				return promiseModule.resolve()
			end):catch(function(p3)
				-- upvalues: p1 (ref), errorOccurredModule (copy)
				p1:dispatch(errorOccurredModule(p3))
			end)
		elseif var7 or collectibleItemInstanceId and collectibleItemInstanceId ~= "" then
			return performPurchaseV2Module(var1, infoType, productId, var5, var4, isRobloxPurchase, collectibleItemId, collectibleProductId, idempotencyKey, purchaseAuthToken, collectibleItemInstanceId, if fFlagPurchasePromptCartPricingEnabledModule then var6 else nil):andThen(function(p3)
				-- upvalues: fFlagEnableUnifiedProductPurchaseFlow (copy), p1 (ref), completePurchaseModule (copy), var3 (ref), id (ref), infoType (ref), var5 (write), promiseModule (copy)
				if fFlagEnableUnifiedProductPurchaseFlow then
					p1:dispatch(completePurchaseModule(p3))
				else
					p1:dispatch(completePurchaseModule())
				end
				var3.signalPurchaseSuccess(id, infoType, var5, p3)
				
				return promiseModule.resolve()
			end):catch(function(p3)
				-- upvalues: isEconomicRestrictionResponse (copy), parseEconomicRestrictionsFailureReason (copy), parseEconomicRestrictionsExpirationTimeInMinutes (copy), p1 (ref), setEconomicRestrictionErrorModule (copy), errorOccurredModule (copy), purchaseErrorModule (copy), handlePriceChangedErrorModule (copy), state_1 (ref), var3 (ref), productId (ref), infoType (ref), platform (ref)
				if isEconomicRestrictionResponse(p3) then
					p1:dispatch(setEconomicRestrictionErrorModule(parseEconomicRestrictionsFailureReason(p3), parseEconomicRestrictionsExpirationTimeInMinutes(p3)))
					p1:dispatch(errorOccurredModule(purchaseErrorModule.EconomicRestriction))
					
					return
				elseif handlePriceChangedErrorModule(p1, p3, state_1.productPayload and state_1.productPayload.kind) then return end
				if p3 == purchaseErrorModule.TwoFactorNeeded then
					var3.signalTwoSVSettingsErrorShown(productId, infoType)
					
					if platform == Enum.Platform.Windows or platform == Enum.Platform.OSX then
						p3 = purchaseErrorModule.TwoFactorNeededSettings
					end
				end
				p1:dispatch(errorOccurredModule(p3))
			end)
		end
		local var8 = nil
		
		if fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow then
			var8 = state_1.productPayload and state_1.productPayload.timedOptionDays
		end
		local var9 = nil
		
		if fFlagEnablePurchasePayloadInExperienceShop then
			var9 = state_1.productPayload and state_1.productPayload.purchasePayload
		end
		return performPurchaseModule(var1, infoType, productId, var5, var4, isRobloxPurchase, collectibleItemId_1, collectibleProductId_1, idempotencyKey, purchaseAuthToken, if fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow then var8 else nil, if fFlagEnablePurchasePayloadInExperienceShop then var9 else nil, if fFlagPurchasePromptCartPricingEnabledModule then var6 else nil):andThen(function(p3)
			-- upvalues: fFlagEnableUnifiedProductPurchaseFlow (copy), p1 (ref), completePurchaseModule (copy), itemType (ref), itemTypeModule (copy), var3 (ref), id (ref), infoType (ref), var5 (write), equipIfPurchased (ref), assetTypeId (ref), getToolAssetModule (copy), var1 (ref), playersService (copy), promiseModule (copy)
			if fFlagEnableUnifiedProductPurchaseFlow then
				p1:dispatch(completePurchaseModule(p3))
			else
				p1:dispatch(completePurchaseModule())
			end
			if itemType ~= itemTypeModule.Bundle then
				var3.signalPurchaseSuccess(id, infoType, var5, p3)
			end
			return if equipIfPurchased and assetTypeId == 19 then getToolAssetModule(var1, id):andThen(function(p4)
				-- upvalues: playersService (copy)
				if p4 then
					p4.Parent = playersService.LocalPlayer.Backpack
				end
			end) else promiseModule.resolve()
		end):catch(function(p3)
			-- upvalues: isEconomicRestrictionResponse (copy), parseEconomicRestrictionsFailureReason (copy), parseEconomicRestrictionsExpirationTimeInMinutes (copy), p1 (ref), setEconomicRestrictionErrorModule (copy), errorOccurredModule (copy), purchaseErrorModule (copy), handlePriceChangedErrorModule (copy), state_1 (ref), var3 (ref), productId (ref), infoType (ref), platform (ref)
			if isEconomicRestrictionResponse(p3) then
				p1:dispatch(setEconomicRestrictionErrorModule(parseEconomicRestrictionsFailureReason(p3), parseEconomicRestrictionsExpirationTimeInMinutes(p3)))
				p1:dispatch(errorOccurredModule(purchaseErrorModule.EconomicRestriction))
				
				return
			elseif handlePriceChangedErrorModule(p1, p3, state_1.productPayload and state_1.productPayload.kind) then return end
			if p3 == purchaseErrorModule.TwoFactorNeeded then
				var3.signalTwoSVSettingsErrorShown(productId, infoType)
				
				if platform == Enum.Platform.Windows or platform == Enum.Platform.OSX then
					p3 = purchaseErrorModule.TwoFactorNeededSettings
				end
			end
			p1:dispatch(errorOccurredModule(p3))
		end)
	end)
end