local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local useIsChatUserMessagesEnabledModule = require(appChat.Hooks.useIsChatUserMessagesEnabled)
local loadFoundationCloudAssetModule = require(appChat.Utils.loadFoundationCloudAsset)
local var5, _ = loadFoundationCloudAssetModule("pictograms/chat")
local var6, _ = loadFoundationCloudAssetModule("pictograms/voice_chat")

return reactModule.memo(function() --[[ line: 15 | named "EmptyConversationPage" ]]
	-- upvalues: useTokens (ref), useIsChatUserMessagesEnabledModule (ref), reactModule (ref), foundationModule (ref), var6 (ref), var5 (ref)
	return reactModule.createElement(foundationModule.View, { tag = "size-full" }, {
		ChatIcon = reactModule.createElement(foundationModule.Image, {
			tag = "position-center-center anchor-center-center",
			Image = if useIsChatUserMessagesEnabledModule() then var6 else var5,
			imageStyle = useTokens().Color.Content.Emphasis,
			ScaleType = Enum.ScaleType.Fit,
			Size = UDim2.new(0, 320, 0, 320)
		})
	})
end)