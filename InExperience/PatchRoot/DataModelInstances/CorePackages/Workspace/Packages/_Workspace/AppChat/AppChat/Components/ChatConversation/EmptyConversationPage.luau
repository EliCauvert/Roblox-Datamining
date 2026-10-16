local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseIsChatUserMessagesEnabledModule = require(AppChat.Hooks.useIsChatUserMessagesEnabled)
local LoadFoundationCloudAssetModule = require(AppChat.Utils.loadFoundationCloudAsset)
local Chat, _ = LoadFoundationCloudAssetModule("pictograms/chat")
local VoiceChat, _ = LoadFoundationCloudAssetModule("pictograms/voice_chat")

return ReactModule.memo(function() --[[ Line: 15 | Named "EmptyConversationPage" ]]
	-- upvalues: UseTokensFunction (copy), UseIsChatUserMessagesEnabledModule (copy), ReactModule (copy), FoundationModule (copy), VoiceChat (copy), Chat (copy)
	return ReactModule.createElement(FoundationModule.View, { tag = "size-full" }, {
		ChatIcon = ReactModule.createElement(FoundationModule.Image, {
			tag = "position-center-center anchor-center-center",
			Image = if UseIsChatUserMessagesEnabledModule() then VoiceChat else Chat,
			imageStyle = UseTokensFunction().Color.Content.Emphasis,
			ScaleType = Enum.ScaleType.Fit,
			Size = UDim2.new(0, 320, 0, 320)
		})
	})
end)