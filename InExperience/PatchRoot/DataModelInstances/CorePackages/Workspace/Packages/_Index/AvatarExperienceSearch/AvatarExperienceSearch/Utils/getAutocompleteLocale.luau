local LocalizationContext = require(script:FindFirstAncestor("AvatarExperienceSearch").Parent.Localization).LocalizationContext

return function(p1): string
	-- upvalues: LocalizationContext (copy)
	local BaseLanguage = if p1 then LocalizationContext.getBaseLanguage(p1) else nil
	
	return if BaseLanguage == nil or BaseLanguage == "en" then "en" else BaseLanguage .. "," .. "en"
end