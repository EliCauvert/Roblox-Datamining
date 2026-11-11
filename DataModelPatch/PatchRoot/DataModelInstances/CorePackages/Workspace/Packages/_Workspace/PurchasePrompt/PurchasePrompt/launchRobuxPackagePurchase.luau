local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local ContentProvider = game:GetService("ContentProvider")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local WebViewService = game:GetService("WebViewService")
local PlatformService = nil
pcall(function()
	-- upvalues: PlatformService (ref)
	PlatformService = game:GetService("PlatformService")
end)
local UpsellFlowModule = require(PurchasePrompt.Enums.UpsellFlow)
local GetUpsellFlowModule = require(PurchasePrompt.NativeUpsell.getUpsellFlow)
local GetFFlagEnablePaymentSessionIdInRobuxPurchaseModule = require(PurchasePrompt.Flags.GetFFlagEnablePaymentSessionIdInRobuxPurchase)

local function _(): string
	-- upvalues: ContentProvider (copy)
	return (string.gsub(ContentProvider.BaseUrl:lower(), "/m%.", "/www."))
end

local _ = function(Url, p1)
	-- upvalues: WebViewService (copy)
	local OnWindowClosedConnection = nil
	OnWindowClosedConnection = WebViewService.OnWindowClosed:Connect(function()
		-- upvalues: WebViewService (upval), OnWindowClosedConnection (ref), p1 (copy)
		WebViewService:CloseWindow()
		
		if OnWindowClosedConnection then
			OnWindowClosedConnection:Disconnect()
			OnWindowClosedConnection = nil
		end
		if p1 then
			p1()
		end
	end)
	WebViewService:OpenWindow(Url, "", true)
end

return function(p1)
	-- upvalues: GetFFlagEnablePaymentSessionIdInRobuxPurchaseModule (copy), RunService (copy), UserInputService (copy), GetUpsellFlowModule (copy), UpsellFlowModule (copy), Players (copy), MarketplaceService (copy), PlatformService (ref), ContentProvider (copy), WebViewService (copy)
	local MobileProductId = p1.mobileProductId
	local ProductId = p1.productId
	local PaymentSessionId = GetFFlagEnablePaymentSessionIdInRobuxPurchaseModule() and p1.paymentSessionId or ""
	
	if RunService:IsStudio() then return end
	local UpsellFlowModule1 = GetUpsellFlowModule((UserInputService:GetPlatform()))
	
	if UpsellFlowModule1 == UpsellFlowModule.Mobile then
		local LocalPlayer = Players.LocalPlayer
		local NativePurchaseWithLocalPlayerEngineFeature = game:GetEngineFeature("NativePurchaseWithLocalPlayer")
		local PromptNativePurchaseWithPaymentSessionIdEngineFeature = game:GetEngineFeature("PromptNativePurchaseWithPaymentSessionId")
		pcall(function()
			-- upvalues: MarketplaceService (upval), NativePurchaseWithLocalPlayerEngineFeature (copy), PromptNativePurchaseWithPaymentSessionIdEngineFeature (copy), MobileProductId (copy), PaymentSessionId (copy), LocalPlayer (copy)
			local PromptNativePurchaseWithLocalPlayerWithPaymentSessionIdFunction: (any, any, any) -> () = MarketplaceService.PromptNativePurchaseWithLocalPlayerWithPaymentSessionId
			local PromptNativePurchaseWithLocalPlayerFunction: (any, any) -> () = MarketplaceService.PromptNativePurchaseWithLocalPlayer
			local PromptNativePurchaseWithPaymentSessionIdFunction: (any, any, any, any) -> () = MarketplaceService.PromptNativePurchaseWithPaymentSessionId
			local PromptNativePurchaseFunction: (any, any, any) -> () = MarketplaceService.PromptNativePurchase
			
			if NativePurchaseWithLocalPlayerEngineFeature and PromptNativePurchaseWithPaymentSessionIdEngineFeature and typeof(PromptNativePurchaseWithLocalPlayerWithPaymentSessionIdFunction) == "function" then
				PromptNativePurchaseWithLocalPlayerWithPaymentSessionIdFunction(MarketplaceService, MobileProductId, PaymentSessionId)
				
				return
			end
			if NativePurchaseWithLocalPlayerEngineFeature and typeof(PromptNativePurchaseWithLocalPlayerFunction) == "function" then
				PromptNativePurchaseWithLocalPlayerFunction(MarketplaceService, MobileProductId)
				
				return
			end
			if PromptNativePurchaseWithPaymentSessionIdEngineFeature and typeof(PromptNativePurchaseWithPaymentSessionIdFunction) == "function" then
				PromptNativePurchaseWithPaymentSessionIdFunction(MarketplaceService, LocalPlayer, MobileProductId, PaymentSessionId)
				
				return
			end
			if typeof(PromptNativePurchaseFunction) == "function" then
				PromptNativePurchaseFunction(MarketplaceService, LocalPlayer, MobileProductId)
				
				return
			else
				error("MarketplaceService has no PromptNativePurchase APIs bound")
			end
		end)
		
		return
	end
	if UpsellFlowModule1 ~= UpsellFlowModule.Xbox then
		if UpsellFlowModule1 == UpsellFlowModule.Web then
			if ProductId == nil then return end
			local PaymentmethodsName: string = ("%supgrades/paymentmethods?ap=%s"):format(string.gsub(ContentProvider.BaseUrl:lower(), "/m%.", "/www."), (tostring(ProductId)))
			
			if PaymentSessionId ~= "" then
				PaymentmethodsName = ("%s&paymentSessionId=%s"):format(PaymentmethodsName, PaymentSessionId)
			end
			pcall(function()
				-- upvalues: PaymentmethodsName (ref), p1 (copy), WebViewService (upval)
				local OnWebViewClosedFunction = p1.onWebViewClosed
				local Connection = nil
				Connection = WebViewService.OnWindowClosed:Connect(function()
					-- upvalues: WebViewService (upval), Connection (ref), OnWebViewClosedFunction (copy)
					WebViewService:CloseWindow()
					
					if Connection then
						Connection:Disconnect()
						Connection = nil
					end
					if OnWebViewClosedFunction then
						OnWebViewClosedFunction()
					end
				end)
				WebViewService:OpenWindow(PaymentmethodsName, "", true)
			end)
		end
		return
	elseif PlatformService ~= nil then
		pcall(function()
			-- upvalues: PlatformService (upval), MobileProductId (copy)
			PlatformService:BeginPlatformStorePurchase(MobileProductId)
		end)
		
		return
	else
	end
end