local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local starterGuiService = game:GetService("StarterGui")
local playersService = game:GetService("Players")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local userInputService = game:GetService("UserInputService")
local contextActionService = game:GetService("ContextActionService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local tenFootInterfaceModule = require(robloxGui.Modules.TenFootInterface)
local utilityModule = require(robloxGui.Modules.Settings.Utility)
local cachedPolicyServiceModule = require(corePackagesService.Workspace.Packages.CachedPolicyService)
local roactModule = require(corePackagesService.Packages.Roact)
local roduxModule = require(corePackagesService.Packages.Rodux)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local colorMode = require(corePackagesService.Packages.Foundation).Enums.ColorMode
local constants = require(corePackagesService.Packages.UIBlox).App.Style.Constants
local apolloClientModule = require(coreGuiService.RobloxGui.Modules.ApolloClient)
local apolloProvider = require(corePackagesService.Packages.ApolloClient).ApolloProvider
local parent = script.Parent
local signalsModule = require(corePackagesService.Packages.Signals)
local inExperienceTopBarModule = require(corePackagesService.Workspace.Packages.InExperienceTopBar)
local reducerModule = require(parent.Reducers.Reducer)
local globalConfigModule = require(parent.GlobalConfig)
local playerListSwitcherModule = require(parent.PlayerListSwitcher)
local makePlayerInfoRequestsModule = require(parent.Thunks.MakePlayerInfoRequests)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local platformLeaderboardsClientModule = require(corePackagesService.Workspace.Packages.PlatformLeaderboardsClient)
local playerIconInfoStoreModule = require(corePackagesService.Workspace.Packages.PlayerIconInfoStore)
local blockingUtilityModule = require(corePackagesService.Workspace.Packages.BlockingUtility)
local constants_1 = playerListModule.Common.Constants
local playerRelationshipStore = playerListModule.PlayerRelationshipStore
local setPlayerListEnabledModule = require(parent.Actions.SetPlayerListEnabled)
local setPlayerListVisibilityModule = require(parent.Actions.SetPlayerListVisibility)
local setTempHideKeyModule = require(parent.Actions.SetTempHideKey)
local setTenFootInterfaceModule = require(parent.Actions.SetTenFootInterface)
local setSmallTouchDeviceModule = require(parent.Actions.SetSmallTouchDevice)
local setIsUsingGamepadModule = require(parent.Actions.SetIsUsingGamepad)
local setMinimizedModule = require(parent.Actions.SetMinimized)
local setSubjectToChinaPoliciesModule = require(parent.Actions.SetSubjectToChinaPolicies)
local setSettingsModule = require(parent.Actions.SetSettings)

if not playersService.LocalPlayer then
	playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
end
local fFlagAddNewPlayerListFocusNav = playerListModule.Flags.FFlagAddNewPlayerListFocusNav
local fStringPlayerListOverrideTypeModule = require(parent.Flags.FStringPlayerListOverrideType)
local fFlagReplacePlayerIconRoduxWithSignal = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagReplacePlayerIconRoduxWithSignal
local fFlagBadgeVisibilitySettingEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagBadgeVisibilitySettingEnabled
local fFlagLuaSupportMicroGamepadPreferredInput = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagLuaSupportMicroGamepadPreferredInput
local fFlagAddNewPlayerListMobileFocusNav = playerListModule.Flags.FFlagAddNewPlayerListMobileFocusNav
local fFlagEnableMobilePlayerListOnConsole = playerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local fFlagEnableMobilePlayerListOnGamepad = playerListModule.Flags.FFlagEnableMobilePlayerListOnGamepad
local isReskinConsoleMobileRoute = playerListModule.Common.isReskinConsoleMobileRoute
local fFlagPlayerListUseMobileOnSmallDisplay = playerListModule.Flags.FFlagPlayerListUseMobileOnSmallDisplay
local fFlagPlayerListIgnoreDevGamepadBindings = playerListModule.Flags.FFlagPlayerListIgnoreDevGamepadBindings
local fFlagPlatformLeaderboardPersistStoreOnRemount = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagPlatformLeaderboardPersistStoreOnRemount
local fFlagPlayerListReskin = playerListModule.Flags.FFlagPlayerListReskin
local fFlagPlayerListPersistVisibilityModule = require(parent.Flags.FFlagPlayerListPersistVisibility)
local playerListContainer = playerListModule.Container.PlayerListContainer
local leaderboardStoreInstanceManager = playerListModule.LeaderboardStoreInstanceManager
local playerListVisibilityStore = playerListModule.PlayerListVisibilityStore
local playerContextualMenuStore = playerListModule.PlayerContextualMenuStore
local playerIconInfoStore = playerIconInfoStoreModule.PlayerIconInfoStore
local fFlagTopBarSignalizeSetCores = inExperienceTopBarModule.Flags.FFlagTopBarSignalizeSetCores

local function _()
	return _G.__TESTEZ_RUNNING_TEST__ == true
end

local _ = function(p1)
	-- upvalues: fFlagLuaSupportMicroGamepadPreferredInput (ref)
	return if p1 ~= Enum.PreferredInput.Touch then if p1 ~= Enum.PreferredInput.Gamepad then fFlagLuaSupportMicroGamepadPreferredInput and p1 == Enum.PreferredInput.MicroGamepad else true else true
end

local _ = function(p1)
	-- upvalues: isReskinConsoleMobileRoute (ref), guiService (ref)
	return isReskinConsoleMobileRoute({
		displaySize = guiService.ViewportDisplaySize,
		preferredInput = p1
	})
end

local _ = function(p1)
	-- upvalues: isReskinConsoleMobileRoute (ref), guiService (ref), fFlagEnableMobilePlayerListOnConsole (ref), tenFootInterfaceModule (ref)
	return if isReskinConsoleMobileRoute({
		displaySize = guiService.ViewportDisplaySize,
		preferredInput = p1
	}) or fFlagEnableMobilePlayerListOnConsole then false else tenFootInterfaceModule:IsEnabled()
end

local _ = function(p1)
	-- upvalues: isReskinConsoleMobileRoute (ref), guiService (ref), fFlagLuaSupportMicroGamepadPreferredInput (ref), fFlagEnableMobilePlayerListOnConsole (ref)
	if isReskinConsoleMobileRoute({
		displaySize = guiService.ViewportDisplaySize,
		preferredInput = p1
	}) then
		return true
	elseif guiService.ViewportDisplaySize == Enum.DisplaySize.Large then
		return if if p1 ~= Enum.PreferredInput.Touch then if p1 ~= Enum.PreferredInput.Gamepad then fFlagLuaSupportMicroGamepadPreferredInput and p1 == Enum.PreferredInput.MicroGamepad else true else true then fFlagEnableMobilePlayerListOnConsole else false
	end
end

local _ = function(p1)
	-- upvalues: fFlagPlayerListUseMobileOnSmallDisplay (ref), guiService (ref), utilityModule (ref), isReskinConsoleMobileRoute (ref), fFlagLuaSupportMicroGamepadPreferredInput (ref), fFlagEnableMobilePlayerListOnConsole (ref), fStringPlayerListOverrideTypeModule (ref)
	local var1 = fFlagPlayerListUseMobileOnSmallDisplay and guiService.ViewportDisplaySize == Enum.DisplaySize.Small
	local var2 = utilityModule:IsSmallTouchScreen()
	
	if not var2 then
		if isReskinConsoleMobileRoute({
			displaySize = guiService.ViewportDisplaySize,
			preferredInput = p1
		}) then
			var2 = true
		elseif guiService.ViewportDisplaySize == Enum.DisplaySize.Large then
			var2 = if if p1 ~= Enum.PreferredInput.Touch then if p1 ~= Enum.PreferredInput.Gamepad then fFlagLuaSupportMicroGamepadPreferredInput and p1 == Enum.PreferredInput.MicroGamepad else true else true then fFlagEnableMobilePlayerListOnConsole else false
		end
		if not var2 and var1 then
			var2 = if p1 ~= Enum.PreferredInput.Touch then if p1 ~= Enum.PreferredInput.Gamepad then fFlagLuaSupportMicroGamepadPreferredInput and p1 == Enum.PreferredInput.MicroGamepad else true else true
			var2 = var2 or fStringPlayerListOverrideTypeModule == "mobile"
		end
	end
	return var2
end

local function setupSettings(value)
	-- upvalues: setSettingsModule (ref), userGameSettingsService (ref)
	local function _()
		-- upvalues: value (ref), setSettingsModule (copy), userGameSettingsService (copy)
		value:dispatch(setSettingsModule({
			reducedMotion = userGameSettingsService.ReducedMotion,
			preferredTransparency = userGameSettingsService.PreferredTransparency
		}))
	end
	
	value:dispatch(setSettingsModule({
		reducedMotion = userGameSettingsService.ReducedMotion,
		preferredTransparency = userGameSettingsService.PreferredTransparency
	}))
	userGameSettingsService:GetPropertyChangedSignal("PreferredTransparency"):Connect(function()
		-- upvalues: value (ref), setSettingsModule (copy), userGameSettingsService (copy)
		value:dispatch(setSettingsModule({
			reducedMotion = userGameSettingsService.ReducedMotion,
			preferredTransparency = userGameSettingsService.PreferredTransparency
		}))
	end)
	userGameSettingsService:GetPropertyChangedSignal("ReducedMotion"):Connect(function()
		-- upvalues: value (ref), setSettingsModule (copy), userGameSettingsService (copy)
		value:dispatch(setSettingsModule({
			reducedMotion = userGameSettingsService.ReducedMotion,
			preferredTransparency = userGameSettingsService.PreferredTransparency
		}))
	end)
end

local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref), fFlagPlayerListReskin (ref), globalConfigModule (ref), roactModule (ref), roduxModule (ref), reducerModule (ref), setupSettings (ref), starterGuiService (ref), setPlayerListEnabledModule (ref), setSmallTouchDeviceModule (ref), userInputService (ref), fFlagPlayerListUseMobileOnSmallDisplay (ref), guiService (ref), utilityModule (ref), isReskinConsoleMobileRoute (ref), fFlagLuaSupportMicroGamepadPreferredInput (ref), fFlagEnableMobilePlayerListOnConsole (ref), fStringPlayerListOverrideTypeModule (ref), setTenFootInterfaceModule (ref), tenFootInterfaceModule (ref), setSubjectToChinaPoliciesModule (ref), cachedPolicyServiceModule (ref), colorMode (ref), constants (ref), roactRoduxModule (ref), playerListSwitcherModule (ref), apolloProvider (ref), apolloClientModule (ref), setIsUsingGamepadModule (ref), leaderboardStoreInstanceManager (ref), fFlagReplacePlayerIconRoduxWithSignal (ref), playerIconInfoStore (ref), playerListContainer (ref), robloxGui (ref), coreGuiService (ref), fFlagAddNewPlayerListFocusNav (ref), fFlagTopBarSignalizeSetCores (ref), signalsModule (ref), inExperienceTopBarModule (ref)
	local tbl = setmetatable({}, t)
	
	if fFlagPlayerListReskin then
		return tbl:_setupReskin()
	elseif globalConfigModule.propValidation then
		roactModule.setGlobalConfig({ propValidation = true })
	end
	if globalConfigModule.elementTracing then
		roactModule.setGlobalConfig({ elementTracing = true })
	end
	tbl.layerCollectorRef = roactModule.createRef()
	tbl.store = roduxModule.Store.new(reducerModule, nil, { roduxModule.thunkMiddleware })
	setupSettings(tbl.store)
	
	if not starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList) then
		tbl.store:dispatch(setPlayerListEnabledModule(false))
	end
	coroutine.wrap(function()
		-- upvalues: tbl (ref), setSmallTouchDeviceModule (copy), userInputService (copy), fFlagPlayerListUseMobileOnSmallDisplay (copy), guiService (copy), utilityModule (copy), isReskinConsoleMobileRoute (copy), fFlagLuaSupportMicroGamepadPreferredInput (copy), fFlagEnableMobilePlayerListOnConsole (copy), fStringPlayerListOverrideTypeModule (copy)
		local store = tbl.store
		local preferredInput = userInputService.PreferredInput
		local var1 = fFlagPlayerListUseMobileOnSmallDisplay and guiService.ViewportDisplaySize == Enum.DisplaySize.Small
		local var2 = utilityModule:IsSmallTouchScreen()
		
		if not var2 then
			if isReskinConsoleMobileRoute({
				displaySize = guiService.ViewportDisplaySize,
				preferredInput = preferredInput
			}) then
				var2 = true
			elseif guiService.ViewportDisplaySize == Enum.DisplaySize.Large then
				var2 = if if preferredInput ~= Enum.PreferredInput.Touch then if preferredInput ~= Enum.PreferredInput.Gamepad then fFlagLuaSupportMicroGamepadPreferredInput and preferredInput == Enum.PreferredInput.MicroGamepad else true else true then fFlagEnableMobilePlayerListOnConsole else false
			end
			if not var2 and var1 then
				var2 = if preferredInput ~= Enum.PreferredInput.Touch then if preferredInput ~= Enum.PreferredInput.Gamepad then fFlagLuaSupportMicroGamepadPreferredInput and preferredInput == Enum.PreferredInput.MicroGamepad else true else true
				var2 = var2 or fStringPlayerListOverrideTypeModule == "mobile"
			end
		end
		store:dispatch(setSmallTouchDeviceModule(var2))
	end)()
	tbl.store:dispatch(setTenFootInterfaceModule(if isReskinConsoleMobileRoute({
		displaySize = guiService.ViewportDisplaySize,
		preferredInput = userInputService.PreferredInput
	}) or fFlagEnableMobilePlayerListOnConsole then false else tenFootInterfaceModule:IsEnabled()))
	coroutine.wrap(function()
		-- upvalues: tbl (ref), setSubjectToChinaPoliciesModule (copy), cachedPolicyServiceModule (copy)
		tbl.store:dispatch(setSubjectToChinaPoliciesModule(cachedPolicyServiceModule:IsSubjectToChinaPolicies()))
	end)()
	tbl:_trackEnabled()
	tbl.root = roactModule.createElement(roactRoduxModule.StoreProvider, { store = tbl.store }, {
		Switcher = roactModule.createElement(playerListSwitcherModule, {
			appStyleForUiModeStyleProvider = {
				themeName = colorMode.Dark,
				fontName = constants.FontName.Gotham
			},
			setLayerCollectorEnabled = function(value)
				-- upvalues: tbl (ref)
				if tbl.layerCollectorRef.current then
					tbl.layerCollectorRef.current.Enabled = value
					
					return
				end
			end
		})
	})
	tbl.root = roactModule.createElement(apolloProvider, { client = apolloClientModule }, { StoreProvider = tbl.root })
	
	function tbl._setIsUsingGamepad()
		-- upvalues: userInputService (copy), tbl (ref), setIsUsingGamepadModule (copy)
		local lastInputType = userInputService:GetLastInputType()
		tbl.store:dispatch(setIsUsingGamepadModule((lastInputType and lastInputType.Name:find("Gamepad")) ~= nil))
	end
	
	function tbl._mountLeaderboardStore()
		-- upvalues: leaderboardStoreInstanceManager (copy)
		leaderboardStoreInstanceManager.createLeaderboardStoreInstance()
	end
	
	function tbl._unmountLeaderboardStore()
		-- upvalues: leaderboardStoreInstanceManager (copy)
		leaderboardStoreInstanceManager.cleanUpInstance()
	end
	
	tbl._unmountPlayerIconInfoStore = if fFlagReplacePlayerIconRoduxWithSignal then function()
		-- upvalues: playerIconInfoStore (copy)
		playerIconInfoStore.cleanUp()
	end else nil
	tbl._mountLeaderboardStore()
	tbl._setIsUsingGamepad()
	tbl.root = roactModule.createElement(playerListContainer, {
		leaderboardStore = leaderboardStoreInstanceManager.getLeaderboardStoreInstance,
		TopBarConstants = require(robloxGui.Modules.TopBar.Constants),
		isTenFoot = if isReskinConsoleMobileRoute({
			displaySize = guiService.ViewportDisplaySize,
			preferredInput = userInputService.PreferredInput
		}) or fFlagEnableMobilePlayerListOnConsole then false else tenFootInterfaceModule:IsEnabled()
	}, { PlayerListRoot = tbl.root })
	tbl.root = roactModule.createElement("ScreenGui", {
		AutoLocalize = false,
		IgnoreGuiInset = true,
		DisplayOrder = 1,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		[roactModule.Ref] = tbl.layerCollectorRef
	}, { PlayerListRoot = tbl.root })
	tbl.element = roactModule.mount(tbl.root, coreGuiService, "PlayerList")
	tbl.topBarEnabled = true
	tbl.mounted = true
	tbl.coreGuiEnabled = starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList)
	tbl:_updateMounted()
	tbl.SetVisibleChangedEvent = Instance.new("BindableEvent")
	
	if fFlagAddNewPlayerListFocusNav then
		tbl.VisibilityChangedEvent = Instance.new("BindableEvent")
	end
	if fFlagTopBarSignalizeSetCores then
		tbl.disposeEffect = signalsModule.createEffect(function(p1)
			-- upvalues: inExperienceTopBarModule (copy), tbl (ref)
			local getTopBarStore = inExperienceTopBarModule.Stores.GetTopBarStore
			
			if getTopBarStore then
				tbl:SetTopBarEnabled(getTopBarStore(p1).getTopBarCoreGuiEnabled(p1))
			end
		end)
	end
	tbl.store.changed:connect(function(p1, p2)
		-- upvalues: tbl (ref), fFlagAddNewPlayerListFocusNav (copy)
		if p1.displayOptions.setVisible ~= p2.displayOptions.setVisible then
			tbl.SetVisibleChangedEvent:Fire(p1.displayOptions.setVisible)
		end
		if fFlagAddNewPlayerListFocusNav and p1.displayOptions.isVisible ~= p2.displayOptions.isVisible then
			tbl.VisibilityChangedEvent:Fire(p1.displayOptions.isVisible)
		end
	end)
	
	return tbl
