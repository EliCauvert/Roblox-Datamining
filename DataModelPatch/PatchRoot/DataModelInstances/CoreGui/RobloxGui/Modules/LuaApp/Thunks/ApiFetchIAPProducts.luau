local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)
local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local GetIAPProductsModule = require(Modules.LuaApp.Http.Requests.GetIAPProducts)
local SetIAPProductsModule = require(Modules.LuaApp.Actions.SetIAPProducts)
local IAPProductModule = require(Modules.LuaApp.Models.PremiumFeaturesApi.IAPProduct)

return {
	Fetch = function(p1)
		-- upvalues: PerformFetch (copy), GetIAPProductsModule (copy), ArgCheckModule (copy), IAPProductModule (copy), SetIAPProductsModule (copy)
		return PerformFetch.Single("IAPProducts", function(p2)
			-- upvalues: GetIAPProductsModule (upval), p1 (copy), ArgCheckModule (upval), IAPProductModule (upval), SetIAPProductsModule (upval)
			return GetIAPProductsModule(p1):andThen(function(Entry)
				-- upvalues: ArgCheckModule (upval), IAPProductModule (upval), p2 (copy), SetIAPProductsModule (upval)
				if Entry == nil or Entry[1] == nil or Entry[1].products == nil or type(Entry[1].products) ~= "table" then
					ArgCheckModule.assert("Invalid response from GetIAPProducts")
					
					return
				end
				local List = {}
				local List1 = {}
				local List2 = {}
				
				for _, product in ipairs(Entry[1].products) do
					local FromJsonDataResult = IAPProductModule.fromJsonData(product, p2:getState().Platform)
					
					if FromJsonDataResult ~= nil then
						if FromJsonDataResult.isSubscription then
							table.insert(List2, FromJsonDataResult)
						elseif FromJsonDataResult.requiresPremium then
							table.insert(List, FromJsonDataResult)
						else
							table.insert(List1, FromJsonDataResult)
						end
					end
				end
				local function v10(A, B): boolean
					return A.robuxAmount < B.robuxAmount
				end
				
				table.sort(List, v10)
				table.sort(List1, v10)
				table.sort(List2, v10)
				p2:dispatch(SetIAPProductsModule(List1, List, List2))
			end)
		end)
	end,
	GetFetchingStatus = function(p2)
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p2, "IAPProducts")
	end
}