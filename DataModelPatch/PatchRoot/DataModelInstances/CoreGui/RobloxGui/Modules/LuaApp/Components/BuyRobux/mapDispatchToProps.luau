local Modules = game:GetService("CoreGui").RobloxGui.Modules
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local ApiFetchIAPProductsModule = require(Modules.LuaApp.Thunks.ApiFetchIAPProducts)
local ClearNativePurchaseResultModule = require(Modules.LuaApp.Actions.ClearNativePurchaseResult)
local ApiFetchIAPPurchaseWarningModule = require(Modules.LuaApp.Thunks.ApiFetchIAPPurchaseWarning)
local FetchNativeIAPProductsModule = require(Modules.LuaApp.Thunks.FetchNativeIAPProducts)
local ApiPostAckPurchaseWarningModule = require(Modules.LuaApp.Thunks.ApiPostAckPurchaseWarning)
local OpenNativePurchaseModule = require(Modules.LuaApp.Thunks.Economy.OpenNativePurchase)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local ApiFetchEconomyCurrencyModule = require(Modules.LuaApp.Thunks.ApiFetchEconomyCurrency)
local ApiPostCheckUserPurchaseSettingsModule = require(Modules.LuaApp.Thunks.ApiPostCheckUserPurchaseSettings)

return function(Callback)
	-- upvalues: ClearNativePurchaseResultModule (copy), ApiFetchIAPProductsModule (copy), FetchNativeIAPProductsModule (copy), ApiFetchIAPPurchaseWarningModule (copy), ApiPostAckPurchaseWarningModule (copy), ApiFetchEconomyCurrencyModule (copy), OpenNativePurchaseModule (copy), NavigateBackModule (copy), SetCentralOverlayModule (copy), ApiPostCheckUserPurchaseSettingsModule (copy)
	return {
		dispatchClearNativePurchaseResult = function()
			-- upvalues: Callback (copy), ClearNativePurchaseResultModule (upval)
			Callback(ClearNativePurchaseResultModule())
		end,
		dispatchFetchIAPProducts = function(p1)
			-- upvalues: Callback (copy), ApiFetchIAPProductsModule (upval)
			Callback(ApiFetchIAPProductsModule.Fetch(p1))
		end,
		dispatchFetchNativeIAPProducts = function()
			-- upvalues: Callback (copy), FetchNativeIAPProductsModule (upval)
			Callback(FetchNativeIAPProductsModule.Fetch())
		end,
		dispatchFetchIAPPurchaseWarning = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), ApiFetchIAPPurchaseWarningModule (upval)
			return Callback(ApiFetchIAPPurchaseWarningModule.Fetch(p1, p2, p3, p4))
		end,
		dispatchPostAckPurchaseWarning = function(p1, p2)
			-- upvalues: Callback (copy), ApiPostAckPurchaseWarningModule (upval)
			return Callback(ApiPostAckPurchaseWarningModule.Post(p1, p2))
		end,
		dispatchFetchUserBalance = function(p1, p2)
			-- upvalues: Callback (copy), ApiFetchEconomyCurrencyModule (upval)
			Callback(ApiFetchEconomyCurrencyModule(p1, p2, true))
		end,
		promptRobux = function(p1, p2, p3)
			-- upvalues: Callback (copy), OpenNativePurchaseModule (upval)
			Callback(OpenNativePurchaseModule(p1, p2, p3))
		end,
		dispatchNavigateBack = function()
			-- upvalues: Callback (copy), NavigateBackModule (upval)
			Callback(NavigateBackModule())
		end,
		dispatchCentralOverlay = function(p1, p2)
			-- upvalues: Callback (copy), SetCentralOverlayModule (upval)
			return Callback(SetCentralOverlayModule(p1, p2))
		end,
		dispatchCheckUserPurchaseSettings = function(p1)
			-- upvalues: Callback (copy), ApiPostCheckUserPurchaseSettingsModule (upval)
			return Callback(ApiPostCheckUserPurchaseSettingsModule.Post(p1))
		end
	}
end