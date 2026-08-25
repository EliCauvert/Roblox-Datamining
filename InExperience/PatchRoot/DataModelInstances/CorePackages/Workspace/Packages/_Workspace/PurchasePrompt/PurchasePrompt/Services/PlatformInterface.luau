local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local contentProviderService = game:GetService("ContentProvider")
local guiService = game:GetService("GuiService")
local base64Module = require(purchasePrompt.Utils.Base64)
local purchaseFlowModule = require(purchasePrompt.Enums.PurchaseFlow)
local constantsModule = require(purchasePrompt.Misc.Constants)
local marketplaceService = game:GetService("MarketplaceService")
local browserService = game:GetService("BrowserService")
local httpService = game:GetService("HttpService")
local var9 = nil
pcall(function()
	-- upvalues: var9 (write)
	var9 = game:GetService("PlatformService")
end)
local getFStringVNGWebshopUrl = require(parent.SharedFlags).GetFStringVNGWebshopUrl
local urlBuilder = require(parent.PurchasePromptDeps).UrlBuilder.UrlBuilder
local replaced = string.gsub(contentProviderService.BaseUrl:lower(), "/m.", "/www.")
local t = {}

local function addContextToUrl(p0, p1)
	for i, v in p1 do
		if v then
			p0 = if p0:find("?") then p0 .. ("&%s=%s"):format(i, v) else p0 .. ("?%s=%s"):format(i, v)
		end
	end
	return p0
end

function t.new()
	-- upvalues: marketplaceService (ref), replaced (ref), guiService (ref), addContextToUrl (ref), purchaseFlowModule (ref), base64Module (ref), urlBuilder (ref), httpService (ref), constantsModule (ref), browserService (ref), var9 (write), getFStringVNGWebshopUrl (ref)
	local t = {}
	setmetatable(t, {
		__tostring = function()
			return "Service(PlatformInterface)"
		end
	})
	
	function t.signalMockPurchasePremium()
		-- upvalues: marketplaceService (copy)
		marketplaceService:SignalMockPurchasePremium()
	end
	
	function t.startPremiumUpsell(p2)
		-- upvalues: replaced (copy), guiService (copy)
		guiService:OpenBrowserWindow(("%supgrades/paymentmethods?ap=%d"):format(replaced, p2))
	end
	
	function t.startPremiumUpsellWithContext(p3, p4)
		-- upvalues: replaced (copy), addContextToUrl (copy), guiService (copy)
		guiService:OpenBrowserWindow(addContextToUrl(("%supgrades/paymentmethods?ap=%d"):format(replaced, p4), p3))
	end
	
	function t.startRobuxUpsellWebByFlow(p5, p6)
		-- upvalues: purchaseFlowModule (copy), guiService (copy), replaced (copy)
		if p5 == purchaseFlowModule.RobuxUpsellV2 or p5 == purchaseFlowModule.LargeRobuxUpsell then
			guiService:OpenBrowserWindow(("%supgrades/paymentmethods?ap=%s"):format(replaced, p6))
			
			return
		end
		guiService:OpenBrowserWindow(("%sUpgrades/Robux.aspx?product_id=%s"):format(replaced, p6))
	end
	
	function t.startRobuxUpsellWebByFlowWithContext(p7, p8, p9)
		-- upvalues: purchaseFlowModule (copy), replaced (copy), addContextToUrl (copy), guiService (copy)
		guiService:OpenBrowserWindow(addContextToUrl(if if p8 ~= purchaseFlowModule.RobuxUpsellV2 then p8 == purchaseFlowModule.LargeRobuxUpsell else true then ("%supgrades/paymentmethods?ap=%s"):format(replaced, p9) else ("%sUpgrades/Robux.aspx?product_id=%s"):format(replaced, p9), p7))
	end
	
	function t.openSecuritySettings(value)
		-- upvalues: base64Module (copy), replaced (copy), guiService (copy)
		if value then
			guiService:OpenBrowserWindow(("%smy/account?challenge=%s#!/security"):format(replaced, base64Module.Encode(value)))
			
			return
		end
		guiService:OpenBrowserWindow(("%smy/account#!/security"):format(replaced))
	end
	
	function t.openTermsOfUse()
		-- upvalues: urlBuilder (copy), guiService (copy)
		guiService:OpenBrowserWindow(urlBuilder.static.about.terms())
	end
	
	function t.openTermsOfUseDMCCA()
		-- upvalues: httpService (copy), constantsModule (copy), browserService (copy)
		browserService:SendCommand(httpService:JSONEncode({
			command = "open",
			url = constantsModule.TermsOfUse.DMCCAUrl
		}))
	end
	
	function t.openRobuxStore()
		-- upvalues: guiService (copy), replaced (copy)
		guiService:OpenBrowserWindow(("%sUpgrades/Robux.aspx"):format(replaced))
	end
	
	function t.openRobuxStoreWithContext(p10, p11)
		-- upvalues: replaced (copy), addContextToUrl (copy), guiService (copy)
		local var14 = ("%sUpgrades/Robux.aspx"):format(replaced)
		
		if p11 then
			var14 ..= ("?product_id=%s"):format(p11)
		end
		guiService:OpenBrowserWindow(addContextToUrl(var14, p10))
	end
	
	function t.openPaymentsPageWithContext(p12, p13)
		-- upvalues: replaced (copy), addContextToUrl (copy), guiService (copy)
		guiService:OpenBrowserWindow(addContextToUrl(("%supgrades/paymentmethods?ap=%s"):format(replaced, p13), p12))
	end
	
	function t.promptNativePurchaseWithLocalPlayer(p14)
		-- upvalues: marketplaceService (copy)
		return marketplaceService:PromptNativePurchaseWithLocalPlayer(p14)
	end
	
	function t.promptNativePurchase(p15, p16)
		-- upvalues: marketplaceService (copy)
		return marketplaceService:PromptNativePurchase(p15, p16)
	end
	
	function t.beginPlatformStorePurchase(p17)
		-- upvalues: var9 (copy)
		return var9:BeginPlatformStorePurchase(p17)
	end
	
	function t.openVngStore(p18)
		-- upvalues: getFStringVNGWebshopUrl (copy), guiService (copy)
		if not p18 or p18 == "" then
			p18 = getFStringVNGWebshopUrl()
		end
		guiService:OpenBrowserWindow(p18)
	end
	
	return t
end

return t