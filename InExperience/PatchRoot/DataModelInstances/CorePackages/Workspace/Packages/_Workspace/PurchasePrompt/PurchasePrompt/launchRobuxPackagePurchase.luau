local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local contentProviderService = game:GetService("ContentProvider")
local marketplaceService = game:GetService("MarketplaceService")
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local webViewService = game:GetService("WebViewService")
local var7 = nil
pcall(function() --[[ line: 52 ]]
	-- upvalues: var7 (write)
	var7 = game:GetService("PlatformService")
end)
local upsellFlowModule = require(purchasePrompt.Enums.UpsellFlow)
local getUpsellFlowModule = require(purchasePrompt.NativeUpsell.getUpsellFlow)
local getFFlagEnablePaymentSessionIdInRobuxPurchaseModule = require(purchasePrompt.Flags.GetFFlagEnablePaymentSessionIdInRobuxPurchase)

local function _() --[[ line: 83 | named "getWebBaseUrl" ]]
	-- upvalues: contentProviderService (ref)
	return string.gsub(contentProviderService.BaseUrl:lower(), "/m%.", "/www.")
end

local _ = function(p0, p1) --[[ line: 105 | named "openRobuxPackageWebView" ]]
	-- upvalues: webViewService (ref)
	local onWindowClosedConnection = nil
	onWindowClosedConnection = webViewService.OnWindowClosed:Connect(function() --[[ line: 107 ]]
		-- upvalues: webViewService (copy), onWindowClosedConnection (write), p1 (ref)
		webViewService:CloseWindow()
		
		if onWindowClosedConnection then
			onWindowClosedConnection:Disconnect()
			onWindowClosedConnection = nil
		end
		if p1 then
			p1()
		end
	end)
	webViewService:OpenWindow(p0, "", true)
end

return function(p2) --[[ line: 120 | named "launchRobuxPackagePurchase" ]]
	-- upvalues: getFFlagEnablePaymentSessionIdInRobuxPurchaseModule (ref), runService (ref), userInputService (ref), getUpsellFlowModule (ref), upsellFlowModule (ref), playersService (ref), marketplaceService (ref), var7 (write), contentProviderService (ref), webViewService (ref)
	local mobileProductId = p2.mobileProductId
	local productId = p2.productId
	local var12 = if getFFlagEnablePaymentSessionIdInRobuxPurchaseModule() then p2.paymentSessionId or "" else ""
	
	if runService:IsStudio() then return end
	local var13 = getUpsellFlowModule(userInputService:GetPlatform())
	
	if var13 == upsellFlowModule.Mobile then
		local localPlayer = playersService.LocalPlayer
		local nativePurchaseWithLocalPlayerEngineFeature = game:GetEngineFeature("NativePurchaseWithLocalPlayer")
		local promptNativePurchaseWithPaymentSessionIdEngineFeature = game:GetEngineFeature("PromptNativePurchaseWithPaymentSessionId")
		pcall(function() --[[ line: 157 ]]
			-- upvalues: marketplaceService (copy), nativePurchaseWithLocalPlayerEngineFeature (ref), promptNativePurchaseWithPaymentSessionIdEngineFeature (ref), mobileProductId (ref), var12 (ref), localPlayer (ref)
			local promptNativePurchaseWithLocalPlayerWithPaymentSessionId = marketplaceService.PromptNativePurchaseWithLocalPlayerWithPaymentSessionId
			local promptNativePurchaseWithLocalPlayer = marketplaceService.PromptNativePurchaseWithLocalPlayer
			local promptNativePurchaseWithPaymentSessionId = marketplaceService.PromptNativePurchaseWithPaymentSessionId
			local promptNativePurchase = marketplaceService.PromptNativePurchase
			
			if nativePurchaseWithLocalPlayerEngineFeature and promptNativePurchaseWithPaymentSessionIdEngineFeature and typeof(promptNativePurchaseWithLocalPlayerWithPaymentSessionId) == "function" then
				promptNativePurchaseWithLocalPlayerWithPaymentSessionId(marketplaceService, mobileProductId, var12)
				
				return
			elseif nativePurchaseWithLocalPlayerEngineFeature and typeof(promptNativePurchaseWithLocalPlayer) == "function" then
				promptNativePurchaseWithLocalPlayer(marketplaceService, mobileProductId)
				
				return
			elseif promptNativePurchaseWithPaymentSessionIdEngineFeature and typeof(promptNativePurchaseWithPaymentSessionId) == "function" then
				promptNativePurchaseWithPaymentSessionId(marketplaceService, localPlayer, mobileProductId, var12)
				
				return
			elseif typeof(promptNativePurchase) == "function" then
				promptNativePurchase(marketplaceService, localPlayer, mobileProductId)
				
				return
			end
			error("MarketplaceService has no PromptNativePurchase APIs bound")
		end)
		
		return
	elseif var13 == upsellFlowModule.Xbox then
		if var7 == nil then
			return
		end
		pcall(function() --[[ line: 196 ]]
			-- upvalues: var7 (copy), mobileProductId (ref)
			var7:BeginPlatformStorePurchase(mobileProductId)
		end)
		
		return
	elseif var13 == upsellFlowModule.Web then
		if productId == nil then return end
		local var16 = ("%supgrades/paymentmethods?ap=%s"):format(string.gsub(contentProviderService.BaseUrl:lower(), "/m%.", "/www."), tostring(productId))
		
		if var12 ~= "" then
			var16 = ("%s&paymentSessionId=%s"):format(var16, var12)
		end
		pcall(function() --[[ line: 210 ]]
			-- upvalues: var16 (write), p2 (ref), webViewService (copy)
			local onWebViewClosed = p2.onWebViewClosed
			local onWindowClosedConnection = nil
			onWindowClosedConnection = webViewService.OnWindowClosed:Connect(function() --[[ line: 107 ]]
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
			webViewService:OpenWindow(var16, "", true)
		end)
	end
end