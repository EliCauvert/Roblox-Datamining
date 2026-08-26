local appPage = require(script:FindFirstAncestor("GameDetail").Parent.RobloxAppEnums).AppPage

return function(p1)
	-- upvalues: appPage (ref)
	return if p1 == nil then appPage.ExperienceDetail .. "-Unknown" else appPage.ExperienceDetail .. "-" .. p0
end