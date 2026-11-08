local Moments = script:FindFirstAncestor("Moments")

return game:DefineFastFlag("MomentsCommentTranslationShownByDefault", false) and require(Moments.Flags.FFlagMomentsCommentTranslation)