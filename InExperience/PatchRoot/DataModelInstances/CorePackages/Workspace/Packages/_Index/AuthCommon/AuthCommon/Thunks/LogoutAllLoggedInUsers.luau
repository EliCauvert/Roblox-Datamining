local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local promiseModule = require(parent.Promise)
local logoutAllLoggedInUsersRequestModule = require(authCommon.Http.Requests.LogoutAllLoggedInUsersRequest)
local getLoggedInUsersMetadataRequestModule = require(authCommon.Http.Requests.GetLoggedInUsersMetadataRequest)
local fFlagEnableLuaAccountSwitch = require(parent.SharedFlags).FFlagEnableLuaAccountSwitch
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local recordSignOutModule = require(authCommon.Utils.recordSignOut)

local function recordSignOutOnLogoutAll(value, p1)
	-- upvalues: getLoggedInUsersMetadataRequestModule (ref), recordSignOutModule (ref)
	local var1, var2 = getLoggedInUsersMetadataRequestModule(value, p1):await()
	
	if var1 and var2 and (var2.responseBody and var2.responseBody.logged_in_users_metadata) then
		for i, v in ipairs(var2.responseBody.logged_in_users_metadata) do
			pcall(function()
				-- upvalues: recordSignOutModule (copy), v (ref)
				recordSignOutModule(v, true)
			end)
		end
	end
end

return function(p2, _)
	-- upvalues: fFlagEnableLuaAccountSwitch (ref), promiseModule (ref), appStorageUtilitiesModule (ref), recordSignOutOnLogoutAll (ref), logoutAllLoggedInUsersRequestModule (ref)
	if fFlagEnableLuaAccountSwitch then
		local accountBlob = appStorageUtilitiesModule.getAccountBlob()
		pcall(recordSignOutOnLogoutAll, p2, accountBlob)
		appStorageUtilitiesModule.setAccountBlob("")
		appStorageUtilitiesModule.flush()
		
		return logoutAllLoggedInUsersRequestModule(p2, accountBlob):andThen(function(p3)
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve(p3.responseBody)
		end):catch(function(p3)
			-- upvalues: promiseModule (copy)
			return if p3.data then promiseModule.reject(p3.data.errorCode) elseif p3.StatusCode then promiseModule.reject({ p3.StatusCode }) else promiseModule.reject()
		end)
	end
	return promiseModule.resolve()
end