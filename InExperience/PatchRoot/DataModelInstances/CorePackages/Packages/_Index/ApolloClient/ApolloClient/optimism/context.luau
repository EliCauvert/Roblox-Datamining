local parent = script.Parent.Parent
local t = { parentEntrySlot = require(parent.wry.context).Slot.new() }
local _ = require(script.Parent.anyEntryTypes)
local contextModule = require(parent.wry.context)
t.bindContext = contextModule.bind
t.noContext = contextModule.noContext
t.setTimeout = contextModule.setTimeout

return t