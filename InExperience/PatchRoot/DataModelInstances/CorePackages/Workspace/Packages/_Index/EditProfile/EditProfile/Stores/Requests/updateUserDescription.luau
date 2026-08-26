local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local httpModule = require(parent.Http)
local httpRequestModule = require(parent.HttpRequest)
local promiseModule = require(parent.Promise)
local enumsModule = require(editProfile.Common.Enums)
local httpService = game:GetService("HttpService")
local url = httpModule.Url
local var1 = httpRequestModule.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
	end
})

return function(p1)
	-- upvalues: url (ref), var1 (ref), enumsModule (ref), httpService (ref), promiseModule (ref)
	return var1(string.format("%s/description", url.USERS_URL), enumsModule.RequestMethods.POST, { postBody = httpService:JSONEncode({ description = p1 }) }):andThen(function(p2)
		-- upvalues: p1 (ref)
		return if p2.responseBody then p2.responseBody.description else p1
	end):catch(function(p2)
		-- upvalues: httpService (copy), promiseModule (copy)
		if not p2 then
			return promiseModule.reject(p2)
		end
		local t = { statusCode = p2.StatusCode, errors = {} }
		
		if p2.Body then
			local ok, status = pcall(function()
				-- upvalues: httpService (copy), p2 (ref)
				return httpService:JSONDecode(p2.Body)
			end)
			
			if ok and status and status.errors then
				t.errors = status.errors
			end
		end
		return promiseModule.reject(t)
	end)
end