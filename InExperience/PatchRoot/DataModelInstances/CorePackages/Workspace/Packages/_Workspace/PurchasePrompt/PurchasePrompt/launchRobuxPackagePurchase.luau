local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
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

return function(p1)
	-- upvalues: getFFlagEnablePaymentSessionIdInRobuxPurchaseModule (ref), runService (ref), userInputService (ref), getUpsellFlowModule (ref), upsellFlowModule (ref), playersService (ref), marketplaceService (ref), var1 (write), contentProviderService (ref), webViewService (ref)
	local mobileProductId = p1.mobileProductId
	local productId = p1.productId
	local var2 = if getFFlagEnablePaymentSessionIdInRobuxPurchaseModule() then p1.paymentSessionId or "" else ""
	
	if runService:IsStudio() then return end
	local var3 = getUpsellFlowModule(userInputService:GetPlatform())
	
	if var3 == upsellFlowModule.Mobile then
		local localPlayer = playersService.LocalPlayer
		local nativePurchaseWithLocalPlayerEngineFeature = game:GetEngineFeature("NativePurchaseWithLocalPlayer")
		local promptNativePurchaseWithPaymentSessionIdEngineFeature = game:GetEngineFeature("PromptNativePurchaseWithPaymentSessionId")
		pcall(function()
			-- upvalues: marketplaceService (copy), nativePurchaseWithLocalPlayerEngineFeature (ref), promptNativePurchaseWithPaymentSessionIdEngineFeature (ref), mobileProductId (ref), var2 (ref), localPlayer (ref)
			local promptNativePurchaseWithLocalPlayerWithPaymentSessionId = marketplaceService.PromptNativePurchaseWithLocalPlayerWithPaymentSessionId
			local promptNativePurchaseWithLocalPlayer = marketplaceService.PromptNativePurchaseWithLocalPlayer
			local promptNativePurchaseWithPaymentSessionId = marketplaceService.PromptNativePurchaseWithPaymentSessionId
			local promptNativePurchase = marketplaceService.PromptNativePurchase
			
			if nativePurchaseWithLocalPlayerEngineFeature and promptNativePurchaseWithPaymentSessionIdEngineFeature and typeof(promptNativePurchaseWithLocalPlayerWithPaymentSessionId) == "function" then
				promptNativePurchaseWithLocalPlayerWithPaymentSessionId(marketplaceService, mobileProductId, var2)
				
				return
			elseif nativePurchaseWithLocalPlayerEngineFeature and typeof(promptNativePurchaseWithLocalPlayer) == "function" then
				promptNativePurchaseWithLocalPlayer(marketplaceService, mobileProductId)
				
				return
			elseif promptNativePurchaseWithPaymentSessionIdEngineFeature and typeof(promptNativePurchaseWithPaymentSessionId) == "function" then
				promptNativePurchaseWithPaymentSessionId(marketplaceService, localPlayer, mobileProductId, var2)
				
				return
			elseif typeof(promptNativePurchase) == "function" then
				promptNativePurchase(marketplaceService, localPlayer, mobileProductId)
				
				return
			end
			error("MarketplaceService has no PromptNativePurchase APIs bound")
		end)
		
		return
	elseif var3 == upsellFlowModule.Xbox then
		if var1 == nil then
			return
		end
		pcall(function()
			-- upvalues: var1 (copy), mobileProductId (ref)
			var1:BeginPlatformStorePurchase(mobileProductId)
		end)
		
		return
	elseif var3 == upsellFlowModule.Web then
		if productId == nil then return end
		local var4 = ("%supgrades/paymentmethods?ap=%s"):format(string.gsub(contentProviderService.BaseUrl:lower(), "/m%.", "/www."), tostring(productId))
		
		if var2 ~= "" then
			var4 = ("%s&paymentSessionId=%s"):format(var4, var2)
		end
		pcall(function()
			-- upvalues: var4 (write), p1 (ref), webViewService (copy)
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
			webViewService:OpenWindow(var4, "", true)
		end)
	end
end