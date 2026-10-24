local Parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal
local config = {
	screen = nil,
	params = nil,
	requestId = 0,
	completedRequestId = 0
}

return function()
	-- upvalues: CreateSessionScopedSignalFunction (copy), config (copy)
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(config)
	
	return {
		getRequest = SessionScopedSignal,
		navigateIntoChat = function(p1, p2)
			-- upvalues: SessionScopedSignal (copy), SessionScopedSignal2 (copy)
			local SessionScopedSignalResult = SessionScopedSignal(false)
			SessionScopedSignal2({
				screen = if p1 == nil then SessionScopedSignalResult.screen else p1,
				params = if p2 == nil then SessionScopedSignalResult.params else p2,
				requestId = SessionScopedSignalResult.requestId + 1,
				completedRequestId = SessionScopedSignalResult.completedRequestId
			})
		end,
		completeExternalNavigation = function(CompletedRequestId)
			-- upvalues: SessionScopedSignal (copy), SessionScopedSignal2 (copy)
			local SessionScopedSignalResult = SessionScopedSignal(false)
			SessionScopedSignal2({
				screen = SessionScopedSignalResult.screen,
				params = SessionScopedSignalResult.params,
				requestId = SessionScopedSignalResult.requestId,
				completedRequestId = CompletedRequestId
			})
		end,
		reset = function()
			-- upvalues: SessionScopedSignal2 (copy), config (upval)
			SessionScopedSignal2(config)
		end
	}
end