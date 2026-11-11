local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local AppPageModule = require(Modules.LuaApp.AppPage)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local ApiFetchIAPProductsModule = require(Modules.LuaApp.Thunks.ApiFetchIAPProducts)
local OpenNativePurchaseModule = require(Modules.LuaApp.Thunks.Economy.OpenNativePurchase)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil

return function(Callback)
	-- upvalues: SetCentralOverlayModule (copy), ApiFetchIAPProductsModule (copy), CloseCentralOverlayModule (copy), UserInputService (copy), AppPageModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), OpenNativePurchaseModule (copy)
	return {
		dispatchCentralOverlay = function(p1, p2)
			-- upvalues: Callback (copy), SetCentralOverlayModule (upval)
			return Callback(SetCentralOverlayModule(p1, p2))
		end,
		dispatchFetchIAPProducts = function(p1)
			-- upvalues: Callback (copy), ApiFetchIAPProductsModule (upval)
			Callback(ApiFetchIAPProductsModule.Fetch(p1))
		end,
		closeCentralOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			Callback(CloseCentralOverlayModule())
		end,
		promptPremium = function(p1, p2)
			-- upvalues: UserInputService (upval), AppPageModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval), OpenNativePurchaseModule (upval)
			local Platform = UserInputService:GetPlatform()
			
			if Platform ~= Enum.Platform.Windows and Platform ~= Enum.Platform.OSX then
				Callback(OpenNativePurchaseModule(p1, p2))
				
				return
			end
			local config = { name = AppPageModule.BuildersClub }
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				Callback(NavigateDownModule(config))
			end
		end
	}
end