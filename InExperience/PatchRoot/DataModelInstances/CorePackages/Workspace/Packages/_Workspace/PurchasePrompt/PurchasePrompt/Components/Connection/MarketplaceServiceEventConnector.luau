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

return connectToStoreModule(nil, function(p1) --[[ line: 135 ]]
	-- upvalues: playersService (ref), initiatePurchaseModule (ref), errorOccurredModule (ref), purchaseErrorModule (ref), completePurchaseModule (ref), initiateBundlePurchaseModule (ref), routePremiumToBlackbirdUpsell (ref), robloxSubscriptionPurchaseAppModule (ref), surfaceName (ref), surfaceContext (ref), initiatePremiumPurchaseModule (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), productTypeEnum (ref), initiateSubscriptionPurchaseModule (ref), fFlagEnablePromptRobloxSubscriptionPurchaseBindingModule (ref)
	return {
		onPurchaseRequest = function(p2, p3, p4, _) --[[ line: 136 ]]
			-- upvalues: playersService (copy), p1 (ref), initiatePurchaseModule (copy)
			if p2 == playersService.LocalPlayer then
				p1(initiatePurchaseModule(p3, Enum.InfoType.Asset, p4, false, "", ""))
			end
		end,
		onPurchaseRequestV2 = function(p5, p6, p7, _, p8, p9) --[[ line: 142 ]]
			-- upvalues: playersService (copy), p1 (ref), initiatePurchaseModule (copy)
			if p5 == playersService.LocalPlayer then
				p1(initiatePurchaseModule(p6, Enum.InfoType.Asset, p7, false, p8, p9))
			end
		end,
		onRobloxPurchaseRequest = function(p10, p11) --[[ line: 164 ]]
			-- upvalues: p1 (ref), initiatePurchaseModule (copy)
			p1(initiatePurchaseModule(p10, Enum.InfoType.Asset, p11, true))
		end,
		onProductPurchaseRequest = function(p12, p13, p14, _) --[[ line: 168 ]]
			-- upvalues: playersService (copy), p1 (ref), initiatePurchaseModule (copy)
			if p12 == playersService.LocalPlayer then
				p1(initiatePurchaseModule(p13, Enum.InfoType.Product, p14))
			end
		end,
		onPurchaseGamePassRequest = function(p15, p16) --[[ line: 174 ]]
			-- upvalues: playersService (copy), p1 (ref), initiatePurchaseModule (copy)
			if p15 == playersService.LocalPlayer then
				p1(initiatePurchaseModule(p16, Enum.InfoType.GamePass, false))
			end
		end,
		onServerPurchaseVerification = function(p17) --[[ line: 209 ]]
			-- upvalues: p1 (ref), errorOccurredModule (copy), purchaseErrorModule (copy), playersService (copy), completePurchaseModule (copy)
			if not p17 then
				p1(errorOccurredModule(purchaseErrorModule.UnknownFailure))
				
				return
			end
			local playerId = p17.playerId
			
			if playerId ~= nil then
				playerId = tonumber(p17.playerId)
			end
			if playerId == playersService.LocalPlayer.UserId then
				p1(completePurchaseModule())
			end
		end,
		onBundlePurchaseRequest = function(p18, p19) --[[ line: 223 ]]
			-- upvalues: playersService (copy), p1 (ref), initiateBundlePurchaseModule (copy)
			if p18 == playersService.LocalPlayer then
				p1(initiateBundlePurchaseModule(p19))
			end
		end,
		onPremiumPurchaseRequest = function(p20) --[[ line: 254 ]]
			-- upvalues: playersService (copy), routePremiumToBlackbirdUpsell (copy), robloxSubscriptionPurchaseAppModule (copy), surfaceName (copy), surfaceContext (copy), p1 (ref), initiatePremiumPurchaseModule (copy)
			if p20 == playersService.LocalPlayer then
				if routePremiumToBlackbirdUpsell then
					robloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase({}, nil, nil, surfaceName.PromptSubscriptionPurchase, surfaceContext.InGame, { skipWaitingForPurchaseResult = true })
					
					return
				end
				p1(initiatePremiumPurchaseModule())
			end
		end,
		onPromptCollectiblesPurchaseRequest = function(p21, p22, p23, p24, p25, p26, p27, p28) --[[ line: 180 ]]
			-- upvalues: playersService (copy), p1 (ref), initiatePurchaseModule (copy)
			if p21 == playersService.LocalPlayer then
				p1(initiatePurchaseModule(p22, Enum.InfoType.Asset, false, true, p27, p28, p23, p24, p25, p26))
			end
		end,
		onSubscriptionPurchaseRequest = function(p29) --[[ line: 274 ]]
			-- upvalues: fFlagEnableUnifiedPurchaseFlowForDevSubs (copy), p1 (ref), initiatePurchaseModule (copy), productTypeEnum (copy), initiateSubscriptionPurchaseModule (copy)
			if fFlagEnableUnifiedPurchaseFlowForDevSubs then
				p1(initiatePurchaseModule(p29, productTypeEnum.DeveloperSubscription))
				
				return
			end
			p1(initiateSubscriptionPurchaseModule(p29))
		end,
		onCollectibleBundlePurchaseRequest = function(p30, p31, p32, p33, p34, p35, p36, p37) --[[ line: 229 ]]
			-- upvalues: playersService (copy), p1 (ref), initiateBundlePurchaseModule (copy)
			if p30 == playersService.LocalPlayer then
				p1(initiateBundlePurchaseModule(p31, p36, p37, p32, p33, p34, p35))
			end
		end,
		onRobloxSubscriptionPurchaseRequest = function() --[[ line: 282 ]]
			-- upvalues: fFlagEnablePromptRobloxSubscriptionPurchaseBindingModule (copy), robloxSubscriptionPurchaseAppModule (copy), surfaceName (copy), surfaceContext (copy)
			if fFlagEnablePromptRobloxSubscriptionPurchaseBindingModule then
				robloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase({}, nil, nil, surfaceName.PromptSubscriptionPurchase, surfaceContext.InGame, { skipWaitingForPurchaseResult = true })
			end
		end
	}
end)(function(p0) --[[ line: 37 | named "MarketplaceServiceEventConnector" ]]
	-- upvalues: marketplaceService (ref), getFFlagEnablePromptPurchaseRequestedV2Module (ref), getFFlagEnablePromptPurchaseRequestedV2Take2Module (ref), roact (ref), externalEventConnectionModule (ref), fFlagEnablePromptRobloxSubscriptionPurchaseBindingModule (ref)
	local _ = nil
	
	return roact.createFragment({
		if getFFlagEnablePromptPurchaseRequestedV2Module() or getFFlagEnablePromptPurchaseRequestedV2Take2Module() and pcall(function() --[[ line: 51 | named "checkNewEventExists" ]]
			-- upvalues: marketplaceService (copy)
			return marketplaceService.PromptPurchaseRequestedV2
		end) then roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.PromptPurchaseRequestedV2,
			callback = p0.onPurchaseRequestV2
		}) else roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.PromptPurchaseRequested,
			callback = p0.onPurchaseRequest
		}),
		if pcall(function() --[[ line: 71 | named "checkPromptCollectiblesPurchaseRequestedEventExists" ]]
			-- upvalues: marketplaceService (copy)
			return marketplaceService.PromptCollectiblesPurchaseRequested
		end) then roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.PromptCollectiblesPurchaseRequested,
			callback = p0.onPromptCollectiblesPurchaseRequest
		}) else nil,
		if pcall(function() --[[ line: 82 | named "checkCollectibleBundlePurchaseEventExists" ]]
			-- upvalues: marketplaceService (copy)
			return marketplaceService.PromptCollectibleBundlePurchaseRequested
		end) then roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.PromptCollectibleBundlePurchaseRequested,
			callback = p0.onCollectibleBundlePurchaseRequest
		}) else nil,
		RobloxPurchase = roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.PromptRobloxPurchaseRequested,
			callback = p0.onRobloxPurchaseRequest
		}),
		roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.PromptProductPurchaseRequested,
			callback = p0.onProductPurchaseRequest
		}),
		roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.PromptGamePassPurchaseRequested,
			callback = p0.onPurchaseGamePassRequest
		}),
		roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.ServerPurchaseVerification,
			callback = p0.onServerPurchaseVerification
		}),
		roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.PromptBundlePurchaseRequested,
			callback = p0.onBundlePurchaseRequest
		}),
		roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.PromptPremiumPurchaseRequested,
			callback = p0.onPremiumPurchaseRequest
		}),
		roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.PromptSubscriptionPurchaseRequested,
			callback = p0.onSubscriptionPurchaseRequest
		}),
		if fFlagEnablePromptRobloxSubscriptionPurchaseBindingModule then roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.PromptRobloxSubscriptionPurchaseRequested,
			callback = p0.onRobloxSubscriptionPurchaseRequest
		}) else nil
	})
end)