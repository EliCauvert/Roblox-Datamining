local parent = script:FindFirstAncestor("PYMKCarousel").Parent

return require(parent.GenericChallenges).Middleware.ChallengeRequestWrapper(require(parent.DataHydration).Friends.httpRequest)