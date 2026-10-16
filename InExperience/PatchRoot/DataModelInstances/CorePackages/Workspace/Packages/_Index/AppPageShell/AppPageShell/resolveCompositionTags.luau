local AppPageShell = script:FindFirstAncestor("AppPageShell")
local _ = require(AppPageShell.PageTypes)
local CompositionTags = require(AppPageShell.Parent.AppComposition).CompositionTags
local Frozen = table.freeze({})

return function(p1) --[[ Line: 20 | Named "resolveCompositionTags" ]]
	-- upvalues: Frozen (copy), CompositionTags (copy)
	return if p1 and p1.enabled == false then Frozen else {
		root = `{CompositionTags.ContentRegion.Root} {p1 and p1.layout or CompositionTags.Layout.Discovery}`,
		body = CompositionTags.ContentRegion.Body,
		header = CompositionTags.ContentRegion.Header
	}
end