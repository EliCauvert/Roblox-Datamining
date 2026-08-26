local authCommon = script:FindFirstAncestor("AuthCommon")
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local getUserAppLaunchInfoModule = require(authCommon.Http.Requests.GetUserAppLaunchInfo)
local promiseModule = require(authCommon.Parent.Promise)
local appStorageService = game:GetService("AppStorageService")

return function(p1)
	-- upvalues: promiseModule (ref), getUserAppLaunchInfoModule (ref), appStorageUtilitiesModule (ref), appStorageService (ref)
	local _, var1 = promiseModule.new(function(p2)
		-- upvalues: getUserAppLaunchInfoModule (copy), p1 (ref), appStorageUtilitiesModule (copy), appStorageService (copy)
		getUserAppLaunchInfoModule(p1):andThen(function(p3)
			-- upvalues: appStorageUtilitiesModule (copy), appStorageService (copy), p2 (ref)
			if p3 and p3.responseBody then
				local name = p3.responseBody.name
				appStorageUtilitiesModule.setIncompleteSignupUserId(tostring(p3.responseBody.id))
				appStorageUtilitiesModule.setIncompleteSignupUsername(name)
				appStorageService:Flush()
			end
			p2(true)
		end):catch(function(_)
			-- upvalues: p2 (ref)
			p2(false)
		end)
	end):await()
	
	return var1
end