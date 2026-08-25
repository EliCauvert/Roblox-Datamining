local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local buildAgentRollbackSnackbarAutoDismissSeconds = game:DefineFastInt("BuildAgentRollbackSnackbarAutoDismissSeconds", 4)

return function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), buildAgentRollbackSnackbarAutoDismissSeconds (ref), reactRobloxModule (ref)
	local var1 = foundationModule.Hooks.useOverlay()
	local var2 = foundationModule.Hooks.useTokens()
	reactModule.useEffect(function()
		-- upvalues: buildAgentRollbackSnackbarAutoDismissSeconds (copy), p1 (ref)
		local delayedThread = task.delay(buildAgentRollbackSnackbarAutoDismissSeconds, p1.onClose)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { p1.onClose })
	
	return if var1 == nil then nil else reactRobloxModule.createPortal(reactModule.createElement(foundationModule.Snackbar, {
		testId = "build-agent-rollback-snackbar",
		ZIndex = 999,
		AnchorPoint = Vector2.new(0.5, 1),
		onClose = p1.onClose,
		Position = UDim2.new(0.5, 0, 1, -var2.Padding.XLarge),
		title = p1.title
	}), var1)
end