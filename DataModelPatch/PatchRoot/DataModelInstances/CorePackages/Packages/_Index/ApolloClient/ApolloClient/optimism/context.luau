local Parent = script.Parent.Parent
local _ = require(script.Parent.anyEntryTypes)
local ContextModule = require(Parent.wry.context)

return {
	parentEntrySlot = require(Parent.wry.context).Slot.new(),
	bindContext = ContextModule.bind,
	noContext = ContextModule.noContext,
	setTimeout = ContextModule.setTimeout
}