local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local TModule = require(CorePackages.Packages.t)
local PromiseModule = require(Modules.LuaApp.Promise)
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)
local PurchaseDeveloperProductModule = require(Modules.LuaApp.Http.Requests.DeveloperProductApi.PurchaseDeveloperProduct)
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)
local ApiFetchEconomyCurrencyModule = require(Modules.LuaApp.Thunks.ApiFetchEconomyCurrency)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local PurchaseDeveloperProductModelModule = require(Modules.LuaApp.Models.DeveloperProductApi.PurchaseDeveloperProductModel)
local IsEconomicRestrictionResponseFunction = require(CorePackages.Workspace.Packages.IAPExperience).Utility.isEconomicRestrictionResponse

local function _(Text): string
	return "luaapp.purchasedeveloperproduct." .. Text
end

local TupleResult = TModule.tuple(TModule.callback, TModule.numberPositive, require(Modules.LuaApp.Types.EconomyTypes).PurchaseDetail, TModule.optional(TModule.callback))

local _ = function(p1, p2)
	-- upvalues: ArgCheckModule (copy), ApiFetchEconomyCurrencyModule (copy)
	local LocalUserId = p2:getState().LocalUserId
	ArgCheckModule.isNonEmptyString(LocalUserId, "Thunk.PurchaseProduct.updateRobux.localUserId")
	
	if typeof(LocalUserId) == "string" and LocalUserId ~= "" then
		p2:dispatch(ApiFetchEconomyCurrencyModule(p1, LocalUserId, true))
	end
end

return {
	Post = function(p1, Text, p2, Callback1, Callback)
		-- upvalues: ArgCheckModule (copy), TupleResult (copy), PerformFetch (copy), PurchaseDeveloperProductModule (copy), PurchaseDeveloperProductModelModule (copy), IsEconomicRestrictionResponseFunction (copy), PromiseModule (copy), ApiFetchEconomyCurrencyModule (copy), Logging (copy), SetNetworkingErrorToastModule (copy), HttpService (copy)
		ArgCheckModule.assert(TupleResult(p1, Text, p2, Callback1))
		
		return PerformFetch.Single("luaapp.purchasedeveloperproduct." .. Text, function(p3)
			-- upvalues: PurchaseDeveloperProductModule (upval), p1 (copy), Text (copy), p2 (copy), PurchaseDeveloperProductModelModule (upval), IsEconomicRestrictionResponseFunction (upval), Callback (copy), PromiseModule (upval), ArgCheckModule (upval), ApiFetchEconomyCurrencyModule (upval), Logging (upval), SetNetworkingErrorToastModule (upval), Callback1 (copy), HttpService (upval)
			return PurchaseDeveloperProductModule(p1, Text, p2):andThen(function(Result)
				-- upvalues: PurchaseDeveloperProductModelModule (upval), IsEconomicRestrictionResponseFunction (upval), Callback (upval), PromiseModule (upval), p1 (upval), p3 (copy), ArgCheckModule (upval), ApiFetchEconomyCurrencyModule (upval), Logging (upval), SetNetworkingErrorToastModule (upval)
				local ResponseBody = Result.responseBody
				local FromJsonDataResult = PurchaseDeveloperProductModelModule.fromJsonData(ResponseBody)
				
				if type(ResponseBody) ~= "table" then
					Logging.warn("Response from PurchaseDeveloperProduct is malformed!")
					p3:dispatch(SetNetworkingErrorToastModule({ HttpError = Enum.HttpError.OK }))
					
					return PromiseModule.reject({ HttpError = Enum.HttpError.OK })
				end
				if IsEconomicRestrictionResponseFunction(ResponseBody) and Callback ~= nil then
					Callback(ResponseBody)
					
					return PromiseModule.reject(FromJsonDataResult)
				end
				local LocalUserId = p3:getState().LocalUserId
				ArgCheckModule.isNonEmptyString(LocalUserId, "Thunk.PurchaseProduct.updateRobux.localUserId")
				
				if typeof(LocalUserId) == "string" and LocalUserId ~= "" then
					p3:dispatch(ApiFetchEconomyCurrencyModule(p1, LocalUserId, true))
				end
				return PromiseModule.resolve(FromJsonDataResult)
			end, function(p4)
				-- upvalues: Callback1 (upval), HttpService (upval), p3 (copy), SetNetworkingErrorToastModule (upval), PromiseModule (upval)
				if Callback1 == nil or not p4.Body then
					p3:dispatch(SetNetworkingErrorToastModule(p4))
				else
					Callback1(HttpService:JSONDecode(p4.Body))
				end
				return PromiseModule.reject(p4)
			end)
		end)
	end,
	GetPostingStatus = function(p1, Text)
		-- upvalues: PerformFetch (copy)
		return if Text == nil then nil else PerformFetch.GetStatus(p1, "luaapp.purchasedeveloperproduct." .. Text)
	end
}