local appPage = require(script:FindFirstAncestor("GameDetail").Parent.RobloxAppEnums).AppPage

return function(p0) --[[ line: 6 | named "getExperienceDetailsPageKey" ]]
	-- upvalues: appPage (ref)
	return if p0 == nil then appPage.ExperienceDetail .. "-Unknown" else appPage.ExperienceDetail .. "-" .. p0
end