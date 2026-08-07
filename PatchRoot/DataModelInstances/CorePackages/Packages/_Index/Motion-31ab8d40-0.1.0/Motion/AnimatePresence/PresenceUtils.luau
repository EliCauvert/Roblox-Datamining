-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:52 2026 Pacific Standard Time.

local reactModule = require(script.Parent.Parent.Parent.React)
local presenceContextModule = require(script.Parent.PresenceContext)

return {
	useIsPresent = function() --[[ line: 39 ]]
		-- upvalues: reactModule (ref), presenceContextModule (ref)
		local var2 = reactModule.useContext(presenceContextModule)
		
		return var2 == nil or var2.isPresent
	end,
	isPresent = function(p0) --[[ line: 27 ]]
		return p0 == nil or p0.isPresent
	end
}