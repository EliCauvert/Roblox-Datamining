local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local PostVerifiedSignupChallengeModule = require(Modules.LuaApp.Http.Requests.PostVerifiedSignupChallenge)
local PhoneNumberVerificationErrorCodesModule = require(Modules.LuaApp.Enum.PhoneNumberVerificationErrorCodes)

return function(p1, p2)
	-- upvalues: PostVerifiedSignupChallengeModule (copy), HttpService (copy), PhoneNumberVerificationErrorCodesModule (copy), PromiseModule (copy)
	return PostVerifiedSignupChallengeModule(p1, p2):andThen(function(Entry)
		return { challenge = Entry[1].challenge }
	end, function(p3)
		-- upvalues: HttpService (upval), PhoneNumberVerificationErrorCodesModule (upval), PromiseModule (upval)
		local Data = HttpService:JSONDecode(p3.Body)
		
		return if Data.errors[1].code == PhoneNumberVerificationErrorCodesModule.TooManyAttempts then PromiseModule.reject("Authentication.TwoStepVerification.Response.TooManyAttempts") elseif Data.errors[1].code == PhoneNumberVerificationErrorCodesModule.PhoneNumberAlreadyLinked then PromiseModule.reject("Authentication.SignUp.Response.PhoneNumberAlreadyLinked") elseif Data.errors[1].code == PhoneNumberVerificationErrorCodesModule.InvalidPhoneNumber then PromiseModule.reject("Authentication.SignUp.Response.InvalidPhoneNumber") else PromiseModule.reject("")
	end)
end