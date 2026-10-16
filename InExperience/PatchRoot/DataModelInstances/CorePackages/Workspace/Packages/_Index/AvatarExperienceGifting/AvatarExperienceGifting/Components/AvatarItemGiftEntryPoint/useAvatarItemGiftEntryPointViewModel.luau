local AvatarExperienceGifting = script:FindFirstAncestor("AvatarExperienceGifting")
local Parent = AvatarExperienceGifting.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Gifting)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local _ = require(script.Parent.AvatarItemGiftEntryPointView)
local UseAvatarItemGiftEligibilityModule = require(AvatarExperienceGifting.Hooks.useAvatarItemGiftEligibility)
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen

return function(Frame) --[[ Line: 23 | Named "useAvatarItemGiftEntryPointViewModel" ]]
	-- upvalues: UseNavigationFunction (copy), UseAvatarItemGiftEligibilityModule (copy), ReactModule (copy), AvatarScreen (copy)
	local CollectibleItemId = Frame.collectibleItemId
	local IsCircular = Frame.isCircular
	local LayoutOrder = Frame.LayoutOrder
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarItemGiftEligibilityModuleResult = UseAvatarItemGiftEligibilityModule(CollectibleItemId, Frame.eligibilityDeps)
	local CanGift = UseAvatarItemGiftEligibilityModuleResult.canGift
	local UseResult = ReactModule.useCallback(function() --[[ Line: 36 ]]
		-- upvalues: CanGift (copy), CollectibleItemId (copy), UseNavigationResult (copy), AvatarScreen (upval)
		if CanGift and CollectibleItemId ~= nil and CollectibleItemId ~= "" then
			UseNavigationResult.navigate(AvatarScreen.SendGiftRecipientPicker, { collectibleItemId = CollectibleItemId })
			
			return
		end
	end, { CanGift, CollectibleItemId, UseNavigationResult })
	
	return {
		isVisible = UseAvatarItemGiftEligibilityModuleResult.areItemsGiftable,
		buttonProps = ReactModule.useMemo(function() --[[ Line: 46 ]]
			-- upvalues: UseResult (copy), IsCircular (copy), LayoutOrder (copy)
			return {
				onActivated = UseResult,
				isCircular = IsCircular,
				LayoutOrder = LayoutOrder
			}
		end, { UseResult, IsCircular, LayoutOrder })
	}
end