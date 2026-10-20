local UserActivationFramework = script:FindFirstAncestor("UserActivationFramework")
local Parent = UserActivationFramework.Parent
local ReactModule = require(Parent.React)
local _ = require(UserActivationFramework.Components.ActivationFrameworkTokenMapper)
local _ = require(UserActivationFramework.Types)
local FullPageActivationFrameworkContextModule = require(UserActivationFramework.Context.FullPageActivationFrameworkContext)
local ActivationFrameworkContextActionModule = require(UserActivationFramework.Enums.ActivationFrameworkContextAction)
local NavigationActionModule = require(UserActivationFramework.Enums.NavigationAction)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local AuthPageloadFunction = require(Parent.AuthAnalytics).Events.authPageload
local Text = require(Parent.Foundation).Text
local UseUpdateActivationWorkflowAndNavigateModule = require(UserActivationFramework.Hooks.useUpdateActivationWorkflowAndNavigate)

return function(p1)
	-- upvalues: ReactModule (copy), FullPageActivationFrameworkContextModule (copy), UseDesignTokensFunction (copy), UseUpdateActivationWorkflowAndNavigateModule (copy), AuthPageloadFunction (copy), ActivationFrameworkContextActionModule (copy), NavigationActionModule (copy), Text (copy)
	local UseContextResult = ReactModule.useContext(FullPageActivationFrameworkContextModule)
	local ActivationFrameworkState = UseContextResult.activationFrameworkState
	local ActivationFramework = UseDesignTokensFunction().LuaApps.ActivationFramework
	local UseUpdateActivationWorkflowAndNavigateModuleResult = UseUpdateActivationWorkflowAndNavigateModule(p1.navigation)
	ReactModule.useEffect(function()
		-- upvalues: AuthPageloadFunction (upval), ActivationFrameworkState (copy), p1 (copy), UseContextResult (copy), ActivationFrameworkContextActionModule (upval), UseUpdateActivationWorkflowAndNavigateModuleResult (copy), NavigationActionModule (upval)
		AuthPageloadFunction(ActivationFrameworkState.namespace, ActivationFrameworkState.currentState)
		local OnNonInteractiveStepExecutionResult = p1.step.onNonInteractiveStepExecution()
		local SuccessPayloadAddendum = OnNonInteractiveStepExecutionResult.successPayloadAddendum
		local _ = OnNonInteractiveStepExecutionResult.errorOutput
		
		if SuccessPayloadAddendum then
			UseContextResult.dispatch({
				type = ActivationFrameworkContextActionModule.SetMergePayload,
				data = { payloadTable = SuccessPayloadAddendum }
			})
			UseUpdateActivationWorkflowAndNavigateModuleResult(NavigationActionModule.Next)
			
			return
		else
			UseUpdateActivationWorkflowAndNavigateModuleResult(NavigationActionModule.Back)
		end
	end, {})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 0.5,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0)
	}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, ActivationFramework.verticalPaddingPx),
			PaddingTop = UDim.new(0, ActivationFramework.verticalPaddingPx),
			PaddingLeft = UDim.new(0, ActivationFramework.horizontalPaddingPx),
			PaddingRight = UDim.new(0, ActivationFramework.horizontalPaddingPx)
		}),
		ReactModule.createElement(Text, {
			Text = "LOADING...",
			tag = "text-body-medium text-align-x-left auto-xy",
			TextWrapped = true,
			fontStyle = { LineHeight = 1 }
		})
	})
end