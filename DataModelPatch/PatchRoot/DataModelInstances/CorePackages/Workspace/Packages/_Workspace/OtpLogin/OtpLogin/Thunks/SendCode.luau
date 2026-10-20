local Parent = script.Parent.Parent
local Promise = require(Parent.dependencies).Promise
local PostSendCodeModule = require(Parent.Requests.PostSendCode)
local _ = require(Parent.Common.otpLoginTypes)
local GetFFlagOtpLoginParseJsonErrorBodyModule = require(Parent.Flags.GetFFlagOtpLoginParseJsonErrorBody)
local ParseOtpErrorBodyModule = require(Parent.Utils.parseOtpErrorBody)

return function(p1, p2)
	-- upvalues: PostSendCodeModule (copy), Promise (copy), GetFFlagOtpLoginParseJsonErrorBodyModule (copy), ParseOtpErrorBodyModule (copy)
	return function()
		-- upvalues: PostSendCodeModule (upval), p1 (copy), p2 (copy), Promise (upval), GetFFlagOtpLoginParseJsonErrorBodyModule (upval), ParseOtpErrorBodyModule (upval)
		return PostSendCodeModule(p1, p2):andThen(function(Result)
			-- upvalues: Promise (upval)
			return Promise.resolve(Result.responseBody)
		end):catch(function(Err)
			-- upvalues: Promise (upval), GetFFlagOtpLoginParseJsonErrorBodyModule (upval), ParseOtpErrorBodyModule (upval)
			if Err.data then
				return Promise.reject(Err.data.errorCode)
			end
			if GetFFlagOtpLoginParseJsonErrorBodyModule() then
				local ParseOtpErrorBodyModuleResult = ParseOtpErrorBodyModule(Err.Body)
				
				if ParseOtpErrorBodyModuleResult then
					return Promise.reject(ParseOtpErrorBodyModuleResult)
				end
			end
			return if Err.Body and (type(Err.Body) == "number" or tonumber(Err.Body) ~= nil) then Promise.reject(Err.Body) elseif Err.StatusCode then Promise.reject(Err.StatusCode) else Promise.reject()
		end)
	end
end