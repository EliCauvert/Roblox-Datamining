local Parent = script:FindFirstAncestor("AuthCommon").Parent
local HttpService = game:GetService("HttpService")
local PromiseModule = require(Parent.Promise)
local Url = require(Parent.Http).Url

local function _(): string
	-- upvalues: Url (copy)
	return string.format("%sv2/user/passwords/change", Url.AUTH_URL)
end

return function(Callback, NewPassword)
	-- upvalues: HttpService (copy), Url (copy), PromiseModule (copy)
	return Callback(string.format("%sv2/user/passwords/change", Url.AUTH_URL), "POST", {
		postBody = HttpService:JSONEncode({ currentPassword = nil, newPassword = NewPassword })
	}):andThen(function(Result)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(Result)
	end, function(p1)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.reject(p1)
	end)
end