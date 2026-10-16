local Parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent

return require(Parent.GenericChallenges).Middleware.ChallengeRequestWrapper(require(Parent.DataHydration).Friends.httpRequest)