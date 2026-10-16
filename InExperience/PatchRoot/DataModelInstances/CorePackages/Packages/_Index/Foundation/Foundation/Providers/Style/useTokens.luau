local Parent = script.Parent
local _ = require(Parent.Tokens)
local TokensContextModule = require(Parent.TokensContext)
local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function() --[[ Line: 10 | Named "useTokens" ]]
	-- upvalues: ReactModule (copy), TokensContextModule (copy)
	return (ReactModule.useContext(TokensContextModule))
end