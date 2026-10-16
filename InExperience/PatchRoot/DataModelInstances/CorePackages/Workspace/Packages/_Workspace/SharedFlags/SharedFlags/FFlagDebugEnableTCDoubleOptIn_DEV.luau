local FFlagAppChatEnableDoubleOptInModule = require(script.Parent.FFlagAppChatEnableDoubleOptIn)

return require(script.Parent.FFlagTCUpsellModalEnabled_DEV) and (game:DefineFastFlag("DebugEnableTCDoubleOptIn_DEV", false) and FFlagAppChatEnableDoubleOptInModule)