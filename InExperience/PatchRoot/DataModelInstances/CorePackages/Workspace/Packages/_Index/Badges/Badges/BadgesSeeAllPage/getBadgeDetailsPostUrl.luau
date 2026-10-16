local Parent = script:FindFirstAncestor("Badges").Parent
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "landing-page-api/badge-details-page/v1beta1",
	base = require(Parent.Http).Url.APIS_URL
})

return function() --[[ Line: 12 | Named "getBadgeDetailsPostUrl" ]]
	-- upvalues: NewResult (copy)
	return NewResult()
end