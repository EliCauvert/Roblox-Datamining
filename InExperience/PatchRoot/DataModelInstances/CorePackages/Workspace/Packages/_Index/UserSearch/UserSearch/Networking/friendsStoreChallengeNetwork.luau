local parent = script:FindFirstAncestor("UserSearch").Parent

return require(parent.GenericChallenges).Middleware.ChallengeRequestWrapper(require(parent.DataHydration).Friends.httpRequest)