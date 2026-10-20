local HttpService = game:GetService("HttpService")
local PhoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local PromiseModule = require(PhoneUpsell.Parent.Promise)
local PostVerifyPhoneCodeModule = require(PhoneUpsell.Http.Requests.PostVerifyPhoneCode)

return function(p1, p2)
	-- upvalues: PostVerifyPhoneCodeModule (copy), PromiseModule (copy), HttpService (copy)
	return function()
		-- upvalues: PostVerifyPhoneCodeModule (upval), p1 (copy), p2 (copy), PromiseModule (upval), HttpService (upval)
		return PostVerifyPhoneCodeModule(p1, p2):andThen(function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve()
		end, function(p3)
			-- upvalues: HttpService (upval), PromiseModule (upval)
			return PromiseModule.reject({
				ErrorCode = if p3.Body then HttpService:JSONDecode(p3.Body).errors[1].code else 0
			})
		end)
	end
end