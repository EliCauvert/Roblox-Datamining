local parent = script.Parent.Parent
local parent_1 = parent.Parent
local momentsCreationFlowOpenedModule = require(parent.Actions.MomentsCreationFlowOpened)
local _ = require(parent.Types)

if require(parent.Flags.FFlagCapturesInExpUseMomentsCreation) then
	return function(p1, p2)
		-- upvalues: parent (ref), parent_1 (ref), momentsCreationFlowOpenedModule (ref)
		return function(p3)
			-- upvalues: parent (copy), parent_1 (copy), p1 (ref), momentsCreationFlowOpenedModule (copy), p2 (ref)
			if p3:getState()[require(parent.Constants).RoduxKey].MomentsCreationFlow.IsOpen then
				return
			end
			local momentsCreationModule = require(parent_1.MomentsCreation)
			local creationFlowStore = momentsCreationModule.Stores.GetCreationFlowStore(false)
			momentsCreationModule.resetCreationFlow(momentsCreationModule.Enums.CreationFlowState.Preview)
			creationFlowStore.onSelectedCaptureUpdated(p1)
			momentsCreationModule.beginCreationFlow("Captures")
			p3:dispatch(momentsCreationFlowOpenedModule(p1, p2))
		end
	end
end
local momentsCreationFlowModule = require(parent_1.MomentsCreationFlow)
local creationFlowState = momentsCreationFlowModule.Enums.CreationFlowState
local selectedCaptureUpdated = momentsCreationFlowModule.Actions.SelectedCaptureUpdated
local creationFlowStateUpdated = momentsCreationFlowModule.Actions.CreationFlowStateUpdated

return function(p1, p2)
	-- upvalues: momentsCreationFlowOpenedModule (ref), creationFlowStateUpdated (ref), creationFlowState (ref), selectedCaptureUpdated (ref)
	return function(p3)
		-- upvalues: momentsCreationFlowOpenedModule (copy), p1 (ref), p2 (ref), creationFlowStateUpdated (copy), creationFlowState (copy), selectedCaptureUpdated (copy)
		p3:dispatch(momentsCreationFlowOpenedModule(p1, p2))
		p3:dispatch(creationFlowStateUpdated(creationFlowState.Preview))
		p3:dispatch(selectedCaptureUpdated(p1))
	end
end