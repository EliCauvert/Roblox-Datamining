local parent = script:FindFirstAncestor("AuthCommon").Parent
local httpService = game:GetService("HttpService")
local promiseModule = require(parent.Promise)
local url = require(parent.Http).Url

local function _()
	-- upvalues: url (ref)
	return string.format("%sv2/user/passwords/change", url.AUTH_URL)
end

return function(p1, p2)
	-- upvalues: httpService (ref), url (ref), promiseModule (ref)
	return p1(string.format("%sv2/user/passwords/change", url.AUTH_URL), "POST", {
		postBody = httpService:JSONEncode({ currentPassword = nil, newPassword = p2 })
	}):andThen(function(p3)
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(p3)
	end, function(p3)
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p3)
	end)
end