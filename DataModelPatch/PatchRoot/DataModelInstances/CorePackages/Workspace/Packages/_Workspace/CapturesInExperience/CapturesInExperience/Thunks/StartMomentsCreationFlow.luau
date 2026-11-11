local Parent = script.Parent.Parent
local MomentsCreationFlowModule = require(Parent.Parent.MomentsCreationFlow)
local CreationFlowState = MomentsCreationFlowModule.Enums.CreationFlowState
local SelectedCaptureUpdatedFunction = MomentsCreationFlowModule.Actions.SelectedCaptureUpdated
local CreationFlowStateUpdatedFunction = MomentsCreationFlowModule.Actions.CreationFlowStateUpdated
local MomentsCreationFlowOpenedModule = require(Parent.Actions.MomentsCreationFlowOpened)
local _ = require(Parent.Types)

return function(p1)
	-- upvalues: MomentsCreationFlowOpenedModule (copy), CreationFlowStateUpdatedFunction (copy), CreationFlowState (copy), SelectedCaptureUpdatedFunction (copy)
	return function(p2)
		-- upvalues: MomentsCreationFlowOpenedModule (upval), p1 (copy), CreationFlowStateUpdatedFunction (upval), CreationFlowState (upval), SelectedCaptureUpdatedFunction (upval)
		p2:dispatch(MomentsCreationFlowOpenedModule(p1))
		p2:dispatch(CreationFlowStateUpdatedFunction(CreationFlowState.Preview))
		p2:dispatch(SelectedCaptureUpdatedFunction(p1))
	end
end