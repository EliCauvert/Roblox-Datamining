local parent = script:FindFirstAncestor("SocialTabsPage").Parent

return require(parent.GenericChallenges).Middleware.ChallengeRequestWrapper(require(parent.DataHydration).Friends.httpRequest)