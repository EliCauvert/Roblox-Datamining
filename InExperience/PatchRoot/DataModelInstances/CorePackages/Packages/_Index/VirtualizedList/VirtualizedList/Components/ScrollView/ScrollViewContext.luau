local Parent = script.Parent.Parent.Parent.Parent
local Object = require(Parent.LuauPolyfill).Object
local ReactModule = require(Parent.React)
local ScrollViewContextModule = {}
local Context = ReactModule.createContext(nil)

if _G.__DEV__ then
	Context.displayName = "ScrollViewContext"
end
ScrollViewContextModule.default = Context
ScrollViewContextModule.HORIZONTAL = Object.freeze({ horizontal = true })
ScrollViewContextModule.VERTICAL = Object.freeze({ horizontal = false })

return ScrollViewContextModule