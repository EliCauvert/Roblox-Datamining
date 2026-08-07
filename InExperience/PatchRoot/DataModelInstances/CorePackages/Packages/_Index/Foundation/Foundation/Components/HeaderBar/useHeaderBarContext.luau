local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local headerBarContextModule = require(foundation.Components.HeaderBar.HeaderBarContext)

return function() --[[ line: 8 | named "useHeaderBarContext" ]]
	-- upvalues: reactModule (ref), headerBarContextModule (ref)
	return reactModule.useContext(headerBarContextModule.Context)
end