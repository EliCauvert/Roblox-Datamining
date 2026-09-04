local appPageShell = script:FindFirstAncestor("AppPageShell")
local parent = appPageShell.Parent
local _ = require(parent.AppCommonLib)
local reactModule = require(parent.React)
local _ = require(appPageShell.PageTypes)
local _ = require(appPageShell.createPageScrollStore)

return reactModule.createContext({
	scrollViewPositionChangedSignal = nil,
	verticalScrollingFrameRef = nil,
	impressionsParentScrollingFrameRef = nil
})