end

function t:_updateMounted()
	-- upvalues: userInputService (ref), isReskinConsoleMobileRoute (ref), guiService (ref), fFlagEnableMobilePlayerListOnConsole (ref), tenFootInterfaceModule (ref), roactModule (ref), coreGuiService (ref)
	local var1 = if isReskinConsoleMobileRoute({
		displaySize = guiService.ViewportDisplaySize,
		preferredInput = userInputService.PreferredInput
	}) or fFlagEnableMobilePlayerListOnConsole then false else tenFootInterfaceModule:IsEnabled()
	
	if not var1 then
		var1 = self.coreGuiEnabled and self.topBarEnabled
		
		if var1 and not self.mounted then
			self._mountLeaderboardStore()
			self._setIsUsingGamepad()
			self.element = roactModule.mount(self.root, coreGuiService, "PlayerList")
			self.mounted = true
			
			return
		elseif not var1 and self.mounted then
			roactModule.unmount(self.element)
			self._unmountLeaderboardStore()
			
			if self._unmountPlayerIconInfoStore then
				self._unmountPlayerIconInfoStore()
			end
			self.mounted = false
			
			if self.inspector then
				self.inspector:destroy()
				self.inspector = nil
			end
		end
	end
end

function t._trackEnabled(p1)
	-- upvalues: starterGuiService (ref), setPlayerListEnabledModule (ref), fFlagPlayerListIgnoreDevGamepadBindings (ref), guiService (ref), constants_1 (ref)
	starterGuiService.CoreGuiChangedSignal:Connect(function(p2, p3)
		-- upvalues: p1 (ref), setPlayerListEnabledModule (copy), fFlagPlayerListIgnoreDevGamepadBindings (copy), guiService (copy), constants_1 (copy)
		if p2 == Enum.CoreGuiType.All or p2 == Enum.CoreGuiType.PlayerList then
			p1.coreGuiEnabled = p3
			p1:_updateMounted()
			p1.store:dispatch(setPlayerListEnabledModule(p3))
			
			if fFlagPlayerListIgnoreDevGamepadBindings and not p3 then
				guiService:SetMenuIsOpen(false, constants_1.PLAYER_LIST_MENU)
			end
		end
	end)
