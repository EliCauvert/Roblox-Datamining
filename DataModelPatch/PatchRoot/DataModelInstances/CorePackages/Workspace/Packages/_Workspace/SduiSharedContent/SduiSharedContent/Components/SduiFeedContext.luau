local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local _ = require(Parent.AppCommonLib)

return require(Parent.React).createContext({
	scrollViewPositionChangedSignal = nil,
	verticalScrollingFrameRef = nil
})