local Leaderboards = script:FindFirstAncestor("Leaderboards")
local Parent = Leaderboards.Parent
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	base = require(Parent.Http).Url.APIS_URL,
	path = require(Leaderboards.ExperienceLeaderboardSeeAllPage.Constants).Path
})

return function()
	-- upvalues: NewResult (copy)
	return NewResult()
end