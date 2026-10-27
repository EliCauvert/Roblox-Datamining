local Parent = script:FindFirstAncestor("Groups").Parent
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "v1/groups/{groupId}/pages/overview",
	base = require(Parent.Http).Url.GROUPS_URL
})

return function(p1, p2)
	-- upvalues: NewResult (copy)
	local Text = if p2 == nil then nil else tostring(p2)
	
	return if Text == nil or string.match(Text, "^[1-9]%d*$") == nil then nil else {
		surfaceKey = "OverviewPane",
		configKey = `Groups-OverviewPane-{if p1 == "" then "unknown" else p1}-{Text}`,
		url = NewResult({ groupId = Text }),
		groupId = Text
	}
end