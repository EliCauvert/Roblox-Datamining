local AppPage = require(script:FindFirstAncestor("GameDetail").Parent.RobloxAppEnums).AppPage

return function(Text): string --[[ Line: 6 | Named "getExperienceDetailsPageKey" ]]
	-- upvalues: AppPage (copy)
	return if Text == nil then AppPage.ExperienceDetail .. "-Unknown" else AppPage.ExperienceDetail .. "-" .. Text
end