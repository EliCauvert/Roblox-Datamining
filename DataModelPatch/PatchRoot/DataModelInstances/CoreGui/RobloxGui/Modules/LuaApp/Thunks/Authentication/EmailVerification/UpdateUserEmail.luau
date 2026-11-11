local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local PostUserEmailModule = require(Modules.LuaApp.Http.Requests.PostUserEmail)
local IsStringEmailModule = require(Modules.LuaApp.Util.isStringEmail)

return function(p1, p2, p3)
	-- upvalues: IsStringEmailModule (copy), PromiseModule (copy), PostUserEmailModule (copy), HttpService (copy)
	return function(_)
		-- upvalues: IsStringEmailModule (upval), p2 (copy), PromiseModule (upval), PostUserEmailModule (upval), p1 (copy), p3 (copy), HttpService (upval)
		return if IsStringEmailModule(p2) then PostUserEmailModule(p1, p2, p3):andThen(function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve()
		end, function(p4)
			-- upvalues: HttpService (upval), PromiseModule (upval)
			local PasswordIncorrect = false
			local EmailInvalid = false
			local Message = ""
			local Code = 0
			
			if p4.Body then
				local Error = HttpService:JSONDecode(p4.Body).errors[1]
				Code = Error.code
				PasswordIncorrect = Code == 8
				EmailInvalid = Code == 9
				Message = Error.message
			end
			return PromiseModule.reject({
				EmailInvalid = EmailInvalid,
				PasswordIncorrect = PasswordIncorrect,
				Message = Message,
				ErrorCode = Code
			})
		end) else PromiseModule.reject({ EmailInvalid = true })
	end
end