local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local TurnWorkHeaderModule = require(script.Parent.TurnWorkHeader)
local UseTurnWorkHeaderViewModelModule = require(script.Parent.useTurnWorkHeaderViewModel)

return function(Frame)
	-- upvalues: UseTurnWorkHeaderViewModelModule (copy), ReactModule (copy), TurnWorkHeaderModule (copy)
	return ReactModule.createElement(TurnWorkHeaderModule, {
		LayoutOrder = Frame.LayoutOrder,
		text = UseTurnWorkHeaderViewModelModule(Frame).text,
		isExpanded = Frame.isExpanded,
		onActivated = Frame.onActivated,
		summaryRef = Frame.summaryRef
	})
end