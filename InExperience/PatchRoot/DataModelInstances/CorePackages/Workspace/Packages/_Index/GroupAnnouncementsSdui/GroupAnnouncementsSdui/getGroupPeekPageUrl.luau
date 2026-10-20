local Parent = script:FindFirstAncestor("GroupAnnouncementsSdui").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local Url = require(Parent.Http).Url

return function(GroupId)
	-- upvalues: UrlBuilder (copy), Url (copy)
	return UrlBuilder.new({
		path = "v1/groups/{groupId}/pages/peek",
		base = Url.GROUPS_URL
	})({ groupId = GroupId })
end