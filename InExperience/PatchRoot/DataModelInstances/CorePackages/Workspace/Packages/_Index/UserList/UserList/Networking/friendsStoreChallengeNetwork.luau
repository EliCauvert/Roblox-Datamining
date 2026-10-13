local parent = script:FindFirstAncestor("UserList").Parent

return require(parent.GenericChallenges).Middleware.ChallengeRequestWrapper(require(parent.DataHydration).Friends.httpRequest)