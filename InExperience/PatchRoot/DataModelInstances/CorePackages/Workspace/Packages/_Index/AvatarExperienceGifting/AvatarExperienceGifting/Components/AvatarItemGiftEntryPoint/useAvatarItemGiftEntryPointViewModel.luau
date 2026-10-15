local avatarExperienceGifting = script:FindFirstAncestor("AvatarExperienceGifting")
local parent = avatarExperienceGifting.Parent
local reactModule = require(parent.React)
local _ = require(parent.Gifting)
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local useNavigation = require(parent.Navigation).useNavigation
local _ = require(script.Parent.AvatarItemGiftEntryPointView)
local useAvatarItemGiftEligibilityModule = require(avatarExperienceGifting.Hooks.useAvatarItemGiftEligibility)
local avatarScreen = avatarExperienceNavigationModule.Enums.AvatarScreen

return function(p1)
	-- upvalues: useNavigation (ref), useAvatarItemGiftEligibilityModule (ref), reactModule (ref), avatarScreen (ref)
	local collectibleItemId = p1.collectibleItemId
	local isCircular = p1.isCircular
	local layoutOrder = p1.LayoutOrder
	local var1 = useNavigation()
	local var2 = useAvatarItemGiftEligibilityModule(collectibleItemId, p1.eligibilityDeps)
	local areItemsGiftable = var2.areItemsGiftable
	local canGift = var2.canGift
	local var3 = reactModule.useCallback(function()
		-- upvalues: canGift (ref), collectibleItemId (ref), var1 (ref), avatarScreen (copy)
		if canGift and collectibleItemId ~= nil and collectibleItemId ~= "" then
			var1.navigate(avatarScreen.SendGiftRecipientPicker, { collectibleItemId = collectibleItemId })
			
			return
		end
	end, { canGift, collectibleItemId, var1 })
	
	return {
		isVisible = areItemsGiftable,
		buttonProps = reactModule.useMemo(function()
			-- upvalues: var3 (ref), isCircular (ref), layoutOrder (ref)
			return {
				onActivated = var3,
				isCircular = isCircular,
				LayoutOrder = layoutOrder
			}
		end, { var3, isCircular, layoutOrder })
	}
end