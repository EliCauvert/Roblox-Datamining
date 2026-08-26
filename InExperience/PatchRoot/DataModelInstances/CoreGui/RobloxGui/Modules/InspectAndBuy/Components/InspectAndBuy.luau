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
local var1 = if enabled() then require(robloxGui.Modules.Chrome.Service) else nil
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
local var2 = if require(parent.Flags.FFlagAXEnableFetchAvatarPreview) then require(parent.Thunks.GetAssetsFromHumanoidDescriptionV2) else require(parent.Thunks.GetAssetsFromHumanoidDescription)
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

function inspectAndBuy.configureInputType(p1, p2)
	-- upvalues: userInputService (ref), setGamepadEnabledModule (ref)
	if (p2 or userInputService:GetLastInputType()).Name:find("Gamepad") then
		p1.state.store:dispatch(setGamepadEnabledModule(true))
		
		return
	end
	p1.state.store:dispatch(setGamepadEnabledModule(false))
end

function inspectAndBuy.updateView(p1)
	-- upvalues: fFlagAXEnableNewInspectAndBuyContainerModule (ref), setViewModule (ref), getViewType (ref), constantsModule (ref)
	local viewportSize = workspace.CurrentCamera.ViewportSize
	
	if fFlagAXEnableNewInspectAndBuyContainerModule then
		p1.state.store:dispatch(setViewModule(getViewType(viewportSize)))
		
		return
	end
	local wide = constantsModule.View.Wide
	
	if viewportSize.X < 600 then
		wide = constantsModule.View.Compact
	elseif viewportSize.Y < viewportSize.X and viewportSize.X < 800 then
		wide = constantsModule.View.WideLandscape
	end
	p1.state.store:dispatch(setViewModule(wide))
end

function inspectAndBuy.init(p1)
	-- upvalues: networkModule (ref), fFlagAXEnableInspectAndBuyVersionAnalyticsModule (ref), analyticsModule (ref), fFlagEnableInspectAndBuyV2RootFlag (ref), inspectAndBuyVersion (ref), roduxModule (ref), inspectAndBuyReducerModule (ref), thunkModule (ref), constantsModule (ref), compactViewModule (ref), wideViewModule (ref), wideLandscapeViewModule (ref), updateStoreIdModule (ref), setPlayerNameModule (ref), setLocaleModule (ref), localizationService (ref), setPlayerIdModule (ref), var2 (ref), updateOwnedStatusModule (ref), setItemBeingPurchasedModule (ref)
	local playerId = p1.props.playerId
	local playerName = p1.props.playerName
	local ctx = p1.props.ctx
	p1.connections = {}
	p1.network = p1.props.network or networkModule.new()
	p1.analytics = if fFlagAXEnableInspectAndBuyVersionAnalyticsModule then analyticsModule.new(playerId, ctx, if fFlagEnableInspectAndBuyV2RootFlag then inspectAndBuyVersion.Version2 else inspectAndBuyVersion.Version1) else analyticsModule.new(playerId, ctx)
	p1.humanoidDescription = p1.props.humanoidDescription
	p1.analytics.reportOpenInspectMenu()
	p1.state = {
		store = roduxModule.Store.new(inspectAndBuyReducerModule, {}, {
			thunkModule.middleware({
				[networkModule] = p1.network,
				[analyticsModule] = p1.analytics
			})
		}),
		views = {
			[constantsModule.View.Compact] = compactViewModule,
			[constantsModule.View.Wide] = wideViewModule,
			[constantsModule.View.WideLandscape] = wideLandscapeViewModule
		}
	}
	p1.state.store:dispatch(updateStoreIdModule())
	p1.state.store:dispatch(setPlayerNameModule(playerName))
	p1.state.store:dispatch(setLocaleModule(localizationService.RobloxLocaleId))
	
	if playerId then
		p1.state.store:dispatch(setPlayerIdModule(playerId))
	end
	if p1.humanoidDescription then
		p1.state.store:dispatch(var2(p1.humanoidDescription, false))
	end
	function p3.onPromptPurchaseFinished(_, p2, p3)
		-- upvalues: p1 (ref), constantsModule (copy), updateOwnedStatusModule (copy), setItemBeingPurchasedModule (copy)
		local itemBeingPurchased = p1.state.store:getState().itemBeingPurchased
		p1.analytics.sendCounter(constantsModule.Counters.PurchaseFinished)
		
		if p3 and tostring(p2) == itemBeingPurchased.itemId then
			p1.analytics.reportPurchaseSuccess(itemBeingPurchased.itemType, itemBeingPurchased.itemId)
			p1.state.store:dispatch(updateOwnedStatusModule(itemBeingPurchased.itemId, itemBeingPurchased.itemType))
			
			if itemBeingPurchased.itemType == constantsModule.ItemType.Asset then
				p1.analytics.sendCounter(constantsModule.Counters.PurchaseSucceededAsset)
			elseif itemBeingPurchased.itemType == constantsModule.ItemType.Bundle then
				p1.analytics.sendCounter(constantsModule.Counters.PurchaseSucceededBundle)
			else
				p1.analytics.sendCounter(constantsModule.Counters.PurchaseSucceededOther)
			end
		end
		p1.state.store:dispatch(setItemBeingPurchasedModule(nil, nil))
	end
