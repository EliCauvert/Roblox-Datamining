local parent = script.Parent
local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local _ = require(parent.Tokens)
local tokensContextModule = require(parent.TokensContext)

return function(p0) --[[ line: 17 | named "withTokens_DEPRECATED" ]]
	-- upvalues: reactModule (ref), tokensContextModule (ref)
	return reactModule.createElement(tokensContextModule.Consumer, { render = p0 })
end