local AppChat = script:FindFirstAncestor("AppChat")
local ReactModule = require(AppChat.Parent.React)
local AssetCardViewModule = require(AppChat.Components.ChatConversation.AssetCardView.AssetCardView)
local UseGenericShareLinkAssetCardViewModelModule = require(script.Parent.useGenericShareLinkAssetCardViewModel)

return ReactModule.memo(function(p1)
	-- upvalues: UseGenericShareLinkAssetCardViewModelModule (copy), ReactModule (copy), AssetCardViewModule (copy)
	return ReactModule.createElement(AssetCardViewModule, (UseGenericShareLinkAssetCardViewModelModule(p1)))
end)