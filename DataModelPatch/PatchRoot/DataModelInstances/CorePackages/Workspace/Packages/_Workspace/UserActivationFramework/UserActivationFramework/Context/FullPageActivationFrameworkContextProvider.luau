local UserActivationFramework = script:FindFirstAncestor("UserActivationFramework")
local ReactModule = require(UserActivationFramework.Parent.React)
local FullPageActivationFrameworkContextModule = require(UserActivationFramework.Context.FullPageActivationFrameworkContext)
local ActivationFrameworkReducerModule = require(UserActivationFramework.Reducers.ActivationFrameworkReducer)
local _ = require(UserActivationFramework.Types.ActivationFrameworkContextTypes)
local _ = require(UserActivationFramework.Enums.PayloadKey)

return function(p1)
	-- upvalues: ReactModule (copy), ActivationFrameworkReducerModule (copy), FullPageActivationFrameworkContextModule (copy)
	local InitialActivationWorkflowState = p1.initialActivationWorkflowState
	local UseReducerResult, UseReducerResult2 = ReactModule.useReducer(ActivationFrameworkReducerModule, {
		sessionId = "",
		isLoading = false,
		namespace = InitialActivationWorkflowState.namespace,
		currentState = InitialActivationWorkflowState.state,
		payloadTable = InitialActivationWorkflowState.payload,
		availableActions = InitialActivationWorkflowState.availableActions,
		history = InitialActivationWorkflowState.history,
		onClose = p1.onClose,
		onWorkflowComplete = p1.onWorkflowComplete,
		navigation = {}
	})
	
	return ReactModule.createElement(FullPageActivationFrameworkContextModule.Provider, {
		value = {
			activationFrameworkState = UseReducerResult,
			dispatch = UseReducerResult2,
			monoDeps = p1.monoDeps
		}
	}, p1.children)
end