local appChat = script:FindFirstAncestor("AppChat")
local reactModule = require(appChat.Parent.React)
local assetCardViewModule = require(appChat.Components.ChatConversation.AssetCardView.AssetCardView)
local usePlusReferralAssetCardViewModelModule = require(script.Parent.usePlusReferralAssetCardViewModel)

return reactModule.memo(function(value)
	-- upvalues: usePlusReferralAssetCardViewModelModule (ref), reactModule (ref), assetCardViewModule (ref)
	return reactModule.createElement(assetCardViewModule, usePlusReferralAssetCardViewModelModule(value))
end)