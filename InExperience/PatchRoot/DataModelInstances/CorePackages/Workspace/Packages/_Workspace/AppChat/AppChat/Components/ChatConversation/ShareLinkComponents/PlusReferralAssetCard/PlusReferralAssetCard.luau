local AppChat = script:FindFirstAncestor("AppChat")
local ReactModule = require(AppChat.Parent.React)
local AssetCardViewModule = require(AppChat.Components.ChatConversation.AssetCardView.AssetCardView)
local UsePlusReferralAssetCardViewModelModule = require(script.Parent.usePlusReferralAssetCardViewModel)

return ReactModule.memo(function(p1) --[[ Line: 11 | Named "PlusReferralAssetCard" ]]
	-- upvalues: UsePlusReferralAssetCardViewModelModule (copy), ReactModule (copy), AssetCardViewModule (copy)
	return ReactModule.createElement(AssetCardViewModule, (UsePlusReferralAssetCardViewModelModule(p1)))
end)