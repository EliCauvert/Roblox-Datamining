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
local var1 = nil
pcall(function()
	-- upvalues: var1 (write)
	var1 = game:GetService("PlatformService")
end)
local getFStringVNGWebshopUrl = require(parent.SharedFlags).GetFStringVNGWebshopUrl
local urlBuilder = require(parent.PurchasePromptDeps).UrlBuilder.UrlBuilder
local replaced = string.gsub(contentProviderService.BaseUrl:lower(), "/m.", "/www.")
local t = {}

local function addContextToUrl(p1, p2)
	for i, v in p2 do
		if v then
			p1 = if p1:find("?") then p1 .. ("&%s=%s"):format(i, v) else p1 .. ("?%s=%s"):format(i, v)
		end
	end
	return p1
end

function t.new()
	-- upvalues: marketplaceService (ref), replaced (ref), guiService (ref), addContextToUrl (ref), purchaseFlowModule (ref), base64Module (ref), urlBuilder (ref), httpService (ref), constantsModule (ref), browserService (ref), var1 (write), getFStringVNGWebshopUrl (ref)
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
	
	function t.startPremiumUpsell(p3)
		-- upvalues: replaced (copy), guiService (copy)
		guiService:OpenBrowserWindow(("%supgrades/paymentmethods?ap=%d"):format(replaced, p3))
	end
	
	function t.startPremiumUpsellWithContext(p3, p4)
		-- upvalues: replaced (copy), addContextToUrl (copy), guiService (copy)
		guiService:OpenBrowserWindow(addContextToUrl(("%supgrades/paymentmethods?ap=%d"):format(replaced, p4), p3))
	end
	
	function t.startRobuxUpsellWebByFlow(p3, p4)
		-- upvalues: purchaseFlowModule (copy), guiService (copy), replaced (copy)
		if p3 == purchaseFlowModule.RobuxUpsellV2 or p3 == purchaseFlowModule.LargeRobuxUpsell then
			guiService:OpenBrowserWindow(("%supgrades/paymentmethods?ap=%s"):format(replaced, p4))
			
			return
		end
		guiService:OpenBrowserWindow(("%sUpgrades/Robux.aspx?product_id=%s"):format(replaced, p4))
	end
	
	function t.startRobuxUpsellWebByFlowWithContext(p3, p4, p5)
		-- upvalues: purchaseFlowModule (copy), replaced (copy), addContextToUrl (copy), guiService (copy)
		guiService:OpenBrowserWindow(addContextToUrl(if if p4 ~= purchaseFlowModule.RobuxUpsellV2 then p4 == purchaseFlowModule.LargeRobuxUpsell else true then ("%supgrades/paymentmethods?ap=%s"):format(replaced, p5) else ("%sUpgrades/Robux.aspx?product_id=%s"):format(replaced, p5), p3))
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
	
	function t.openRobuxStoreWithContext(p3, p4)
		-- upvalues: replaced (copy), addContextToUrl (copy), guiService (copy)
		local var2 = ("%sUpgrades/Robux.aspx"):format(replaced)
		
		if p4 then
			var2 ..= ("?product_id=%s"):format(p4)
		end
		guiService:OpenBrowserWindow(addContextToUrl(var2, p3))
	end
	
	function t.openPaymentsPageWithContext(p3, p4)
		-- upvalues: replaced (copy), addContextToUrl (copy), guiService (copy)
		guiService:OpenBrowserWindow(addContextToUrl(("%supgrades/paymentmethods?ap=%s"):format(replaced, p4), p3))
	end
	
	function t.promptNativePurchaseWithLocalPlayer(p3)
		-- upvalues: marketplaceService (copy)
		return marketplaceService:PromptNativePurchaseWithLocalPlayer(p3)
	end
	
	function t.promptNativePurchase(p3, p4)
		-- upvalues: marketplaceService (copy)
		return marketplaceService:PromptNativePurchase(p3, p4)
	end
	
	function t.beginPlatformStorePurchase(p3)
		-- upvalues: var1 (copy)
		return var1:BeginPlatformStorePurchase(p3)
	end
	
	function t.openVngStore(p3)
		-- upvalues: getFStringVNGWebshopUrl (copy), guiService (copy)
		if not p3 or p3 == "" then
			p3 = getFStringVNGWebshopUrl()
		end
		guiService:OpenBrowserWindow(p3)
	end
	
	return t
end

return t