local Parent = script:FindFirstAncestor("ProfilePlatform").Parent

return require(Parent.GenericChallenges).Middleware.ChallengeRequestWrapper(require(Parent.DataHydration).Friends.httpRequest)