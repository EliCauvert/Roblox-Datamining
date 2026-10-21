local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local SharedFlagsModule = require(PurchasePrompt.Parent.SharedFlags)
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
local GetEngineFeaturePromptNativePurchaseWithContextModule = require(PurchasePrompt.Flags.getEngineFeaturePromptNativePurchaseWithContext)
local FFlagEnableBonusJwtInShop = SharedFlagsModule.FFlagEnableBonusJwtInShop

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

local function tryLaunchNativePurchaseWithContext(p1, p2): boolean
	-- upvalues: MarketplaceService (copy)
	local PurchaseType = p1.purchaseType
	local IsInApp = p1.isInApp
	
	if PurchaseType == nil or IsInApp == nil then
		return false
	end
	local PromptNativePurchaseWithContextFunction = MarketplaceService.PromptNativePurchaseWithContext
	
	if typeof(PromptNativePurchaseWithContextFunction) == "function" then
		local config = {
			paymentSessionId = if p2 == "" then nil else p2,
			purchaseType = PurchaseType,
			isInApp = IsInApp
		}
		local Flag = false
		pcall(function()
			-- upvalues: PromptNativePurchaseWithContextFunction (copy), MarketplaceService (copy), p1 (copy), config (copy), Flag (ref)
			PromptNativePurchaseWithContextFunction(MarketplaceService, p1.mobileProductId, config)
			Flag = true
			
			if p1.onNativePurchaseLaunched ~= nil then
				p1.onNativePurchaseLaunched()
			end
		end)
		
		return Flag
	else
		return false
	end
end

local function startPurchase(p1, PaymentSessionId)
	-- upvalues: UserInputService (copy), GetUpsellFlowModule (copy), UpsellFlowModule (copy), GetEngineFeaturePromptNativePurchaseWithContextModule (copy), tryLaunchNativePurchaseWithContext (copy), Players (copy), MarketplaceService (copy), PlatformService (ref), ContentProvider (copy), WebViewService (copy)
	local MobileProductId = p1.mobileProductId
	local ProductId = p1.productId
	local UpsellFlowModule1 = GetUpsellFlowModule((UserInputService:GetPlatform()))
	
	if UpsellFlowModule1 ~= UpsellFlowModule.Mobile then
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
			return
		end
	elseif not GetEngineFeaturePromptNativePurchaseWithContextModule() or not tryLaunchNativePurchaseWithContext(p1, PaymentSessionId) then
		local LocalPlayer = Players.LocalPlayer
		local NativePurchaseWithLocalPlayerEngineFeature = game:GetEngineFeature("NativePurchaseWithLocalPlayer")
		local PromptNativePurchaseWithPaymentSessionIdEngineFeature = game:GetEngineFeature("PromptNativePurchaseWithPaymentSessionId")
		pcall(function()
			-- upvalues: MarketplaceService (upval), NativePurchaseWithLocalPlayerEngineFeature (copy), PromptNativePurchaseWithPaymentSessionIdEngineFeature (copy), MobileProductId (copy), PaymentSessionId (copy), LocalPlayer (copy), p1 (copy)
			local PromptNativePurchaseWithLocalPlayerWithPaymentSessionIdFunction: (any, any, any) -> () = MarketplaceService.PromptNativePurchaseWithLocalPlayerWithPaymentSessionId
			local PromptNativePurchaseWithLocalPlayerFunction: (any, any) -> () = MarketplaceService.PromptNativePurchaseWithLocalPlayer
			local PromptNativePurchaseWithPaymentSessionIdFunction: (any, any, any, any) -> () = MarketplaceService.PromptNativePurchaseWithPaymentSessionId
			local PromptNativePurchaseFunction: (any, any, any) -> () = MarketplaceService.PromptNativePurchase
			
			if NativePurchaseWithLocalPlayerEngineFeature and PromptNativePurchaseWithPaymentSessionIdEngineFeature and typeof(PromptNativePurchaseWithLocalPlayerWithPaymentSessionIdFunction) == "function" then
				PromptNativePurchaseWithLocalPlayerWithPaymentSessionIdFunction(MarketplaceService, MobileProductId, PaymentSessionId)
			elseif NativePurchaseWithLocalPlayerEngineFeature and typeof(PromptNativePurchaseWithLocalPlayerFunction) == "function" then
				PromptNativePurchaseWithLocalPlayerFunction(MarketplaceService, MobileProductId)
			elseif PromptNativePurchaseWithPaymentSessionIdEngineFeature and typeof(PromptNativePurchaseWithPaymentSessionIdFunction) == "function" then
				PromptNativePurchaseWithPaymentSessionIdFunction(MarketplaceService, LocalPlayer, MobileProductId, PaymentSessionId)
			elseif typeof(PromptNativePurchaseFunction) == "function" then
				PromptNativePurchaseFunction(MarketplaceService, LocalPlayer, MobileProductId)
			else
				error("MarketplaceService has no PromptNativePurchase APIs bound")
			end
			if p1.onNativePurchaseLaunched ~= nil then
				p1.onNativePurchaseLaunched()
			end
		end)
		
		return
	else
	end
end

return function(p1)
	-- upvalues: GetFFlagEnablePaymentSessionIdInRobuxPurchaseModule (copy), RunService (copy), FFlagEnableBonusJwtInShop (copy), GetUpsellFlowModule (copy), UserInputService (copy), UpsellFlowModule (copy), startPurchase (copy)
	local PaymentSessionId = GetFFlagEnablePaymentSessionIdInRobuxPurchaseModule() and p1.paymentSessionId or ""
	
	if RunService:IsStudio() then
		return nil
	end
	if FFlagEnableBonusJwtInShop then
		local UpsellFlowModule1 = GetUpsellFlowModule(UserInputService:GetPlatform())
		local BonusJwt = p1.bonusJwt
		local RedeemBonusTokenFunction = p1.redeemBonusToken
		
		if (UpsellFlowModule1 == UpsellFlowModule.Mobile or UpsellFlowModule1 == UpsellFlowModule.Web) and typeof(BonusJwt) == "string" and BonusJwt ~= "" and RedeemBonusTokenFunction ~= nil then
			local Success, Result = pcall(function()
				-- upvalues: RedeemBonusTokenFunction (copy), BonusJwt (copy)
				return RedeemBonusTokenFunction(BonusJwt, game.GameId)
			end)
			
			return if Success and (typeof(Result) == "table" and typeof(Result.andThen) == "function") then Result:andThen(function(Result)
				-- upvalues: startPurchase (upval), p1 (copy)
				startPurchase(p1, if typeof(Result) == "string" then Result else "")
			end) else nil
		end
	end
	startPurchase(p1, PaymentSessionId)
	
	return nil
end