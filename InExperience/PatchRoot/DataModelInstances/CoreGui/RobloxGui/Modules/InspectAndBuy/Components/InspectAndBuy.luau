local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local MouseIconOverrideService = require(CorePackages.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local RoactModule = require(CorePackages.Packages.Roact)
local RoduxModule = require(CorePackages.Packages.Rodux)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RenderWithCoreScriptsStyleProviderModule = require(CoreGui.RobloxGui.Modules.Common.renderWithCoreScriptsStyleProvider)
local SelectionCursorProvider = require(CorePackages.Packages.UIBlox).App.SelectionImage.SelectionCursorProvider
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local AXInspectAndBuyLayerName = game:DefineFastString("AXInspectAndBuyLayerName", "Experience.Menu")
local AXEnableInspectAndBuyExposureLogging = game:DefineFastFlag("AXEnableInspectAndBuyExposureLogging", false)
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local CoreScriptsRootProvider = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local Chrome = CoreGui:WaitForChild("RobloxGui").Modules.Chrome
local EnabledFunction = require(CorePackages.Workspace.Packages.Chrome).Enabled
local ServiceModule = if EnabledFunction() then require(Chrome.Service) else nil
local FFlagEnableConsoleExpControls = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local Parent = script.Parent.Parent
local SetDetailsInformationModule = require(Parent.Actions.SetDetailsInformation)
local SetTryingOnInfoModule = require(Parent.Actions.SetTryingOnInfo)
local ThunkModule = require(Parent.Thunk)
local NetworkModule = require(Parent.Services.Network)
local AnalyticsModule = require(Parent.Services.Analytics)
local InspectAndBuyReducerModule = require(Parent.Reducers.InspectAndBuyReducer)
local ContainerModule = require(Parent.Components.Container)
local InspectAndBuyBaseContainerModule = require(Parent.Components.InspectAndBuyBaseContainer)
local ConstantsModule = require(Parent.Constants)
local CompactViewModule = require(Parent.CompactView)
local WideViewModule = require(Parent.WideView)
local WideLandscapeViewModule = require(Parent.WideLandscapeView)
local SetGamepadEnabledModule = require(Parent.Actions.SetGamepadEnabled)
local SetViewModule = require(Parent.Actions.SetView)
local SetPlayerIdModule = require(Parent.Actions.SetPlayerId)
local SetPlayerNameModule = require(Parent.Actions.SetPlayerName)
local SetLocaleModule = require(Parent.Actions.SetLocale)
local SetItemBeingPurchasedModule = require(Parent.Actions.SetItemBeingPurchased)
local SetIsSubjectToChinaPoliciesModule = require(Parent.Actions.SetIsSubjectToChinaPolicies)
local UpdateStoreIdModule = require(Parent.Actions.UpdateStoreId)
local GetAssetsFromHumanoidDescriptionV2Module = if require(Parent.Flags.FFlagAXEnableFetchAvatarPreview) then require(Parent.Thunks.GetAssetsFromHumanoidDescriptionV2) else require(Parent.Thunks.GetAssetsFromHumanoidDescription)
local UpdateOwnedStatusModule = require(Parent.Thunks.UpdateOwnedStatus)
local ReportPurchaseSuccessUnifiedEventModule = require(Parent.Thunks.ReportPurchaseSuccessUnifiedEvent)
local FFlagAXIaBSinglePurchaseUnifiedEventsModule = require(Parent.Flags.FFlagAXIaBSinglePurchaseUnifiedEvents)
local GetCharacterModelFromUserIdModule = require(Parent.Thunks.GetCharacterModelFromUserId)
local GetPlayerNameModule = require(Parent.Thunks.GetPlayerName)
local InspectAndBuyContextModule = require(Parent.Components.InspectAndBuyContext)
local CloseOverlayModule = require(Parent.Actions.CloseOverlay)
local AvatarExperienceInspectAndBuyModule = require(CorePackages.Workspace.Packages.AvatarExperienceInspectAndBuy)
local GetViewTypeFunction = AvatarExperienceInspectAndBuyModule.Utils.getViewType
local InspectAndBuyVersion = AvatarExperienceInspectAndBuyModule.Enums.InspectAndBuyVersion
local FFlagEnableInspectAndBuyV2RootFlag = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableInspectAndBuyV2RootFlag
local FFlagAXEnableInspectAndBuyVersionAnalyticsModule = require(Parent.Flags.FFlagAXEnableInspectAndBuyVersionAnalytics)
local FFlagAXEnableInspectAndBuyFocusNavigation = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableInspectAndBuyFocusNavigation
local CachedPolicyServiceModule = require(CorePackages.Workspace.Packages.CachedPolicyService)
local FFlagAXEnableNewInspectAndBuyContainerModule = require(Parent.Flags.FFlagAXEnableNewInspectAndBuyContainer)
local OverrideCursorInspectMenu = require(CorePackages.Workspace.Packages.AppCommonLib).Symbol.named("OverrideCursorInspectMenu")
local InspectAndBuy = RoactModule.PureComponent:extend("InspectAndBuy")

function InspectAndBuy:pushMouseIconOverride() --[[ Line: 89 ]]
	-- upvalues: UserInputService (copy), MouseIconOverrideService (copy), OverrideCursorInspectMenu (copy)
	if UserInputService:GetLastInputType().Name:find("Gamepad") then
		MouseIconOverrideService.push(OverrideCursorInspectMenu, Enum.OverrideMouseIconBehavior.ForceHide)
		
		return
	else
		MouseIconOverrideService.push(OverrideCursorInspectMenu, Enum.OverrideMouseIconBehavior.ForceShow)
	end
end

function InspectAndBuy:popMouseIconOverride() --[[ Line: 100 ]]
	-- upvalues: MouseIconOverrideService (copy), OverrideCursorInspectMenu (copy)
	MouseIconOverrideService.pop(OverrideCursorInspectMenu)
end

function InspectAndBuy.configureInputType(p1, p2) --[[ Line: 104 ]]
	-- upvalues: UserInputService (copy), SetGamepadEnabledModule (copy)
	if (p2 or UserInputService:GetLastInputType()).Name:find("Gamepad") then
		p1.state.store:dispatch(SetGamepadEnabledModule(true))
		
		return
	else
		p1.state.store:dispatch(SetGamepadEnabledModule(false))
	end
end

function InspectAndBuy.updateView(p1) --[[ Line: 115 ]]
	-- upvalues: FFlagAXEnableNewInspectAndBuyContainerModule (copy), SetViewModule (copy), GetViewTypeFunction (copy), ConstantsModule (copy)
	local ViewportSize = workspace.CurrentCamera.ViewportSize
	
	if FFlagAXEnableNewInspectAndBuyContainerModule then
		p1.state.store:dispatch(SetViewModule(GetViewTypeFunction(ViewportSize)))
		
		return
	else
		p1.state.store:dispatch(SetViewModule(if ViewportSize.X < 600 then ConstantsModule.View.Compact elseif ViewportSize.Y < ViewportSize.X and ViewportSize.X < 800 then ConstantsModule.View.WideLandscape else ConstantsModule.View.Wide))
	end
end

function InspectAndBuy.init(p1) --[[ Line: 133 ]]
	-- upvalues: NetworkModule (copy), FFlagAXEnableInspectAndBuyVersionAnalyticsModule (copy), AnalyticsModule (copy), FFlagEnableInspectAndBuyV2RootFlag (copy), InspectAndBuyVersion (copy), RoduxModule (copy), InspectAndBuyReducerModule (copy), ThunkModule (copy), ConstantsModule (copy), CompactViewModule (copy), WideViewModule (copy), WideLandscapeViewModule (copy), UpdateStoreIdModule (copy), SetPlayerNameModule (copy), SetLocaleModule (copy), LocalizationService (copy), SetPlayerIdModule (copy), GetAssetsFromHumanoidDescriptionV2Module (copy), FFlagAXIaBSinglePurchaseUnifiedEventsModule (copy), ReportPurchaseSuccessUnifiedEventModule (copy), UpdateOwnedStatusModule (copy), SetItemBeingPurchasedModule (copy)
	local PlayerId = p1.props.playerId
	local PlayerName = p1.props.playerName
	local Ctx = p1.props.ctx
	p1.connections = {}
	p1.network = p1.props.network or NetworkModule.new()
	p1.analytics = if FFlagAXEnableInspectAndBuyVersionAnalyticsModule then AnalyticsModule.new(PlayerId, Ctx, if FFlagEnableInspectAndBuyV2RootFlag then InspectAndBuyVersion.Version2 else InspectAndBuyVersion.Version1) else AnalyticsModule.new(PlayerId, Ctx)
	p1.humanoidDescription = p1.props.humanoidDescription
	p1.analytics.reportOpenInspectMenu()
	p1.state = {
		store = RoduxModule.Store.new(InspectAndBuyReducerModule, {}, {
			ThunkModule.middleware({
				[NetworkModule] = p1.network,
				[AnalyticsModule] = p1.analytics
			})
		}),
		views = {
			[ConstantsModule.View.Compact] = CompactViewModule,
			[ConstantsModule.View.Wide] = WideViewModule,
			[ConstantsModule.View.WideLandscape] = WideLandscapeViewModule
		}
	}
	p1.state.store:dispatch(UpdateStoreIdModule())
	p1.state.store:dispatch(SetPlayerNameModule(PlayerName))
	p1.state.store:dispatch(SetLocaleModule(LocalizationService.RobloxLocaleId))
	
	if PlayerId then
		p1.state.store:dispatch(SetPlayerIdModule(PlayerId))
	end
	if p1.humanoidDescription then
		p1.state.store:dispatch(GetAssetsFromHumanoidDescriptionV2Module(p1.humanoidDescription, false))
	end
	function p1:onPromptPurchaseFinished(p2, p3) --[[ Line: 186 ]]
		-- upvalues: p1 (copy), ConstantsModule (upval), FFlagAXIaBSinglePurchaseUnifiedEventsModule (upval), ReportPurchaseSuccessUnifiedEventModule (upval), UpdateOwnedStatusModule (upval), SetItemBeingPurchasedModule (upval)
		local ItemBeingPurchased = p1.state.store:getState().itemBeingPurchased
		p1.analytics.sendCounter(ConstantsModule.Counters.PurchaseFinished)
		
		if p3 and tostring(p2) == ItemBeingPurchased.itemId then
			if FFlagAXIaBSinglePurchaseUnifiedEventsModule then
				p1.state.store:dispatch(ReportPurchaseSuccessUnifiedEventModule(ItemBeingPurchased.itemId, ItemBeingPurchased.itemType, ItemBeingPurchased.resalePrice))
			else
				p1.analytics.reportPurchaseSuccess(ItemBeingPurchased.itemType, ItemBeingPurchased.itemId)
			end
			p1.state.store:dispatch(UpdateOwnedStatusModule(ItemBeingPurchased.itemId, ItemBeingPurchased.itemType))
			
			if ItemBeingPurchased.itemType == ConstantsModule.ItemType.Asset then
				p1.analytics.sendCounter(ConstantsModule.Counters.PurchaseSucceededAsset)
			elseif ItemBeingPurchased.itemType == ConstantsModule.ItemType.Bundle then
				p1.analytics.sendCounter(ConstantsModule.Counters.PurchaseSucceededBundle)
			else
				p1.analytics.sendCounter(ConstantsModule.Counters.PurchaseSucceededOther)
			end
		end
		p1.state.store:dispatch(SetItemBeingPurchasedModule(nil, nil))
	end
end

function InspectAndBuy.didMount(p1) --[[ Line: 216 ]]
	-- upvalues: AXEnableInspectAndBuyExposureLogging (copy), IxpUtilsModule (copy), AXInspectAndBuyLayerName (copy), FFlagEnableConsoleExpControls (copy), EnabledFunction (copy), ServiceModule (copy), UserInputService (copy), LocalizationService (copy), SetLocaleModule (copy), GuiService (copy), CachedPolicyServiceModule (copy), SetIsSubjectToChinaPoliciesModule (copy), MarketplaceService (copy), Players (copy), GetCharacterModelFromUserIdModule (copy), GetAssetsFromHumanoidDescriptionV2Module (copy), GetPlayerNameModule (copy)
	local PlayerId = p1.props.playerId
	p1.isMounted = true
	p1:updateView()
	p1:bindButtonB()
	p1:configureInputType()
	p1:pushMouseIconOverride()
	
	if AXEnableInspectAndBuyExposureLogging then
		IxpUtilsModule.logLayerExposure(AXInspectAndBuyLayerName)
	end
	if FFlagEnableConsoleExpControls and EnabledFunction() then
		ServiceModule:setHideShortcutBar("InspectAndBuy", true)
	end
	local LastInputTypeChangedConnection = UserInputService.LastInputTypeChanged:Connect(function(LastInputType) --[[ Line: 233 ]]
		-- upvalues: p1 (copy)
		p1:configureInputType(LastInputType)
	end)
	local Connection = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 239 ]]
		-- upvalues: p1 (copy)
		p1:updateView()
	end)
	local Connection1 = LocalizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function() --[[ Line: 243 ]]
		-- upvalues: p1 (copy), SetLocaleModule (upval), LocalizationService (upval)
		p1.state.store:dispatch(SetLocaleModule(LocalizationService.RobloxLocaleId))
	end)
	local MenuOpenedConnection = GuiService.MenuOpened:Connect(function() --[[ Line: 247 ]]
		-- upvalues: p1 (copy), GuiService (upval)
		p1:popMouseIconOverride()
		GuiService.SelectedCoreObject = nil
	end)
	local MenuClosedConnection = GuiService.MenuClosed:Connect(function() --[[ Line: 252 ]]
		-- upvalues: p1 (copy)
		p1:pushMouseIconOverride()
	end)
	coroutine.wrap(function() --[[ Line: 256 ]]
		-- upvalues: CachedPolicyServiceModule (upval), p1 (copy), SetIsSubjectToChinaPoliciesModule (upval)
		p1.state.store:dispatch(SetIsSubjectToChinaPoliciesModule((CachedPolicyServiceModule:IsSubjectToChinaPolicies())))
	end)()
	local PromptPurchaseFinishedConnection = MarketplaceService.PromptPurchaseFinished:Connect(p1.onPromptPurchaseFinished)
	local PromptBundlePurchaseFinishedConnection = MarketplaceService.PromptBundlePurchaseFinished:Connect(p1.onPromptPurchaseFinished)
	local ChangedConnection = p1.state.store.changed:connect(function(Value, p2) --[[ Line: 269 ]]
		-- upvalues: p1 (copy)
		p1:update(Value, p2)
	end)
	table.insert(p1.connections, Connection)
	table.insert(p1.connections, Connection1)
	table.insert(p1.connections, MenuOpenedConnection)
	table.insert(p1.connections, MenuClosedConnection)
	table.insert(p1.connections, LastInputTypeChangedConnection)
	table.insert(p1.connections, PromptPurchaseFinishedConnection)
	table.insert(p1.connections, PromptBundlePurchaseFinishedConnection)
	table.insert(p1.connections, ChangedConnection)
	p1.state.store:dispatch(GetCharacterModelFromUserIdModule(Players.LocalPlayer.UserId, true, function(Character) --[[ Line: 283 ]]
		-- upvalues: p1 (copy), GetAssetsFromHumanoidDescriptionV2Module (upval)
		if p1 and p1.isMounted then
			p1.localPlayerModel = Character
			local HumanoidDescription = Character.Humanoid.HumanoidDescription
			
			if HumanoidDescription then
				p1.state.store:dispatch(GetAssetsFromHumanoidDescriptionV2Module(HumanoidDescription, true))
			end
			p1:setState({ obtainedLocalPlayerModel = true })
		end
	end))
	
	if PlayerId then
		p1.state.store:dispatch(GetCharacterModelFromUserIdModule(PlayerId, false, function(PlayerModel) --[[ Line: 299 ]]
			-- upvalues: p1 (copy), GetAssetsFromHumanoidDescriptionV2Module (upval)
			if p1 and p1.isMounted then
				p1.playerModel = PlayerModel
				local HumanoidDescription = p1.playerModel.Humanoid.HumanoidDescription
				
				if HumanoidDescription then
					p1.state.store:dispatch(GetAssetsFromHumanoidDescriptionV2Module(HumanoidDescription, false))
				end
				p1:setState({ obtainedPlayerModel = true })
			end
		end))
		p1.state.store:dispatch(GetPlayerNameModule(PlayerId))
	end
