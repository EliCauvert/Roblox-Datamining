local Roact = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact
local NewModule = require(script.Parent.new)

return function(p1) --[[ Line: 7 | Named "vertical" ]]
	-- upvalues: Roact (copy), NewModule (copy)
	return NewModule(Roact.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }), p1)
end