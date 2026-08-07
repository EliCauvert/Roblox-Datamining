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