local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local GameInvite = script:FindFirstAncestor("GameInvite")
local Parent = GameInvite.Parent

return (require(GameInvite.analytics.GameInviteAnalytics).new():withEventStream(require(Parent.Analytics).AnalyticsReporters.EventStream.new(RbxAnalyticsService)):withDiag(require(Parent.Analytics).AnalyticsReporters.Diag.new(RbxAnalyticsService)))