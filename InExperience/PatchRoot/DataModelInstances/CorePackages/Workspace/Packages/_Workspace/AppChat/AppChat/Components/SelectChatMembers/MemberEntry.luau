local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local fFlagAppChatUseProfileFrameThumbnailModule = require(appChat.Flags.FFlagAppChatUseProfileFrameThumbnail)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local useSignalState = require(parent.SignalsReact).useSignalState
local getSelectedUsersStoreModule = require(appChat.Stores.GetSelectedUsersStore)
local useUserDataModule = require(appChat.Hooks.useUserData)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), getSelectedUsersStoreModule (ref), useSignalState (ref), useUserDataModule (ref), reactModule (ref), foundationModule (ref), fFlagAppChatUseProfileFrameThumbnailModule (ref)
	local var1 = useTokens()
	local var2 = getSelectedUsersStoreModule(false)
	local var3 = useSignalState(var2.getSelectedUserIdAtIndex(p1.index))
	local var4 = useUserDataModule(var3 or "")
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy",
		onActivated = if var3 then reactModule.useCallback(function()
			-- upvalues: var3 (ref), var2 (ref)
			if var3 then
				var2.removeUserId(var3)
			end
		end, { var3 }) else nil,
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		LayoutOrder = p1.index
	}, {
		UserContainer = reactModule.createElement(foundationModule.View, {
			tag = "col size-0-full auto-x flex-x-fill align-x-center gap-xsmall"
		}, {
			Avatar = if var3 then reactModule.createElement(foundationModule.Avatar, {
				LayoutOrder = 1,
				userId = var4.id,
				userPresence = var4.presence,
				size = foundationModule.Enums.InputSize.Large,
				backgroundStyle = var1.Color.Shift.Shift_300,
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
				Size = UDim2.fromOffset(var1.Size.Size_1200, var1.Size.Size_1200)
			}),
			Label = reactModule.createElement(foundationModule.Text, {
				tag = "auto-y text-truncate-end text-caption-small",
				LayoutOrder = 2,
				Text = var4.combinedName,
				textStyle = var1.Color.Content.Default,
				fontStyle = var1.Typography.CaptionSmall
			})
		}),
		RemoveIcon = if var3 then reactModule.createElement(foundationModule.View, {
			tag = "auto-xy position-top-right anchor-top-right bg-over-media-0 radius-circle",
			ZIndex = 2
		}, {
			Icon = reactModule.createElement(foundationModule.Icon, {
				ZIndex = 2,
				style = var1.Color.Content.Emphasis,
				name = foundationModule.Enums.IconName.CircleX,
				variant = foundationModule.Enums.IconVariant.Filled,
				size = foundationModule.Enums.IconSize.Small
			})
		}) else nil
	})
end)