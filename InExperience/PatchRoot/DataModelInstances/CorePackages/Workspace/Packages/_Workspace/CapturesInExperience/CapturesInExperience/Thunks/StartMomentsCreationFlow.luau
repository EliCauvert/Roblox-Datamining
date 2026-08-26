local parent = script.Parent.Parent
local momentsCreationFlowModule = require(parent.Parent.MomentsCreationFlow)
local creationFlowState = momentsCreationFlowModule.Enums.CreationFlowState
local selectedCaptureUpdated = momentsCreationFlowModule.Actions.SelectedCaptureUpdated
local creationFlowStateUpdated = momentsCreationFlowModule.Actions.CreationFlowStateUpdated
local momentsCreationFlowOpenedModule = require(parent.Actions.MomentsCreationFlowOpened)
local _ = require(parent.Types)

return function(p1, p2)
	-- upvalues: momentsCreationFlowOpenedModule (ref), creationFlowStateUpdated (ref), creationFlowState (ref), selectedCaptureUpdated (ref)
	return function(p3)
		-- upvalues: momentsCreationFlowOpenedModule (copy), p1 (ref), p2 (ref), creationFlowStateUpdated (copy), creationFlowState (copy), selectedCaptureUpdated (copy)
		p3:dispatch(momentsCreationFlowOpenedModule(p1, p2))
		p3:dispatch(creationFlowStateUpdated(creationFlowState.Preview))
		p3:dispatch(selectedCaptureUpdated(p1))
	end
end