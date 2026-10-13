local parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent

return require(parent.GenericChallenges).Middleware.ChallengeRequestWrapper(require(parent.DataHydration).Friends.httpRequest)