local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local localizationService = game:GetService("LocalizationService")
local userInputService = game:GetService("UserInputService")
local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local marketplaceService = game:GetService("MarketplaceService")
local playersService = game:GetService("Players")
local mouseIconOverrideService = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local roactModule = require(corePackagesService.Packages.Roact)
local roduxModule = require(corePackagesService.Packages.Rodux)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local symbol = require(corePackagesService.Workspace.Packages.AppCommonLib).Symbol
local renderWithCoreScriptsStyleProviderModule = require(coreGuiService.RobloxGui.Modules.Common.renderWithCoreScriptsStyleProvider)
local selectionCursorProvider = require(corePackagesService.Packages.UIBlox).App.SelectionImage.SelectionCursorProvider
local ixpUtilsModule = require(corePackagesService.Workspace.Packages.IxpUtils)
local AXInspectAndBuyLayerName = game:DefineFastString("AXInspectAndBuyLayerName", "Experience.Menu")
local AXEnableInspectAndBuyExposureLogging = game:DefineFastFlag("AXEnableInspectAndBuyExposureLogging", false)
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local focusNavigationUtilsModule = require(corePackagesService.Workspace.Packages.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusRoot = focusNavigationUtilsModule.FocusRoot
local coreScriptsRootProvider = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local enabled = require(corePackagesService.Workspace.Packages.Chrome).Enabled
local var17 = if enabled() then require(robloxGui.Modules.Chrome.Service) else nil
local fFlagEnableConsoleExpControls = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local parent = script.Parent.Parent
local setDetailsInformationModule = require(parent.Actions.SetDetailsInformation)
local setTryingOnInfoModule = require(parent.Actions.SetTryingOnInfo)
local thunkModule = require(parent.Thunk)
local networkModule = require(parent.Services.Network)
local analyticsModule = require(parent.Services.Analytics)
local inspectAndBuyReducerModule = require(parent.Reducers.InspectAndBuyReducer)
local containerModule = require(parent.Components.Container)
local inspectAndBuyBaseContainerModule = require(parent.Components.InspectAndBuyBaseContainer)
local constantsModule = require(parent.Constants)
local compactViewModule = require(parent.CompactView)
local wideViewModule = require(parent.WideView)
local wideLandscapeViewModule = require(parent.WideLandscapeView)
local setGamepadEnabledModule = require(parent.Actions.SetGamepadEnabled)
local setViewModule = require(parent.Actions.SetView)
local setPlayerIdModule = require(parent.Actions.SetPlayerId)
local setPlayerNameModule = require(parent.Actions.SetPlayerName)
local setLocaleModule = require(parent.Actions.SetLocale)
local setItemBeingPurchasedModule = require(parent.Actions.SetItemBeingPurchased)
local setIsSubjectToChinaPoliciesModule = require(parent.Actions.SetIsSubjectToChinaPolicies)
local updateStoreIdModule = require(parent.Actions.UpdateStoreId)
local var38 = if require(parent.Flags.FFlagAXEnableFetchAvatarPreview) then require(parent.Thunks.GetAssetsFromHumanoidDescriptionV2) else require(parent.Thunks.GetAssetsFromHumanoidDescription)
local updateOwnedStatusModule = require(parent.Thunks.UpdateOwnedStatus)
local getCharacterModelFromUserIdModule = require(parent.Thunks.GetCharacterModelFromUserId)
local getPlayerNameModule = require(parent.Thunks.GetPlayerName)
local inspectAndBuyContextModule = require(parent.Components.InspectAndBuyContext)
local closeOverlayModule = require(parent.Actions.CloseOverlay)
local avatarExperienceInspectAndBuyModule = require(corePackagesService.Workspace.Packages.AvatarExperienceInspectAndBuy)
local getViewType = avatarExperienceInspectAndBuyModule.Utils.getViewType
local inspectAndBuyVersion = avatarExperienceInspectAndBuyModule.Enums.InspectAndBuyVersion
local avatarExperienceFlagsModule = require(corePackagesService.Workspace.Packages.AvatarExperienceFlags)
local fFlagEnableInspectAndBuyV2RootFlag = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableInspectAndBuyV2RootFlag
local fFlagAXEnableInspectAndBuyVersionAnalyticsModule = require(parent.Flags.FFlagAXEnableInspectAndBuyVersionAnalytics)
local fFlagAXEnableInspectAndBuyFocusNavigation = avatarExperienceFlagsModule.FFlagAXEnableInspectAndBuyFocusNavigation
local cachedPolicyServiceModule = require(corePackagesService.Workspace.Packages.CachedPolicyService)
local fFlagAXEnableNewInspectAndBuyContainerModule = require(parent.Flags.FFlagAXEnableNewInspectAndBuyContainer)
local overrideCursorInspectMenu = symbol.named("OverrideCursorInspectMenu")
local inspectAndBuy = roactModule.PureComponent:extend("InspectAndBuy")

function inspectAndBuy.pushMouseIconOverride(_)
	-- upvalues: userInputService (ref), mouseIconOverrideService (ref), overrideCursorInspectMenu (ref)
	if userInputService:GetLastInputType().Name:find("Gamepad") then
		mouseIconOverrideService.push(overrideCursorInspectMenu, Enum.OverrideMouseIconBehavior.ForceHide)
		
		return
	end
	mouseIconOverrideService.push(overrideCursorInspectMenu, Enum.OverrideMouseIconBehavior.ForceShow)
end

function inspectAndBuy.popMouseIconOverride(_)
	-- upvalues: mouseIconOverrideService (ref), overrideCursorInspectMenu (ref)
	mouseIconOverrideService.pop(overrideCursorInspectMenu)
end

function inspectAndBuy.configureInputType(p0, p1)
	-- upvalues: userInputService (ref), setGamepadEnabledModule (ref)
	if (p1 or userInputService:GetLastInputType()).Name:find("Gamepad") then
		p0.state.store:dispatch(setGamepadEnabledModule(true))
		
		return
	end
	p0.state.store:dispatch(setGamepadEnabledModule(false))
end

function inspectAndBuy.updateView(p2)
	-- upvalues: fFlagAXEnableNewInspectAndBuyContainerModule (ref), setViewModule (ref), getViewType (ref), constantsModule (ref)
	local viewportSize = workspace.CurrentCamera.ViewportSize
	
	if fFlagAXEnableNewInspectAndBuyContainerModule then
		p2.state.store:dispatch(setViewModule(getViewType(viewportSize)))
		
		return
	end
	local wide = constantsModule.View.Wide
	
	if viewportSize.X < 600 then
		wide = constantsModule.View.Compact
	elseif viewportSize.Y < viewportSize.X and viewportSize.X < 800 then
		wide = constantsModule.View.WideLandscape
	end
	p2.state.store:dispatch(setViewModule(wide))
end

function inspectAndBuy.init(p3)
	-- upvalues: networkModule (ref), fFlagAXEnableInspectAndBuyVersionAnalyticsModule (ref), analyticsModule (ref), fFlagEnableInspectAndBuyV2RootFlag (ref), inspectAndBuyVersion (ref), roduxModule (ref), inspectAndBuyReducerModule (ref), thunkModule (ref), constantsModule (ref), compactViewModule (ref), wideViewModule (ref), wideLandscapeViewModule (ref), updateStoreIdModule (ref), setPlayerNameModule (ref), setLocaleModule (ref), localizationService (ref), setPlayerIdModule (ref), var38 (ref), updateOwnedStatusModule (ref), setItemBeingPurchasedModule (ref)
	local playerId = p3.props.playerId
	local playerName = p3.props.playerName
	local ctx = p3.props.ctx
	p3.connections = {}
	p3.network = p3.props.network or networkModule.new()
	p3.analytics = if fFlagAXEnableInspectAndBuyVersionAnalyticsModule then analyticsModule.new(playerId, ctx, if fFlagEnableInspectAndBuyV2RootFlag then inspectAndBuyVersion.Version2 else inspectAndBuyVersion.Version1) else analyticsModule.new(playerId, ctx)
	p3.humanoidDescription = p3.props.humanoidDescription
	p3.analytics.reportOpenInspectMenu()
	p3.state = {
		store = roduxModule.Store.new(inspectAndBuyReducerModule, {}, {
			thunkModule.middleware({
				[networkModule] = p3.network,
				[analyticsModule] = p3.analytics
			})
		}),
		views = {
			[constantsModule.View.Compact] = compactViewModule,
			[constantsModule.View.Wide] = wideViewModule,
			[constantsModule.View.WideLandscape] = wideLandscapeViewModule
		}
	}
	p3.state.store:dispatch(updateStoreIdModule())
	p3.state.store:dispatch(setPlayerNameModule(playerName))
	p3.state.store:dispatch(setLocaleModule(localizationService.RobloxLocaleId))
	
	if playerId then
		p3.state.store:dispatch(setPlayerIdModule(playerId))
	end
	if p3.humanoidDescription then
		p3.state.store:dispatch(var38(p3.humanoidDescription, false))
	end
	function p3.onPromptPurchaseFinished(_, p4, p5)
		-- upvalues: p3 (ref), constantsModule (copy), updateOwnedStatusModule (copy), setItemBeingPurchasedModule (copy)
		local itemBeingPurchased = p3.state.store:getState().itemBeingPurchased
		p3.analytics.sendCounter(constantsModule.Counters.PurchaseFinished)
		
		if p5 and tostring(p4) == itemBeingPurchased.itemId then
			p3.analytics.reportPurchaseSuccess(itemBeingPurchased.itemType, itemBeingPurchased.itemId)
			p3.state.store:dispatch(updateOwnedStatusModule(itemBeingPurchased.itemId, itemBeingPurchased.itemType))
			
			if itemBeingPurchased.itemType == constantsModule.ItemType.Asset then
				p3.analytics.sendCounter(constantsModule.Counters.PurchaseSucceededAsset)
			elseif itemBeingPurchased.itemType == constantsModule.ItemType.Bundle then
				p3.analytics.sendCounter(constantsModule.Counters.PurchaseSucceededBundle)
			else
				p3.analytics.sendCounter(constantsModule.Counters.PurchaseSucceededOther)
			end
		end
		p3.state.store:dispatch(setItemBeingPurchasedModule(nil, nil))
	end
end

function inspectAndBuy.didMount(p6)
	-- upvalues: AXEnableInspectAndBuyExposureLogging (ref), ixpUtilsModule (ref), AXInspectAndBuyLayerName (ref), fFlagEnableConsoleExpControls (ref), enabled (ref), var17 (ref), userInputService (ref), localizationService (ref), setLocaleModule (ref), guiService (ref), cachedPolicyServiceModule (ref), setIsSubjectToChinaPoliciesModule (ref), marketplaceService (ref), playersService (ref), getCharacterModelFromUserIdModule (ref), var38 (ref), getPlayerNameModule (ref)
	local playerId = p6.props.playerId
	p6.isMounted = true
	p6:updateView()
	p6:bindButtonB()
	p6:configureInputType()
	p6:pushMouseIconOverride()
	
	if AXEnableInspectAndBuyExposureLogging then
		ixpUtilsModule.logLayerExposure(AXInspectAndBuyLayerName)
	end
	if fFlagEnableConsoleExpControls and enabled() then
		var17:setHideShortcutBar("InspectAndBuy", true)
	end
	local lastInputTypeChangedConnection = userInputService.LastInputTypeChanged:Connect(function(p7)
		-- upvalues: p6 (ref)
		p6:configureInputType(p7)
	end)
	local var52 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
		-- upvalues: p6 (ref)
		p6:updateView()
	end)
	local var53 = localizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
		-- upvalues: p6 (ref), setLocaleModule (copy), localizationService (copy)
		p6.state.store:dispatch(setLocaleModule(localizationService.RobloxLocaleId))
	end)
	local menuOpenedConnection = guiService.MenuOpened:Connect(function()
		-- upvalues: p6 (ref), guiService (copy)
		p6:popMouseIconOverride()
		guiService.SelectedCoreObject = nil
	end)
	local menuClosedConnection = guiService.MenuClosed:Connect(function()
		-- upvalues: p6 (ref)
		p6:pushMouseIconOverride()
	end)
	coroutine.wrap(function()
		-- upvalues: cachedPolicyServiceModule (copy), p6 (ref), setIsSubjectToChinaPoliciesModule (copy)
		p6.state.store:dispatch(setIsSubjectToChinaPoliciesModule(cachedPolicyServiceModule:IsSubjectToChinaPolicies()))
	end)()
	local promptPurchaseFinishedConnection = marketplaceService.PromptPurchaseFinished:Connect(p6.onPromptPurchaseFinished)
	local promptBundlePurchaseFinishedConnection = marketplaceService.PromptBundlePurchaseFinished:Connect(p6.onPromptPurchaseFinished)
	local changedConnection = p6.state.store.changed:connect(function(p8, p9)
		-- upvalues: p6 (ref)
		p6:update(p8, p9)
	end)
	table.insert(p6.connections, var52)
	table.insert(p6.connections, var53)
	table.insert(p6.connections, menuOpenedConnection)
	table.insert(p6.connections, menuClosedConnection)
	table.insert(p6.connections, lastInputTypeChangedConnection)
	table.insert(p6.connections, promptPurchaseFinishedConnection)
	table.insert(p6.connections, promptBundlePurchaseFinishedConnection)
	table.insert(p6.connections, changedConnection)
	p6.state.store:dispatch(getCharacterModelFromUserIdModule(playersService.LocalPlayer.UserId, true, function(p10)
		-- upvalues: p6 (ref), var38 (copy)
		if p6 and p6.isMounted then
			p6.localPlayerModel = p10
			local humanoidDescription = p10.Humanoid.HumanoidDescription
			
			if humanoidDescription then
				p6.state.store:dispatch(var38(humanoidDescription, true))
			end
			p6:setState({ obtainedLocalPlayerModel = true })
		end
	end))
	
	if playerId then
		p6.state.store:dispatch(getCharacterModelFromUserIdModule(playerId, false, function(p11)
			-- upvalues: p6 (ref), var38 (copy)
			if p6 and p6.isMounted then
				p6.playerModel = p11
				local humanoidDescription = p6.playerModel.Humanoid.HumanoidDescription
				
				if humanoidDescription then
					p6.state.store:dispatch(var38(humanoidDescription, false))
				end
				p6:setState({ obtainedPlayerModel = true })
			end
		end))
		p6.state.store:dispatch(getPlayerNameModule(playerId))
	end
