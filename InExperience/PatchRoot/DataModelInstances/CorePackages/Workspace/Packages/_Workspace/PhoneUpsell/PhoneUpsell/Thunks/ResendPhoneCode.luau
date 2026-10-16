local HttpService = game:GetService("HttpService")
local PhoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local PromiseModule = require(PhoneUpsell.Parent.Promise)
local PostResendPhoneCodeModule = require(PhoneUpsell.Http.Requests.PostResendPhoneCode)

return function(p1) --[[ Line: 14 ]]
	-- upvalues: PostResendPhoneCodeModule (copy), PromiseModule (copy), HttpService (copy)
	return function() --[[ Line: 15 ]]
		-- upvalues: PostResendPhoneCodeModule (upval), p1 (copy), PromiseModule (upval), HttpService (upval)
		return PostResendPhoneCodeModule(p1):andThen(function(_) --[[ Line: 16 ]]
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve()
		end, function(p2) --[[ Line: 18 ]]
			-- upvalues: HttpService (upval), PromiseModule (upval)
			return PromiseModule.reject({
				ErrorCode = if p2.Body then HttpService:JSONDecode(p2.Body).errors[1].code else 0
			})
		end)
	end
end