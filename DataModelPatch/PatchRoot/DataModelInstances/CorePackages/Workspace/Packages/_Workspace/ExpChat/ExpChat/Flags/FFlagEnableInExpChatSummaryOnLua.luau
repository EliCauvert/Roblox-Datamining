local FFlagEnableClientSummarySystemMessageOnLua = require(script:FindFirstAncestor("ExpChat").Parent.SharedFlags).FFlagEnableClientSummarySystemMessageOnLua
local EnableInExpChatSummaryOnLua4 = game:DefineFastFlag("EnableInExpChatSummaryOnLua4", false)

return game:GetEngineFeature("EnableInExpChatSummary2") and (EnableInExpChatSummaryOnLua4 or FFlagEnableClientSummarySystemMessageOnLua)