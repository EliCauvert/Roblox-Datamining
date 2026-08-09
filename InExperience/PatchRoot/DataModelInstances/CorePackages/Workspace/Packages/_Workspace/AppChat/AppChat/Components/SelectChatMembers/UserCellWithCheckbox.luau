local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
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

local function noOp() --[[ line: 29 ]] end

local repeated = string.rep("W", 20)

return reactModule.memo(function(p0) --[[ line: 35 ]]
	-- upvalues: useUserDataModule (ref), foundationModule (ref), useIsRobloxSubscriber (ref), fFlagEnableBlackbirdCheck (ref), getSelectedUsersStoreModule (ref), useSignalState (ref), reactModule (ref), text (ref), repeated (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), noOp (ref)
	local var9 = useUserDataModule(p0.userId)
	local var10 = foundationModule.Hooks.useTokens()
	local var11 = useIsRobloxSubscriber(if fFlagEnableBlackbirdCheck then p0.userId else nil)
	local var12 = getSelectedUsersStoreModule(false)
	local var13 = useSignalState(var12.getIsUserSelected(p0.userId))
	local var14 = reactModule.useCallback(function() --[[ line: 44 ]]
		-- upvalues: var12 (ref), p0 (ref)
		var12.toggleUserId(p0.userId)
	end, { p0.userId })
	local var15 = reactModule.useMemo(function() --[[ line: 48 ]]
		-- upvalues: text (copy), repeated (copy), var10 (ref)
		local textBounds = text.GetTextBounds(repeated, var10.Typography.TitleLarge.Font, var10.Typography.TitleLarge.FontSize, Vector2.zero)
		
		return UDim2.fromOffset(textBounds.X, textBounds.Y)
	end, {
		var10.Typography.TitleLarge.Font,
		var10.Typography.TitleLarge.FontSize
	})
	local var16 = reactModule.useMemo(function() --[[ line: 58 ]]
		-- upvalues: text (copy), var10 (ref)
		local textBounds = text.GetTextBounds("Roblox Studio", var10.Typography.CaptionMedium.Font, var10.Typography.CaptionMedium.FontSize, Vector2.zero)
		
		return UDim2.fromOffset(textBounds.X, textBounds.Y)
	end, {
		var10.Typography.CaptionMedium.Font,
		var10.Typography.CaptionMedium.FontSize
	})
	local var17 = nil
	local _ = nil
	
	if fFlagDebugAppChatEnableDomLocatorsModule then
		local var18, var19 = reactModule.useState("")
		var17 = var18
		local var20 = var19
		reactModule.__subscribeToBinding(var9.username, function(p1) --[[ line: 71 ]]
			-- upvalues: var20 (write)
			var20(p1)
		end)
	end
	return reactModule.createElement(foundationModule.View, {
		tag = "row size-full-0 auto-y stroke-muted stroke-thin gap-medium padding-x-medium padding-y-small align-y-center",
		onActivated = var14,
		testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.selectChatMembersUserCellWithCheckbox(var17, var13) else nil
	}, {
		Avatar = reactModule.createElement(foundationModule.Avatar, {
			LayoutOrder = 1,
			userId = var9.id,
			userPresence = var9.presence,
			size = foundationModule.Enums.InputSize.Medium,
			backgroundStyle = var10.Color.Shift.Shift_300
		}),
		UserInfo = reactModule.createElement(foundationModule.View, { tag = "col fill auto-y clip", LayoutOrder = 2 }, {
			UserDataSkeleton = reactModule.createElement(foundationModule.Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(var15.X, var15.Y + var16.Y),
				Visible = var9.isLoading
			}),
			DisplayNameRow = if fFlagEnableBlackbirdCheck then reactModule.createElement(foundationModule.View, {
				tag = "row auto-xy align-y-center gap-xsmall",
				LayoutOrder = 1,
				Visible = var9.isLoading:map(function(p2) --[[ line: 104 ]]
					return not p2
				end)
			}, {
				DisplayName = reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-title-large text-truncate-end content-emphasis",
					LayoutOrder = 1,
					Text = var9.combinedName
				}),
				SubscriptionBadge = if var11 then reactModule.createElement(foundationModule.Icon, {
					LayoutOrder = 2,
					name = foundationModule.Enums.IconName.RobloxPlus,
					size = foundationModule.Enums.IconSize.Small,
					style = var10.Color.Content.Emphasis
				}) else nil
			}) else nil,
			DisplayName = if not fFlagEnableBlackbirdCheck then reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-title-large text-truncate-end content-emphasis",
				LayoutOrder = 1,
				Text = var9.combinedName,
				Visible = var9.isLoading:map(function(p3) --[[ line: 128 ]]
					return not p3
				end)
			}) else nil,
			PresenceText = reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-caption-medium text-truncate-end content-muted",
				LayoutOrder = 3,
				Text = var9.presenceText,
				Visible = var9.isLoading:map(function(p4) --[[ line: 137 ]]
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
				isChecked = var13,
				size = foundationModule.Enums.InputSize.XSmall,
				onActivated = noOp
			})
		})
	})
end)