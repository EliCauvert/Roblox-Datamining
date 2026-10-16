local Parent = script:FindFirstAncestor("UserList").Parent

return require(Parent.GenericChallenges).Middleware.ChallengeRequestWrapper(require(Parent.DataHydration).Friends.httpRequest)