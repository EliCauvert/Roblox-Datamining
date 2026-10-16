local AvatarExperienceGifting = script:FindFirstAncestor("AvatarExperienceGifting")
local Parent = AvatarExperienceGifting.Parent
local ReactModule = require(Parent.React)
local AvatarExperienceNavigationModule = require(Parent.AvatarExperienceNavigation)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local _ = require(script.Parent.AvatarItemGiftReviewSheetPlaceholderView)
local BuildGiftItemModule = require(AvatarExperienceGifting.Utils.buildGiftItem)
local _ = require(AvatarExperienceGifting.Types.GiftSendFlowNavigationOverrides)
local CloseGiftSendFlowFunction = AvatarExperienceNavigationModule.Utils.closeGiftSendFlow
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute

return function(p1) --[[ Line: 19 | Named "useAvatarItemGiftReviewSheetViewModel" ]]
	-- upvalues: UseNavigationFunction (copy), UseAvatarRouteFunction (copy), ReactModule (copy), BuildGiftItemModule (copy), CloseGiftSendFlowFunction (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local CollectibleItemIdParam = UseNavigationResult.getParam("collectibleItemId")
	local RecipientIdParam = UseNavigationResult.getParam("recipientId")
	local GoBack = if p1 then p1.goBack else nil
	local CloseSendFlow = if p1 then p1.closeSendFlow else nil
	local IsKeyMatch: boolean = UseAvatarRouteResult.isVisible and UseAvatarRouteResult.current.key == UseNavigationResult.state.key
	
	return {
		isVisible = ReactModule.useMemo(function() --[[ Line: 26 ]]
			-- upvalues: BuildGiftItemModule (upval), CollectibleItemIdParam (copy)
			return BuildGiftItemModule(CollectibleItemIdParam)
		end, { CollectibleItemIdParam }) ~= nil and (RecipientIdParam ~= nil and IsKeyMatch),
		onBack = ReactModule.useCallback(function() --[[ Line: 31 ]]
			-- upvalues: GoBack (copy), UseNavigationResult (copy)
			if GoBack then
				GoBack()
				
				return
			else
				UseNavigationResult.pop()
			end
		end, { UseNavigationResult, GoBack }),
		onClose = ReactModule.useCallback(function() --[[ Line: 40 ]]
			-- upvalues: CloseSendFlow (copy), CloseGiftSendFlowFunction (upval), UseNavigationResult (copy)
			if CloseSendFlow then
				CloseSendFlow()
				
				return
			else
				CloseGiftSendFlowFunction(UseNavigationResult)
			end
		end, { UseNavigationResult, CloseSendFlow })
	}
end