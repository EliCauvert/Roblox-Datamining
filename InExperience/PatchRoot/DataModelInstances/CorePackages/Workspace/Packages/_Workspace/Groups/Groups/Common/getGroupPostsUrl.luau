local Category = require(script:FindFirstAncestor("Groups").Parent.UrlBuilder).UrlBuilder.fromString("www:communities/{groupId}#!/forums/{category}")

return function(GroupId, p1)
	-- upvalues: Category (copy)
	return Category({ groupId = GroupId, category = `category-{p1}` })
end