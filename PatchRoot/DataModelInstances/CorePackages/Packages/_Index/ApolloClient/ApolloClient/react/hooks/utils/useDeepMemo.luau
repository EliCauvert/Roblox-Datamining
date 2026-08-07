-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:16 2026 Pacific Standard Time.

local t = {}
local parent = script.Parent.Parent.Parent.Parent
local useRef = require(parent.Parent.React).useRef
local equalModule = require(parent.jsutils.equal)

function t.useDeepMemo(p0, p1) --[[ line: 26 ]]
	-- upvalues: useRef (ref), equalModule (ref)
	local var2 = useRef(nil)
	
	if not var2.current or not equalModule(p1, var2.current.key) then
		var2.current = { key = p1, value = p0() }
	end
	return var2.current.value
end

return t