local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local fFlagAppChatUseProfileFrameThumbnailModule = require(appChat.Flags.FFlagAppChatUseProfileFrameThumbnail)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local text = require(parent.AppCommonLib).Text
local useSignalState = require(parent.SignalsReact).useSignalState
local getSelectedUsersStoreModule = require(appChat.Stores.GetSelectedUsersStore)
local useUserDataModule = require(appChat.Hooks.useUserData)
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local useIsRobloxSubscriber = require(parent.UserProfiles).Hooks.useIsRobloxSubscriber
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local domLocatorsModule = require(appChat.Utils.DomLocators)

local function noOp() --[[ line: 30 ]] end

local repeated = string.rep("W", 20)

return reactModule.memo(function(p0) --[[ line: 36 ]]
	-- upvalues: useUserDataModule (ref), foundationModule (ref), useIsRobloxSubscriber (ref), fFlagEnableBlackbirdCheck (ref), getSelectedUsersStoreModule (ref), useSignalState (ref), reactModule (ref), text (ref), repeated (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), fFlagAppChatUseProfileFrameThumbnailModule (ref), noOp (ref)
	local var10 = useUserDataModule(p0.userId)
	local var11 = foundationModule.Hooks.useTokens()
	local var12 = useIsRobloxSubscriber(if fFlagEnableBlackbirdCheck then p0.userId else nil)
	local var13 = getSelectedUsersStoreModule(false)
	local var14 = useSignalState(var13.getIsUserSelected(p0.userId))
	local var15 = reactModule.useCallback(function() --[[ line: 45 ]]
		-- upvalues: var13 (ref), p0 (ref)
		var13.toggleUserId(p0.userId)
	end, { p0.userId })
	local var16 = reactModule.useMemo(function() --[[ line: 49 ]]
		-- upvalues: text (copy), repeated (copy), var11 (ref)
		local textBounds = text.GetTextBounds(repeated, var11.Typography.TitleLarge.Font, var11.Typography.TitleLarge.FontSize, Vector2.zero)
		
		return UDim2.fromOffset(textBounds.X, textBounds.Y)
	end, {
		var11.Typography.TitleLarge.Font,
		var11.Typography.TitleLarge.FontSize
	})
	local var17 = reactModule.useMemo(function() --[[ line: 59 ]]
		-- upvalues: text (copy), var11 (ref)
		local textBounds = text.GetTextBounds("Roblox Studio", var11.Typography.CaptionMedium.Font, var11.Typography.CaptionMedium.FontSize, Vector2.zero)
		
		return UDim2.fromOffset(textBounds.X, textBounds.Y)
	end, {
		var11.Typography.CaptionMedium.Font,
		var11.Typography.CaptionMedium.FontSize
	})
	local var18 = nil
	local _ = nil
	
	if fFlagDebugAppChatEnableDomLocatorsModule then
		local var19, var20 = reactModule.useState("")
		var18 = var19
		local var21 = var20
		reactModule.__subscribeToBinding(var10.username, function(p1) --[[ line: 72 ]]
			-- upvalues: var21 (write)
			var21(p1)
		end)
	end
	return reactModule.createElement(foundationModule.View, {
		tag = "row size-full-0 auto-y stroke-muted stroke-thin gap-medium padding-x-medium padding-y-small align-y-center",
		onActivated = var15,
		testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.selectChatMembersUserCellWithCheckbox(var18, var14) else nil
	}, {
		Avatar = reactModule.createElement(foundationModule.Avatar, {
			LayoutOrder = 1,
			userId = var10.id,
			userPresence = var10.presence,
			size = foundationModule.Enums.InputSize.Medium,
			backgroundStyle = var11.Color.Shift.Shift_300,
			includeProfileFrame = fFlagAppChatUseProfileFrameThumbnailModule
		}),
		UserInfo = reactModule.createElement(foundationModule.View, { tag = "col fill auto-y clip", LayoutOrder = 2 }, {
			UserDataSkeleton = reactModule.createElement(foundationModule.Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(var16.X, var16.Y + var17.Y),
				Visible = var10.isLoading
			}),
			DisplayNameRow = if fFlagEnableBlackbirdCheck then reactModule.createElement(foundationModule.View, {
				tag = "row auto-xy align-y-center gap-xsmall",
				LayoutOrder = 1,
				Visible = var10.isLoading:map(function(p2) --[[ line: 106 ]]
					return not p2
				end)
			}, {
				DisplayName = reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-title-large text-truncate-end content-emphasis",
					LayoutOrder = 1,
					Text = var10.combinedName
				}),
				SubscriptionBadge = if var12 then reactModule.createElement(foundationModule.Icon, {
					LayoutOrder = 2,
					name = foundationModule.Enums.IconName.RobloxPlus,
					size = foundationModule.Enums.IconSize.Small,
					style = var11.Color.Content.Emphasis
				}) else nil
			}) else nil,
			DisplayName = if not fFlagEnableBlackbirdCheck then reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-title-large text-truncate-end content-emphasis",
				LayoutOrder = 1,
				Text = var10.combinedName,
				Visible = var10.isLoading:map(function(p3) --[[ line: 130 ]]
					return not p3
				end)
			}) else nil,
			PresenceText = reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-caption-medium text-truncate-end content-muted",
				LayoutOrder = 3,
				Text = var10.presenceText,
				Visible = var10.isLoading:map(function(p4) --[[ line: 139 ]]
					return not p4
				end)
			})
		}),
		CheckboxContainer = reactModule.createElement(foundationModule.View, {
			tag = "auto-xy padding-x-medium",
			isDisabled = true,
			LayoutOrder = 3,
			onActivated = noOp,
			selection = { Selectable = false }
		}, {
			checkbox = reactModule.createElement(foundationModule.Checkbox, {
				label = "",
				Selectable = false,
				isChecked = var14,
				size = foundationModule.Enums.InputSize.XSmall,
				onActivated = noOp
			})
		})
	})
end)