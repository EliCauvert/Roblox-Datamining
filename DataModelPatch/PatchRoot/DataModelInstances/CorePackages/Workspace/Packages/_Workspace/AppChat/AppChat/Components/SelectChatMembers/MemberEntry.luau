local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GetSelectedUsersStoreModule = require(AppChat.Stores.GetSelectedUsersStore)
local UseUserDataModule = require(AppChat.Hooks.useUserData)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), GetSelectedUsersStoreModule (copy), UseSignalStateFunction (copy), UseUserDataModule (copy), ReactModule (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	local SelectedUsersStoreModule = GetSelectedUsersStoreModule(false)
	local UseSignalStateResult = UseSignalStateFunction(SelectedUsersStoreModule.getSelectedUserIdAtIndex(p1.index))
	local UseUserDataModuleResult = UseUserDataModule(UseSignalStateResult or "")
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseSignalStateResult (copy), SelectedUsersStoreModule (copy)
		if UseSignalStateResult then
			SelectedUsersStoreModule.removeUserId(UseSignalStateResult)
		end
	end, { UseSignalStateResult })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy",
		onActivated = if UseSignalStateResult then UseResult else nil,
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		},
		LayoutOrder = p1.index
	}, {
		UserContainer = ReactModule.createElement(FoundationModule.View, {
			tag = "col size-0-full auto-x flex-x-fill align-x-center gap-xsmall"
		}, {
			Avatar = if UseSignalStateResult then ReactModule.createElement(FoundationModule.Avatar, {
				LayoutOrder = 1,
				userId = UseUserDataModuleResult.id,
				userPresence = UseUserDataModuleResult.presence,
				size = FoundationModule.Enums.InputSize.Large,
				backgroundStyle = UseTokensResult.Color.Shift.Shift_300
			}) else ReactModule.createElement(FoundationModule.Image, {
				tag = "content-emphasis",
				Image = "rbxasset://textures/ui/LuaChatV2/ic-friend-empty-border.png",
				LayoutOrder = 1,
				aspectRatio = {
					AspectRatio = 1,
					AspectType = Enum.AspectType.FitWithinMaxSize,
					DominantAxis = Enum.DominantAxis.Height
				},
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_1200, UseTokensResult.Size.Size_1200)
			}),
			Label = ReactModule.createElement(FoundationModule.Text, {
				tag = "auto-y text-truncate-end text-caption-small",
				LayoutOrder = 2,
				Text = UseUserDataModuleResult.combinedName,
				textStyle = UseTokensResult.Color.Content.Default,
				fontStyle = UseTokensResult.Typography.CaptionSmall
			})
		}),
		RemoveIcon = if UseSignalStateResult then ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy position-top-right anchor-top-right bg-over-media-0 radius-circle",
			ZIndex = 2
		}, {
			Icon = ReactModule.createElement(FoundationModule.Icon, {
				ZIndex = 2,
				style = UseTokensResult.Color.Content.Emphasis,
				name = FoundationModule.Enums.IconName.CircleX,
				variant = FoundationModule.Enums.IconVariant.Filled,
				size = FoundationModule.Enums.IconSize.Small
			})
		}) else nil
	})
end)