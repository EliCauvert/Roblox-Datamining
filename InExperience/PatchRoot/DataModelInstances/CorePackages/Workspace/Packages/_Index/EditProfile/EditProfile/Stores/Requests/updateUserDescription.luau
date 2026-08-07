local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local httpModule = require(parent.Http)
local httpRequestModule = require(parent.HttpRequest)
local promiseModule = require(parent.Promise)
local enumsModule = require(editProfile.Common.Enums)
local httpService = game:GetService("HttpService")
local url = httpModule.Url
local var6 = httpRequestModule.config({
	requestFunction = function(p0, p1, p2) --[[ line: 15 ]]
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.RequestInternal(p0, p1, p2)
	end
})

return function(p3) --[[ line: 20 | named "updateUserDescription" ]]
	-- upvalues: url (ref), var6 (ref), enumsModule (ref), httpService (ref), promiseModule (ref)
	return var6(string.format("%s/description", url.USERS_URL), enumsModule.RequestMethods.POST, { postBody = httpService:JSONEncode({ description = p3 }) }):andThen(function(p5) --[[ line: 28 ]]
		-- upvalues: p3 (ref)
		return if p5.responseBody then p5.responseBody.description else p3
	end):catch(function(p4) --[[ line: 31 ]]
		-- upvalues: httpService (copy), promiseModule (copy)
		if not p4 then
			return promiseModule.reject(p4)
		end
		local t = { statusCode = p4.StatusCode, errors = {} }
		
		if p4.Body then
			local ok, status = pcall(function() --[[ line: 38 ]]
				-- upvalues: httpService (copy), p4 (ref)
				return httpService:JSONDecode(p4.Body)
			end)
			
			if ok and status and status.errors then
				t.errors = status.errors
			end
		end
		return promiseModule.reject(t)
	end)
end