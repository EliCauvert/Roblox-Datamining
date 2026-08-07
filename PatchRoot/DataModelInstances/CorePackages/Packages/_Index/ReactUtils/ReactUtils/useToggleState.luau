-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:39 2026 Pacific Standard Time.

local reactUtils = script:FindFirstAncestor("ReactUtils")
local reactModule = require(reactUtils.Parent.React)
local var2 = require(reactUtils.Flags.getFFlagUseToggleStateImprovements)()

return function(value) --[[ line: 10 | named "useToggleState" ]]
	-- upvalues: reactModule (ref), var2 (ref)
	local var3, var4 = reactModule.useState(value or false)
	
	return {
		enabled = var3,
		enable = reactModule.useCallback(function() --[[ line: 19 ]]
			-- upvalues: var4 (ref)
			var4(true)
		end, {}),
		disable = reactModule.useCallback(function() --[[ line: 23 ]]
			-- upvalues: var4 (ref)
			var4(false)
		end, {}),
		toggle = if var2 then if var2 then reactModule.useCallback(function() --[[ line: 29 ]]
			-- upvalues: var4 (ref)
			var4(function(p0) --[[ line: 30 ]]
				return not p0
			end)
		end, {}) else nil else nil,
		set = if var2 then var4 else nil
	}
end