end

function inspectAndBuy.didMount(p1)
	-- upvalues: AXEnableInspectAndBuyExposureLogging (ref), ixpUtilsModule (ref), AXInspectAndBuyLayerName (ref), fFlagEnableConsoleExpControls (ref), enabled (ref), var1 (ref), userInputService (ref), localizationService (ref), setLocaleModule (ref), guiService (ref), cachedPolicyServiceModule (ref), setIsSubjectToChinaPoliciesModule (ref), marketplaceService (ref), playersService (ref), getCharacterModelFromUserIdModule (ref), var2 (ref), getPlayerNameModule (ref)
	local playerId = p1.props.playerId
	p1.isMounted = true
	p1:updateView()
	p1:bindButtonB()
	p1:configureInputType()
	p1:pushMouseIconOverride()
	
	if AXEnableInspectAndBuyExposureLogging then
		ixpUtilsModule.logLayerExposure(AXInspectAndBuyLayerName)
	end
	if fFlagEnableConsoleExpControls and enabled() then
		var1:setHideShortcutBar("InspectAndBuy", true)
	end
	local lastInputTypeChangedConnection = userInputService.LastInputTypeChanged:Connect(function(p2)
		-- upvalues: p1 (ref)
		p1:configureInputType(p2)
	end)
	local var3 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
		-- upvalues: p1 (ref)
		p1:updateView()
	end)
	local var4 = localizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
		-- upvalues: p1 (ref), setLocaleModule (copy), localizationService (copy)
		p1.state.store:dispatch(setLocaleModule(localizationService.RobloxLocaleId))
	end)
	local menuOpenedConnection = guiService.MenuOpened:Connect(function()
		-- upvalues: p1 (ref), guiService (copy)
		p1:popMouseIconOverride()
		guiService.SelectedCoreObject = nil
	end)
	local menuClosedConnection = guiService.MenuClosed:Connect(function()
		-- upvalues: p1 (ref)
		p1:pushMouseIconOverride()
	end)
	coroutine.wrap(function()
		-- upvalues: cachedPolicyServiceModule (copy), p1 (ref), setIsSubjectToChinaPoliciesModule (copy)
		p1.state.store:dispatch(setIsSubjectToChinaPoliciesModule(cachedPolicyServiceModule:IsSubjectToChinaPolicies()))
	end)()
	local promptPurchaseFinishedConnection = marketplaceService.PromptPurchaseFinished:Connect(p1.onPromptPurchaseFinished)
	local promptBundlePurchaseFinishedConnection = marketplaceService.PromptBundlePurchaseFinished:Connect(p1.onPromptPurchaseFinished)
	local changedConnection = p1.state.store.changed:connect(function(p2, p3)
		-- upvalues: p1 (ref)
		p1:update(p2, p3)
	end)
	table.insert(p1.connections, var3)
	table.insert(p1.connections, var4)
	table.insert(p1.connections, menuOpenedConnection)
	table.insert(p1.connections, menuClosedConnection)
	table.insert(p1.connections, lastInputTypeChangedConnection)
	table.insert(p1.connections, promptPurchaseFinishedConnection)
	table.insert(p1.connections, promptBundlePurchaseFinishedConnection)
	table.insert(p1.connections, changedConnection)
	p1.state.store:dispatch(getCharacterModelFromUserIdModule(playersService.LocalPlayer.UserId, true, function(p2)
		-- upvalues: p1 (ref), var2 (copy)
		if p1 and p1.isMounted then
			p1.localPlayerModel = p2
			local humanoidDescription = p2.Humanoid.HumanoidDescription
			
			if humanoidDescription then
				p1.state.store:dispatch(var2(humanoidDescription, true))
			end
			p1:setState({ obtainedLocalPlayerModel = true })
		end
	end))
	
	if playerId then
		p1.state.store:dispatch(getCharacterModelFromUserIdModule(playerId, false, function(p2)
			-- upvalues: p1 (ref), var2 (copy)
			if p1 and p1.isMounted then
				p1.playerModel = p2
				local humanoidDescription = p1.playerModel.Humanoid.HumanoidDescription
				
				if humanoidDescription then
					p1.state.store:dispatch(var2(humanoidDescription, false))
				end
				p1:setState({ obtainedPlayerModel = true })
			end
		end))
		p1.state.store:dispatch(getPlayerNameModule(playerId))
	end
