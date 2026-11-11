local AuthCommon = script:FindFirstAncestor("AuthCommon")
local AppStorageUtilitiesModule = require(AuthCommon.Utils.AppStorageUtilities)
local GetUserAppLaunchInfoModule = require(AuthCommon.Http.Requests.GetUserAppLaunchInfo)
local PromiseModule = require(AuthCommon.Parent.Promise)
local AppStorageService = game:GetService("AppStorageService")

return function(p1)
	-- upvalues: PromiseModule (copy), GetUserAppLaunchInfoModule (copy), AppStorageUtilitiesModule (copy), AppStorageService (copy)
	local _, v1 = PromiseModule.new(function(Callback)
		-- upvalues: GetUserAppLaunchInfoModule (upval), p1 (copy), AppStorageUtilitiesModule (upval), AppStorageService (upval)
		GetUserAppLaunchInfoModule(p1):andThen(function(Result)
			-- upvalues: AppStorageUtilitiesModule (upval), AppStorageService (upval), Callback (copy)
			if Result and Result.responseBody then
				local Name = Result.responseBody.name
				AppStorageUtilitiesModule.setIncompleteSignupUserId((tostring(Result.responseBody.id)))
				AppStorageUtilitiesModule.setIncompleteSignupUsername(Name)
				AppStorageService:Flush()
			end
			Callback(true)
		end):catch(function(_)
			-- upvalues: Callback (copy)
			Callback(false)
		end)
	end):await()
	
	return v1
end