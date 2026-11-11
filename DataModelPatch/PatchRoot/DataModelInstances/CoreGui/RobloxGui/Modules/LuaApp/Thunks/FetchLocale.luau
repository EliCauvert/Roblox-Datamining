local GetLocaleModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Requests.GetLocale)

return function(p1)
	-- upvalues: GetLocaleModule (copy)
	return GetLocaleModule(p1):andThen(function(Entry)
		local Entry1 = Entry[1]
		local Locale = nil
		local Locale1 = nil
		local Locale2 = nil
		
		if Entry1 then
			Locale1 = Entry1.generalExperience and Entry1.generalExperience.locale
			Locale = Entry1.signupAndLogin.locale
			Locale2 = Entry1.ugc.locale
		end
		return {
			signupAndLoginLocale = Locale,
			generalExperienceLocale = Locale1,
			ugcLocale = Locale2
		}
	end)
end