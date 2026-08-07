local authCommon = script:FindFirstAncestor("AuthCommon")
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local getUserAppLaunchInfoModule = require(authCommon.Http.Requests.GetUserAppLaunchInfo)
local promiseModule = require(authCommon.Parent.Promise)
local appStorageService = game:GetService("AppStorageService")

return function(p0) --[[ line: 8 ]]
	-- upvalues: promiseModule (ref), getUserAppLaunchInfoModule (ref), appStorageUtilitiesModule (ref), appStorageService (ref)
	local _, var5 = promiseModule.new(function(p1) --[[ line: 9 ]]
		-- upvalues: getUserAppLaunchInfoModule (copy), p0 (ref), appStorageUtilitiesModule (copy), appStorageService (copy)
		getUserAppLaunchInfoModule(p0):andThen(function(p2) --[[ line: 10 ]]
			-- upvalues: appStorageUtilitiesModule (copy), appStorageService (copy), p1 (ref)
			if p2 and p2.responseBody then
				local name = p2.responseBody.name
				appStorageUtilitiesModule.setIncompleteSignupUserId(tostring(p2.responseBody.id))
				appStorageUtilitiesModule.setIncompleteSignupUsername(name)
				appStorageService:Flush()
			end
			p1(true)
		end):catch(function(_) --[[ line: 19 ]]
			-- upvalues: p1 (ref)
			p1(false)
		end)
	end):await()
	
	return var5
end