local avatarExperienceGifting = script:FindFirstAncestor("AvatarExperienceGifting")
local parent = avatarExperienceGifting.Parent
local reactModule = require(parent.React)
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local useNavigation = require(parent.Navigation).useNavigation
local _ = require(script.Parent.AvatarItemGiftReviewSheetPlaceholderView)
local buildGiftItemModule = require(avatarExperienceGifting.Utils.buildGiftItem)
local _ = require(avatarExperienceGifting.Types.GiftSendFlowNavigationOverrides)
local closeGiftSendFlow = avatarExperienceNavigationModule.Utils.closeGiftSendFlow
local useAvatarRoute = avatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute

return function(p1)
	-- upvalues: useNavigation (ref), useAvatarRoute (ref), reactModule (ref), buildGiftItemModule (ref), closeGiftSendFlow (ref)
	local var1 = useNavigation()
	local var2 = useAvatarRoute()
	local collectibleItemId = var1.getParam("collectibleItemId")
	local recipientId = var1.getParam("recipientId")
	local var3 = reactModule.useMemo(function()
		-- upvalues: buildGiftItemModule (copy), collectibleItemId (ref)
		return buildGiftItemModule(collectibleItemId)
	end, { collectibleItemId })
	local var4 = if p1 then p1.goBack else nil
	local var5 = if p1 then p1.closeSendFlow else nil
	
	return {
		isVisible = var3 ~= nil and (recipientId ~= nil and (var2.isVisible and var2.current.key == var1.state.key)),
		onBack = reactModule.useCallback(function()
			-- upvalues: var4 (ref), var1 (ref)
			if var4 then
				var4()
				
				return
			end
			var1.pop()
		end, { var1, var4 }),
		onClose = reactModule.useCallback(function()
			-- upvalues: var5 (ref), closeGiftSendFlow (copy), var1 (ref)
			if var5 then
				var5()
				
				return
			end
			closeGiftSendFlow(var1)
		end, { var1, var5 })
	}
end