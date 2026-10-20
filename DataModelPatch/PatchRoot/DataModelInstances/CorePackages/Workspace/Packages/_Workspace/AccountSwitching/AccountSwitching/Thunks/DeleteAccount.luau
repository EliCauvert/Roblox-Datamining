local Parent = script:FindFirstAncestor("AccountSwitching").Parent
local HttpService = game:GetService("HttpService")
local AuthCommonModule = require(Parent.AuthCommon)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local PromiseModule = require(Parent.Promise)
local AppStorageUtilities = AuthCommonModule.Utils.AppStorageUtilities
local RecordSignOutFunction = AuthCommonModule.Utils.recordSignOut
local PathsModule = require(script.Parent.Paths)

return function(Callback, p1)
	-- upvalues: AppStorageUtilities (copy), PromiseModule (copy), UrlBuilder (copy), PathsModule (copy), HttpService (copy), RecordSignOutFunction (copy)
	local AccountBlob = AppStorageUtilities.getAccountBlob()
	
	return if p1.user_id and AccountBlob then Callback(UrlBuilder.fromString(PathsModule.DeleteAccount)(), "POST", {
		postBody = HttpService:JSONEncode({
			deleted_user_id = p1.user_id,
			encrypted_users_data_blob = AccountBlob
		})
	}):andThen(function(Result)
		-- upvalues: AppStorageUtilities (upval), RecordSignOutFunction (upval), p1 (copy), PromiseModule (upval)
		if Result and Result.responseBody and Result.responseBody.encrypted_users_data_blob then
			AppStorageUtilities.setAccountBlob(Result.responseBody.encrypted_users_data_blob)
			AppStorageUtilities.flush()
			pcall(function()
				-- upvalues: RecordSignOutFunction (upval), p1 (upval)
				RecordSignOutFunction(p1)
			end)
			
			return PromiseModule.resolve(Result.responseBody)
		else
			return PromiseModule.reject()
		end
	end):catch(function(Err)
		-- upvalues: PromiseModule (upval)
		return if Err.data then PromiseModule.reject(Err.data.errorCode) elseif Err.StatusCode then PromiseModule.reject({ Err.StatusCode }) else PromiseModule.reject()
	end) else PromiseModule.reject("invalid payload")
end