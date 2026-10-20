local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local GetLoggedInUsersMetadataModule = require(Modules.LuaApp.Http.Requests.AccountSwitcher.GetLoggedInUsersMetadata)
local FFlagEnableLuaAccountSwitchModule = require(Modules.LuaApp.Flags.FFlagEnableLuaAccountSwitch)
local AppStorageUtilitiesModule = require(Modules.LuaApp.Thunks.Authentication.AppStorageUtilities)
local CorePackages = game:GetService("CorePackages")

return if game:DefineFastFlag("EnablePackageGetAccountsList1", false) then require(CorePackages.Workspace.Packages.AccountSwitching).GetAccountsList else function(p1, p2)
	-- upvalues: FFlagEnableLuaAccountSwitchModule (copy), PromiseModule (copy), AppStorageUtilitiesModule (copy), GetLoggedInUsersMetadataModule (copy)
	return if FFlagEnableLuaAccountSwitchModule then GetLoggedInUsersMetadataModule(p1, FFlagEnableLuaAccountSwitchModule and AppStorageUtilitiesModule.getAccountBlob() or "", not p2):andThen(function(Result)
		-- upvalues: FFlagEnableLuaAccountSwitchModule (upval), AppStorageUtilitiesModule (upval), PromiseModule (upval)
		if FFlagEnableLuaAccountSwitchModule then
			AppStorageUtilitiesModule.setAccountBlob(Result.responseBody.encrypted_users_data_blob)
			AppStorageUtilitiesModule.flush()
		end
		return PromiseModule.resolve(Result.responseBody)
	end):catch(function(Err)
		-- upvalues: PromiseModule (upval)
		return if Err.data then PromiseModule.reject(Err.data.errorCode) elseif Err.StatusCode then PromiseModule.reject({ Err.StatusCode }) else PromiseModule.reject()
	end) else PromiseModule.resolve()
end