local UserActivationFramework = script:FindFirstAncestor("UserActivationFramework")
local ReactModule = require(UserActivationFramework.Parent.React)
local FullPageActivationFrameworkContextModule = require(UserActivationFramework.Context.FullPageActivationFrameworkContext)
local NavigationActionModule = require(UserActivationFramework.Enums.NavigationAction)
local ActivationFrameworkContextActionModule = require(UserActivationFramework.Enums.ActivationFrameworkContextAction)
local CallbackStatusModule = require(UserActivationFramework.Enums.CallbackStatus)
local UseUpdateActivationWorkflowAndNavigateModule = require(UserActivationFramework.Hooks.useUpdateActivationWorkflowAndNavigate)
local _ = require(UserActivationFramework.Types)
local _ = require(UserActivationFramework.Enums.PayloadKey)

return function(p1)
	-- upvalues: UseUpdateActivationWorkflowAndNavigateModule (copy), ReactModule (copy), FullPageActivationFrameworkContextModule (copy), ActivationFrameworkContextActionModule (copy), CallbackStatusModule (copy), NavigationActionModule (copy)
	local UseUpdateActivationWorkflowAndNavigateModuleResult = UseUpdateActivationWorkflowAndNavigateModule(p1)
	local UseContextResult = ReactModule.useContext(FullPageActivationFrameworkContextModule)
	
	return ReactModule.useCallback(function(p2)
		-- upvalues: UseContextResult (copy), ActivationFrameworkContextActionModule (upval), CallbackStatusModule (upval), UseUpdateActivationWorkflowAndNavigateModuleResult (copy), NavigationActionModule (upval)
		if p2 and not UseContextResult.activationFrameworkState.isLoading then
			UseContextResult.dispatch({
				type = ActivationFrameworkContextActionModule.SetIsLoading,
				data = { isLoading = true }
			})
			local OnButtonClickedResult = p2.onButtonClicked()
			
			if OnButtonClickedResult ~= nil then
				local PayloadAddendum = OnButtonClickedResult.payloadAddendum
				local Status = OnButtonClickedResult.status
				
				if Status == CallbackStatusModule.Success then
					if PayloadAddendum ~= nil then
						UseContextResult.dispatch({
							type = ActivationFrameworkContextActionModule.SetMergePayload,
							data = { payloadTable = PayloadAddendum }
						})
					end
					UseUpdateActivationWorkflowAndNavigateModuleResult(NavigationActionModule.Next, PayloadAddendum)
				elseif Status == CallbackStatusModule.NeedsReset then
					UseContextResult.dispatch({
						type = ActivationFrameworkContextActionModule.ClearPayload
					})
					UseUpdateActivationWorkflowAndNavigateModuleResult(NavigationActionModule.Reset)
				end
			end
			UseContextResult.dispatch({
				type = ActivationFrameworkContextActionModule.SetIsLoading,
				data = { isLoading = false }
			})
		end
	end, {
		p1,
		UseUpdateActivationWorkflowAndNavigateModuleResult,
		UseContextResult
	})
end