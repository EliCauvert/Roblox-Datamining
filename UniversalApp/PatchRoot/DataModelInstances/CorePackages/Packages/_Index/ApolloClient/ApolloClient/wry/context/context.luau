local luauPolyfillModule = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local t = {}
local slot = require(script.Parent.slot).Slot
t.Slot = slot
local bind = slot.bind
local noContext = slot.noContext
t.bind = bind
t.noContext = noContext
local setTimeout = luauPolyfillModule.setTimeout

function t.setTimeoutWithContext(value, p1)
	-- upvalues: setTimeout (ref), bind (ref)
	return setTimeout(bind(value), p1)
end

return t