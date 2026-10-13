local parent = script:FindFirstAncestor("ProfilePlatform").Parent

return require(parent.GenericChallenges).Middleware.ChallengeRequestWrapper(require(parent.DataHydration).Friends.httpRequest)