end

if fFlagAddNewPlayerListMobileFocusNav then
	function t:GetIsModal()
		-- upvalues: fFlagPlayerListReskin (ref), userInputService (ref), fFlagPlayerListUseMobileOnSmallDisplay (ref), guiService (ref), utilityModule (ref), isReskinConsoleMobileRoute (ref), fFlagLuaSupportMicroGamepadPreferredInput (ref), fFlagEnableMobilePlayerListOnConsole (ref), fStringPlayerListOverrideTypeModule (ref)
		if not fFlagPlayerListReskin then
			return self.store:getState().displayOptions.isSmallTouchDevice
		end
		local preferredInput = userInputService.PreferredInput
		local var1 = fFlagPlayerListUseMobileOnSmallDisplay and guiService.ViewportDisplaySize == Enum.DisplaySize.Small
		local var2 = utilityModule:IsSmallTouchScreen()
		
		if not var2 then
			if isReskinConsoleMobileRoute({
				displaySize = guiService.ViewportDisplaySize,
				preferredInput = preferredInput
			}) then
				var2 = true
			elseif guiService.ViewportDisplaySize == Enum.DisplaySize.Large then
				var2 = if if preferredInput ~= Enum.PreferredInput.Touch then if preferredInput ~= Enum.PreferredInput.Gamepad then fFlagLuaSupportMicroGamepadPreferredInput and preferredInput == Enum.PreferredInput.MicroGamepad else true else true then fFlagEnableMobilePlayerListOnConsole else false
			end
			if not var2 and var1 then
				var2 = if preferredInput ~= Enum.PreferredInput.Touch then if preferredInput ~= Enum.PreferredInput.Gamepad then fFlagLuaSupportMicroGamepadPreferredInput and preferredInput == Enum.PreferredInput.MicroGamepad else true else true
				var2 = var2 or fStringPlayerListOverrideTypeModule == "mobile"
			end
		end
		return var2
	end
