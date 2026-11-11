local AccountSwitching = script:FindFirstAncestor("AccountSwitching")
local Parent = AccountSwitching.Parent
local PromiseModule = require(Parent.Promise)
local GetLoggedInUsersMetadataModule = require(AccountSwitching.Thunks.GetLoggedInUsersMetadata)
local FFlagEnableLuaAccountSwitch = require(Parent.SharedFlags).FFlagEnableLuaAccountSwitch
local AppStorageUtilities = require(Parent.AuthCommon).Utils.AppStorageUtilities

return function(p1, p2)
	-- upvalues: FFlagEnableLuaAccountSwitch (copy), PromiseModule (copy), AppStorageUtilities (copy), GetLoggedInUsersMetadataModule (copy)
	return if FFlagEnableLuaAccountSwitch then GetLoggedInUsersMetadataModule(p1, FFlagEnableLuaAccountSwitch and AppStorageUtilities.getAccountBlob() or "", not p2):andThen(function(Result)
		-- upvalues: FFlagEnableLuaAccountSwitch (upval), AppStorageUtilities (upval), PromiseModule (upval)
		if FFlagEnableLuaAccountSwitch then
			AppStorageUtilities.setAccountBlob(Result.responseBody.encrypted_users_data_blob)
			AppStorageUtilities.flush()
		end
		return PromiseModule.resolve(Result.responseBody)
	end):catch(function(Err)
		-- upvalues: PromiseModule (upval)
		return if Err.data then PromiseModule.reject(Err.data.errorCode) elseif Err.StatusCode then PromiseModule.reject({ Err.StatusCode }) else PromiseModule.reject()
	end) else PromiseModule.resolve()
end