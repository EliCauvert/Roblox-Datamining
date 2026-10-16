local FFlagEditProfileImageV2EnabledModule = require(script.Parent.FFlagEditProfileImageV2Enabled)

return game:DefineFastFlag("EditProfileFramesEnabled2", false) and (FFlagEditProfileImageV2EnabledModule and game:GetEngineFeature("FrameAssetInProfileConfigurationEnabled"))