local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local IsEconomicRestrictionResponseFunction = require(CorePackages.Workspace.Packages.IAPExperience).Utility.isEconomicRestrictionResponse
local TModule = require(CorePackages.Packages.t)
local PromiseModule = require(Modules.LuaApp.Promise)
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)
local PurchaseGamePassModule = require(Modules.LuaApp.Http.Requests.GamesApi.PurchaseGamePass)
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)
local SetPurchaseErrorToastModule = require(Modules.LuaApp.Thunks.SetPurchaseErrorToast)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local PurchaseProductModule = require(Modules.LuaApp.Models.EconomyApi.PurchaseProduct)

local function _(Text): string
	return "luaapp.purchasegamepass." .. Text
end

local TupleResult = TModule.tuple(TModule.callback, TModule.numberPositive, require(Modules.LuaApp.Types.EconomyTypes).PurchaseDetail, TModule.optional(TModule.callback), TModule.callback)

return {
	Post = function(p1, Text, p2, Callback, Callback1)
		-- upvalues: ArgCheckModule (copy), TupleResult (copy), PerformFetch (copy), PurchaseGamePassModule (copy), PurchaseProductModule (copy), IsEconomicRestrictionResponseFunction (copy), SetPurchaseErrorToastModule (copy), PromiseModule (copy), Logging (copy), SetNetworkingErrorToastModule (copy)
		ArgCheckModule.assert(TupleResult(p1, Text, p2, Callback, Callback1))
		
		return PerformFetch.Single("luaapp.purchasegamepass." .. Text, function(p3)
			-- upvalues: PurchaseGamePassModule (upval), p1 (copy), Text (copy), p2 (copy), PurchaseProductModule (upval), Callback (copy), IsEconomicRestrictionResponseFunction (upval), Callback1 (copy), SetPurchaseErrorToastModule (upval), PromiseModule (upval), Logging (upval), SetNetworkingErrorToastModule (upval)
			return PurchaseGamePassModule(p1, Text, p2):andThen(function(Result)
				-- upvalues: PurchaseProductModule (upval), Callback (upval), IsEconomicRestrictionResponseFunction (upval), Callback1 (upval), p3 (copy), SetPurchaseErrorToastModule (upval), PromiseModule (upval), Logging (upval), SetNetworkingErrorToastModule (upval)
				local ResponseBody = Result.responseBody
				
				if type(ResponseBody) ~= "table" then
					Logging.warn("Response from PurchaseGamePass is malformed!")
					p3:dispatch(SetNetworkingErrorToastModule({ HttpError = Enum.HttpError.OK }))
					
					return PromiseModule.reject({ HttpError = Enum.HttpError.OK })
				end
				local FromJsonDataResult = PurchaseProductModule.fromJsonData(ResponseBody)
				
				if FromJsonDataResult.purchased then
					return PromiseModule.resolve(FromJsonDataResult)
				end
				if Callback == nil or Callback(FromJsonDataResult) == false then
					if IsEconomicRestrictionResponseFunction(ResponseBody) then
						Callback1(ResponseBody)
					else
						p3:dispatch(SetPurchaseErrorToastModule(FromJsonDataResult))
					end
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
		return if Text == nil then nil else PerformFetch.GetStatus(p1, "luaapp.purchasegamepass." .. Text)
	end
}