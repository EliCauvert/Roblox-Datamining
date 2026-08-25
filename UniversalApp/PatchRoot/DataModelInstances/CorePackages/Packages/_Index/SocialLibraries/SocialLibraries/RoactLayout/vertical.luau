local roact = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact
local newModule = require(script.Parent.new)

return function(p0)
	-- upvalues: roact (ref), newModule (ref)
	return newModule(roact.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }), p0)
end