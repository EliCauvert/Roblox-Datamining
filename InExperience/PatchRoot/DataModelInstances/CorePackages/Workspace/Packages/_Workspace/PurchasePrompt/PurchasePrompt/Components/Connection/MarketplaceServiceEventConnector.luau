local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local Roact = require(Parent.PurchasePromptDeps).Roact
local ErrorOccurredModule = require(PurchasePrompt.Actions.ErrorOccurred)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local CompletePurchaseModule = require(PurchasePrompt.Thunks.completePurchase)
local InitiatePurchaseModule = require(PurchasePrompt.Thunks.initiatePurchase)
local InitiateBundlePurchaseModule = require(PurchasePrompt.Thunks.initiateBundlePurchase)
local InitiatePremiumPurchaseModule = require(PurchasePrompt.Thunks.initiatePremiumPurchase)
local InitiateSubscriptionPurchaseModule = require(PurchasePrompt.Thunks.initiateSubscriptionPurchase)
local ExternalEventConnectionModule = require(script.Parent.ExternalEventConnection)
local GetFFlagEnablePromptPurchaseRequestedV2Module = require(PurchasePrompt.Flags.GetFFlagEnablePromptPurchaseRequestedV2)
local GetFFlagEnablePromptPurchaseRequestedV2Take2Module = require(PurchasePrompt.Flags.GetFFlagEnablePromptPurchaseRequestedV2Take2)
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local ProductTypeEnum = require(PurchasePrompt.types).ProductTypeEnum
local FFlagEnablePromptRobloxSubscriptionPurchaseBindingModule = require(PurchasePrompt.Flags.FFlagEnablePromptRobloxSubscriptionPurchaseBinding)
local FFlagLuaAppsEnablePromptVIPServerPurchase = require(PurchasePrompt.Parent.SharedFlags).FFlagLuaAppsEnablePromptVIPServerPurchase
local RoutePremiumToBlackbirdUpsell = game:DefineFastFlag("RoutePremiumToBlackbirdUpsell", false)
local RobloxSubscriptionPurchaseAppModule = require(Parent.RobloxSubscriptionPurchaseApp)
local SurfaceContext = RobloxSubscriptionPurchaseAppModule.SurfaceContext
local SurfaceName = RobloxSubscriptionPurchaseAppModule.SurfaceName

