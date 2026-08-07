-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:02 2026 Pacific Standard Time.

local object = require(script.Parent.Parent.Parent.LuauPolyfill).Object
local var0 = require(script.Parent.Parent.NavigationSymbol)("JUMP_TO")
local t = { JumpTo = var0 }
setmetatable(t, {
	__index = function(_, p0) --[[ line: 16 ]]
		error(("%q is not a valid member of SwitchActions"):format(tostring(p0)), 2)
	end
})

function t.jumpTo(p1) --[[ line: 22 ]]
	-- upvalues: var0 (ref), object (ref)
	local t = { preserveFocus = true, type = var0 }
	
	return if p1 then object.assign(t, p1) else t
end

return t