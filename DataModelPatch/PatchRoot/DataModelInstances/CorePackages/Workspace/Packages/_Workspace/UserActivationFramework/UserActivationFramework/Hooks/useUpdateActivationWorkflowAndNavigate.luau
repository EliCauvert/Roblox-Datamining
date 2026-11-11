local UserActivationFramework = script:FindFirstAncestor("UserActivationFramework")
local ReactModule = require(UserActivationFramework.Parent.React)
local FullPageActivationFrameworkContextModule = require(UserActivationFramework.Context.FullPageActivationFrameworkContext)
local UpdateActivationWorkflowModule = require(UserActivationFramework.Thunks.UpdateActivationWorkflow)
local _ = require(UserActivationFramework.Enums.NavigationAction)
local UserActivationSignupPageStateModule = require(UserActivationFramework.Enums.UserActivationSignupPageState)
local ActivationFrameworkContextActionModule = require(UserActivationFramework.Enums.ActivationFrameworkContextAction)
local _ = require(UserActivationFramework.Enums.Namespace)
local _ = require(UserActivationFramework.Enums.PayloadKey)

return function(p1)
	-- upvalues: ReactModule (copy), FullPageActivationFrameworkContextModule (copy), UpdateActivationWorkflowModule (copy), UserActivationSignupPageStateModule (copy), ActivationFrameworkContextActionModule (copy)
	local UseContextResult = ReactModule.useContext(FullPageActivationFrameworkContextModule)
	local ActivationFrameworkState = UseContextResult.activationFrameworkState
	local DispatchFunction = UseContextResult.dispatch
	local Namespace = ActivationFrameworkState.namespace
	
	return ReactModule.useCallback(function(p2, p3)
		-- upvalues: UpdateActivationWorkflowModule (upval), Namespace (copy), ActivationFrameworkState (copy), UserActivationSignupPageStateModule (upval), DispatchFunction (copy), ActivationFrameworkContextActionModule (upval), p1 (copy)
		local UpdateActivationWorkflowModuleResult = UpdateActivationWorkflowModule(Namespace, ActivationFrameworkState.currentState, ActivationFrameworkState.payloadTable, p2, ActivationFrameworkState.history, p3)
		
		if UpdateActivationWorkflowModuleResult == nil then
			ActivationFrameworkState.onClose()
			
			return
		end
		if UpdateActivationWorkflowModuleResult.state == UserActivationSignupPageStateModule.Complete then
			ActivationFrameworkState.onWorkflowComplete(ActivationFrameworkState.payloadTable)
			
			return
		else
			DispatchFunction({
				type = ActivationFrameworkContextActionModule.SetActivationFrameworkState,
				data = {
					currentState = UpdateActivationWorkflowModuleResult.state,
					availableActions = UpdateActivationWorkflowModuleResult.availableActions,
					history = UpdateActivationWorkflowModuleResult.history
				}
			})
			p1.navigate(UpdateActivationWorkflowModuleResult.state)
		end
	end, {
		p1,
		ActivationFrameworkState.currentState,
		ActivationFrameworkState.payloadTable,
		DispatchFunction
	})
end