end

function InspectAndBuy.update(p1, p2, p3) --[[ Line: 318 ]]
	-- upvalues: ContextActionService (copy)
	if not p2.visible and p3.visible then
		ContextActionService:UnbindCoreAction("BackButtonInspectMenu")
		
		return
	end
	if p2.visible and not p3.visible then
		p1:bindButtonB()
	end
end

function InspectAndBuy.willUnmount(p1) --[[ Line: 326 ]]
	-- upvalues: ContextActionService (copy), FFlagEnableConsoleExpControls (copy), EnabledFunction (copy), ServiceModule (copy)
	p1.isMounted = false
	
	for _, connection in pairs(p1.connections) do
		connection:disconnect()
	end
	ContextActionService:UnbindCoreAction("BackButtonInspectMenu")
	p1:popMouseIconOverride()
	
	if FFlagEnableConsoleExpControls and EnabledFunction() then
		ServiceModule:setHideShortcutBar("InspectAndBuy", false)
	end
end

function InspectAndBuy.render(p2) --[[ Line: 340 ]]
	-- upvalues: FFlagAXEnableNewInspectAndBuyContainerModule (copy), RoactModule (copy), CoreScriptsRootProvider (copy), FFlagAXEnableInspectAndBuyFocusNavigation (copy), RoactRoduxModule (copy), InspectAndBuyBaseContainerModule (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), InspectAndBuyContextModule (copy), RenderWithCoreScriptsStyleProviderModule (copy), SelectionCursorProvider (copy), ContainerModule (copy)
	local LocalPlayerModel = p2.localPlayerModel
	
	return if FFlagAXEnableNewInspectAndBuyContainerModule then RoactModule.createElement("Folder", { Name = "InspectAndBuyApp" }, {
		CoreScriptsRootProvider = RoactModule.createElement(CoreScriptsRootProvider, {}, if FFlagAXEnableInspectAndBuyFocusNavigation then {
			StoreProvider = RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = p2.state.store }, {
				Container = RoactModule.createElement(InspectAndBuyBaseContainerModule, {
					localPlayerModel = LocalPlayerModel,
					analytics = p2.analytics
				})
			})
		} else {
			FocusNavigationWrapper = RoactModule.createElement(FocusRoot, {
				surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
			}, {
				StoreProvider = RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = p2.state.store }, {
					Container = RoactModule.createElement(InspectAndBuyBaseContainerModule, {
						localPlayerModel = LocalPlayerModel,
						analytics = p2.analytics
					})
				})
			})
		})
	}) else RoactModule.createElement(InspectAndBuyContextModule.Provider, { value = p2.state.views }, {
		StoreProvider = RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = p2.state.store }, {
			ThemeProvider = RenderWithCoreScriptsStyleProviderModule({
				CursorProvider = RoactModule.createElement(SelectionCursorProvider, {}, {
					Container = RoactModule.createElement(ContainerModule, { localPlayerModel = LocalPlayerModel })
				})
			})
		})
	})
