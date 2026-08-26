local parent = script.Parent
local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local _ = require(parent.Tokens)
local tokensContextModule = require(parent.TokensContext)

return function(p1)
	-- upvalues: reactModule (ref), tokensContextModule (ref)
	return reactModule.createElement(tokensContextModule.Consumer, { render = p1 })
end