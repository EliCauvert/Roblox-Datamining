local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local httpModule = require(parent.Http)
local httpRequestModule = require(parent.HttpRequest)
local promiseModule = require(parent.Promise)
local httpService = game:GetService("HttpService")
local url = httpModule.Url
local enumsModule = require(editProfile.Common.Enums)
local var6 = httpRequestModule.config({
	requestFunction = function(p0, p1, p2) --[[ line: 16 ]]
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.RequestInternal(p0, p1, p2)
	end
})

return function(p3, p4) --[[ line: 21 | named "updateUserDisplayName" ]]
	-- upvalues: url (ref), var6 (ref), enumsModule (ref), httpService (ref), promiseModule (ref)
	return var6(string.format("%s/users/%s/display-names", url.USERS_URL, p3), enumsModule.RequestMethods.PATCH, {
		postBody = httpService:JSONEncode({ newDisplayName = p4 })
	}):andThen(function(p6) --[[ line: 29 ]]
		-- upvalues: p4 (ref)
		return if p6.responseBody then p6.responseBody.displayName else p4
	end):catch(function(p5) --[[ line: 32 ]]
		-- upvalues: httpService (copy), promiseModule (copy)
		if not p5 then
			return promiseModule.reject(p5)
		end
		local t = { statusCode = p5.StatusCode, errors = {} }
		
		if p5.Body then
			local ok, status = pcall(function() --[[ line: 39 ]]
				-- upvalues: httpService (copy), p5 (ref)
				return httpService:JSONDecode(p5.Body)
			end)
			
			if ok and status and status.errors then
				t.errors = status.errors
			end
		end
		return promiseModule.reject(t)
	end)
end