end
function t:_setupReskin()
	-- upvalues: corePackagesService (ref), robloxGui (ref), playerListModule (ref), parent (ref), userInputService (ref), isReskinConsoleMobileRoute (ref), guiService (ref), fFlagEnableMobilePlayerListOnConsole (ref), tenFootInterfaceModule (ref), fFlagPlayerListUseMobileOnSmallDisplay (ref), utilityModule (ref), fFlagLuaSupportMicroGamepadPreferredInput (ref), fStringPlayerListOverrideTypeModule (ref), playerContextualMenuStore (ref), playerListVisibilityStore (ref), fFlagPlatformLeaderboardPersistStoreOnRemount (ref), platformLeaderboardsClientModule (ref), fFlagPlayerListPersistVisibilityModule (ref), signalsModule (ref), constants_1 (ref), userGameSettingsService (ref), playerListContainer (ref), leaderboardStoreInstanceManager (ref), playersService (ref), playerRelationshipStore (ref), makePlayerInfoRequestsModule (ref), playerIconInfoStore (ref), blockingUtilityModule (ref), fFlagBadgeVisibilitySettingEnabled (ref), robloxReplicatedStorageService (ref), coreGuiService (ref), starterGuiService (ref), fFlagEnableMobilePlayerListOnGamepad (ref), contextActionService (ref), fFlagTopBarSignalizeSetCores (ref), inExperienceTopBarModule (ref)
	local reactModule = require(corePackagesService.Packages.React)
	local reactRobloxModule = require(corePackagesService.Packages.ReactRoblox)
	local constantsModule = require(robloxGui.Modules.TopBar.Constants)
	local foundationModule = require(corePackagesService.Packages.Foundation)
	local foundationProvider = foundationModule.FoundationProvider
	local colorMode = foundationModule.Enums.ColorMode
	local device = foundationModule.Enums.Device
	local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
	local playerListPanel = playerListModule.Presentation.PlayerListPanel
	local playerContextualMenuView = playerListModule.Presentation.PlayerContextualMenuView
	local leaderboardScrim = playerListModule.Presentation.LeaderboardScrim
	local contextMenuControllerModule = require(parent.ContextMenuController)
	
	local function _(p1, p2)
		-- upvalues: robloxTranslatorModule (ref)
		local ok, status = pcall(function()
			-- upvalues: robloxTranslatorModule (copy), p1 (ref)
			return robloxTranslatorModule:FormatByKey(p1)
		end)
		
		return if ok and status and status ~= "" then status else p2
	end
	
	local var1 = "InGame.PlayerList.Leaderboard"
	local ok, status = pcall(function()
		-- upvalues: robloxTranslatorModule (ref), var1 (ref)
		return robloxTranslatorModule:FormatByKey(var1)
	end)
	local var2 = if ok and status and status ~= "" then status else "Leaderboard"
	ok = userInputService.PreferredInput
	status = if isReskinConsoleMobileRoute({
		displaySize = guiService.ViewportDisplaySize,
		preferredInput = ok
	}) or fFlagEnableMobilePlayerListOnConsole then false else tenFootInterfaceModule:IsEnabled()
	local var3 = fFlagPlayerListUseMobileOnSmallDisplay and guiService.ViewportDisplaySize == Enum.DisplaySize.Small
	local var4 = utilityModule:IsSmallTouchScreen()
	
	if not var4 then
		local var5
		if isReskinConsoleMobileRoute({
			displaySize = guiService.ViewportDisplaySize,
			preferredInput = ok
		}) then
			var4 = true
		elseif guiService.ViewportDisplaySize == Enum.DisplaySize.Large then
			var4 = if if ok ~= Enum.PreferredInput.Touch then if ok ~= Enum.PreferredInput.Gamepad then fFlagLuaSupportMicroGamepadPreferredInput and ok == Enum.PreferredInput.MicroGamepad else true else true then fFlagEnableMobilePlayerListOnConsole else false
		end
		if not var4 and var3 then
			var4 = if ok ~= Enum.PreferredInput.Touch then if ok ~= Enum.PreferredInput.Gamepad then fFlagLuaSupportMicroGamepadPreferredInput and ok == Enum.PreferredInput.MicroGamepad else true else true
			var4 = var4 or fStringPlayerListOverrideTypeModule == "mobile"
		end
	end
	if not status then
		local var6
		if isReskinConsoleMobileRoute({
			displaySize = guiService.ViewportDisplaySize,
			preferredInput = ok
		}) then
			var6 = true
		elseif guiService.ViewportDisplaySize == Enum.DisplaySize.Large then
			var6 = if if ok ~= Enum.PreferredInput.Touch then if ok ~= Enum.PreferredInput.Gamepad then fFlagLuaSupportMicroGamepadPreferredInput and ok == Enum.PreferredInput.MicroGamepad else true else true then fFlagEnableMobilePlayerListOnConsole else false
		end
		var5 = if var6 then device.Console else device.Unknown
	end
	local function restoreVisibilityOnDismiss()
		-- upvalues: playerContextualMenuStore (copy), playerListVisibilityStore (copy)
		if playerContextualMenuStore.takeSuppressNextDismissRestore() then
			return
		end
		playerListVisibilityStore.setVisible(true)
	end
	
	if var4 then
		playerContextualMenuStore.setOnDismiss(restoreVisibilityOnDismiss)
	end
	playerContextualMenuStore.setContextMenuOpener(function(p1, p2, p3, p4)
		-- upvalues: contextMenuControllerModule (ref), playerContextualMenuStore (copy), var4 (write)
		task.spawn(function()
			-- upvalues: contextMenuControllerModule (copy), p1 (ref), playerContextualMenuStore (copy), var4 (copy), p4 (ref), p2 (ref), p3 (ref)
			local var7 = contextMenuControllerModule.buildMenuData(p1, playerContextualMenuStore.closeContextMenu, var4, p4)
			
			if p1.Parent == nil then
				return
			end
			var7.anchorPosition = p2
			playerContextualMenuStore.setMenuDataIfCurrent(var7, p3)
		end)
	end)
	local playerListInitialVisibleStateModule = require(parent.PlayerListInitialVisibleState)
	playerListVisibilityStore.reset()
	
	if fFlagPlatformLeaderboardPersistStoreOnRemount then
		platformLeaderboardsClientModule.reset()
	end
	local _ = function()
		-- upvalues: playerListVisibilityStore (copy), fFlagPlayerListPersistVisibilityModule (copy), var4 (write), status (ref)
		playerListVisibilityStore.setShouldPersistVisibility(fFlagPlayerListPersistVisibilityModule and (not var4 and not status))
	end
	
	playerListVisibilityStore.setShouldPersistVisibility(fFlagPlayerListPersistVisibilityModule and (not var4 and not status))
	playerListVisibilityStore.setVisible(playerListInitialVisibleStateModule())
	self.SetVisibleChangedEvent = Instance.new("BindableEvent")
	self.VisibilityChangedEvent = Instance.new("BindableEvent")
	
	local function setupVisibilityEffect()
		-- upvalues: self (ref), signalsModule (copy), playerListVisibilityStore (copy)
		local var7 = false
		self._reskinSetVisibleEffect = signalsModule.createEffect(function(p1)
			-- upvalues: playerListVisibilityStore (copy), var7 (write), self (copy)
			local visible = playerListVisibilityStore.getVisible(p1)
			
			if var7 then
				self.SetVisibleChangedEvent:Fire(visible)
				
				return
			end
			var7 = true
		end)
		local var8 = false
		self._reskinVisibilityEffect = signalsModule.createEffect(function(p1)
			-- upvalues: playerListVisibilityStore (copy), var8 (write), self (copy)
			local effectiveVisible = playerListVisibilityStore.getEffectiveVisible(p1)
			
			if var8 then
				self.VisibilityChangedEvent:Fire(effectiveVisible)
				
				return
			end
			var8 = true
		end)
	end
	
	local topBarHeight = constantsModule.TopBarHeight
	
	local _ = function()
		-- upvalues: constants_1 (copy), constantsModule (ref)
		local MOBILE_EDGE_GAP = constants_1.MOBILE_EDGE_GAP
		
		return math.max(MOBILE_EDGE_GAP, constantsModule.ApplyDisplayScale(MOBILE_EDGE_GAP))
	end
	
	local function computeMobilePosition()
		-- upvalues: topBarHeight (ref), constants_1 (copy), constantsModule (ref)
		local MOBILE_EDGE_GAP = constants_1.MOBILE_EDGE_GAP
		
		return UDim2.new(0.5, 0, 0, topBarHeight + math.max(MOBILE_EDGE_GAP, constantsModule.ApplyDisplayScale(MOBILE_EDGE_GAP)))
	end
	
	local var7, var8 = reactModule.createBinding(computeMobilePosition())
	
	local function resolveContainerProps()
		-- upvalues: var4 (write), var7 (ref), constantsModule (ref), topBarHeight (ref)
		if var4 then
			return {
				tag = "auto-xy",
				AnchorPoint = Vector2.new(0.5, 0),
				Position = var7,
				Size = UDim2.fromOffset(0, 0)
			}
		end
		local maxValue = math.max(4, constantsModule.ApplyDisplayScale(4))
		
		return {
			tag = "auto-xy",
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -maxValue, 0, maxValue + topBarHeight),
			Size = UDim2.fromOffset(0, 0)
		}
	end
	
	local function buildReskinElement()
		-- upvalues: reactModule (ref), foundationProvider (ref), colorMode (ref), var5 (write), userGameSettingsService (copy), leaderboardScrim (ref), var4 (write), foundationModule (ref), resolveContainerProps (ref), playerListContainer (copy), leaderboardStoreInstanceManager (copy), constantsModule (ref), status (ref), playerListPanel (ref), var2 (ref), playerContextualMenuView (ref)
		return reactModule.createElement(foundationProvider, {
			colorMode = colorMode.Dark,
			device = var5,
			preferences = {
				preferredTransparency = userGameSettingsService.PreferredTransparency
			}
		}, {
			Scrim = reactModule.createElement(leaderboardScrim, { isSmallTouchDevice = var4 }),
			Container = reactModule.createElement(foundationModule.View, resolveContainerProps(), {
				ReskinContainer = reactModule.createElement(playerListContainer, {
					leaderboardStore = leaderboardStoreInstanceManager.getLeaderboardStoreInstance,
					TopBarConstants = constantsModule,
					isTenFoot = status
				}, {
					PlayerListPanel = reactModule.createElement(playerListPanel, { isSmallTouchDevice = var4, title = var2 })
				})
			}),
			ContextMenu = reactModule.createElement(playerContextualMenuView, { isSmallTouchDevice = var4 })
		})
	end
	
	local function setupPlayerInfoRequests()
		-- upvalues: playersService (copy), playerRelationshipStore (copy), makePlayerInfoRequestsModule (copy), self (ref), playerIconInfoStore (copy), playerContextualMenuStore (copy), blockingUtilityModule (copy), fFlagBadgeVisibilitySettingEnabled (copy), robloxReplicatedStorageService (copy)
		local t = {
			getState = function()
				-- upvalues: playersService (copy)
				return { players = playersService:GetPlayers() }
			end,
			dispatch = function(_, p1)
				-- upvalues: playerRelationshipStore (copy)
				if type(p1) ~= "table" then return end
				if p1.type == "SetPlayerIsBlocked" and p1.userId then
					playerRelationshipStore.patchPlayerRelationship(p1.userId, { isBlocked = p1.isBlocked })
					
					return
				elseif p1.type == "SetPlayerFriendStatus" and p1.userId then
					playerRelationshipStore.patchPlayerRelationship(p1.userId, { friendStatus = p1.friendStatus })
				end
			end
		}
		
		local function request(p1)
			-- upvalues: makePlayerInfoRequestsModule (copy), t (ref)
			makePlayerInfoRequestsModule(p1)(t)
		end
		
		for i, v in ipairs(playersService:GetPlayers()) do
			makePlayerInfoRequestsModule(v)(t)
		end
		self._reskinPlayerAddedConn = playersService.PlayerAdded:Connect(request)
		self._reskinPlayerRemovingConn = playersService.PlayerRemoving:Connect(function(p1)
			-- upvalues: playerIconInfoStore (copy), playerRelationshipStore (copy)
			playerIconInfoStore.removePlayer(p1.UserId)
			playerRelationshipStore.removePlayer(p1.UserId)
		end)
		
		local function _(p1, p2)
			-- upvalues: playerContextualMenuStore (copy)
			local menuData = playerContextualMenuStore.getMenuData(false)
			
			if menuData ~= nil and menuData.player == p1 then
				playerContextualMenuStore.openContextMenu(p1, menuData.anchorPosition, p2)
			end
		end
		
		self._reskinBlockedStatusConn = blockingUtilityModule:GetBlockedStatusChangedEvent():Connect(function(p1, p2)
			-- upvalues: playerRelationshipStore (copy)
			local var9 = tonumber(p1)
			
			if var9 then
				playerRelationshipStore.patchPlayerRelationship(var9, { isBlocked = p2 })
			end
		end)
		self._reskinFriendStatusConn = playersService.LocalPlayer.FriendStatusChanged:Connect(function(p1, p2)
			-- upvalues: playerRelationshipStore (copy), playerContextualMenuStore (copy)
			playerRelationshipStore.patchPlayerRelationship(p1.UserId, { friendStatus = p2 })
			local menuData = playerContextualMenuStore.getMenuData(false)
			
			if menuData ~= nil and menuData.player == p1 then
				playerContextualMenuStore.openContextMenu(p1, menuData.anchorPosition, p2)
			end
		end)
		
		if fFlagBadgeVisibilitySettingEnabled then
			task.spawn(function()
				-- upvalues: robloxReplicatedStorageService (copy), self (copy), playersService (copy), makePlayerInfoRequestsModule (copy), t (ref)
				self._reskinProfileSettingsConn = robloxReplicatedStorageService:WaitForChild("SendPlayerProfileSettings", 1e999).OnClientEvent:Connect(function(p1)
					-- upvalues: playersService (copy), makePlayerInfoRequestsModule (copy), t (copy)
					local var9 = playersService:GetPlayerByUserId(tonumber(p1))
					
					if var9 then
						makePlayerInfoRequestsModule(var9)(t)
					end
				end)
			end)
		end
	end
	
	local function teardownPlayerInfoRequests()
		-- upvalues: self (ref), playerRelationshipStore (copy)
		if self._reskinPlayerAddedConn then
			self._reskinPlayerAddedConn:Disconnect()
			self._reskinPlayerAddedConn = nil
		end
		if self._reskinPlayerRemovingConn then
			self._reskinPlayerRemovingConn:Disconnect()
			self._reskinPlayerRemovingConn = nil
		end
		if self._reskinBlockedStatusConn then
			self._reskinBlockedStatusConn:Disconnect()
			self._reskinBlockedStatusConn = nil
		end
		if self._reskinFriendStatusConn then
			self._reskinFriendStatusConn:Disconnect()
			self._reskinFriendStatusConn = nil
		end
		if self._reskinProfileSettingsConn then
			self._reskinProfileSettingsConn:Disconnect()
			self._reskinProfileSettingsConn = nil
		end
		playerRelationshipStore.cleanUp()
	end
	
	local function mountReskin()
		-- upvalues: playerListVisibilityStore (copy), fFlagPlayerListPersistVisibilityModule (copy), var4 (write), status (ref), coreGuiService (copy), reactRobloxModule (ref), buildReskinElement (ref), self (ref), var8 (ref), computeMobilePosition (ref), setupPlayerInfoRequests (ref)
		playerListVisibilityStore.setShouldPersistVisibility(fFlagPlayerListPersistVisibilityModule and (not var4 and not status))
		local playerListReskin = Instance.new("ScreenGui")
		playerListReskin.Name = "PlayerListReskin"
		playerListReskin.AutoLocalize = false
		playerListReskin.IgnoreGuiInset = true
		playerListReskin.DisplayOrder = if _G.__TESTEZ_RUNNING_TEST__ == true then -1 else 1
		playerListReskin.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		playerListReskin.Parent = coreGuiService
		local var9 = reactRobloxModule.createRoot(playerListReskin)
		var9:render(buildReskinElement())
		self._reskinRoot = var9
		self._reskinScreenGui = playerListReskin
		
		if var4 then
			local function connectViewport(p1)
				-- upvalues: self (copy), var8 (copy), computeMobilePosition (copy)
				if self._reskinViewportConn then
					self._reskinViewportConn:Disconnect()
					self._reskinViewportConn = nil
				end
				if p1 then
					self._reskinViewportConn = p1:GetPropertyChangedSignal("ViewportSize"):Connect(function()
						-- upvalues: var8 (copy), computeMobilePosition (copy)
						var8(computeMobilePosition())
					end)
					var8(computeMobilePosition())
				end
			end
			
			self._reskinCameraConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
				-- upvalues: connectViewport (ref)
				connectViewport(workspace.CurrentCamera)
			end)
			connectViewport(workspace.CurrentCamera)
		end
		setupPlayerInfoRequests()
	end
	
	local function unmountReskin()
		-- upvalues: playerListVisibilityStore (copy), teardownPlayerInfoRequests (ref), self (ref)
		playerListVisibilityStore.setShouldPersistVisibility(false)
		teardownPlayerInfoRequests()
		
		if self._reskinCameraConn then
			self._reskinCameraConn:Disconnect()
			self._reskinCameraConn = nil
		end
		if self._reskinViewportConn then
			self._reskinViewportConn:Disconnect()
			self._reskinViewportConn = nil
		end
		if self._reskinRoot then
			self._reskinRoot:unmount()
			self._reskinRoot = nil
		end
		if self._reskinScreenGui then
			self._reskinScreenGui:Destroy()
			self._reskinScreenGui = nil
		end
		if self._reskinVisibilityEffect then
			self._reskinVisibilityEffect()
			self._reskinVisibilityEffect = nil
		end
		if self._reskinSetVisibleEffect then
			self._reskinSetVisibleEffect()
			self._reskinSetVisibleEffect = nil
		end
	end
	
	self.topBarEnabled = true
	self.coreGuiEnabled = starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList)
	self._reskin = {
		mountReskin = mountReskin,
		unmountReskin = unmountReskin,
		setupVisibilityEffect = setupVisibilityEffect
	}
	
	if self.coreGuiEnabled then
		leaderboardStoreInstanceManager.createLeaderboardStoreInstance()
		setupVisibilityEffect()
		mountReskin()
		self.mounted = true
	else
		self.mounted = false
	end
	if fFlagEnableMobilePlayerListOnGamepad then
		local function onPreferredInputChanged(p1)
			-- upvalues: fFlagPlayerListUseMobileOnSmallDisplay (copy), guiService (copy), utilityModule (copy), isReskinConsoleMobileRoute (copy), fFlagLuaSupportMicroGamepadPreferredInput (copy), fFlagEnableMobilePlayerListOnConsole (copy), fStringPlayerListOverrideTypeModule (copy), var4 (write), playerContextualMenuStore (copy), var5 (write), device (ref), restoreVisibilityOnDismiss (ref), self (ref), unmountReskin (ref), setupVisibilityEffect (ref), mountReskin (ref), playerListVisibilityStore (copy), fFlagPlayerListPersistVisibilityModule (copy), status (ref), playerListInitialVisibleStateModule (ref)
			local var9 = fFlagPlayerListUseMobileOnSmallDisplay and guiService.ViewportDisplaySize == Enum.DisplaySize.Small
			local var10 = utilityModule:IsSmallTouchScreen()
			
			if not var10 then
				if isReskinConsoleMobileRoute({
					displaySize = guiService.ViewportDisplaySize,
					preferredInput = p1
				}) then
					var10 = true
				elseif guiService.ViewportDisplaySize == Enum.DisplaySize.Large then
					var10 = if if p1 ~= Enum.PreferredInput.Touch then if p1 ~= Enum.PreferredInput.Gamepad then fFlagLuaSupportMicroGamepadPreferredInput and p1 == Enum.PreferredInput.MicroGamepad else true else true then fFlagEnableMobilePlayerListOnConsole else false
				end
				if not var10 and var9 then
					var10 = if p1 ~= Enum.PreferredInput.Touch then if p1 ~= Enum.PreferredInput.Gamepad then fFlagLuaSupportMicroGamepadPreferredInput and p1 == Enum.PreferredInput.MicroGamepad else true else true
					var10 = var10 or fStringPlayerListOverrideTypeModule == "mobile"
				end
			end
			if var10 == var4 then return end
			if playerContextualMenuStore.getMenuData(false) ~= nil then
				playerContextualMenuStore.closeContextMenu()
			end
			local var11
			var4 = var10
			
			if isReskinConsoleMobileRoute({
				displaySize = guiService.ViewportDisplaySize,
				preferredInput = p1
			}) then
				var11 = true
			elseif guiService.ViewportDisplaySize == Enum.DisplaySize.Large then
				var11 = if if p1 ~= Enum.PreferredInput.Touch then if p1 ~= Enum.PreferredInput.Gamepad then fFlagLuaSupportMicroGamepadPreferredInput and p1 == Enum.PreferredInput.MicroGamepad else true else true then fFlagEnableMobilePlayerListOnConsole else false
			end
			var5 = if var11 then device.Console else device.Unknown
			playerContextualMenuStore.setOnDismiss(if var4 then restoreVisibilityOnDismiss else nil)
			
			if self.mounted then
				unmountReskin()
				setupVisibilityEffect()
				mountReskin()
			end
			playerListVisibilityStore.setShouldPersistVisibility(fFlagPlayerListPersistVisibilityModule and (not var4 and not status))
			local var12 = playerListInitialVisibleStateModule(p1)
			playerListVisibilityStore.setVisible(var12)
			playerListVisibilityStore.setTempHideSnapshot(var12)
		end
		
		self._onPreferredInputChanged = onPreferredInputChanged
		self._reskinPreferredInputConn = userInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function()
			-- upvalues: onPreferredInputChanged (ref), userInputService (copy)
			onPreferredInputChanged(userInputService.PreferredInput)
		end)
	end
	self._reskinCoreGuiConn = starterGuiService.CoreGuiChangedSignal:Connect(function(p1, p2)
		-- upvalues: self (ref)
		if p1 == Enum.CoreGuiType.All or p1 == Enum.CoreGuiType.PlayerList then
			self.coreGuiEnabled = p2
			self:SetTopBarEnabled(self.topBarEnabled)
		end
	end)
	contextActionService:BindCoreAction("RbxPlayerListToggle", function(_, p1, _)
		-- upvalues: self (ref), var4 (write), guiService (copy)
		if not self.mounted then
			return Enum.ContextActionResult.Pass
		elseif var4 then
			return Enum.ContextActionResult.Pass
		elseif guiService.MenuIsOpen then
			return Enum.ContextActionResult.Pass
		elseif p1 == Enum.UserInputState.Begin then
			self:SetVisibility(not self:GetVisibility())
			
			return Enum.ContextActionResult.Sink
		end
		return Enum.ContextActionResult.Pass
	end, false, Enum.KeyCode.Tab)
	
	if fFlagTopBarSignalizeSetCores then
		self._reskinTopBarEffect = signalsModule.createEffect(function(p1)
			-- upvalues: inExperienceTopBarModule (copy), self (ref)
			local getTopBarStore = inExperienceTopBarModule.Stores.GetTopBarStore
			
			if getTopBarStore then
				self:SetTopBarEnabled(getTopBarStore(p1).getTopBarCoreGuiEnabled(p1))
			end
		end)
	end
	return self
