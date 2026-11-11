local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local MarketplaceService = game:GetService("MarketplaceService")
local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PlatformService = nil
pcall(function()
	-- upvalues: PlatformService (ref)
	PlatformService = game:GetService("PlatformService")
end)
local AppPageModule = require(Modules.LuaApp.AppPage)
local PaymentPlatformModule = require(Modules.LuaApp.Enum.PaymentPlatform)
local NativePurchaseStatusModule = require(Modules.LuaApp.Enum.NativePurchaseStatus)
local SetNativePurchaseResultModule = require(Modules.LuaApp.Actions.SetNativePurchaseResult)
local NativePurchaseCompleteModule = require(Modules.LuaApp.Thunks.NativePurchaseComplete)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local GetPaymentPlatformModule = require(Modules.LuaApp.Util.getPaymentPlatform)
local GetAppFeaturePoliciesFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies
local OpenPurchaseRobuxPageModule = require(Modules.LuaApp.Thunks.Economy.OpenPurchaseRobuxPage)
local DesktopUpsellExperiment = require(CorePackages.Workspace.Packages.IAPExperience).Utility.DesktopUpsellExperiment
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil

return function(p1, ProductId, Detail, AnalyticId)
	-- upvalues: SetNativePurchaseResultModule (copy), NativePurchaseStatusModule (copy), RunService (copy), NativePurchaseCompleteModule (copy), GetPaymentPlatformModule (copy), PaymentPlatformModule (copy), GetAppFeaturePoliciesFunction (copy), OpenPurchaseRobuxPageModule (copy), DesktopUpsellExperiment (copy), AppPageModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), PlatformService (ref), MarketplaceService (copy), Players (copy)
	return function(p2)
		-- upvalues: SetNativePurchaseResultModule (upval), ProductId (copy), NativePurchaseStatusModule (upval), RunService (upval), NativePurchaseCompleteModule (upval), p1 (copy), GetPaymentPlatformModule (upval), PaymentPlatformModule (upval), GetAppFeaturePoliciesFunction (upval), OpenPurchaseRobuxPageModule (upval), DesktopUpsellExperiment (upval), AppPageModule (upval), Detail (copy), AnalyticId (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownModule (upval), PlatformService (upval), MarketplaceService (upval), Players (upval)
		p2:dispatch(SetNativePurchaseResultModule(ProductId, NativePurchaseStatusModule.Pending))
		
		if RunService:IsStudio() then
			delay(3, function()
				-- upvalues: p2 (copy), NativePurchaseCompleteModule (upval), p1 (upval), ProductId (upval), NativePurchaseStatusModule (upval)
				p2:dispatch(NativePurchaseCompleteModule(p1, ProductId, NativePurchaseStatusModule.Success))
			end)
			
			return
		end
		local PaymentPlatformModule1 = GetPaymentPlatformModule()
		
		if PaymentPlatformModule1 == PaymentPlatformModule.Web then
			if GetAppFeaturePoliciesFunction().getRedirectBuyRobuxToVNG() then
				return p2:dispatch(OpenPurchaseRobuxPageModule(function()
					-- upvalues: p2 (copy), NativePurchaseCompleteModule (upval), p1 (upval), ProductId (upval), NativePurchaseStatusModule (upval)
					return p2:dispatch(NativePurchaseCompleteModule(p1, ProductId, NativePurchaseStatusModule.Polling))
				end, p1))
			elseif DesktopUpsellExperiment.getVariant() == DesktopUpsellExperiment.variants.OpenRobuxStore then
				local config = {
					name = AppPageModule.PurchaseRobux,
					detail = Detail,
					extraProps = { analyticId = AnalyticId, productId = Detail }
				}
				
				return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(config)) else p2:dispatch(NavigateDownModule(config))
			else
				local config = {
					name = AppPageModule.Payment,
					detail = Detail,
					extraProps = { analyticId = AnalyticId }
				}
				
				return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(config)) else p2:dispatch(NavigateDownModule(config))
			end
		elseif PaymentPlatformModule1 == PaymentPlatformModule.Xbox then
			local BeginPlatformStorePurchaseResult = nil
			local Success, _ = pcall(function()
				-- upvalues: BeginPlatformStorePurchaseResult (ref), PlatformService (upval), ProductId (upval)
				BeginPlatformStorePurchaseResult = PlatformService:BeginPlatformStorePurchase(ProductId)
			end)
			
			return p2:dispatch(NativePurchaseCompleteModule(p1, ProductId, if Success and BeginPlatformStorePurchaseResult == 0 then NativePurchaseStatusModule.Success else NativePurchaseStatusModule.Failed))
		else
			local BeginPlatformStorePurchaseResult = game
			BeginPlatformStorePurchaseResult = BeginPlatformStorePurchaseResult:GetEngineFeature("NativePurchaseWithLocalPlayer")
			
			if BeginPlatformStorePurchaseResult then
				BeginPlatformStorePurchaseResult = MarketplaceService
				
				return BeginPlatformStorePurchaseResult:PromptNativePurchaseWithLocalPlayer(ProductId)
			else
				BeginPlatformStorePurchaseResult = MarketplaceService
				
				return BeginPlatformStorePurchaseResult:PromptNativePurchase(Players.LocalPlayer, ProductId)
			end
		end
	end
end