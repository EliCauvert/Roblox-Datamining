local Markdown = script:FindFirstAncestor("Markdown")
local DashModule = require(Markdown.Parent.Dash)
local _ = require(Markdown.Types)

return function(p1, p2) --[[ Line: 7 | Named "mergeContexts" ]]
	-- upvalues: DashModule (copy)
	return DashModule.joinDeep(p1, p2)
end