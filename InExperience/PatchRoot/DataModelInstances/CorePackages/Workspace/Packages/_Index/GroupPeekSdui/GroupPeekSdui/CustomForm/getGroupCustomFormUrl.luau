local Parent = script:FindFirstAncestor("GroupPeekSdui").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local Url = require(Parent.Http).Url
local NewUrlBuilder = UrlBuilder.new({
	path = "v1/groups/{groupId}/forms/{formId}/results",
	base = Url.GROUPS_URL,
	query = { cfVertical = "{cfVertical}" }
})
local NewUrlBuilder1 = UrlBuilder.new({
	path = "v1/groups/{groupId}/forms/{formId}/responses",
	base = Url.GROUPS_URL
})

return {
	results = function(GroupId, FormId, CfVertical)
		-- upvalues: NewUrlBuilder (copy)
		return NewUrlBuilder({
			groupId = GroupId,
			formId = FormId,
			cfVertical = CfVertical
		})
	end,
	responses = function(GroupId, FormId)
		-- upvalues: NewUrlBuilder1 (copy)
		return NewUrlBuilder1({ groupId = GroupId, formId = FormId })
	end
}