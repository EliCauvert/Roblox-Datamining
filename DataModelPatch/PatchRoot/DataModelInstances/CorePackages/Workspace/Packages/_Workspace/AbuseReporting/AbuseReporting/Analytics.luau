local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local CryoModule = require(script:FindFirstAncestor("AbuseReporting").Parent.Cryo)
local AnalyticsModule = {}
AnalyticsModule.__index = AnalyticsModule
local config = {
	selectItemCount = 0,
	backButtonClickCount = 0,
	isSeenSummaryPage = false
}

function AnalyticsModule.new(_target, _context)
	-- upvalues: config (copy), AnalyticsModule (copy)
	return (setmetatable({
		_target = _target,
		_context = _context,
		_state = table.clone(config)
	}, AnalyticsModule))
end

function AnalyticsModule:_sendEvent(EventName, p1)
	-- upvalues: CryoModule (copy), RbxAnalyticsService (copy)
	if self._target and self._context then
		RbxAnalyticsService:SendEventDeferred(self._target, self._context, EventName, (CryoModule.Dictionary.join({
			platform = self._target,
			dialogEntryPoint = self._context
		}, self._state, p1 or {})))
	end
end

function AnalyticsModule:onBackButtonPressed()
	local State = self._state
	State.backButtonClickCount += 1
end

function AnalyticsModule:onSingleListItemSelected()
	local State = self._state
	State.selectItemCount += 1
end

function AnalyticsModule:onSubmissionPageMount()
	self._state.isSeenSummaryPage = true
end

function AnalyticsModule:onReportSubmitted()
	self:_sendEvent("TreeBasedAbuseReportSubmitted")
end

function AnalyticsModule:onReportAbandoned()
	self:_sendEvent("TreeBasedAbuseReportAbandoned")
end

return AnalyticsModule