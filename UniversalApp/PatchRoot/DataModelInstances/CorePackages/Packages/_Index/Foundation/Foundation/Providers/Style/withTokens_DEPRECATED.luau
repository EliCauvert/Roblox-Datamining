local Parent = script.Parent
local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local _ = require(Parent.Tokens)
local TokensContextModule = require(Parent.TokensContext)

return function(Render) --[[ Line: 17 | Named "withTokens_DEPRECATED" ]]
	-- upvalues: ReactModule (copy), TokensContextModule (copy)
	return ReactModule.createElement(TokensContextModule.Consumer, { render = Render })
end