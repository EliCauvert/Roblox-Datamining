local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseUtilitiesModule = require(Modules.LuaApp.PromiseUtilities)
local ApiFetchAccountSettingsEmailModule = require(Modules.LuaApp.Thunks.ApiFetchAccountSettingsEmail)
local ApiFetchPasswordStatusModule = require(Modules.LuaApp.Thunks.ApiFetchPasswordStatus)
local ApiFetchFriendRequestsCountModule = require(Modules.LuaApp.Thunks.ApiFetchFriendRequestsCount)
local ApiFetchUnreadMessageCountModule = require(Modules.LuaApp.Thunks.ApiFetchUnreadMessageCount)
local ApiFetchUnreadNotificationCountModule = require(Modules.LuaApp.Thunks.ApiFetchUnreadNotificationCount)
local FFlagEnablePasswordStatusRemovalModule = require(Modules.LuaApp.Flags.FFlagEnablePasswordStatusRemoval)

return function(p1)
	-- upvalues: ApiFetchAccountSettingsEmailModule (copy), FFlagEnablePasswordStatusRemovalModule (copy), ApiFetchPasswordStatusModule (copy), ApiFetchFriendRequestsCountModule (copy), ApiFetchUnreadMessageCountModule (copy), ApiFetchUnreadNotificationCountModule (copy), PromiseUtilitiesModule (copy)
	return function(p2)
		-- upvalues: ApiFetchAccountSettingsEmailModule (upval), p1 (copy), FFlagEnablePasswordStatusRemovalModule (upval), ApiFetchPasswordStatusModule (upval), ApiFetchFriendRequestsCountModule (upval), ApiFetchUnreadMessageCountModule (upval), ApiFetchUnreadNotificationCountModule (upval), PromiseUtilitiesModule (upval)
		local DispatchResults = {}
		table.insert(DispatchResults, p2:dispatch(ApiFetchAccountSettingsEmailModule(p1)))
		
		if not FFlagEnablePasswordStatusRemovalModule then
			table.insert(DispatchResults, p2:dispatch(ApiFetchPasswordStatusModule(p1)))
		end
		table.insert(DispatchResults, p2:dispatch(ApiFetchFriendRequestsCountModule(p1)))
		table.insert(DispatchResults, p2:dispatch(ApiFetchUnreadMessageCountModule(p1)))
		table.insert(DispatchResults, p2:dispatch(ApiFetchUnreadNotificationCountModule(p1)))
		
		return PromiseUtilitiesModule.Batch(DispatchResults):andThen(function(Result)
			-- upvalues: PromiseUtilitiesModule (upval), DispatchResults (copy)
			local FailureCount = PromiseUtilitiesModule.CountResults(Result).failureCount
			
			if FailureCount ~= 0 then
				warn(string.format("%d of %d notification count fetching failed!", FailureCount, #DispatchResults))
			end
		end)
	end
end