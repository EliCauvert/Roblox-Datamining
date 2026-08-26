local markdown = script:FindFirstAncestor("Markdown")
local dashModule = require(markdown.Parent.Dash)
local _ = require(markdown.Types)

return function(p1, p2)
	-- upvalues: dashModule (ref)
	return dashModule.joinDeep(p1, p2)
end