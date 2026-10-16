local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local ContentProvider = game:GetService("ContentProvider")
local GuiService = game:GetService("GuiService")
local Base64Module = require(PurchasePrompt.Utils.Base64)
local PurchaseFlowModule = require(PurchasePrompt.Enums.PurchaseFlow)
local ConstantsModule = require(PurchasePrompt.Misc.Constants)
local MarketplaceService = game:GetService("MarketplaceService")
local BrowserService = game:GetService("BrowserService")
local HttpService = game:GetService("HttpService")
local PlatformService = nil
pcall(function() --[[ Line: 15 ]]
	-- upvalues: PlatformService (ref)
	PlatformService = game:GetService("PlatformService")
end)
local GetFStringVNGWebshopUrlFunction = require(Parent.SharedFlags).GetFStringVNGWebshopUrl
local UrlBuilder = require(Parent.PurchasePromptDeps).UrlBuilder.UrlBuilder
local Replaced = string.gsub(ContentProvider.BaseUrl:lower(), "/m.", "/www.")

local function addContextToUrl(PaymentmethodsName: string, List): string --[[ Line: 32 ]]
	for i, value in List do
		if value then
			if PaymentmethodsName:find("?") then
				PaymentmethodsName ..= ("&%s=%s"):format(i, value)
			else
				PaymentmethodsName ..= ("?%s=%s"):format(i, value)
			end
		end
	end
	return PaymentmethodsName
end

return {
	new = function() --[[ Line: 45 ]]
		-- upvalues: MarketplaceService (copy), Replaced (copy), GuiService (copy), addContextToUrl (copy), PurchaseFlowModule (copy), Base64Module (copy), UrlBuilder (copy), HttpService (copy), ConstantsModule (copy), BrowserService (copy), PlatformService (ref), GetFStringVNGWebshopUrlFunction (copy)
		local t = {}
		setmetatable(t, {
			__tostring = function(): string --[[ Line: 49 ]]
				return "Service(PlatformInterface)"
			end
		})
		
		function t.signalMockPurchasePremium() --[[ Line: 54 ]]
			-- upvalues: MarketplaceService (upval)
			MarketplaceService:SignalMockPurchasePremium()
		end
		
		function t.startPremiumUpsell(p1) --[[ Line: 58 ]]
			-- upvalues: Replaced (upval), GuiService (upval)
			GuiService:OpenBrowserWindow((("%supgrades/paymentmethods?ap=%d"):format(Replaced, p1)))
		end
		
		function t.startPremiumUpsellWithContext(p1, p2) --[[ Line: 64 ]]
			-- upvalues: Replaced (upval), addContextToUrl (upval), GuiService (upval)
			GuiService:OpenBrowserWindow((addContextToUrl(("%supgrades/paymentmethods?ap=%d"):format(Replaced, p2), p1)))
		end
		
		function t.startRobuxUpsellWebByFlow(LargeRobuxUpsell, p1) --[[ Line: 70 ]]
			-- upvalues: PurchaseFlowModule (upval), GuiService (upval), Replaced (upval)
			if LargeRobuxUpsell == PurchaseFlowModule.RobuxUpsellV2 or LargeRobuxUpsell == PurchaseFlowModule.LargeRobuxUpsell then
				GuiService:OpenBrowserWindow(("%supgrades/paymentmethods?ap=%s"):format(Replaced, p1))
				
				return
			else
				GuiService:OpenBrowserWindow(("%sUpgrades/Robux.aspx?product_id=%s"):format(Replaced, p1))
			end
		end
		
		function t.startRobuxUpsellWebByFlowWithContext(p1, LargeRobuxUpsell, p2) --[[ Line: 78 ]]
			-- upvalues: PurchaseFlowModule (upval), Replaced (upval), addContextToUrl (upval), GuiService (upval)
			local IsLargeRobuxUpsellMatch: boolean = LargeRobuxUpsell == PurchaseFlowModule.RobuxUpsellV2 or LargeRobuxUpsell == PurchaseFlowModule.LargeRobuxUpsell
			GuiService:OpenBrowserWindow((addContextToUrl(if IsLargeRobuxUpsellMatch then ("%supgrades/paymentmethods?ap=%s"):format(Replaced, p2) else ("%sUpgrades/Robux.aspx?product_id=%s"):format(Replaced, p2), p1)))
		end
		
		function t.openSecuritySettings(p1) --[[ Line: 89 ]]
			-- upvalues: Base64Module (upval), Replaced (upval), GuiService (upval)
			if p1 then
				GuiService:OpenBrowserWindow((("%smy/account?challenge=%s#!/security"):format(Replaced, (Base64Module.Encode(p1)))))
				
				return
			else
				GuiService:OpenBrowserWindow((("%smy/account#!/security"):format(Replaced)))
			end
		end
		
		function t.openTermsOfUse() --[[ Line: 103 ]]
			-- upvalues: UrlBuilder (upval), GuiService (upval)
			GuiService:OpenBrowserWindow((UrlBuilder.static.about.terms()))
		end
		
		function t.openTermsOfUseDMCCA() --[[ Line: 109 ]]
			-- upvalues: HttpService (upval), ConstantsModule (upval), BrowserService (upval)
			BrowserService:SendCommand((HttpService:JSONEncode({
				command = "open",
				url = ConstantsModule.TermsOfUse.DMCCAUrl
			})))
		end
		
		function t.openRobuxStore() --[[ Line: 117 ]]
			-- upvalues: GuiService (upval), Replaced (upval)
			GuiService:OpenBrowserWindow(("%sUpgrades/Robux.aspx"):format(Replaced))
		end
		
		function t.openRobuxStoreWithContext(p1, p2) --[[ Line: 121 ]]
			-- upvalues: Replaced (upval), addContextToUrl (upval), GuiService (upval)
			local SUpgradesName: string = ("%sUpgrades/Robux.aspx"):format(Replaced)
			
			if p2 then
				SUpgradesName ..= ("?product_id=%s"):format(p2)
			end
			GuiService:OpenBrowserWindow((addContextToUrl(SUpgradesName, p1)))
		end
		
		function t.openPaymentsPageWithContext(p1, p2) --[[ Line: 130 ]]
			-- upvalues: Replaced (upval), addContextToUrl (upval), GuiService (upval)
			GuiService:OpenBrowserWindow((addContextToUrl(("%supgrades/paymentmethods?ap=%s"):format(Replaced, p2), p1)))
		end
		
		function t.promptNativePurchaseWithLocalPlayer(ProductId) --[[ Line: 136 ]]
			-- upvalues: MarketplaceService (upval)
			return MarketplaceService:PromptNativePurchaseWithLocalPlayer(ProductId)
		end
		
		function t.promptNativePurchase(Player, ProductId) --[[ Line: 140 ]]
			-- upvalues: MarketplaceService (upval)
			return MarketplaceService:PromptNativePurchase(Player, ProductId)
		end
		
		function t.beginPlatformStorePurchase(p1) --[[ Line: 144 ]]
			-- upvalues: PlatformService (upval)
			return PlatformService:BeginPlatformStorePurchase(p1)
		end
		
		function t.openVngStore(Url) --[[ Line: 148 ]]
			-- upvalues: GetFStringVNGWebshopUrlFunction (upval), GuiService (upval)
			if not Url or Url == "" then
				Url = GetFStringVNGWebshopUrlFunction()
			end
			GuiService:OpenBrowserWindow(Url)
		end
		
		return t
	end
}