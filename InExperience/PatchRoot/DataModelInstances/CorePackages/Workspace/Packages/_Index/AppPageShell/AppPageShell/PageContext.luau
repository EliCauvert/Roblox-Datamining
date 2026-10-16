local AppPageShell = script:FindFirstAncestor("AppPageShell")
local Parent = AppPageShell.Parent
local _ = require(Parent.AppCommonLib)
local _ = require(AppPageShell.PageTypes)
local _ = require(AppPageShell.createPageScrollStore)

return require(Parent.React).createContext({
	scrollViewPositionChangedSignal = nil,
	verticalScrollingFrameRef = nil,
	impressionsParentScrollingFrameRef = nil
})