local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local headerBarContextModule = require(foundation.Components.HeaderBar.HeaderBarContext)

return function()
	-- upvalues: reactModule (ref), headerBarContextModule (ref)
	return reactModule.useContext(headerBarContextModule.Context)
end