return (require(PurchasePrompt.connectToStore)(nil, function(Callback) --[[ Line: 147 ]]
	-- upvalues: Players (copy), InitiatePurchaseModule (copy), ErrorOccurredModule (copy), PurchaseErrorModule (copy), CompletePurchaseModule (copy), InitiateBundlePurchaseModule (copy), RoutePremiumToBlackbirdUpsell (copy), RobloxSubscriptionPurchaseAppModule (copy), SurfaceName (copy), SurfaceContext (copy), InitiatePremiumPurchaseModule (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), ProductTypeEnum (copy), InitiateSubscriptionPurchaseModule (copy), FFlagEnablePromptRobloxSubscriptionPurchaseBindingModule (copy)
	return {
		onPurchaseRequest = function(LocalPlayer, p1, p2, _) --[[ Line: 148 ]]
			-- upvalues: Players (upval), Callback (copy), InitiatePurchaseModule (upval)
			if LocalPlayer == Players.LocalPlayer then
				Callback(InitiatePurchaseModule(p1, Enum.InfoType.Asset, p2, false, "", ""))
			end
		end,
		onPurchaseRequestV2 = function(LocalPlayer, p1, p2, _, p3, p4) --[[ Line: 154 ]]
			-- upvalues: Players (upval), Callback (copy), InitiatePurchaseModule (upval)
			if LocalPlayer == Players.LocalPlayer then
				Callback(InitiatePurchaseModule(p1, Enum.InfoType.Asset, p2, false, p3, p4))
			end
		end,
		onRobloxPurchaseRequest = function(p1, p2) --[[ Line: 176 ]]
			-- upvalues: Callback (copy), InitiatePurchaseModule (upval)
			Callback(InitiatePurchaseModule(p1, Enum.InfoType.Asset, p2, true))
		end,
		onProductPurchaseRequest = function(LocalPlayer, p1, p2, _) --[[ Line: 180 ]]
			-- upvalues: Players (upval), Callback (copy), InitiatePurchaseModule (upval)
			if LocalPlayer == Players.LocalPlayer then
				Callback(InitiatePurchaseModule(p1, Enum.InfoType.Product, p2))
			end
		end,
		onPurchaseGamePassRequest = function(LocalPlayer, p1) --[[ Line: 186 ]]
			-- upvalues: Players (upval), Callback (copy), InitiatePurchaseModule (upval)
			if LocalPlayer == Players.LocalPlayer then
				Callback(InitiatePurchaseModule(p1, Enum.InfoType.GamePass, false))
			end
		end,
		onServerPurchaseVerification = function(p1) --[[ Line: 221 ]]
			-- upvalues: Callback (copy), ErrorOccurredModule (upval), PurchaseErrorModule (upval), Players (upval), CompletePurchaseModule (upval)
			if not p1 then
				Callback(ErrorOccurredModule(PurchaseErrorModule.UnknownFailure))
				
				return
			end
			local PlayerId = p1.playerId
			
			if PlayerId ~= nil then
				PlayerId = tonumber(p1.playerId)
			end
			if PlayerId == Players.LocalPlayer.UserId then
				Callback(CompletePurchaseModule())
			end
		end,
		onBundlePurchaseRequest = function(LocalPlayer, p1) --[[ Line: 235 ]]
			-- upvalues: Players (upval), Callback (copy), InitiateBundlePurchaseModule (upval)
			if LocalPlayer == Players.LocalPlayer then
				Callback(InitiateBundlePurchaseModule(p1))
			end
		end,
		onPremiumPurchaseRequest = function(LocalPlayer) --[[ Line: 266 ]]
			-- upvalues: Players (upval), RoutePremiumToBlackbirdUpsell (upval), RobloxSubscriptionPurchaseAppModule (upval), SurfaceName (upval), SurfaceContext (upval), Callback (copy), InitiatePremiumPurchaseModule (upval)
			if LocalPlayer == Players.LocalPlayer then
				if RoutePremiumToBlackbirdUpsell then
					RobloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase({}, nil, nil, SurfaceName.PromptSubscriptionPurchase, SurfaceContext.InGame, { skipWaitingForPurchaseResult = true })
					
					return
				end
				Callback(InitiatePremiumPurchaseModule())
			end
		end,
		onPromptCollectiblesPurchaseRequest = function(LocalPlayer, p1, p2, p3, p4, p5, p6, p7) --[[ Line: 192 ]]
			-- upvalues: Players (upval), Callback (copy), InitiatePurchaseModule (upval)
			if LocalPlayer == Players.LocalPlayer then
				Callback(InitiatePurchaseModule(p1, Enum.InfoType.Asset, false, true, p6, p7, p2, p3, p4, p5))
			end
		end,
		onSubscriptionPurchaseRequest = function(p1) --[[ Line: 286 ]]
			-- upvalues: FFlagEnableUnifiedPurchaseFlowForDevSubs (upval), Callback (copy), InitiatePurchaseModule (upval), ProductTypeEnum (upval), InitiateSubscriptionPurchaseModule (upval)
			if FFlagEnableUnifiedPurchaseFlowForDevSubs then
				Callback(InitiatePurchaseModule(p1, ProductTypeEnum.DeveloperSubscription))
				
				return
			else
				Callback(InitiateSubscriptionPurchaseModule(p1))
			end
		end,
		onCollectibleBundlePurchaseRequest = function(LocalPlayer, p1, p2, p3, p4, p5, p6, p7) --[[ Line: 241 ]]
			-- upvalues: Players (upval), Callback (copy), InitiateBundlePurchaseModule (upval)
			if LocalPlayer == Players.LocalPlayer then
				Callback(InitiateBundlePurchaseModule(p1, p6, p7, p2, p3, p4, p5))
			end
		end,
		onRobloxSubscriptionPurchaseRequest = function() --[[ Line: 294 ]]
			-- upvalues: FFlagEnablePromptRobloxSubscriptionPurchaseBindingModule (upval), RobloxSubscriptionPurchaseAppModule (upval), SurfaceName (upval), SurfaceContext (upval)
			if FFlagEnablePromptRobloxSubscriptionPurchaseBindingModule then
				RobloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase({}, nil, nil, SurfaceName.PromptSubscriptionPurchase, SurfaceContext.InGame, { skipWaitingForPurchaseResult = true })
			end
		end,
		onVIPServerPurchaseRequest = function(_) --[[ Line: 309 ]]
			-- upvalues: Callback (copy), InitiatePurchaseModule (upval), ProductTypeEnum (upval)
			Callback(InitiatePurchaseModule(game.GameId, ProductTypeEnum.VIPServer))
		end
	}
end)(function(p1) --[[ Line: 39 | Named "MarketplaceServiceEventConnector" ]]
	-- upvalues: MarketplaceService (copy), GetFFlagEnablePromptPurchaseRequestedV2Module (copy), GetFFlagEnablePromptPurchaseRequestedV2Take2Module (copy), Roact (copy), ExternalEventConnectionModule (copy), FFlagLuaAppsEnablePromptVIPServerPurchase (copy), FFlagEnablePromptRobloxSubscriptionPurchaseBindingModule (copy)
	local OnPurchaseRequest = p1.onPurchaseRequest
	local OnPurchaseRequestV2 = p1.onPurchaseRequestV2
	local OnPromptCollectiblesPurchaseRequest = p1.onPromptCollectiblesPurchaseRequest
	local OnCollectibleBundlePurchaseRequest = p1.onCollectibleBundlePurchaseRequest
	local OnRobloxSubscriptionPurchaseRequest = p1.onRobloxSubscriptionPurchaseRequest
	local OnVIPServerPurchaseRequest = p1.onVIPServerPurchaseRequest
	
	local function checkNewEventExists() --[[ Line: 54 ]]
		-- upvalues: MarketplaceService (upval)
		return MarketplaceService.PromptPurchaseRequestedV2
	end
	
	return Roact.createFragment({
		if GetFFlagEnablePromptPurchaseRequestedV2Module() or GetFFlagEnablePromptPurchaseRequestedV2Take2Module() and pcall(checkNewEventExists) then Roact.createElement(ExternalEventConnectionModule, {
			event = MarketplaceService.PromptPurchaseRequestedV2,
			callback = OnPurchaseRequestV2
		}) else Roact.createElement(ExternalEventConnectionModule, {
			event = MarketplaceService.PromptPurchaseRequested,
			callback = OnPurchaseRequest
		}),
		if pcall(function() --[[ Line: 74 | Named "checkPromptCollectiblesPurchaseRequestedEventExists" ]]
			-- upvalues: MarketplaceService (upval)
			return MarketplaceService.PromptCollectiblesPurchaseRequested
		end) then Roact.createElement(ExternalEventConnectionModule, {
			event = MarketplaceService.PromptCollectiblesPurchaseRequested,
			callback = OnPromptCollectiblesPurchaseRequest
		}) else nil,
		if pcall(function() --[[ Line: 85 | Named "checkCollectibleBundlePurchaseEventExists" ]]
			-- upvalues: MarketplaceService (upval)
			return MarketplaceService.PromptCollectibleBundlePurchaseRequested
		end) then Roact.createElement(ExternalEventConnectionModule, {
			event = MarketplaceService.PromptCollectibleBundlePurchaseRequested,
			callback = OnCollectibleBundlePurchaseRequest
		}) else nil,
		if FFlagLuaAppsEnablePromptVIPServerPurchase then Roact.createElement(ExternalEventConnectionModule, {
			event = MarketplaceService.PromptVIPServerPurchaseRequested,
			callback = OnVIPServerPurchaseRequest
		}) else nil,
		RobloxPurchase = Roact.createElement(ExternalEventConnectionModule, {
			event = MarketplaceService.PromptRobloxPurchaseRequested,
			callback = p1.onRobloxPurchaseRequest
		}),
		Roact.createElement(ExternalEventConnectionModule, {
			event = MarketplaceService.PromptProductPurchaseRequested,
			callback = p1.onProductPurchaseRequest
		}),
		Roact.createElement(ExternalEventConnectionModule, {
			event = MarketplaceService.PromptGamePassPurchaseRequested,
			callback = p1.onPurchaseGamePassRequest
		}),
		Roact.createElement(ExternalEventConnectionModule, {
			event = MarketplaceService.ServerPurchaseVerification,
			callback = p1.onServerPurchaseVerification
		}),
		Roact.createElement(ExternalEventConnectionModule, {
			event = MarketplaceService.PromptBundlePurchaseRequested,
			callback = p1.onBundlePurchaseRequest
		}),
		Roact.createElement(ExternalEventConnectionModule, {
			event = MarketplaceService.PromptPremiumPurchaseRequested,
			callback = p1.onPremiumPurchaseRequest
		}),
		Roact.createElement(ExternalEventConnectionModule, {
			event = MarketplaceService.PromptSubscriptionPurchaseRequested,
			callback = p1.onSubscriptionPurchaseRequest
		}),
		if FFlagEnablePromptRobloxSubscriptionPurchaseBindingModule then Roact.createElement(ExternalEventConnectionModule, {
			event = MarketplaceService.PromptRobloxSubscriptionPurchaseRequested,
			callback = OnRobloxSubscriptionPurchaseRequest
		}) else nil
	})
end))