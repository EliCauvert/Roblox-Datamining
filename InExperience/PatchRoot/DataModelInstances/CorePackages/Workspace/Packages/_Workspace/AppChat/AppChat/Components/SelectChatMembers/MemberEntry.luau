local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local useSignalState = require(parent.SignalsReact).useSignalState
local getSelectedUsersStoreModule = require(appChat.Stores.GetSelectedUsersStore)
local useUserDataModule = require(appChat.Hooks.useUserData)

return reactModule.memo(function(p0) --[[ line: 23 | named "MemberEntry" ]]
	-- upvalues: useTokens (ref), getSelectedUsersStoreModule (ref), useSignalState (ref), useUserDataModule (ref), reactModule (ref), foundationModule (ref)
	local var5 = useTokens()
	local var6 = getSelectedUsersStoreModule(false)
	local var7 = useSignalState(var6.getSelectedUserIdAtIndex(p0.index))
	local var8 = useUserDataModule(var7 or "")
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy",
		onActivated = if var7 then reactModule.useCallback(function() --[[ line: 30 ]]
			-- upvalues: var7 (ref), var6 (ref)
			if var7 then
				var6.removeUserId(var7)
			end
		end, { var7 }) else nil,
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		LayoutOrder = p0.index
	}, {
		UserContainer = reactModule.createElement(foundationModule.View, {
			tag = "col size-0-full auto-x flex-x-fill align-x-center gap-xsmall"
		}, {
			Avatar = if var7 then reactModule.createElement(foundationModule.Avatar, {
				LayoutOrder = 1,
				userId = var8.id,
				userPresence = var8.presence,
				size = foundationModule.Enums.InputSize.Large,
				backgroundStyle = var5.Color.Shift.Shift_300
			}) else reactModule.createElement(foundationModule.Image, {
				tag = "content-emphasis",
				Image = "rbxasset://textures/ui/LuaChatV2/ic-friend-empty-border.png",
				LayoutOrder = 1,
				aspectRatio = {
					AspectRatio = 1,
					AspectType = Enum.AspectType.FitWithinMaxSize,
					DominantAxis = Enum.DominantAxis.Height
				},
				Size = UDim2.fromOffset(var5.Size.Size_1200, var5.Size.Size_1200)
			}),
			Label = reactModule.createElement(foundationModule.Text, {
				tag = "auto-y text-truncate-end text-caption-small",
				LayoutOrder = 2,
				Text = var8.combinedName,
				textStyle = var5.Color.Content.Default,
				fontStyle = var5.Typography.CaptionSmall
			})
		}),
		RemoveIcon = if var7 then reactModule.createElement(foundationModule.View, {
			tag = "auto-xy position-top-right anchor-top-right bg-over-media-0 radius-circle",
			ZIndex = 2
		}, {
			Icon = reactModule.createElement(foundationModule.Icon, {
				ZIndex = 2,
				style = var5.Color.Content.Emphasis,
				name = foundationModule.Enums.IconName.CircleX,
				variant = foundationModule.Enums.IconVariant.Filled,
				size = foundationModule.Enums.IconSize.Small
			})
		}) else nil
	})
end)