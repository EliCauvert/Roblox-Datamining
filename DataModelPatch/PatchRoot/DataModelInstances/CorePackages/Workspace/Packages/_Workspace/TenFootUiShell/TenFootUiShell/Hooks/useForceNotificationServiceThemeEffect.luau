local NotificationService = game:GetService("NotificationService")
local ReactModule = require(script:FindFirstAncestor("TenFootUiShell").Parent.React)
local UseAppPolicyModule = require(script.Parent.useAppPolicy)

return function()
	-- upvalues: UseAppPolicyModule (copy), ReactModule (copy), NotificationService (copy)
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p1)
		return p1.getForceTheme()
	end)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseAppPolicyModuleResult (copy), NotificationService (upval)
		if UseAppPolicyModuleResult then
			NotificationService.SelectedTheme = UseAppPolicyModuleResult
		end
	end, { UseAppPolicyModuleResult })
end