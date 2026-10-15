local avatarExperienceGifting = script:FindFirstAncestor("AvatarExperienceGifting")
local parent = avatarExperienceGifting.Parent
local reactModule = require(parent.React)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local foundationModule = require(parent.Foundation)
local giftingModule = require(parent.Gifting)
local useNavigation = require(parent.Navigation).useNavigation
local _ = require(script.Parent.AvatarItemGiftRecipientPickerView)
local buildGiftItemModule = require(avatarExperienceGifting.Utils.buildGiftItem)
local _ = require(avatarExperienceGifting.Types.GiftSendFlowNavigationOverrides)
local avatarScreen = avatarExperienceNavigationModule.Enums.AvatarScreen
local closeGiftSendFlow = avatarExperienceNavigationModule.Utils.closeGiftSendFlow
local debounce = avatarExperienceCommonModule.Utils.debounce
local useAvatarRoute = avatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local useTokens = foundationModule.Hooks.useTokens
local constants = giftingModule.Constants
local giftState = giftingModule.Enums.GiftState
local useGiftRecipients = giftingModule.Hooks.useGiftRecipients
local recipientPickerStrings = constants.RecipientPickerStrings

return function(p1)
	-- upvalues: useNavigation (ref), useAvatarRoute (ref), useTokens (ref), reactModule (ref), buildGiftItemModule (ref), closeGiftSendFlow (ref), avatarScreen (ref), debounce (ref), useGiftRecipients (ref), giftState (ref), recipientPickerStrings (ref), giftingModule (ref)
	local var1 = useNavigation()
	local var2 = useAvatarRoute()
	local var3 = useTokens()
	local collectibleItemId = var1.getParam("collectibleItemId")
	local var4 = reactModule.useMemo(function()
		-- upvalues: buildGiftItemModule (copy), collectibleItemId (ref)
		return buildGiftItemModule(collectibleItemId)
	end, { collectibleItemId })
	local var5 = reactModule.useMemo(function()
		-- upvalues: var4 (ref)
		return if var4 == nil then nil else { var4 }
	end, { var4 })
	local var6 = if p1 then p1.closeSendFlow else nil
	local var7 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), closeGiftSendFlow (copy), var1 (ref)
		if var6 then
			var6()
			
			return
		end
		closeGiftSendFlow(var1)
	end, { var1, var6 })
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), avatarScreen (copy), collectibleItemId (ref)
		var1.navigate(avatarScreen.SendGiftReview, { collectibleItemId = collectibleItemId, recipientId = p2 })
	end, { var1, collectibleItemId })
	local var9, var10 = reactModule.useState("")
	local var11, var12 = reactModule.useState("")
	local var13 = reactModule.useMemo(function()
		-- upvalues: debounce (copy), var12 (ref)
		return debounce(var12, 0.25)
	end, {})
	local var14 = reactModule.useCallback(function(p2)
		-- upvalues: var10 (ref), var13 (ref)
		var10(p2)
		var13(p2)
	end, { var13 })
	local var15 = useGiftRecipients(var5, var11)
	local var16 = reactModule.useMemo(function()
		-- upvalues: var15 (ref)
		local t = {}
		
		for i, v in var15.recipients do
			table.insert(t, {
				isAvailable = true,
				userId = tostring(v.userId),
				displayName = v.displayName,
				username = v.username
			})
		end
		return t
	end, { var15.recipients })
	
	return {
		isVisible = var4 ~= nil and (var2.isVisible and var2.current.key == var1.state.key),
		pickerProps = {
			isOpen = true,
			titleText = recipientPickerStrings.SheetTitle,
			searchPlaceholder = recipientPickerStrings.SearchPlaceholder,
			searchText = var9,
			isSearchVisible = not (var15.hasFailed and var11 == ""),
			onSearchChanged = var14,
			sectionTitle = reactModule.useMemo(function()
				-- upvalues: var15 (ref), giftingModule (copy), recipientPickerStrings (copy)
				local var17 = 0
				
				for i, v in var15.recipients do
					if v.userRelationship == giftingModule.Enums.UserRelationship.Friend then
						var17 += 1
					end
				end
				return string.format(recipientPickerStrings.FriendsSectionTitleFormat, var17)
			end, { var15.recipients }),
			rows = var16,
			state = reactModule.useMemo(function()
				-- upvalues: var15 (ref), giftState (copy), recipientPickerStrings (copy), var16 (ref)
				return if var15.isLoading then { state = giftState.Loading } elseif var15.hasFailed then {
					state = giftState.Error,
					titleText = recipientPickerStrings.ErrorTitle,
					bodyText = recipientPickerStrings.ErrorBody,
					retryLabel = recipientPickerStrings.RetryLabel,
					onRetry = var15.retry
				} elseif #var16 == 0 then {
					state = giftState.Empty,
					titleText = recipientPickerStrings.EmptyTitle,
					bodyText = recipientPickerStrings.EmptyBody
				} else nil
			end, { var15.isLoading, var15.hasFailed, var15.retry, var16 }),
			onRecipientSelected = reactModule.useCallback(function(p2)
				-- upvalues: var8 (ref)
				local var18 = tonumber(p2)
				
				if var18 == nil then
					return
				end
				var8(var18)
			end, { var8 }),
			unavailableLabel = recipientPickerStrings.UnavailableLabel,
			avatarBackgroundStyle = var3.Color.Shift.Shift_200,
			onClose = var7
		}
	}
end