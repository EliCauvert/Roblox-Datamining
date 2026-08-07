-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:10 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent.Parent
local object = require(parent.LuauPolyfill).Object
local t = {}
local var1 = require(parent.React).createContext(nil)

if _G.__DEV__ then
	var1.displayName = "ScrollViewContext"
end
t.default = var1
t.HORIZONTAL = object.freeze({ horizontal = true })
t.VERTICAL = object.freeze({ horizontal = false })

return t