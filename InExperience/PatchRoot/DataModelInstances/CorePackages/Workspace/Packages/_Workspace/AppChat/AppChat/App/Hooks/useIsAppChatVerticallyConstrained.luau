local UseLayerCollectorFunction = require(script:FindFirstAncestor("AppChat").Parent.UIBlox).Core.Layout.LayerCollector.useLayerCollector
local AppChatVerticalConstraintThreshold = game:DefineFastInt("AppChatVerticalConstraintThreshold", 300)

return function(): boolean --[[ Line: 10 ]]
	-- upvalues: UseLayerCollectorFunction (copy), AppChatVerticalConstraintThreshold (copy)
	return UseLayerCollectorFunction().absoluteSize.Y <= AppChatVerticalConstraintThreshold
end