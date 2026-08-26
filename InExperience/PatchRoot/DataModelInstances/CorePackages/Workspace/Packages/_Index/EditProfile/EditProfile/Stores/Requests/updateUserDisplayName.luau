local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local httpModule = require(parent.Http)
local httpRequestModule = require(parent.HttpRequest)
local promiseModule = require(parent.Promise)
local httpService = game:GetService("HttpService")
local url = httpModule.Url
local enumsModule = require(editProfile.Common.Enums)
local var1 = httpRequestModule.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
	end
})

return function(p1, p2)
	-- upvalues: url (ref), var1 (ref), enumsModule (ref), httpService (ref), promiseModule (ref)
	return var1(string.format("%s/users/%s/display-names", url.USERS_URL, p1), enumsModule.RequestMethods.PATCH, {
		postBody = httpService:JSONEncode({ newDisplayName = p2 })
	}):andThen(function(p3)
		-- upvalues: p2 (ref)
		return if p3.responseBody then p3.responseBody.displayName else p2
	end):catch(function(p3)
		-- upvalues: httpService (copy), promiseModule (copy)
		if not p3 then
			return promiseModule.reject(p3)
		end
		local t = { statusCode = p3.StatusCode, errors = {} }
		
		if p3.Body then
			local ok, status = pcall(function()
				-- upvalues: httpService (copy), p3 (ref)
				return httpService:JSONDecode(p3.Body)
			end)
			
			if ok and status and status.errors then
				t.errors = status.errors
			end
		end
		return promiseModule.reject(t)
	end)
end