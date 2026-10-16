local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local BuildAgentRollbackSnackbarAutoDismissSeconds = game:DefineFastInt("BuildAgentRollbackSnackbarAutoDismissSeconds", 4)

return function(p1) --[[ Line: 17 | Named "AgentRollbackSnackbar" ]]
	-- upvalues: FoundationModule (copy), ReactModule (copy), BuildAgentRollbackSnackbarAutoDismissSeconds (copy), ReactRobloxModule (copy)
	local UseOverlayResult = FoundationModule.Hooks.useOverlay()
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	ReactModule.useEffect(function() --[[ Line: 21 ]]
		-- upvalues: BuildAgentRollbackSnackbarAutoDismissSeconds (upval), p1 (copy)
		local DelayedThread = task.delay(BuildAgentRollbackSnackbarAutoDismissSeconds, p1.onClose)
		
		return function() --[[ Line: 23 ]]
			-- upvalues: DelayedThread (copy)
			task.cancel(DelayedThread)
		end
	end, { p1.onClose })
	
	return if UseOverlayResult == nil then nil else ReactRobloxModule.createPortal(ReactModule.createElement(FoundationModule.Snackbar, {
		testId = "build-agent-rollback-snackbar",
		ZIndex = 999,
		AnchorPoint = Vector2.new(0.5, 1),
		onClose = p1.onClose,
		Position = UDim2.new(0.5, 0, 1, -UseTokensResult.Padding.XLarge),
		title = p1.title
	}), UseOverlayResult)
end