local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local RoactNavigationModule = require(Parent.RoactNavigation)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local AvatarWorkshopPolicyProviderModule = require(AvatarWorkshop.Components.AvatarWorkshopPolicyProvider)
local WorkshopWindowContextModule = require(AvatarWorkshop.Contexts.WorkshopWindowContext)
local RespawnDialogContainerModule = require(AvatarWorkshop.Components.Modals.RespawnDialogContainer)
local GetAvatarStateStoreModule = require(AvatarWorkshop.Stores.Getters.getAvatarStateStore)
local GetUiStateStoreModule = require(AvatarWorkshop.Stores.Getters.getUiStateStore)
local RespawnAvatarModule = require(AvatarWorkshop.Utils.respawnAvatar)
local AppContainer = RoactNavigationModule.createAppContainer((require(AvatarWorkshop.Navigation.Navigators.WorkshopNavigator)))

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseSignalStateFunction (copy), GetAvatarStateStoreModule (copy), GetUiStateStoreModule (copy), ReactModule (copy), RespawnAvatarModule (copy), AvatarWorkshopPolicyProviderModule (copy), WorkshopWindowContextModule (copy), AppContainer (copy), RespawnDialogContainerModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseSignalStateResult = UseSignalStateFunction(GetAvatarStateStoreModule)
	local UseSignalStateResult1 = UseSignalStateFunction(GetUiStateStoreModule)
	local UseSignalStateResult2 = UseSignalStateFunction(UseSignalStateResult1.getIsRespawnDialogOpen)
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy)
		UseSignalStateResult.loadCurrentAvatar()
	end, { UseSignalStateResult })
	local SetIsRespawnDialogOpenFunction = UseSignalStateResult1.setIsRespawnDialogOpen
	ReactModule.useEffect(function()
		-- upvalues: SetIsRespawnDialogOpenFunction (copy)
		return function()
			-- upvalues: SetIsRespawnDialogOpenFunction (upval)
			SetIsRespawnDialogOpenFunction(false)
		end
	end, { SetIsRespawnDialogOpenFunction })
	local GetRespawnBehaviourFunction = p1.getRespawnBehaviour
	local RespawnBehaviorChangedEvent = p1.respawnBehaviorChangedEvent
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: GetRespawnBehaviourFunction (copy)
		return GetRespawnBehaviourFunction ~= nil and GetRespawnBehaviourFunction()
	end)
	ReactModule.useEffect(function()
		-- upvalues: RespawnBehaviorChangedEvent (copy), UseStateResult2 (copy), GetRespawnBehaviourFunction (copy)
		local EventConnection = if RespawnBehaviorChangedEvent then RespawnBehaviorChangedEvent.Event:Connect(UseStateResult2) else nil
		
		if GetRespawnBehaviourFunction then
			UseStateResult2((GetRespawnBehaviourFunction()))
		end
		return function()
			-- upvalues: EventConnection (copy)
			if EventConnection then
				EventConnection:Disconnect()
			end
		end
	end, { RespawnBehaviorChangedEvent, GetRespawnBehaviourFunction })
	
	return ReactModule.createElement("Frame", {
		Active = true,
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = UseTokensResult.Color.Surface.Surface_100.Color3,
		BackgroundTransparency = UseTokensResult.Color.Surface.Surface_100.Transparency
	}, {
		Corner = ReactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
		}),
		Navigation = ReactModule.createElement(AvatarWorkshopPolicyProviderModule, nil, ReactModule.createElement(WorkshopWindowContextModule.Provider, {
			value = ReactModule.useMemo(function()
				-- upvalues: p1 (copy), UseStateResult (copy), GetRespawnBehaviourFunction (copy), RespawnAvatarModule (upval)
				return {
					verticalLayout = p1.verticalLayout,
					onClose = p1.onClose,
					respawnEnabled = UseStateResult,
					respawn = function()
						-- upvalues: GetRespawnBehaviourFunction (upval), RespawnAvatarModule (upval)
						if GetRespawnBehaviourFunction then
							RespawnAvatarModule(GetRespawnBehaviourFunction)
						end
					end
				}
			end, {
				p1.verticalLayout,
				p1.onClose,
				UseStateResult,
				GetRespawnBehaviourFunction
			})
		}, {
			Navigator = ReactModule.createElement(AppContainer),
			RespawnDialog = if UseSignalStateResult2 then ReactModule.createElement(RespawnDialogContainerModule) else nil
		}))
	})
end