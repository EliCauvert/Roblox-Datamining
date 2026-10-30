local NotificationsOrchestrator = script:FindFirstAncestor("NotificationsOrchestrator")

return require(NotificationsOrchestrator.Parent.Signals).createComputed((require(NotificationsOrchestrator.Internal.createNotificationsStore)))