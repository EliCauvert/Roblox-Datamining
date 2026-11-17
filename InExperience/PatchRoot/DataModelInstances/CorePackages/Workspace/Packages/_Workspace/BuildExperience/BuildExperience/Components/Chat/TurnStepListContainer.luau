local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local TurnStepListModule = require(script.Parent.TurnStepList)
local UseTurnStepListViewModelModule = require(script.Parent.useTurnStepListViewModel)

return function(Frame)
	-- upvalues: UseTurnStepListViewModelModule (copy), ReactModule (copy), TurnStepListModule (copy)
	return ReactModule.createElement(TurnStepListModule, {
		LayoutOrder = Frame.LayoutOrder,
		rows = UseTurnStepListViewModelModule(Frame).rows
	})
end