local parent = script:FindFirstAncestor("Style").Parent
local argCheckModule = require(parent.ArgCheck)
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local designTokenContextModule = require(script.Parent.DesignTokenContext)

return function(value)
	-- upvalues: reactModule (ref), designTokenContextModule (ref), dashModule (ref), argCheckModule (ref)
	local var4 = reactModule.useContext(designTokenContextModule)
	local value_1 = value or dashModule.identity
	argCheckModule.assert(var4, "Design Tokens not found, ensure AppStyleProvider has been configured correctly.")
	
	return value_1(var4)
end