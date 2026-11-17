local Parent = script:FindFirstAncestor("Moments").Parent

return game:DefineFastFlag("MomentsFixTappedMomentIndex", false) and (require(Parent.SharedFlags).FFlagMomentsOptimisticProfilePending and require(script.Parent.FFlagMomentsModeratedMomentPage))