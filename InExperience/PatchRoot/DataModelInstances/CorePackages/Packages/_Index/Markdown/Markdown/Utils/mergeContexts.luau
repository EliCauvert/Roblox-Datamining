local markdown = script:FindFirstAncestor("Markdown")
local dashModule = require(markdown.Parent.Dash)
local _ = require(markdown.Types)

return function(p0, p1) --[[ line: 7 | named "mergeContexts" ]]
	-- upvalues: dashModule (ref)
	return dashModule.joinDeep(p0, p1)
end