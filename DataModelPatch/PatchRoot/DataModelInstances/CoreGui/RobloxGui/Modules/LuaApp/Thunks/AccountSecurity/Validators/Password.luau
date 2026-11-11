local PostPasswordValidModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Requests.PostPasswordValid)
local config = {
	[1] = "Feature.AccountSecurityPrompt.Message.Error.PasswordValidation.WeakPassword",
	[2] = "Feature.AccountSecurityPrompt.Message.Error.PasswordValidation.ShortPassword",
	[3] = "Feature.AccountSecurityPrompt.Message.Error.PasswordValidation.PasswordSameAsUsername",
	[4] = "Feature.AccountSecurityPrompt.Message.Error.PasswordValidation.ForbiddenPassword",
	[5] = "Feature.AccountSecurityPrompt.Message.Error.PasswordValidation.DumbStrings"
}
local LocalizationKeys = {}

for _, value in pairs(config) do
	LocalizationKeys[value] = value
end
return {
	localizationKeys = LocalizationKeys,
	validator = function(p1, p2, p3)
		-- upvalues: PostPasswordValidModule (copy), config (copy)
		return function(p4)
			-- upvalues: PostPasswordValidModule (upval), p1 (copy), p3 (copy), config (upval), p2 (copy)
			return PostPasswordValidModule(p1, p3, p4):andThen(function(Result)
				-- upvalues: config (upval), p2 (upval)
				local Entry = config[Result and (Result.responseBody and Result.responseBody.code)]
				
				return if Entry == nil then nil else p2[Entry]
			end):catch(function(_)
				return nil
			end)
		end
	end
}