local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(Modules.LuaApp.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local EconomyGetCurrencyModule = require(Modules.LuaApp.Http.Requests.EconomyGetCurrency)
local SetUserRobuxModule = require(Modules.LuaApp.Actions.SetUserRobux)

return function(p1, Text: string, p2)
	-- upvalues: PerformFetch (copy), PromiseModule (copy), EconomyGetCurrencyModule (copy), SetUserRobuxModule (copy), Logging (copy)
	if type(Text) ~= "string" then
		error("ApiFetchEconomyCurrency thunk expects userId to be a string")
	end
	return PerformFetch.Single("com.roblox.economy.users." .. Text .. ".currency", function(p3)
		-- upvalues: Text (copy), p2 (copy), PromiseModule (upval), EconomyGetCurrencyModule (upval), p1 (copy), SetUserRobuxModule (upval), Logging (upval)
		local UserRobuxEntry = p3:getState().UserRobux[Text]
		
		return if p2 or UserRobuxEntry == nil then EconomyGetCurrencyModule(p1, Text):andThen(function(Result)
			-- upvalues: p3 (copy), SetUserRobuxModule (upval), Text (upval), Logging (upval), PromiseModule (upval)
			local ResponseBody = Result.responseBody
			
			if ResponseBody == nil or ResponseBody.robux == nil then
				Logging.warn("Response from EconomyGetCurrency is malformed!")
				
				return PromiseModule.reject({ HttpError = Enum.HttpError.OK })
			else
				p3:dispatch(SetUserRobuxModule(Text, ResponseBody.robux))
				
				return Result
			end
		end):catch(function(Err)
			-- upvalues: Logging (upval), PromiseModule (upval)
			Logging.warn("Failed to fetch user currency: " .. tostring(Err))
			
			return PromiseModule.reject({ HttpError = Enum.HttpError.OK })
		end) else PromiseModule.resolve()
	end)
end