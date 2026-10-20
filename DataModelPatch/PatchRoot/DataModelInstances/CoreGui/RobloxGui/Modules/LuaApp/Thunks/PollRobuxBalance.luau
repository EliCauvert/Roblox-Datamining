local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local SetUserRobuxModule = require(Modules.LuaApp.Actions.SetUserRobux)
local EconomyGetCurrencyModule = require(Modules.LuaApp.Http.Requests.EconomyGetCurrency)
local LuaAppPollRobuxBalanceAttempts = game:DefineFastInt("LuaAppPollRobuxBalanceAttempts", 7)
local LuaAppPollRobuxBalanceIntervalSec = game:DefineFastInt("LuaAppPollRobuxBalanceIntervalSec", 2)

local function PollRobuxBalance(p1, p2, p3, Robux, Callback, LuaAppPollRobuxBalanceAttempts)
	-- upvalues: EconomyGetCurrencyModule (copy), Logging (copy), SetUserRobuxModule (copy), LuaAppPollRobuxBalanceIntervalSec (copy), PollRobuxBalance (copy)
	return EconomyGetCurrencyModule(p2, p3):andThen(function(Result)
		-- upvalues: Logging (upval), Callback (copy), Robux (copy), p1 (copy), SetUserRobuxModule (upval), p3 (copy), LuaAppPollRobuxBalanceAttempts (copy), LuaAppPollRobuxBalanceIntervalSec (upval), PollRobuxBalance (upval), p2 (copy)
		local ResponseBody = Result.responseBody
		
		if ResponseBody == nil or ResponseBody.robux == nil then
			Logging.warn("Response from EconomyGetCurrency is malformed!")
			Callback(Robux)
			
			return
		end
		local Robux1 = ResponseBody.robux
		
		if Robux1 ~= Robux then
			p1:dispatch(SetUserRobuxModule(p3, Robux1))
			Callback(Robux1)
			
			return
		end
		if LuaAppPollRobuxBalanceAttempts > 0 then
			delay(LuaAppPollRobuxBalanceIntervalSec, function()
				-- upvalues: PollRobuxBalance (upval), p1 (upval), p2 (upval), p3 (upval), Robux (upval), Callback (upval), LuaAppPollRobuxBalanceAttempts (upval)
				PollRobuxBalance(p1, p2, p3, Robux, Callback, LuaAppPollRobuxBalanceAttempts - 1)
			end)
			
			return
		else
			Callback(Robux)
		end
	end):catch(function()
		-- upvalues: Callback (copy), Robux (copy)
		Callback(Robux)
	end)
end

return function(p1, Text, p2, p3)
	-- upvalues: PerformFetch (copy), PollRobuxBalance (copy), LuaAppPollRobuxBalanceAttempts (copy)
	return PerformFetch.Single("com.roblox.economy.users." .. Text .. ".currency.poll", function(p4)
		-- upvalues: PollRobuxBalance (upval), p1 (copy), Text (copy), p2 (copy), p3 (copy), LuaAppPollRobuxBalanceAttempts (upval)
		return PollRobuxBalance(p4, p1, Text, p2, p3, LuaAppPollRobuxBalanceAttempts)
	end)
end