end

function t:GetVisibility()
	-- upvalues: fFlagPlayerListReskin (ref), playerListVisibilityStore (ref)
	return if fFlagPlayerListReskin then playerListVisibilityStore.getEffectiveVisible(false) else self.store:getState().displayOptions.isVisible
end

if fFlagAddNewPlayerListFocusNav then
	function t:GetVisibilityChangedEvent()
		return self.VisibilityChangedEvent
	end
end
function t:GetSetVisible()
	-- upvalues: fFlagPlayerListReskin (ref), playerListVisibilityStore (ref)
	return if fFlagPlayerListReskin then playerListVisibilityStore.getVisible(false) else self.store:getState().displayOptions.setVisible
end

function t:GetSetVisibleChangedEvent()
	return self.SetVisibleChangedEvent
end

function t:SetVisibility(p1)
	-- upvalues: fFlagPlayerListReskin (ref), playerContextualMenuStore (ref), playerListVisibilityStore (ref), setPlayerListVisibilityModule (ref)
	if not fFlagPlayerListReskin then
		self.store:dispatch(setPlayerListVisibilityModule(p1))
		
		return
	elseif not p1 then
		playerContextualMenuStore.closeContextMenu()
	end
	playerListVisibilityStore.setVisible(p1)
end

function t:HideTemp(p1, p2)
	-- upvalues: fFlagPlayerListReskin (ref), playerContextualMenuStore (ref), playerListVisibilityStore (ref), setTempHideKeyModule (ref)
	if fFlagPlayerListReskin then
		if p2 and playerContextualMenuStore.getMenuData(false) ~= nil then
			playerContextualMenuStore.closeContextMenu()
		end
		playerListVisibilityStore.setTempHide(p1, p2)
		
		return
	elseif p2 == false then
		p2 = nil
	end
	self.store:dispatch(setTempHideKeyModule(p1, p2))
end

function t:SetTopBarEnabled(p1)
	-- upvalues: fFlagPlayerListReskin (ref), leaderboardStoreInstanceManager (ref)
	if not fFlagPlayerListReskin then
		self.topBarEnabled = p1
		self:_updateMounted()
		
		return
	end
	self.topBarEnabled = p1
	p1 = self.coreGuiEnabled and p1
	
	if p1 and not self.mounted then
		leaderboardStoreInstanceManager.createLeaderboardStoreInstance()
		self._reskin.setupVisibilityEffect()
		self._reskin.mountReskin()
		self.mounted = true
		
		return
	elseif not p1 and self.mounted then
		self._reskin.unmountReskin()
		leaderboardStoreInstanceManager.cleanUpInstance()
		self.mounted = false
	end
end

function t:SetMinimized(b)
	-- upvalues: fFlagPlayerListReskin (ref), setMinimizedModule (ref)
	if fFlagPlayerListReskin then
		return
	end
	self.store:dispatch(setMinimizedModule(b))
end

return t