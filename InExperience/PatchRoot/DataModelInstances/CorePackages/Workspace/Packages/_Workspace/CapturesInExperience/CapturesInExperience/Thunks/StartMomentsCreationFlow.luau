local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local MomentsCreationFlowOpenedModule = require(Parent.Actions.MomentsCreationFlowOpened)
local _ = require(Parent.Types)

if require(Parent.Flags.FFlagCapturesInExpUseMomentsCreation) then
	return function(p1, p2) --[[ Line: 9 ]]
		-- upvalues: Parent (copy), Parent1 (copy), MomentsCreationFlowOpenedModule (copy)
		return function(p3) --[[ Line: 10 ]]
			-- upvalues: Parent (upval), Parent1 (upval), p1 (copy), MomentsCreationFlowOpenedModule (upval), p2 (copy)
			if not p3:getState()[require(Parent.Constants).RoduxKey].MomentsCreationFlow.IsOpen then
				local MomentsCreationModule = require(Parent1.MomentsCreation)
				local CreationFlowStore = MomentsCreationModule.Stores.GetCreationFlowStore(false)
				MomentsCreationModule.resetCreationFlow(MomentsCreationModule.Enums.CreationFlowState.Preview)
				CreationFlowStore.onSelectedCaptureUpdated(p1)
				MomentsCreationModule.beginCreationFlow("Captures")
				p3:dispatch(MomentsCreationFlowOpenedModule(p1, p2))
				
				return
			end
		end
	end
else
	local MomentsCreationFlowModule = require(Parent1.MomentsCreationFlow)
	local CreationFlowState = MomentsCreationFlowModule.Enums.CreationFlowState
	local SelectedCaptureUpdatedFunction = MomentsCreationFlowModule.Actions.SelectedCaptureUpdated
	local CreationFlowStateUpdatedFunction = MomentsCreationFlowModule.Actions.CreationFlowStateUpdated
	
	return function(p1, p2) --[[ Line: 34 ]]
		-- upvalues: MomentsCreationFlowOpenedModule (copy), CreationFlowStateUpdatedFunction (copy), CreationFlowState (copy), SelectedCaptureUpdatedFunction (copy)
		return function(p3) --[[ Line: 35 ]]
			-- upvalues: MomentsCreationFlowOpenedModule (upval), p1 (copy), p2 (copy), CreationFlowStateUpdatedFunction (upval), CreationFlowState (upval), SelectedCaptureUpdatedFunction (upval)
			p3:dispatch(MomentsCreationFlowOpenedModule(p1, p2))
			p3:dispatch(CreationFlowStateUpdatedFunction(CreationFlowState.Preview))
			p3:dispatch(SelectedCaptureUpdatedFunction(p1))
		end
	end
end