local NewResult = require(script:FindFirstAncestor("ChallengeDialog").Parent.Analytics).Analytics.new((game:GetService("RbxAnalyticsService")))
local LoginInfoOverflowedCounter = game:DefineFastString("LoginInfoOverflowedCounter", "LoginInfoOverflowed")

return {
	loginInfoOverflowed = function()
		-- upvalues: NewResult (copy), LoginInfoOverflowedCounter (copy)
		NewResult.Diag:reportCounter(LoginInfoOverflowedCounter, 1)
	end
}