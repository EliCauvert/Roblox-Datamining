local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local PromiseModule = require(Parent.Promise)
local LogoutAllLoggedInUsersRequestModule = require(AuthCommon.Http.Requests.LogoutAllLoggedInUsersRequest)
local GetLoggedInUsersMetadataRequestModule = require(AuthCommon.Http.Requests.GetLoggedInUsersMetadataRequest)
local FFlagEnableLuaAccountSwitch = require(Parent.SharedFlags).FFlagEnableLuaAccountSwitch
local AppStorageUtilitiesModule = require(AuthCommon.Utils.AppStorageUtilities)
local RecordSignOutModule = require(AuthCommon.Utils.recordSignOut)

local function recordSignOutOnLogoutAll(p1, p2)
	-- upvalues: GetLoggedInUsersMetadataRequestModule (copy), RecordSignOutModule (copy)
	local v1, v2 = GetLoggedInUsersMetadataRequestModule(p1, p2):await()
	
	if v1 and v2 and v2.responseBody and v2.responseBody.logged_in_users_metadata then
		for _, value in ipairs(v2.responseBody.logged_in_users_metadata) do
			pcall(function()
				-- upvalues: RecordSignOutModule (upval), value (copy)
				RecordSignOutModule(value, true)
			end)
		end
	end
end

return function(p3, _)
	-- upvalues: FFlagEnableLuaAccountSwitch (copy), PromiseModule (copy), AppStorageUtilitiesModule (copy), recordSignOutOnLogoutAll (copy), LogoutAllLoggedInUsersRequestModule (copy)
	if FFlagEnableLuaAccountSwitch then
		local AccountBlob = AppStorageUtilitiesModule.getAccountBlob()
		pcall(recordSignOutOnLogoutAll, p3, AccountBlob)
		AppStorageUtilitiesModule.setAccountBlob("")
		AppStorageUtilitiesModule.flush()
		
		return LogoutAllLoggedInUsersRequestModule(p3, AccountBlob):andThen(function(Result)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve(Result.responseBody)
		end):catch(function(Err)
			-- upvalues: PromiseModule (upval)
			return if Err.data then PromiseModule.reject(Err.data.errorCode) elseif Err.StatusCode then PromiseModule.reject({ Err.StatusCode }) else PromiseModule.reject()
		end)
	else
		return PromiseModule.resolve()
	end
end