local Parent = script:FindFirstAncestor("SocialTabsPage").Parent

return require(Parent.GenericChallenges).Middleware.ChallengeRequestWrapper(require(Parent.DataHydration).Friends.httpRequest)