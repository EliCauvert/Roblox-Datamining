local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local useIsChatUserMessagesEnabledModule = require(appChat.Hooks.useIsChatUserMessagesEnabled)
local loadFoundationCloudAssetModule = require(appChat.Utils.loadFoundationCloudAsset)
local var1, _ = loadFoundationCloudAssetModule("pictograms/chat")
local var2, _ = loadFoundationCloudAssetModule("pictograms/voice_chat")

return reactModule.memo(function()
	-- upvalues: useTokens (ref), useIsChatUserMessagesEnabledModule (ref), reactModule (ref), foundationModule (ref), var2 (ref), var1 (ref)
	return reactModule.createElement(foundationModule.View, { tag = "size-full" }, {
		ChatIcon = reactModule.createElement(foundationModule.Image, {
			tag = "position-center-center anchor-center-center",
			Image = if useIsChatUserMessagesEnabledModule() then var2 else var1,
			imageStyle = useTokens().Color.Content.Emphasis,
			ScaleType = Enum.ScaleType.Fit,
			Size = UDim2.new(0, 320, 0, 320)
		})
	})
end)