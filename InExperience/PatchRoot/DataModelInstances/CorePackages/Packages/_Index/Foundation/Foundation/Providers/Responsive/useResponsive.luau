local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local responsiveContextModule = require(script.Parent.ResponsiveContext)

return function()
	-- upvalues: reactModule (ref), responsiveContextModule (ref)
	return reactModule.useContext(responsiveContextModule)
end