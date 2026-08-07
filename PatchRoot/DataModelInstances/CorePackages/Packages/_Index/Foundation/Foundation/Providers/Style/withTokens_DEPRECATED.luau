-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:28 2026 Pacific Standard Time.

local parent = script.Parent
local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local _ = require(parent.Tokens)
local tokensContextModule = require(parent.TokensContext)

return function(p0) --[[ line: 17 | named "withTokens_DEPRECATED" ]]
	-- upvalues: reactModule (ref), tokensContextModule (ref)
	return reactModule.createElement(tokensContextModule.Consumer, { render = p0 })
end