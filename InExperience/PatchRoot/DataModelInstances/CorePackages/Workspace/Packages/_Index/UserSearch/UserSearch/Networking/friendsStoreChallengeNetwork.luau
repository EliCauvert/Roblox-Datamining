local Parent = script:FindFirstAncestor("UserSearch").Parent

return require(Parent.GenericChallenges).Middleware.ChallengeRequestWrapper(require(Parent.DataHydration).Friends.httpRequest)