local Parent = script:FindFirstAncestor("PYMKCarousel").Parent

return require(Parent.GenericChallenges).Middleware.ChallengeRequestWrapper(require(Parent.DataHydration).Friends.httpRequest)