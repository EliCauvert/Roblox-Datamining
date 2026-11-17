local UrlBuilder = require(script:FindFirstAncestor("Groups").Parent.UrlBuilder).UrlBuilder
local Tab = UrlBuilder.fromString("www:communities/{groupId}#!/{tab}")
local GroupId = UrlBuilder.fromString("www:communities/{groupId}")

return function(GroupId1, Tab1)
	-- upvalues: Tab (copy), GroupId (copy)
	return if Tab1 then Tab({ groupId = GroupId1, tab = Tab1 }) else GroupId({ groupId = GroupId1 })
end