end

function inspectAndBuy.update(p12, p13, p14)
	-- upvalues: contextActionService (ref)
	if not p13.visible and p14.visible then
		contextActionService:UnbindCoreAction("BackButtonInspectMenu")
		
		return
	elseif p13.visible and not p14.visible then
		p12:bindButtonB()
	end
end

function inspectAndBuy.willUnmount(p15)
	-- upvalues: contextActionService (ref), fFlagEnableConsoleExpControls (ref), enabled (ref), var17 (ref)
	p15.isMounted = false
	
	for i, v in pairs(p15.connections) do
		v:disconnect()
	end
	contextActionService:UnbindCoreAction("BackButtonInspectMenu")
	p15:popMouseIconOverride()
	
	if fFlagEnableConsoleExpControls and enabled() then
		var17:setHideShortcutBar("InspectAndBuy", false)
	end
end

function inspectAndBuy.render(p16)
	-- upvalues: fFlagAXEnableNewInspectAndBuyContainerModule (ref), roactModule (ref), coreScriptsRootProvider (ref), fFlagAXEnableInspectAndBuyFocusNavigation (ref), roactRoduxModule (ref), inspectAndBuyBaseContainerModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), inspectAndBuyContextModule (ref), renderWithCoreScriptsStyleProviderModule (ref), selectionCursorProvider (ref), containerModule (ref)
	local localPlayerModel = p16.localPlayerModel
	
	return if fFlagAXEnableNewInspectAndBuyContainerModule then roactModule.createElement("Folder", { Name = "InspectAndBuyApp" }, {
		CoreScriptsRootProvider = roactModule.createElement(coreScriptsRootProvider, {}, if fFlagAXEnableInspectAndBuyFocusNavigation then {
			StoreProvider = roactModule.createElement(roactRoduxModule.StoreProvider, { store = p16.state.store }, {
				Container = roactModule.createElement(inspectAndBuyBaseContainerModule, {
					localPlayerModel = localPlayerModel,
					analytics = p16.analytics
				})
			})
		} else {
			FocusNavigationWrapper = roactModule.createElement(focusRoot, {
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
			}, {
				StoreProvider = roactModule.createElement(roactRoduxModule.StoreProvider, { store = p16.state.store }, {
					Container = roactModule.createElement(inspectAndBuyBaseContainerModule, {
						localPlayerModel = localPlayerModel,
						analytics = p16.analytics
					})
				})
			})
		})
	}) else roactModule.createElement(inspectAndBuyContextModule.Provider, { value = p16.state.views }, {
		StoreProvider = roactModule.createElement(roactRoduxModule.StoreProvider, { store = p16.state.store }, {
			ThemeProvider = renderWithCoreScriptsStyleProviderModule({
				CursorProvider = roactModule.createElement(selectionCursorProvider, {}, {
					Container = roactModule.createElement(containerModule, { localPlayerModel = localPlayerModel })
				})
			})
		})
	})