end

function InspectAndBuy.bindButtonB(p2) --[[ Line: 394 ]]
	-- upvalues: ContextActionService (copy), CloseOverlayModule (copy), SetDetailsInformationModule (copy), SetTryingOnInfoModule (copy), GuiService (copy)
	ContextActionService:BindCoreAction("BackButtonInspectMenu", function(_, UserInputState, Input) --[[ Line: 395 ]]
		-- upvalues: p2 (copy), CloseOverlayModule (upval), SetDetailsInformationModule (upval), SetTryingOnInfoModule (upval), GuiService (upval)
		if UserInputState == Enum.UserInputState.End and Input.KeyCode == Enum.KeyCode.ButtonB then
			local State = p2.state.store:getState()
			local ViewingDetails = State.detailsInformation.viewingDetails
			
			if State.overlay and State.overlay.overlay ~= nil then
				p2.state.store:dispatch(CloseOverlayModule())
			elseif ViewingDetails then
				p2.state.store:dispatch(SetDetailsInformationModule(false, nil))
				p2.state.store:dispatch(SetTryingOnInfoModule(false, nil))
			else
				GuiService:CloseInspectMenu()
			end
		elseif UserInputState == Enum.UserInputState.Begin and Input.KeyCode == Enum.KeyCode.Escape or Input.KeyCode == Enum.KeyCode.ButtonStart then
			GuiService:CloseInspectMenu()
			
			return Enum.ContextActionResult.Pass
		end
		return Enum.ContextActionResult.Sink
	end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape, Enum.KeyCode.ButtonStart)
end

return InspectAndBuy