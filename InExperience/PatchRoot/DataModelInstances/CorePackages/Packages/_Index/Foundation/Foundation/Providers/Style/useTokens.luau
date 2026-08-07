local parent = script.Parent
local parent_1 = script:FindFirstAncestor("Foundation").Parent
local _ = require(parent.Tokens)
local tokensContextModule = require(parent.TokensContext)
local reactModule = require(parent_1.React)

return function() --[[ line: 10 | named "useTokens" ]]
	-- upvalues: reactModule (ref), tokensContextModule (ref)
	return reactModule.useContext(tokensContextModule)
end