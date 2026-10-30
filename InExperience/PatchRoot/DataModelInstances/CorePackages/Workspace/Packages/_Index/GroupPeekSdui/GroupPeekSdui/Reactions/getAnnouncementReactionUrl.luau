local Parent = script:FindFirstAncestor("GroupPeekSdui").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local Url = require(Parent.Http).Url

return function(p1)
	-- upvalues: UrlBuilder (copy), Url (copy)
	return UrlBuilder.new({
		path = "v1/groups/{groupId}/announcements/{announcementId}/messages/{messageId}/reactions/{emoteId}",
		base = Url.GROUPS_URL
	})(p1)
end