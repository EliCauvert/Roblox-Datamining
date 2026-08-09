local parent = script.Parent.Parent
local momentsCreationFlowModule = require(parent.Parent.MomentsCreationFlow)
local creationFlowState = momentsCreationFlowModule.Enums.CreationFlowState
local selectedCaptureUpdated = momentsCreationFlowModule.Actions.SelectedCaptureUpdated
local creationFlowStateUpdated = momentsCreationFlowModule.Actions.CreationFlowStateUpdated
local momentsCreationFlowOpenedModule = require(parent.Actions.MomentsCreationFlowOpened)
local _ = require(parent.Types)

return function(p0) --[[ line: 13 ]]
	-- upvalues: momentsCreationFlowOpenedModule (ref), creationFlowStateUpdated (ref), creationFlowState (ref), selectedCaptureUpdated (ref)
	return function(p1) --[[ line: 14 ]]
		-- upvalues: momentsCreationFlowOpenedModule (copy), p0 (ref), creationFlowStateUpdated (copy), creationFlowState (copy), selectedCaptureUpdated (copy)
		p1:dispatch(momentsCreationFlowOpenedModule(p0))
		p1:dispatch(creationFlowStateUpdated(creationFlowState.Preview))
		p1:dispatch(selectedCaptureUpdated(p0))
	end
end