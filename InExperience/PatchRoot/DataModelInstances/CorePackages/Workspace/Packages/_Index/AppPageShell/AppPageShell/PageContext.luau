local AppPageShell = script:FindFirstAncestor("AppPageShell")
local Parent = AppPageShell.Parent
local _ = require(Parent.AppCommonLib)
local ReactModule = require(Parent.React)
local _ = require(AppPageShell.PageTypes)
local _ = require(AppPageShell.createPageScrollStore)

return ReactModule.createContext({
	scrollViewPositionChangedSignal = nil,
	verticalScrollingFrameRef = nil,
	impressionsParentScrollingFrameRef = nil
})