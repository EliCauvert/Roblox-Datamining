local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local TModule = require(CorePackages.Packages.t)
local PromiseModule = require(Modules.LuaApp.Promise)
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)
local PurchaseProductModule = require(Modules.LuaApp.Http.Requests.PurchaseProduct)
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)
local SetPurchaseErrorToastModule = require(Modules.LuaApp.Thunks.SetPurchaseErrorToast)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local PurchaseProductModule1 = require(Modules.LuaApp.Models.EconomyApi.PurchaseProduct)

local function _(Text): string
	return "luaapp.purchaseproduct." .. Text
end

local TupleResult = TModule.tuple(TModule.callback, TModule.numberPositive, require(Modules.LuaApp.Types.EconomyTypes).PurchaseDetail, TModule.optional(TModule.callback))

return {
	Post = function(p1, Text, p2, Callback)
		-- upvalues: ArgCheckModule (copy), TupleResult (copy), PerformFetch (copy), PurchaseProductModule (copy), PurchaseProductModule1 (copy), SetPurchaseErrorToastModule (copy), PromiseModule (copy), Logging (copy), SetNetworkingErrorToastModule (copy)
		ArgCheckModule.assert(TupleResult(p1, Text, p2, Callback))
		
		return PerformFetch.Single("luaapp.purchaseproduct." .. Text, function(p3)
			-- upvalues: PurchaseProductModule (upval), p1 (copy), Text (copy), p2 (copy), PurchaseProductModule1 (upval), Callback (copy), SetPurchaseErrorToastModule (upval), PromiseModule (upval), Logging (upval), SetNetworkingErrorToastModule (upval)
			return PurchaseProductModule(p1, Text, p2):andThen(function(Result)
				-- upvalues: PurchaseProductModule1 (upval), Callback (upval), p3 (copy), SetPurchaseErrorToastModule (upval), PromiseModule (upval), Logging (upval), SetNetworkingErrorToastModule (upval)
				local ResponseBody = Result.responseBody
				
				if type(ResponseBody) ~= "table" then
					Logging.warn("Response from PurchaseProduct is malformed!")
					p3:dispatch(SetNetworkingErrorToastModule({ HttpError = Enum.HttpError.OK }))
					
					return PromiseModule.reject({ HttpError = Enum.HttpError.OK })
				end
				local FromJsonDataResult = PurchaseProductModule1.fromJsonData(ResponseBody)
				
				if FromJsonDataResult.purchased then
					return PromiseModule.resolve(FromJsonDataResult)
				end
				if Callback == nil or Callback(FromJsonDataResult) == false then
					p3:dispatch(SetPurchaseErrorToastModule(FromJsonDataResult))
				end
				return PromiseModule.reject(FromJsonDataResult)
			end, function(p4)
				-- upvalues: p3 (copy), SetNetworkingErrorToastModule (upval), PromiseModule (upval)
				p3:dispatch(SetNetworkingErrorToastModule(p4))
				
				return PromiseModule.reject(p4)
			end)
		end)
	end,
	GetPostingStatus = function(p1, Text)
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p1, "luaapp.purchaseproduct." .. Text)
	end
}