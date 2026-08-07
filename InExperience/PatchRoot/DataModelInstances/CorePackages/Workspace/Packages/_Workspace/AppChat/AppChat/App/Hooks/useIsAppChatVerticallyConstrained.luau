local useLayerCollector = require(script:FindFirstAncestor("AppChat").Parent.UIBlox).Core.Layout.LayerCollector.useLayerCollector
local appChatVerticalConstraintThreshold = game:DefineFastInt("AppChatVerticalConstraintThreshold", 300)

return function() --[[ line: 10 ]]
	-- upvalues: useLayerCollector (ref), appChatVerticalConstraintThreshold (ref)
	return useLayerCollector().absoluteSize.Y <= appChatVerticalConstraintThreshold
end