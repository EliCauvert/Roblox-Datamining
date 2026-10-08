local parent = script:FindFirstAncestor("GroupAnnouncementsSdui").Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local url = require(parent.Http).Url

return function(p1)
	-- upvalues: urlBuilder (ref), url (ref)
	return urlBuilder.new({
		path = "v1/groups/{groupId}/pages/peek",
		base = url.GROUPS_URL
	})({ groupId = p1 })
end