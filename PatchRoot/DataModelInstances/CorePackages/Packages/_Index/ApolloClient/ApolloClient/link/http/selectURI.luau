-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:15 2026 Pacific Standard Time.

local boolean = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Boolean
local _ = require(script.Parent.Parent.core.types)

return {
	selectURI = function(p0, p1) --[[ line: 19 ]]
		-- upvalues: boolean (ref)
		local uri = p0:getContext().uri
		
		return if boolean.toJSBoolean(uri) then uri elseif typeof(p1) == "function" then p1(p0) elseif boolean.toJSBoolean(p1) then p1 else "/graphql"
	end
}