-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:28 2026 Pacific Standard Time.

local parent = script.Parent
local parent_1 = script:FindFirstAncestor("Foundation").Parent
local _ = require(parent.Tokens)
local tokensContextModule = require(parent.TokensContext)
local reactModule = require(parent_1.React)

return function() --[[ line: 10 | named "useTokens" ]]
	-- upvalues: reactModule (ref), tokensContextModule (ref)
	return reactModule.useContext(tokensContextModule)
end