end

function inspectAndBuy.bindButtonB(p17)
	-- upvalues: contextActionService (ref), closeOverlayModule (ref), setDetailsInformationModule (ref), setTryingOnInfoModule (ref), guiService (ref)
	contextActionService:BindCoreAction("BackButtonInspectMenu", function(_, p18, p19)
		-- upvalues: p17 (ref), closeOverlayModule (copy), setDetailsInformationModule (copy), setTryingOnInfoModule (copy), guiService (copy)
		if p18 == Enum.UserInputState.End and p19.KeyCode == Enum.KeyCode.ButtonB then
			local state = p17.state.store:getState()
			local viewingDetails = state.detailsInformation.viewingDetails
			
			if state.overlay and state.overlay.overlay ~= nil then
				p17.state.store:dispatch(closeOverlayModule())
			elseif viewingDetails then
				p17.state.store:dispatch(setDetailsInformationModule(false, nil))
				p17.state.store:dispatch(setTryingOnInfoModule(false, nil))
			else
				guiService:CloseInspectMenu()
			end
		elseif p18 == Enum.UserInputState.Begin and p19.KeyCode == Enum.KeyCode.Escape or p19.KeyCode == Enum.KeyCode.ButtonStart then
			guiService:CloseInspectMenu()
			
			return Enum.ContextActionResult.Pass
		end
		return Enum.ContextActionResult.Sink
	end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape, Enum.KeyCode.ButtonStart)
end

return inspectAndBuy