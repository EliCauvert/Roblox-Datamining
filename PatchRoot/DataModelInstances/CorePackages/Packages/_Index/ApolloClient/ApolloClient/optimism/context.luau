-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:15 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local t = { parentEntrySlot = require(parent.wry.context).Slot.new() }
local _ = require(script.Parent.anyEntryTypes)
local contextModule = require(parent.wry.context)
t.bindContext = contextModule.bind
t.noContext = contextModule.noContext
t.setTimeout = contextModule.setTimeout

return t