local Parent = script:FindFirstAncestor("Style").Parent
local _ = require(Parent.Foundation)
local Signal, Signal2 = require(Parent.Signals).createSignal(nil)

return {
	getAppFoundationThemeName = Signal,
	setAppFoundationThemeName = Signal2
}