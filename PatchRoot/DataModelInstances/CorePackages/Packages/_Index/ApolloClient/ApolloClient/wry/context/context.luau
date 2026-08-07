-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:17 2026 Pacific Standard Time.

local luauPolyfillModule = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local t = {}
local slot = require(script.Parent.slot).Slot
t.Slot = slot
local bind = slot.bind
local noContext = slot.noContext
t.bind = bind
t.noContext = noContext
local setTimeout = luauPolyfillModule.setTimeout

function t.setTimeoutWithContext(value, p0) --[[ line: 27 ]]
	-- upvalues: setTimeout (ref), bind (ref)
	return setTimeout(bind(value), p0)
end

return t