end

function inspectAndBuy.update(p1, p2, p3)
	-- upvalues: contextActionService (ref)
	if not p2.visible and p3.visible then
		contextActionService:UnbindCoreAction("BackButtonInspectMenu")
		
		return
	elseif p2.visible and not p3.visible then
		p1:bindButtonB()
	end
end

function inspectAndBuy.willUnmount(p1)
	-- upvalues: contextActionService (ref), fFlagEnableConsoleExpControls (ref), enabled (ref), var1 (ref)
	p1.isMounted = false
	
	for i, v in pairs(p1.connections) do
		v:disconnect()
	end
	contextActionService:UnbindCoreAction("BackButtonInspectMenu")
	p1:popMouseIconOverride()
	
	if fFlagEnableConsoleExpControls and enabled() then
		var1:setHideShortcutBar("InspectAndBuy", false)
	end
end

function inspectAndBuy.render(p2)
	-- upvalues: fFlagAXEnableNewInspectAndBuyContainerModule (ref), roactModule (ref), coreScriptsRootProvider (ref), fFlagAXEnableInspectAndBuyFocusNavigation (ref), roactRoduxModule (ref), inspectAndBuyBaseContainerModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), inspectAndBuyContextModule (ref), renderWithCoreScriptsStyleProviderModule (ref), selectionCursorProvider (ref), containerModule (ref)
	local localPlayerModel = p2.localPlayerModel
	
	return if fFlagAXEnableNewInspectAndBuyContainerModule then roactModule.createElement("Folder", { Name = "InspectAndBuyApp" }, {
		CoreScriptsRootProvider = roactModule.createElement(coreScriptsRootProvider, {}, if fFlagAXEnableInspectAndBuyFocusNavigation then {
			StoreProvider = roactModule.createElement(roactRoduxModule.StoreProvider, { store = p2.state.store }, {
				Container = roactModule.createElement(inspectAndBuyBaseContainerModule, {
					localPlayerModel = localPlayerModel,
					analytics = p2.analytics
				})
			})
		} else {
			FocusNavigationWrapper = roactModule.createElement(focusRoot, {
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
			}, {
				StoreProvider = roactModule.createElement(roactRoduxModule.StoreProvider, { store = p2.state.store }, {
					Container = roactModule.createElement(inspectAndBuyBaseContainerModule, {
						localPlayerModel = localPlayerModel,
						analytics = p2.analytics
					})
				})
			})
		})
	}) else roactModule.createElement(inspectAndBuyContextModule.Provider, { value = p2.state.views }, {
		StoreProvider = roactModule.createElement(roactRoduxModule.StoreProvider, { store = p2.state.store }, {
			ThemeProvider = renderWithCoreScriptsStyleProviderModule({
				CursorProvider = roactModule.createElement(selectionCursorProvider, {}, {
					Container = roactModule.createElement(containerModule, { localPlayerModel = localPlayerModel })
				})
			})
		})
	})
end

function inspectAndBuy.bindButtonB(p2)
	-- upvalues: contextActionService (ref), closeOverlayModule (ref), setDetailsInformationModule (ref), setTryingOnInfoModule (ref), guiService (ref)
	contextActionService:BindCoreAction("BackButtonInspectMenu", function(_, p3, p4)
		-- upvalues: p2 (ref), closeOverlayModule (copy), setDetailsInformationModule (copy), setTryingOnInfoModule (copy), guiService (copy)
		if p3 == Enum.UserInputState.End and p4.KeyCode == Enum.KeyCode.ButtonB then
			local state = p2.state.store:getState()
			local viewingDetails = state.detailsInformation.viewingDetails
			
			if state.overlay and state.overlay.overlay ~= nil then
				p2.state.store:dispatch(closeOverlayModule())
			elseif viewingDetails then
				p2.state.store:dispatch(setDetailsInformationModule(false, nil))
				p2.state.store:dispatch(setTryingOnInfoModule(false, nil))
			else
				guiService:CloseInspectMenu()
			end
		elseif p3 == Enum.UserInputState.Begin and p4.KeyCode == Enum.KeyCode.Escape or p4.KeyCode == Enum.KeyCode.ButtonStart then
			guiService:CloseInspectMenu()
			
			return Enum.ContextActionResult.Pass
		end
		return Enum.ContextActionResult.Sink
	end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape, Enum.KeyCode.ButtonStart)
end

return inspectAndBuy