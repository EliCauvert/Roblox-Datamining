local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local HeaderBarContextModule = require(Foundation.Components.HeaderBar.HeaderBarContext)

return function() --[[ Line: 8 | Named "useHeaderBarContext" ]]
	-- upvalues: ReactModule (copy), HeaderBarContextModule (copy)
	return ReactModule.useContext(HeaderBarContextModule.Context)
end