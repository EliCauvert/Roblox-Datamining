local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local httpModule = require(parent.Http)
local httpRequestModule = require(parent.HttpRequest)
local promiseModule = require(parent.Promise)
local enumsModule = require(editProfile.Common.Enums)
local httpService = game:GetService("HttpService")
local url = httpModule.Url
local var6 = httpRequestModule.config({
	requestFunction = function(p0, p1, p2)
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.RequestInternal(p0, p1, p2)
	end
})

return function(p3, p4)
	-- upvalues: url (ref), httpService (ref), var6 (ref), enumsModule (ref), promiseModule (ref)
	return var6(string.format("%s?displayName=%s", string.format("%s/users/%s/display-names/validate", url.USERS_URL, p3), httpService:UrlEncode(p4)), enumsModule.RequestMethods.GET):andThen(function(p6)
		return p6.responseBody or {}
	end):catch(function(p5)
		-- upvalues: httpService (copy), promiseModule (copy)
		if not p5 then
			return promiseModule.reject(p5)
		end
		local t = { statusCode = p5.StatusCode, errors = {} }
		
		if p5.Body then
			local ok, status = pcall(function()
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