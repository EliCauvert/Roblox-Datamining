local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local promiseModule = require(parent.Promise)
local logoutAllLoggedInUsersRequestModule = require(authCommon.Http.Requests.LogoutAllLoggedInUsersRequest)
local getLoggedInUsersMetadataRequestModule = require(authCommon.Http.Requests.GetLoggedInUsersMetadataRequest)
local fFlagEnableLuaAccountSwitch = require(parent.SharedFlags).FFlagEnableLuaAccountSwitch
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local recordSignOutModule = require(authCommon.Utils.recordSignOut)

local function recordSignOutOnLogoutAll(value, p0)
	-- upvalues: getLoggedInUsersMetadataRequestModule (ref), recordSignOutModule (ref)
	local var7, var8 = getLoggedInUsersMetadataRequestModule(value, p0):await()
	
	if var7 and var8 and (var8.responseBody and var8.responseBody.logged_in_users_metadata) then
		for i, v in ipairs(var8.responseBody.logged_in_users_metadata) do
			pcall(function()
				-- upvalues: recordSignOutModule (copy), v (ref)
				recordSignOutModule(v, true)
			end)
		end
	end
end

return function(p1, _)
	-- upvalues: fFlagEnableLuaAccountSwitch (ref), promiseModule (ref), appStorageUtilitiesModule (ref), recordSignOutOnLogoutAll (ref), logoutAllLoggedInUsersRequestModule (ref)
	if fFlagEnableLuaAccountSwitch then
		local accountBlob = appStorageUtilitiesModule.getAccountBlob()
		pcall(recordSignOutOnLogoutAll, p1, accountBlob)
		appStorageUtilitiesModule.setAccountBlob("")
		appStorageUtilitiesModule.flush()
		
		return logoutAllLoggedInUsersRequestModule(p1, accountBlob):andThen(function(p3)
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve(p3.responseBody)
		end):catch(function(p2)
			-- upvalues: promiseModule (copy)
			return if p2.data then promiseModule.reject(p2.data.errorCode) elseif p2.StatusCode then promiseModule.reject({ p2.StatusCode }) else promiseModule.reject()
		end)
	end
	return promiseModule.resolve()
end