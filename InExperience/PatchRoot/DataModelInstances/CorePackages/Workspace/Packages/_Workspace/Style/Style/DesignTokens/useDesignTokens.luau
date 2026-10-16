local Parent = script:FindFirstAncestor("Style").Parent
local ArgCheckModule = require(Parent.ArgCheck)
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local DesignTokenContextModule = require(script.Parent.DesignTokenContext)

return function(p1) --[[ Line: 11 | Named "useDesignTokens" ]]
	-- upvalues: ReactModule (copy), DesignTokenContextModule (copy), DashModule (copy), ArgCheckModule (copy)
	local UseContextResult = ReactModule.useContext(DesignTokenContextModule)
	local Callback = p1 or DashModule.identity
	ArgCheckModule.assert(UseContextResult, "Design Tokens not found, ensure AppStyleProvider has been configured correctly.")
	
	return Callback(UseContextResult)
end