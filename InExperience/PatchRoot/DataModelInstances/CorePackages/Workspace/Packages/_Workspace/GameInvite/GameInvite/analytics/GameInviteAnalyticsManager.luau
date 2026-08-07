local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local gameInvite = script:FindFirstAncestor("GameInvite")
local parent = gameInvite.Parent

return require(gameInvite.analytics.GameInviteAnalytics).new():withEventStream(require(parent.Analytics).AnalyticsReporters.EventStream.new(rbxAnalyticsService)):withDiag(require(parent.Analytics).AnalyticsReporters.Diag.new(rbxAnalyticsService))