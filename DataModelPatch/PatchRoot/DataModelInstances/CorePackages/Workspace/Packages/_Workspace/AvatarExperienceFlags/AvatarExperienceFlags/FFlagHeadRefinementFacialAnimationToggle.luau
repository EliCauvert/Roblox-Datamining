local EnableFacsDisableOverride2EngineFeature = game:GetEngineFeature("EnableFacsDisableOverride2")

return require(script.Parent.FFlagDynamicHeadsMigration) and (EnableFacsDisableOverride2EngineFeature and game:DefineFastFlag("HeadRefinementFacialAnimationToggle4", false))