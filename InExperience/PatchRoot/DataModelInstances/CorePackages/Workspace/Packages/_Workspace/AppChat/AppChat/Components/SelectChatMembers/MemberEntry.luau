local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local fFlagAppChatUseProfileFrameThumbnailModule = require(appChat.Flags.FFlagAppChatUseProfileFrameThumbnail)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local useSignalState = require(parent.SignalsReact).useSignalState
local getSelectedUsersStoreModule = require(appChat.Stores.GetSelectedUsersStore)
local useUserDataModule = require(appChat.Hooks.useUserData)

return reactModule.memo(function(p0) --[[ line: 24 | named "MemberEntry" ]]
	-- upvalues: useTokens (ref), getSelectedUsersStoreModule (ref), useSignalState (ref), useUserDataModule (ref), reactModule (ref), foundationModule (ref), fFlagAppChatUseProfileFrameThumbnailModule (ref)
	local var6 = useTokens()
	local var7 = getSelectedUsersStoreModule(false)
	local var8 = useSignalState(var7.getSelectedUserIdAtIndex(p0.index))
	local var9 = useUserDataModule(var8 or "")
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy",
		onActivated = if var8 then reactModule.useCallback(function() --[[ line: 31 ]]
			-- upvalues: var8 (ref), var7 (ref)
			if var8 then
				var7.removeUserId(var8)
			end
		end, { var8 }) else nil,
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		LayoutOrder = p0.index
	}, {
		UserContainer = reactModule.createElement(foundationModule.View, {
			tag = "col size-0-full auto-x flex-x-fill align-x-center gap-xsmall"
		}, {
			Avatar = if var8 then reactModule.createElement(foundationModule.Avatar, {
				LayoutOrder = 1,
				userId = var9.id,
				userPresence = var9.presence,
				size = foundationModule.Enums.InputSize.Large,
				backgroundStyle = var6.Color.Shift.Shift_300,
				includeProfileFrame = fFlagAppChatUseProfileFrameThumbnailModule
			}) else reactModule.createElement(foundationModule.Image, {
				tag = "content-emphasis",
				Image = "rbxasset://textures/ui/LuaChatV2/ic-friend-empty-border.png",
				LayoutOrder = 1,
				aspectRatio = {
					AspectRatio = 1,
					AspectType = Enum.AspectType.FitWithinMaxSize,
					DominantAxis = Enum.DominantAxis.Height
				},
				Size = UDim2.fromOffset(var6.Size.Size_1200, var6.Size.Size_1200)
			}),
			Label = reactModule.createElement(foundationModule.Text, {
				tag = "auto-y text-truncate-end text-caption-small",
				LayoutOrder = 2,
				Text = var9.combinedName,
				textStyle = var6.Color.Content.Default,
				fontStyle = var6.Typography.CaptionSmall
			})
		}),
		RemoveIcon = if var8 then reactModule.createElement(foundationModule.View, {
			tag = "auto-xy position-top-right anchor-top-right bg-over-media-0 radius-circle",
			ZIndex = 2
		}, {
			Icon = reactModule.createElement(foundationModule.Icon, {
				ZIndex = 2,
				style = var6.Color.Content.Emphasis,
				name = foundationModule.Enums.IconName.CircleX,
				variant = foundationModule.Enums.IconVariant.Filled,
				size = foundationModule.Enums.IconSize.Small
			})
		}) else nil
	})
end)