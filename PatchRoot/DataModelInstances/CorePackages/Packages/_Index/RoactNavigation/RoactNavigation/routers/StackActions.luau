-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:01 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local object = require(parent.Parent.LuauPolyfill).Object
local navigationSymbolModule = require(parent.NavigationSymbol)
local var1 = navigationSymbolModule("POP")
local var2 = navigationSymbolModule("POP_TO_TOP")
local var3 = navigationSymbolModule("PUSH")
local var4 = navigationSymbolModule("RESET")
local var5 = navigationSymbolModule("REPLACE")
local var6 = navigationSymbolModule("COMPLETE_TRANSITION")
local t = {
	Pop = var1,
	PopToTop = var2,
	Push = var3,
	Reset = var4,
	Replace = var5,
	CompleteTransition = var6
}
setmetatable(t, {
	__index = function(_, p0) --[[ line: 34 ]]
		error(("%q is not a valid member of StackActions"):format(tostring(p0)), 2)
	end
})

function t.pop(p1) --[[ line: 40 ]]
	-- upvalues: var1 (ref), object (ref)
	local t = { type = var1 }
	
	return if p1 then object.assign(t, p1) else t
end

function t.popToTop(p2) --[[ line: 46 ]]
	-- upvalues: var2 (ref), object (ref)
	local t = { type = var2 }
	
	return if p2 then object.assign(t, p2) else t
end

function t.push(p3) --[[ line: 52 ]]
	-- upvalues: var3 (ref), object (ref)
	local t = { type = var3 }
	
	return if p3 then object.assign(t, p3) else t
end

function t.reset(value) --[[ line: 59 ]]
	-- upvalues: var4 (ref), object (ref)
	local t = { type = var4 }
	
	return if value then object.assign(t, value) else t
end

function t.replace(p4) --[[ line: 65 ]]
	-- upvalues: var5 (ref), object (ref)
	local t = { preserveFocus = true, type = var5 }
	
	return if p4 then object.assign(t, p4) else t
end

function t.completeTransition(p5) --[[ line: 70 ]]
	-- upvalues: var6 (ref), object (ref)
	local t = { preserveFocus = true, type = var6 }
	
	return if p5 then object.assign(t, p5) else t
end

return t