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
pcall(function()
	-- upvalues: PlatformService (ref)
	PlatformService = game:GetService("PlatformService")
end)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFStringVNGWebshopUrlFunction = SharedFlagsModule.GetFStringVNGWebshopUrl

local function _()
	-- upvalues: SharedFlagsModule (copy)
	return SharedFlagsModule.FFlagEnableBuyRobuxNewRouting and SharedFlagsModule.FFlagEnableBuyRobuxNewRoutingInExperience
end

local UrlBuilder = require(Parent.PurchasePromptDeps).UrlBuilder.UrlBuilder
local Replaced = string.gsub(ContentProvider.BaseUrl:lower(), "/m.", "/www.")

local function addContextToUrl(Text: string, List): string
	for i, value in List do
		if value then
			if Text:find("?") then
				Text ..= ("&%s=%s"):format(i, value)
			else
				Text ..= ("?%s=%s"):format(i, value)
			end
		end
	end
	return Text
end

return {
	new = function()
		-- upvalues: PurchaseFlowModule (copy), GuiService (copy), Replaced (copy), SharedFlagsModule (copy), Parent (copy), addContextToUrl (copy), Base64Module (copy), UrlBuilder (copy), HttpService (copy), ConstantsModule (copy), BrowserService (copy), MarketplaceService (copy), PlatformService (ref), GetFStringVNGWebshopUrlFunction (copy)
		local t = {}
		setmetatable(t, {
			__tostring = function(): string
				return "Service(PlatformInterface)"
			end
		})
		
		function t.startRobuxUpsellWebByFlow(LargeRobuxUpsell, ProductId)
			-- upvalues: PurchaseFlowModule (upval), GuiService (upval), Replaced (upval), SharedFlagsModule (upval), Parent (upval)
			if LargeRobuxUpsell == PurchaseFlowModule.RobuxUpsellV2 or LargeRobuxUpsell == PurchaseFlowModule.LargeRobuxUpsell then
				GuiService:OpenBrowserWindow(("%supgrades/paymentmethods?ap=%s"):format(Replaced, ProductId))
				
				return
			end
			if SharedFlagsModule.FFlagEnableBuyRobuxNewRouting and SharedFlagsModule.FFlagEnableBuyRobuxNewRoutingInExperience then
				require(Parent.BuyRobuxInExperience).openBuyRobux({ productId = ProductId }, function(Url)
					-- upvalues: GuiService (upval)
					GuiService:OpenBrowserWindow(Url)
				end, "PurchasePrompt.startRobuxUpsellWebByFlow")
				
				return
			else
				GuiService:OpenBrowserWindow(("%sUpgrades/Robux.aspx?product_id=%s"):format(Replaced, ProductId))
			end
		end
		
		function t.startRobuxUpsellWebByFlowWithContext(p1, LargeRobuxUpsell, ProductId)
			-- upvalues: PurchaseFlowModule (upval), SharedFlagsModule (upval), Parent (upval), GuiService (upval), Replaced (upval), addContextToUrl (upval)
			local IsLargeRobuxUpsellMatch: boolean = LargeRobuxUpsell == PurchaseFlowModule.RobuxUpsellV2 or LargeRobuxUpsell == PurchaseFlowModule.LargeRobuxUpsell
			
			if SharedFlagsModule.FFlagEnableBuyRobuxNewRouting and SharedFlagsModule.FFlagEnableBuyRobuxNewRoutingInExperience and not IsLargeRobuxUpsellMatch then
				require(Parent.BuyRobuxInExperience).openBuyRobux({ productId = ProductId, analyticId = p1.analyticId }, function(Url)
					-- upvalues: GuiService (upval)
					GuiService:OpenBrowserWindow(Url)
				end, "PurchasePrompt.startRobuxUpsellWebByFlowWithContext")
				
				return
			else
				GuiService:OpenBrowserWindow((addContextToUrl(if IsLargeRobuxUpsellMatch then ("%supgrades/paymentmethods?ap=%s"):format(Replaced, ProductId) else ("%sUpgrades/Robux.aspx?product_id=%s"):format(Replaced, ProductId), p1)))
			end
		end
		
		function t.openSecuritySettings(p1)
			-- upvalues: Base64Module (upval), Replaced (upval), GuiService (upval)
			if p1 then
				GuiService:OpenBrowserWindow((("%smy/account?challenge=%s#!/security"):format(Replaced, (Base64Module.Encode(p1)))))
				
				return
			else
				GuiService:OpenBrowserWindow((("%smy/account#!/security"):format(Replaced)))
			end
		end
		
		function t.openTermsOfUse()
			-- upvalues: UrlBuilder (upval), GuiService (upval)
			GuiService:OpenBrowserWindow((UrlBuilder.static.about.terms()))
		end
		
		function t.openTermsOfUseDMCCA()
			-- upvalues: HttpService (upval), ConstantsModule (upval), BrowserService (upval)
			BrowserService:SendCommand((HttpService:JSONEncode({
				command = "open",
				url = ConstantsModule.TermsOfUse.DMCCAUrl
			})))
		end
		
		function t.openRobuxStore()
			-- upvalues: SharedFlagsModule (upval), Parent (upval), GuiService (upval), Replaced (upval)
			if SharedFlagsModule.FFlagEnableBuyRobuxNewRouting and SharedFlagsModule.FFlagEnableBuyRobuxNewRoutingInExperience then
				require(Parent.BuyRobuxInExperience).openBuyRobux({}, function(Url)
					-- upvalues: GuiService (upval)
					GuiService:OpenBrowserWindow(Url)
				end, "PurchasePrompt.openRobuxStore")
				
				return
			else
				GuiService:OpenBrowserWindow(("%sUpgrades/Robux.aspx"):format(Replaced))
			end
		end
		
		function t.openRobuxStoreWithContext(p1, ProductId)
			-- upvalues: SharedFlagsModule (upval), Parent (upval), GuiService (upval), Replaced (upval), addContextToUrl (upval)
			if SharedFlagsModule.FFlagEnableBuyRobuxNewRouting and SharedFlagsModule.FFlagEnableBuyRobuxNewRoutingInExperience then
				require(Parent.BuyRobuxInExperience).openBuyRobux({ productId = ProductId, analyticId = p1.analyticId }, function(Url)
					-- upvalues: GuiService (upval)
					GuiService:OpenBrowserWindow(Url)
				end, "PurchasePrompt.openRobuxStoreWithContext")
				
				return
			end
			local SUpgradesName: string = ("%sUpgrades/Robux.aspx"):format(Replaced)
			
			if ProductId then
				SUpgradesName ..= ("?product_id=%s"):format(ProductId)
			end
			GuiService:OpenBrowserWindow((addContextToUrl(SUpgradesName, p1)))
		end
		
		function t.openPaymentsPageWithContext(p1, p2)
			-- upvalues: Replaced (upval), addContextToUrl (upval), GuiService (upval)
			GuiService:OpenBrowserWindow((addContextToUrl(("%supgrades/paymentmethods?ap=%s"):format(Replaced, p2), p1)))
		end
		
		function t.promptNativePurchaseWithLocalPlayer(ProductId)
			-- upvalues: MarketplaceService (upval)
			return MarketplaceService:PromptNativePurchaseWithLocalPlayer(ProductId)
		end
		
		function t.promptNativePurchase(Player, ProductId)
			-- upvalues: MarketplaceService (upval)
			return MarketplaceService:PromptNativePurchase(Player, ProductId)
		end
		
		function t.beginPlatformStorePurchase(p1)
			-- upvalues: PlatformService (upval)
			return PlatformService:BeginPlatformStorePurchase(p1)
		end
		
		function t.openVngStore(Url)
			-- upvalues: GetFStringVNGWebshopUrlFunction (upval), GuiService (upval)
			if not Url or Url == "" then
				Url = GetFStringVNGWebshopUrlFunction()
			end
			GuiService:OpenBrowserWindow(Url)
		end
		
		return t
	end
}