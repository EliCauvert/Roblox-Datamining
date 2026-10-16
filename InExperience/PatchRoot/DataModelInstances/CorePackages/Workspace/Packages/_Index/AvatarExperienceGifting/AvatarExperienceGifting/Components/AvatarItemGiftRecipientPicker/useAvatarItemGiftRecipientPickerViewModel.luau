local AvatarExperienceGifting = script:FindFirstAncestor("AvatarExperienceGifting")
local Parent = AvatarExperienceGifting.Parent
local ReactModule = require(Parent.React)
local AvatarExperienceNavigationModule = require(Parent.AvatarExperienceNavigation)
local GiftingModule = require(Parent.Gifting)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local _ = require(script.Parent.AvatarItemGiftRecipientPickerView)
local BuildGiftItemModule = require(AvatarExperienceGifting.Utils.buildGiftItem)
local _ = require(AvatarExperienceGifting.Types.GiftSendFlowNavigationOverrides)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local CloseGiftSendFlowFunction = AvatarExperienceNavigationModule.Utils.closeGiftSendFlow
local DebounceFunction = require(Parent.AvatarExperienceCommon).Utils.debounce
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local GiftState = GiftingModule.Enums.GiftState
local UseGiftRecipientsFunction = GiftingModule.Hooks.useGiftRecipients
local RecipientPickerStrings = GiftingModule.Constants.RecipientPickerStrings

return function(p1) --[[ Line: 33 | Named "useAvatarItemGiftRecipientPickerViewModel" ]]
	-- upvalues: UseNavigationFunction (copy), UseAvatarRouteFunction (copy), UseTokensFunction (copy), ReactModule (copy), BuildGiftItemModule (copy), CloseGiftSendFlowFunction (copy), AvatarScreen (copy), DebounceFunction (copy), UseGiftRecipientsFunction (copy), GiftState (copy), RecipientPickerStrings (copy), GiftingModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseTokensResult = UseTokensFunction()
	local CollectibleItemIdParam = UseNavigationResult.getParam("collectibleItemId")
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 42 ]]
		-- upvalues: BuildGiftItemModule (upval), CollectibleItemIdParam (copy)
		return BuildGiftItemModule(CollectibleItemIdParam)
	end, { CollectibleItemIdParam })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 46 ]]
		-- upvalues: UseMemoResult (copy)
		return if UseMemoResult == nil then nil else { UseMemoResult }
	end, { UseMemoResult })
	local CloseSendFlow = if p1 then p1.closeSendFlow else nil
	local UseResult = ReactModule.useCallback(function() --[[ Line: 51 ]]
		-- upvalues: CloseSendFlow (copy), CloseGiftSendFlowFunction (upval), UseNavigationResult (copy)
		if CloseSendFlow then
			CloseSendFlow()
			
			return
		else
			CloseGiftSendFlowFunction(UseNavigationResult)
		end
	end, { UseNavigationResult, CloseSendFlow })
	local UseResult1 = ReactModule.useCallback(function(RecipientId) --[[ Line: 59 ]]
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), CollectibleItemIdParam (copy)
		UseNavigationResult.navigate(AvatarScreen.SendGiftReview, {
			collectibleItemId = CollectibleItemIdParam,
			recipientId = RecipientId
		})
	end, { UseNavigationResult, CollectibleItemIdParam })
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 68 ]]
		-- upvalues: DebounceFunction (upval), UseStateResult2_1 (copy)
		return DebounceFunction(UseStateResult2_1, 0.25)
	end, {})
	local UseResult2 = ReactModule.useCallback(function(p2) --[[ Line: 71 ]]
		-- upvalues: UseStateResult2 (copy), UseMemoResult2 (copy)
		UseStateResult2(p2)
		UseMemoResult2(p2)
	end, { UseMemoResult2 })
	local UseGiftRecipientsResult = UseGiftRecipientsFunction(UseMemoResult1, UseStateResult1)
	local UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 78 ]]
		-- upvalues: UseGiftRecipientsResult (copy)
		local List = {}
		
		for _, recipient in UseGiftRecipientsResult.recipients do
			table.insert(List, {
				isAvailable = true,
				userId = tostring(recipient.userId),
				displayName = recipient.displayName,
				username = recipient.username
			})
		end
		return List
	end, { UseGiftRecipientsResult.recipients })
	local IsKeyMatch: boolean = UseAvatarRouteResult.isVisible and UseAvatarRouteResult.current.key == UseNavigationResult.state.key
	
	return {
		isVisible = UseMemoResult ~= nil and IsKeyMatch,
		pickerProps = {
			isOpen = true,
			titleText = RecipientPickerStrings.SheetTitle,
			searchPlaceholder = RecipientPickerStrings.SearchPlaceholder,
			searchText = UseStateResult,
			isSearchVisible = not (UseGiftRecipientsResult.hasFailed and UseStateResult1 == ""),
			onSearchChanged = UseResult2,
			sectionTitle = ReactModule.useMemo(function(): string --[[ Line: 126 ]]
				-- upvalues: UseGiftRecipientsResult (copy), GiftingModule (upval), RecipientPickerStrings (upval)
				local Count = 0
				
				for _, recipient in UseGiftRecipientsResult.recipients do
					if recipient.userRelationship == GiftingModule.Enums.UserRelationship.Friend then
						Count += 1
					end
				end
				return string.format(RecipientPickerStrings.FriendsSectionTitleFormat, Count)
			end, { UseGiftRecipientsResult.recipients }),
			rows = UseMemoResult3,
			state = ReactModule.useMemo(function() --[[ Line: 99 ]]
				-- upvalues: UseGiftRecipientsResult (copy), GiftState (upval), RecipientPickerStrings (upval), UseMemoResult3 (copy)
				return if UseGiftRecipientsResult.isLoading then { state = GiftState.Loading } elseif UseGiftRecipientsResult.hasFailed then {
					state = GiftState.Error,
					titleText = RecipientPickerStrings.ErrorTitle,
					bodyText = RecipientPickerStrings.ErrorBody,
					retryLabel = RecipientPickerStrings.RetryLabel,
					onRetry = UseGiftRecipientsResult.retry
				} elseif #UseMemoResult3 == 0 then {
					state = GiftState.Empty,
					titleText = RecipientPickerStrings.EmptyTitle,
					bodyText = RecipientPickerStrings.EmptyBody
				} else nil
			end, {
				UseGiftRecipientsResult.isLoading,
				UseGiftRecipientsResult.hasFailed,
				UseGiftRecipientsResult.retry,
				UseMemoResult3
			}),
			onRecipientSelected = ReactModule.useCallback(function(p2) --[[ Line: 91 ]]
				-- upvalues: UseResult1 (copy)
				local Number: number? = tonumber(p2)
				
				if Number ~= nil then
					UseResult1(Number)
					
					return
				end
			end, { UseResult1 }),
			unavailableLabel = RecipientPickerStrings.UnavailableLabel,
			avatarBackgroundStyle = UseTokensResult.Color.Shift.Shift_200,
			onClose = UseResult
		}
	}
end