local Parent = script:FindFirstAncestor("ContactImporter").Parent

return require(Parent.GenericChallenges).Middleware.ChallengeRequestWrapper(require(Parent.DataHydration).Friends.httpRequest)