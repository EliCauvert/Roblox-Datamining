-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:28 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local dashModule = require(foundation.Parent.Dash)
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(script.Parent.Rules.Types)
local formatTokensModule = require(script.Parent.formatTokens)

return function(p0, p1) --[[ line: 11 | named "generateRules" ]]
	-- upvalues: formatTokensModule (ref), dashModule (ref)
	local var3, var4, var5 = p1(p0, formatTokensModule(p0))
	
	return dashModule.joinArrays(var3, var4, var5), var3, var4, var5
end