local Parent = script.Parent.Parent
local Promise = require(Parent.dependencies).Promise
local PostResendCodeModule = require(Parent.Requests.PostResendCode)
local _ = require(Parent.Common.otpLoginTypes)
local GetFFlagOtpLoginParseJsonErrorBodyModule = require(Parent.Flags.GetFFlagOtpLoginParseJsonErrorBody)
local ParseOtpErrorBodyModule = require(Parent.Utils.parseOtpErrorBody)
local ResendCodeCheckBodyForOtpErrors = game:DefineFastFlag("ResendCodeCheckBodyForOtpErrors", false)

return function(p1, p2)
	-- upvalues: PostResendCodeModule (copy), Promise (copy), GetFFlagOtpLoginParseJsonErrorBodyModule (copy), ParseOtpErrorBodyModule (copy), ResendCodeCheckBodyForOtpErrors (copy)
	return function()
		-- upvalues: PostResendCodeModule (upval), p1 (copy), p2 (copy), Promise (upval), GetFFlagOtpLoginParseJsonErrorBodyModule (upval), ParseOtpErrorBodyModule (upval), ResendCodeCheckBodyForOtpErrors (upval)
		return PostResendCodeModule(p1, p2):andThen(function(Result)
			-- upvalues: Promise (upval)
			return Promise.resolve(Result.responseBody)
		end):catch(function(Err)
			-- upvalues: Promise (upval), GetFFlagOtpLoginParseJsonErrorBodyModule (upval), ParseOtpErrorBodyModule (upval), ResendCodeCheckBodyForOtpErrors (upval)
			if Err.data then
				return Promise.reject(Err.data.errorCode)
			end
			if GetFFlagOtpLoginParseJsonErrorBodyModule() then
				local ParseOtpErrorBodyModuleResult = ParseOtpErrorBodyModule(Err.Body)
				
				if ParseOtpErrorBodyModuleResult then
					return Promise.reject(ParseOtpErrorBodyModuleResult)
				end
			end
			return if ResendCodeCheckBodyForOtpErrors and Err.Body and (type(Err.Body) == "number" or tonumber(Err.Body) ~= nil) then Promise.reject(Err.Body) elseif Err.StatusCode then Promise.reject(Err.StatusCode) else Promise.reject()
		end)
	end
end