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

local function noOp() end

local repeated = string.rep("W", 20)

return reactModule.memo(function(p1)
	-- upvalues: useUserDataModule (ref), foundationModule (ref), useIsRobloxSubscriber (ref), fFlagEnableBlackbirdCheck (ref), getSelectedUsersStoreModule (ref), useSignalState (ref), reactModule (ref), text (ref), repeated (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), fFlagAppChatUseProfileFrameThumbnailModule (ref), noOp (ref)
	local var1 = useUserDataModule(p1.userId)
	local var2 = foundationModule.Hooks.useTokens()
	local var3 = useIsRobloxSubscriber(if fFlagEnableBlackbirdCheck then p1.userId else nil)
	local var4 = getSelectedUsersStoreModule(false)
	local var5 = useSignalState(var4.getIsUserSelected(p1.userId))
	local var6 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), p1 (ref)
		var4.toggleUserId(p1.userId)
	end, { p1.userId })
	local var7 = reactModule.useMemo(function()
		-- upvalues: text (copy), repeated (copy), var2 (ref)
		local textBounds = text.GetTextBounds(repeated, var2.Typography.TitleLarge.Font, var2.Typography.TitleLarge.FontSize, Vector2.zero)
		
		return UDim2.fromOffset(textBounds.X, textBounds.Y)
	end, {
		var2.Typography.TitleLarge.Font,
		var2.Typography.TitleLarge.FontSize
	})
	local var8 = reactModule.useMemo(function()
		-- upvalues: text (copy), var2 (ref)
		local textBounds = text.GetTextBounds("Roblox Studio", var2.Typography.CaptionMedium.Font, var2.Typography.CaptionMedium.FontSize, Vector2.zero)
		
		return UDim2.fromOffset(textBounds.X, textBounds.Y)
	end, {
		var2.Typography.CaptionMedium.Font,
		var2.Typography.CaptionMedium.FontSize
	})
	local var9 = nil
	local _ = nil
	
	if fFlagDebugAppChatEnableDomLocatorsModule then
		local var10, var11 = reactModule.useState("")
		var9 = var10
		local var12 = var11
		reactModule.__subscribeToBinding(var1.username, function(p2)
			-- upvalues: var12 (write)
			var12(p2)
		end)
	end
	return reactModule.createElement(foundationModule.View, {
		tag = "row size-full-0 auto-y stroke-muted stroke-thin gap-medium padding-x-medium padding-y-small align-y-center",
		onActivated = var6,
		testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.selectChatMembersUserCellWithCheckbox(var9, var5) else nil
	}, {
		Avatar = reactModule.createElement(foundationModule.Avatar, {
			LayoutOrder = 1,
			userId = var1.id,
			userPresence = var1.presence,
			size = foundationModule.Enums.InputSize.Medium,
			backgroundStyle = var2.Color.Shift.Shift_300,
			includeProfileFrame = fFlagAppChatUseProfileFrameThumbnailModule
		}),
		UserInfo = reactModule.createElement(foundationModule.View, { tag = "col fill auto-y clip", LayoutOrder = 2 }, {
			UserDataSkeleton = reactModule.createElement(foundationModule.Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(var7.X, var7.Y + var8.Y),
				Visible = var1.isLoading
			}),
			DisplayNameRow = if fFlagEnableBlackbirdCheck then reactModule.createElement(foundationModule.View, {
				tag = "row auto-xy align-y-center gap-xsmall",
				LayoutOrder = 1,
				Visible = var1.isLoading:map(function(p2)
					return not p2
				end)
			}, {
				DisplayName = reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-title-large text-truncate-end content-emphasis",
					LayoutOrder = 1,
					Text = var1.combinedName
				}),
				SubscriptionBadge = if var3 then reactModule.createElement(foundationModule.Icon, {
					LayoutOrder = 2,
					name = foundationModule.Enums.IconName.RobloxPlus,
					size = foundationModule.Enums.IconSize.Small,
					style = var2.Color.Content.Emphasis
				}) else nil
			}) else nil,
			DisplayName = if not fFlagEnableBlackbirdCheck then reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-title-large text-truncate-end content-emphasis",
				LayoutOrder = 1,
				Text = var1.combinedName,
				Visible = var1.isLoading:map(function(p2)
					return not p2
				end)
			}) else nil,
			PresenceText = reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-caption-medium text-truncate-end content-muted",
				LayoutOrder = 3,
				Text = var1.presenceText,
				Visible = var1.isLoading:map(function(p2)
					return not p2
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
				isChecked = var5,
				size = foundationModule.Enums.InputSize.XSmall,
				onActivated = noOp
			})
		})
	})
end)