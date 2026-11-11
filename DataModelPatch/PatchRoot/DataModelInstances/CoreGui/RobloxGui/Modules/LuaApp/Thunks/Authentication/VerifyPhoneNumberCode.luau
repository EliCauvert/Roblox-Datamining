local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local PostVerifyPhoneNumberModule = require(Modules.LuaApp.Http.Requests.PostVerifyPhoneNumber)
local PhoneNumberVerificationErrorCodesModule = require(Modules.LuaApp.Enum.PhoneNumberVerificationErrorCodes)

return function(p1, p2, p3)
	-- upvalues: PostVerifyPhoneNumberModule (copy), HttpService (copy), PhoneNumberVerificationErrorCodesModule (copy), PromiseModule (copy)
	return function(_)
		-- upvalues: PostVerifyPhoneNumberModule (upval), p1 (copy), p2 (copy), p3 (copy), HttpService (upval), PhoneNumberVerificationErrorCodesModule (upval), PromiseModule (upval)
		return PostVerifyPhoneNumberModule(p1, p2, p3):andThen(function(Entry)
			return { voucher = Entry[1].voucher }
		end, function(p4)
			-- upvalues: HttpService (upval), PhoneNumberVerificationErrorCodesModule (upval), PromiseModule (upval)
			local Data = HttpService:JSONDecode(p4.Body)
			
			return if Data.errors[1].code == PhoneNumberVerificationErrorCodesModule.InvalidCode then PromiseModule.reject("Authentication.TwoStepVerification.Label.InvalidCode") elseif Data.errors[1].code == PhoneNumberVerificationErrorCodesModule.TooManyAttempts then PromiseModule.reject("Authentication.TwoStepVerification.Response.TooManyAttempts") else PromiseModule.reject("")
		end)
	end
end