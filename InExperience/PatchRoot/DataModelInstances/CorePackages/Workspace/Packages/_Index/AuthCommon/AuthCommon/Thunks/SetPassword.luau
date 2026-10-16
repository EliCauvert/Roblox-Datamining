local Parent = script:FindFirstAncestor("AuthCommon").Parent
local HttpService = game:GetService("HttpService")
local PromiseModule = require(Parent.Promise)
local Url = require(Parent.Http).Url

local function _(): string --[[ Line: 10 | Named "getChangePasswordUrl" ]]
	-- upvalues: Url (copy)
	return string.format("%sv2/user/passwords/change", Url.AUTH_URL)
end

return function(Callback, NewPassword) --[[ Line: 22 ]]
	-- upvalues: HttpService (copy), Url (copy), PromiseModule (copy)
	return Callback(string.format("%sv2/user/passwords/change", Url.AUTH_URL), "POST", {
		postBody = HttpService:JSONEncode({ currentPassword = nil, newPassword = NewPassword })
	}):andThen(function(Result) --[[ Line: 24 ]]
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(Result)
	end, function(p1) --[[ Line: 26 ]]
		-- upvalues: PromiseModule (upval)
		return PromiseModule.reject(p1)
	end)
end