local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local sharedFlagsModule = require(purchasePrompt.Parent.SharedFlags)
local contentProviderService = game:GetService("ContentProvider")
local marketplaceService = game:GetService("MarketplaceService")
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local webViewService = game:GetService("WebViewService")
local var1 = nil
pcall(function()
	-- upvalues: var1 (write)
	var1 = game:GetService("PlatformService")
end)
local upsellFlowModule = require(purchasePrompt.Enums.UpsellFlow)
local getUpsellFlowModule = require(purchasePrompt.NativeUpsell.getUpsellFlow)
local getFFlagEnablePaymentSessionIdInRobuxPurchaseModule = require(purchasePrompt.Flags.GetFFlagEnablePaymentSessionIdInRobuxPurchase)
local fFlagEnableBonusJwtInShop = sharedFlagsModule.FFlagEnableBonusJwtInShop

local function _()
	-- upvalues: contentProviderService (ref)
	return string.gsub(contentProviderService.BaseUrl:lower(), "/m%.", "/www.")
end

local _ = function(p1, p2)
	-- upvalues: webViewService (ref)
	local onWindowClosedConnection = nil
	onWindowClosedConnection = webViewService.OnWindowClosed:Connect(function()
		-- upvalues: webViewService (copy), onWindowClosedConnection (write), p2 (ref)
		webViewService:CloseWindow()
		
		if onWindowClosedConnection then
			onWindowClosedConnection:Disconnect()
			onWindowClosedConnection = nil
		end
		if p2 then
			p2()
		end
	end)
	webViewService:OpenWindow(p1, "", true)
end

local function startPurchase(p1, p2)
	-- upvalues: userInputService (ref), getUpsellFlowModule (ref), upsellFlowModule (ref), playersService (ref), marketplaceService (ref), var1 (write), contentProviderService (ref), webViewService (ref)
	local mobileProductId = p1.mobileProductId
	local productId = p1.productId
	local var2 = getUpsellFlowModule(userInputService:GetPlatform())
	
	if var2 == upsellFlowModule.Mobile then
		local localPlayer = playersService.LocalPlayer
		local nativePurchaseWithLocalPlayerEngineFeature = game:GetEngineFeature("NativePurchaseWithLocalPlayer")
		local promptNativePurchaseWithPaymentSessionIdEngineFeature = game:GetEngineFeature("PromptNativePurchaseWithPaymentSessionId")
		pcall(function()
			-- upvalues: marketplaceService (copy), nativePurchaseWithLocalPlayerEngineFeature (ref), promptNativePurchaseWithPaymentSessionIdEngineFeature (ref), mobileProductId (ref), p2 (ref), localPlayer (ref), p1 (ref)
			local promptNativePurchaseWithLocalPlayerWithPaymentSessionId = marketplaceService.PromptNativePurchaseWithLocalPlayerWithPaymentSessionId
			local promptNativePurchaseWithLocalPlayer = marketplaceService.PromptNativePurchaseWithLocalPlayer
			local promptNativePurchaseWithPaymentSessionId = marketplaceService.PromptNativePurchaseWithPaymentSessionId
			local promptNativePurchase = marketplaceService.PromptNativePurchase
			
			if nativePurchaseWithLocalPlayerEngineFeature and promptNativePurchaseWithPaymentSessionIdEngineFeature and typeof(promptNativePurchaseWithLocalPlayerWithPaymentSessionId) == "function" then
				promptNativePurchaseWithLocalPlayerWithPaymentSessionId(marketplaceService, mobileProductId, p2)
			elseif nativePurchaseWithLocalPlayerEngineFeature and typeof(promptNativePurchaseWithLocalPlayer) == "function" then
				promptNativePurchaseWithLocalPlayer(marketplaceService, mobileProductId)
			elseif promptNativePurchaseWithPaymentSessionIdEngineFeature and typeof(promptNativePurchaseWithPaymentSessionId) == "function" then
				promptNativePurchaseWithPaymentSessionId(marketplaceService, localPlayer, mobileProductId, p2)
			elseif typeof(promptNativePurchase) == "function" then
				promptNativePurchase(marketplaceService, localPlayer, mobileProductId)
			else
				error("MarketplaceService has no PromptNativePurchase APIs bound")
			end
			if p1.onNativePurchaseLaunched ~= nil then
				p1.onNativePurchaseLaunched()
			end
		end)
		
		return
	elseif var2 == upsellFlowModule.Xbox then
		if var1 == nil then
			return
		end
		pcall(function()
			-- upvalues: var1 (copy), mobileProductId (ref)
			var1:BeginPlatformStorePurchase(mobileProductId)
		end)
		
		return
	elseif var2 == upsellFlowModule.Web then
		if productId == nil then return end
		local var3 = ("%supgrades/paymentmethods?ap=%s"):format(string.gsub(contentProviderService.BaseUrl:lower(), "/m%.", "/www."), tostring(productId))
		
		if p2 ~= "" then
			var3 = ("%s&paymentSessionId=%s"):format(var3, p2)
		end
		pcall(function()
			-- upvalues: var3 (write), p1 (ref), webViewService (copy)
			local onWebViewClosed = p1.onWebViewClosed
			local onWindowClosedConnection = nil
			onWindowClosedConnection = webViewService.OnWindowClosed:Connect(function()
				-- upvalues: webViewService (copy), onWindowClosedConnection (write), onWebViewClosed (ref)
				webViewService:CloseWindow()
				
				if onWindowClosedConnection then
					onWindowClosedConnection:Disconnect()
					onWindowClosedConnection = nil
				end
				if onWebViewClosed then
					onWebViewClosed()
				end
			end)
			webViewService:OpenWindow(var3, "", true)
		end)
	end
end

return function(p1)
	-- upvalues: getFFlagEnablePaymentSessionIdInRobuxPurchaseModule (ref), runService (ref), fFlagEnableBonusJwtInShop (ref), getUpsellFlowModule (ref), userInputService (ref), upsellFlowModule (ref), startPurchase (ref)
	local var2 = if getFFlagEnablePaymentSessionIdInRobuxPurchaseModule() then p1.paymentSessionId or "" else ""
	
	if runService:IsStudio() then
		return nil
	elseif fFlagEnableBonusJwtInShop then
		local var3 = getUpsellFlowModule(userInputService:GetPlatform())
		local var4 = var3 ~= upsellFlowModule.Mobile and var3 ~= upsellFlowModule.Web
		local bonusJwt = p1.bonusJwt
		local redeemBonusToken = p1.redeemBonusToken
		
		if var4 or typeof(bonusJwt) ~= "string" or (bonusJwt == "" or redeemBonusToken == nil) then
			startPurchase(p1, var2)
			
			return nil
		end
		local ok, status = pcall(function()
			-- upvalues: redeemBonusToken (ref), bonusJwt (ref)
			return redeemBonusToken(bonusJwt, game.GameId)
		end)
		
		return if ok then if typeof(status) == "table" and typeof(status.andThen) == "function" then status:andThen(function(p2)
			-- upvalues: startPurchase (copy), p1 (ref)
			startPurchase(p1, if typeof(p2) == "string" then p2 else "")
		end) else nil else nil
	end
end