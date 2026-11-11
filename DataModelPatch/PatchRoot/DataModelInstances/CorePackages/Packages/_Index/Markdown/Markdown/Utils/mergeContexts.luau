local Markdown = script:FindFirstAncestor("Markdown")
local DashModule = require(Markdown.Parent.Dash)
local _ = require(Markdown.Types)

return function(p1, p2)
	-- upvalues: DashModule (copy)
	return DashModule.joinDeep(p1, p2)
end