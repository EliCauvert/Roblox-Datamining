local marketplaceService = game:GetService("MarketplaceService")
local playersService = game:GetService("Players")
local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local roact = require(parent.PurchasePromptDeps).Roact
local errorOccurredModule = require(purchasePrompt.Actions.ErrorOccurred)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local completePurchaseModule = require(purchasePrompt.Thunks.completePurchase)
local initiatePurchaseModule = require(purchasePrompt.Thunks.initiatePurchase)
local initiateBundlePurchaseModule = require(purchasePrompt.Thunks.initiateBundlePurchase)
local initiatePremiumPurchaseModule = require(purchasePrompt.Thunks.initiatePremiumPurchase)
local initiateSubscriptionPurchaseModule = require(purchasePrompt.Thunks.initiateSubscriptionPurchase)
local connectToStoreModule = require(purchasePrompt.connectToStore)
local externalEventConnectionModule = require(script.Parent.ExternalEventConnection)
local getFFlagEnablePromptPurchaseRequestedV2Module = require(purchasePrompt.Flags.GetFFlagEnablePromptPurchaseRequestedV2)
local getFFlagEnablePromptPurchaseRequestedV2Take2Module = require(purchasePrompt.Flags.GetFFlagEnablePromptPurchaseRequestedV2Take2)
local fFlagEnableUnifiedPurchaseFlowForDevSubs = require(parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local productTypeEnum = require(purchasePrompt.types).ProductTypeEnum
local fFlagEnablePromptRobloxSubscriptionPurchaseBindingModule = require(purchasePrompt.Flags.FFlagEnablePromptRobloxSubscriptionPurchaseBinding)
local routePremiumToBlackbirdUpsell = game:DefineFastFlag("RoutePremiumToBlackbirdUpsell", false)
local robloxSubscriptionPurchaseAppModule = require(parent.RobloxSubscriptionPurchaseApp)
local surfaceContext = robloxSubscriptionPurchaseAppModule.SurfaceContext
local surfaceName = robloxSubscriptionPurchaseAppModule.SurfaceName

return connectToStoreModule(nil, function(p1)
	-- upvalues: playersService (ref), initiatePurchaseModule (ref), errorOccurredModule (ref), purchaseErrorModule (ref), completePurchaseModule (ref), initiateBundlePurchaseModule (ref), routePremiumToBlackbirdUpsell (ref), robloxSubscriptionPurchaseAppModule (ref), surfaceName (ref), surfaceContext (ref), initiatePremiumPurchaseModule (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), productTypeEnum (ref), initiateSubscriptionPurchaseModule (ref), fFlagEnablePromptRobloxSubscriptionPurchaseBindingModule (ref)
	return {
		onPurchaseRequest = function(p2, p3, p4, _)
			-- upvalues: playersService (copy), p1 (ref), initiatePurchaseModule (copy)
			if p2 == playersService.LocalPlayer then
				p1(initiatePurchaseModule(p3, Enum.InfoType.Asset, p4, false, "", ""))
			end
		end,
		onPurchaseRequestV2 = function(p2, p3, p4, _, p5, p6)
			-- upvalues: playersService (copy), p1 (ref), initiatePurchaseModule (copy)
			if p2 == playersService.LocalPlayer then
				p1(initiatePurchaseModule(p3, Enum.InfoType.Asset, p4, false, p5, p6))
			end
		end,
		onRobloxPurchaseRequest = function(p2, p3)
			-- upvalues: p1 (ref), initiatePurchaseModule (copy)
			p1(initiatePurchaseModule(p2, Enum.InfoType.Asset, p3, true))
		end,
		onProductPurchaseRequest = function(p2, p3, p4, _)
			-- upvalues: playersService (copy), p1 (ref), initiatePurchaseModule (copy)
			if p2 == playersService.LocalPlayer then
				p1(initiatePurchaseModule(p3, Enum.InfoType.Product, p4))
			end
		end,
		onPurchaseGamePassRequest = function(p2, p3)
			-- upvalues: playersService (copy), p1 (ref), initiatePurchaseModule (copy)
			if p2 == playersService.LocalPlayer then
				p1(initiatePurchaseModule(p3, Enum.InfoType.GamePass, false))
			end
		end,
		onServerPurchaseVerification = function(p2)
			-- upvalues: p1 (ref), errorOccurredModule (copy), purchaseErrorModule (copy), playersService (copy), completePurchaseModule (copy)
			if not p2 then
				p1(errorOccurredModule(purchaseErrorModule.UnknownFailure))
				
				return
			end
			local playerId = p2.playerId
			
			if playerId ~= nil then
				playerId = tonumber(p2.playerId)
			end
			if playerId == playersService.LocalPlayer.UserId then
				p1(completePurchaseModule())
			end
		end,
		onBundlePurchaseRequest = function(p2, p3)
			-- upvalues: playersService (copy), p1 (ref), initiateBundlePurchaseModule (copy)
			if p2 == playersService.LocalPlayer then
				p1(initiateBundlePurchaseModule(p3))
			end
		end,
		onPremiumPurchaseRequest = function(p2)
			-- upvalues: playersService (copy), routePremiumToBlackbirdUpsell (copy), robloxSubscriptionPurchaseAppModule (copy), surfaceName (copy), surfaceContext (copy), p1 (ref), initiatePremiumPurchaseModule (copy)
			if p2 == playersService.LocalPlayer then
				if routePremiumToBlackbirdUpsell then
					robloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase({}, nil, nil, surfaceName.PromptSubscriptionPurchase, surfaceContext.InGame, { skipWaitingForPurchaseResult = true })
					
					return
				end
				p1(initiatePremiumPurchaseModule())
			end
		end,
		onPromptCollectiblesPurchaseRequest = function(p2, p3, p4, p5, p6, p7, p8, p9)
			-- upvalues: playersService (copy), p1 (ref), initiatePurchaseModule (copy)
			if p2 == playersService.LocalPlayer then
				p1(initiatePurchaseModule(p3, Enum.InfoType.Asset, false, true, p8, p9, p4, p5, p6, p7))
			end
		end,
		onSubscriptionPurchaseRequest = function(p2)
			-- upvalues: fFlagEnableUnifiedPurchaseFlowForDevSubs (copy), p1 (ref), initiatePurchaseModule (copy), productTypeEnum (copy), initiateSubscriptionPurchaseModule (copy)
			if fFlagEnableUnifiedPurchaseFlowForDevSubs then
				p1(initiatePurchaseModule(p2, productTypeEnum.DeveloperSubscription))
				
				return
			end
			p1(initiateSubscriptionPurchaseModule(p2))
		end,
		onCollectibleBundlePurchaseRequest = function(p2, p3, p4, p5, p6, p7, p8, p9)
			-- upvalues: playersService (copy), p1 (ref), initiateBundlePurchaseModule (copy)
			if p2 == playersService.LocalPlayer then
				p1(initiateBundlePurchaseModule(p3, p8, p9, p4, p5, p6, p7))
			end
		end,
		onRobloxSubscriptionPurchaseRequest = function()
			-- upvalues: fFlagEnablePromptRobloxSubscriptionPurchaseBindingModule (copy), robloxSubscriptionPurchaseAppModule (copy), surfaceName (copy), surfaceContext (copy)
			if fFlagEnablePromptRobloxSubscriptionPurchaseBindingModule then
				robloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase({}, nil, nil, surfaceName.PromptSubscriptionPurchase, surfaceContext.InGame, { skipWaitingForPurchaseResult = true })
			end
		end
	}
end)(function(p1)
	-- upvalues: marketplaceService (ref), getFFlagEnablePromptPurchaseRequestedV2Module (ref), getFFlagEnablePromptPurchaseRequestedV2Take2Module (ref), roact (ref), externalEventConnectionModule (ref), fFlagEnablePromptRobloxSubscriptionPurchaseBindingModule (ref)
	local _ = nil
	
	return roact.createFragment({
		if getFFlagEnablePromptPurchaseRequestedV2Module() or getFFlagEnablePromptPurchaseRequestedV2Take2Module() and pcall(function()
			-- upvalues: marketplaceService (copy)
			return marketplaceService.PromptPurchaseRequestedV2
		end) then roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.PromptPurchaseRequestedV2,
			callback = p1.onPurchaseRequestV2
		}) else roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.PromptPurchaseRequested,
			callback = p1.onPurchaseRequest
		}),
		if pcall(function()
			-- upvalues: marketplaceService (copy)
			return marketplaceService.PromptCollectiblesPurchaseRequested
		end) then roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.PromptCollectiblesPurchaseRequested,
			callback = p1.onPromptCollectiblesPurchaseRequest
		}) else nil,
		if pcall(function()
			-- upvalues: marketplaceService (copy)
			return marketplaceService.PromptCollectibleBundlePurchaseRequested
		end) then roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.PromptCollectibleBundlePurchaseRequested,
			callback = p1.onCollectibleBundlePurchaseRequest
		}) else nil,
		RobloxPurchase = roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.PromptRobloxPurchaseRequested,
			callback = p1.onRobloxPurchaseRequest
		}),
		roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.PromptProductPurchaseRequested,
			callback = p1.onProductPurchaseRequest
		}),
		roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.PromptGamePassPurchaseRequested,
			callback = p1.onPurchaseGamePassRequest
		}),
		roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.ServerPurchaseVerification,
			callback = p1.onServerPurchaseVerification
		}),
		roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.PromptBundlePurchaseRequested,
			callback = p1.onBundlePurchaseRequest
		}),
		roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.PromptPremiumPurchaseRequested,
			callback = p1.onPremiumPurchaseRequest
		}),
		roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.PromptSubscriptionPurchaseRequested,
			callback = p1.onSubscriptionPurchaseRequest
		}),
		if fFlagEnablePromptRobloxSubscriptionPurchaseBindingModule then roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.PromptRobloxSubscriptionPurchaseRequested,
			callback = p1.onRobloxSubscriptionPurchaseRequest
		}) else nil
	})
end)