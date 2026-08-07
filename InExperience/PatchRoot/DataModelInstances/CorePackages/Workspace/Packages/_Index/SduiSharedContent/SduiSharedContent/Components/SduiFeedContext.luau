local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local _ = require(parent.AppCommonLib)

return require(parent.React).createContext({
	scrollViewPositionChangedSignal = nil,
	verticalScrollingFrameRef = nil
})