local appPageShell = script:FindFirstAncestor("AppPageShell")
local _ = require(appPageShell.PageTypes)
local compositionTags = require(appPageShell.Parent.AppComposition).CompositionTags
local frozen = table.freeze({})

return function(p1)
	-- upvalues: frozen (ref), compositionTags (ref)
	return if p1 and p1.enabled == false then frozen else {
		root = `{compositionTags.ContentRegion.Root} {if p1 then p1.layout else compositionTags.Layout.Discovery}`,
		body = compositionTags.ContentRegion.Body,
		header = compositionTags.ContentRegion.Header
	}
end