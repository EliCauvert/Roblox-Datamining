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
local fFlagAddNewPlayerListMobileFocusNav = playerListModule.Flags.FFlagAddNewPlayerListMobileFocusNav
local fFlagEnableMobilePlayerListOnConsole = playerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local fFlagPlayerListUseMobileOnSmallDisplay = playerListModule.Flags.FFlagPlayerListUseMobileOnSmallDisplay
local fFlagPlayerListIgnoreDevGamepadBindings = playerListModule.Flags.FFlagPlayerListIgnoreDevGamepadBindings
local fFlagPlatformLeaderboardPersistStoreOnRemount = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagPlatformLeaderboardPersistStoreOnRemount
local fFlagPlayerListReskin = playerListModule.Flags.FFlagPlayerListReskin
local playerListContainer = playerListModule.Container.PlayerListContainer
local leaderboardStoreInstanceManager = playerListModule.LeaderboardStoreInstanceManager
local playerListVisibilityStore = playerListModule.PlayerListVisibilityStore
local playerContextualMenuStore = playerListModule.PlayerContextualMenuStore
local playerIconInfoStore = playerIconInfoStoreModule.PlayerIconInfoStore
local fFlagTopBarSignalizeSetCores = inExperienceTopBarModule.Flags.FFlagTopBarSignalizeSetCores

local function _() --[[ line: 83 | named "isUnderTestEZ" ]]
	return _G.__TESTEZ_RUNNING_TEST__ == true
end

local _ = function() --[[ line: 89 | named "isTouchOrGamepadInput" ]]
	-- upvalues: userInputService (ref)
	return if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true
end

local _ = function() --[[ line: 100 | named "isReskinConsoleMobileRoute" ]]
	-- upvalues: fFlagPlayerListReskin (ref), fFlagEnableMobilePlayerListOnConsole (ref), guiService (ref), userInputService (ref)
	return fFlagPlayerListReskin and (fFlagEnableMobilePlayerListOnConsole and (guiService.ViewportDisplaySize == Enum.DisplaySize.Large and (if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true)))
end

local _ = function() --[[ line: 109 | named "resolveIsTenFoot" ]]
	-- upvalues: fFlagPlayerListReskin (ref), fFlagEnableMobilePlayerListOnConsole (ref), guiService (ref), userInputService (ref), tenFootInterfaceModule (ref)
	return if (fFlagPlayerListReskin and (fFlagEnableMobilePlayerListOnConsole and (guiService.ViewportDisplaySize == Enum.DisplaySize.Large and (if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true)))) or fFlagEnableMobilePlayerListOnConsole then false else tenFootInterfaceModule:IsEnabled()
end

local _ = function() --[[ line: 119 | named "isLargeConsoleLayout" ]]
	-- upvalues: guiService (ref), userInputService (ref), fFlagEnableMobilePlayerListOnConsole (ref)
	if guiService.ViewportDisplaySize == Enum.DisplaySize.Large then
		return if if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true then fFlagEnableMobilePlayerListOnConsole else false
	end
end

local _ = function() --[[ line: 126 | named "isSmallTouchScreen" ]]
	-- upvalues: fFlagPlayerListUseMobileOnSmallDisplay (ref), guiService (ref), utilityModule (ref), userInputService (ref), fFlagEnableMobilePlayerListOnConsole (ref), fStringPlayerListOverrideTypeModule (ref)
	if _G.__TESTEZ_RUNNING_TEST__ == true then
		return false
	end
	local var39 = fFlagPlayerListUseMobileOnSmallDisplay and guiService.ViewportDisplaySize == Enum.DisplaySize.Small
	local var40 = utilityModule:IsSmallTouchScreen()
	
	if not var40 then
		if guiService.ViewportDisplaySize == Enum.DisplaySize.Large then
			var40 = if if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true then fFlagEnableMobilePlayerListOnConsole else false
		end
		if not var40 and var39 then
			var40 = if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true
			var40 = var40 or fStringPlayerListOverrideTypeModule == "mobile"
		end
	end
	return var40
end

local function setupSettings(value) --[[ line: 138 ]]
	-- upvalues: setSettingsModule (ref), userGameSettingsService (ref)
	local function _() --[[ line: 139 | named "updateSettings" ]]
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
	userGameSettingsService:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() --[[ line: 148 ]]
		-- upvalues: value (ref), setSettingsModule (copy), userGameSettingsService (copy)
		value:dispatch(setSettingsModule({
			reducedMotion = userGameSettingsService.ReducedMotion,
			preferredTransparency = userGameSettingsService.PreferredTransparency
		}))
	end)
	userGameSettingsService:GetPropertyChangedSignal("ReducedMotion"):Connect(function() --[[ line: 151 ]]
		-- upvalues: value (ref), setSettingsModule (copy), userGameSettingsService (copy)
		value:dispatch(setSettingsModule({
			reducedMotion = userGameSettingsService.ReducedMotion,
			preferredTransparency = userGameSettingsService.PreferredTransparency
		}))
	end)
end

local t = {}
t.__index = t

function t.new() --[[ line: 159 ]]
	-- upvalues: t (ref), fFlagPlayerListReskin (ref), globalConfigModule (ref), roactModule (ref), roduxModule (ref), reducerModule (ref), setupSettings (ref), starterGuiService (ref), setPlayerListEnabledModule (ref), setSmallTouchDeviceModule (ref), fFlagPlayerListUseMobileOnSmallDisplay (ref), guiService (ref), utilityModule (ref), userInputService (ref), fFlagEnableMobilePlayerListOnConsole (ref), fStringPlayerListOverrideTypeModule (ref), setTenFootInterfaceModule (ref), tenFootInterfaceModule (ref), setSubjectToChinaPoliciesModule (ref), cachedPolicyServiceModule (ref), colorMode (ref), constants (ref), roactRoduxModule (ref), playerListSwitcherModule (ref), apolloProvider (ref), apolloClientModule (ref), setIsUsingGamepadModule (ref), leaderboardStoreInstanceManager (ref), fFlagReplacePlayerIconRoduxWithSignal (ref), playerIconInfoStore (ref), playerListContainer (ref), robloxGui (ref), coreGuiService (ref), fFlagAddNewPlayerListFocusNav (ref), fFlagTopBarSignalizeSetCores (ref), signalsModule (ref), inExperienceTopBarModule (ref)
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
	coroutine.wrap(function() --[[ line: 189 ]]
		-- upvalues: tbl (ref), setSmallTouchDeviceModule (copy), fFlagPlayerListUseMobileOnSmallDisplay (copy), guiService (copy), utilityModule (copy), userInputService (copy), fFlagEnableMobilePlayerListOnConsole (copy), fStringPlayerListOverrideTypeModule (copy)
		local var45
		local store = tbl.store
		
		if _G.__TESTEZ_RUNNING_TEST__ == true then
			var45 = false
		else
			local var44 = fFlagPlayerListUseMobileOnSmallDisplay and guiService.ViewportDisplaySize == Enum.DisplaySize.Small
			var45 = utilityModule:IsSmallTouchScreen()
			
			if not var45 then
				if guiService.ViewportDisplaySize == Enum.DisplaySize.Large then
					var45 = if if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true then fFlagEnableMobilePlayerListOnConsole else false
				end
				if not var45 and var44 then
					var45 = if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true
					var45 = var45 or fStringPlayerListOverrideTypeModule == "mobile"
				end
			end
		end
		store:dispatch(setSmallTouchDeviceModule(var45))
	end)()
	local var42 = fFlagPlayerListReskin and (fFlagEnableMobilePlayerListOnConsole and (guiService.ViewportDisplaySize == Enum.DisplaySize.Large and (if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true)))
	tbl.store:dispatch(setTenFootInterfaceModule(if var42 or fFlagEnableMobilePlayerListOnConsole then false else tenFootInterfaceModule:IsEnabled()))
	coroutine.wrap(function() --[[ line: 195 ]]
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
			setLayerCollectorEnabled = function(value) --[[ line: 211 ]]
				-- upvalues: tbl (ref)
				if tbl.layerCollectorRef.current then
					tbl.layerCollectorRef.current.Enabled = value
					
					return
				end
			end
		})
	})
	tbl.root = roactModule.createElement(apolloProvider, { client = apolloClientModule }, { StoreProvider = tbl.root })
	
	function tbl._setIsUsingGamepad() --[[ line: 225 ]]
		-- upvalues: userInputService (copy), tbl (ref), setIsUsingGamepadModule (copy)
		local lastInputType = userInputService:GetLastInputType()
		tbl.store:dispatch(setIsUsingGamepadModule((lastInputType and lastInputType.Name:find("Gamepad")) ~= nil))
	end
	
	function tbl._mountLeaderboardStore() --[[ line: 231 ]]
		-- upvalues: leaderboardStoreInstanceManager (copy)
		leaderboardStoreInstanceManager.createLeaderboardStoreInstance()
	end
	
	function tbl._unmountLeaderboardStore() --[[ line: 235 ]]
		-- upvalues: leaderboardStoreInstanceManager (copy)
		leaderboardStoreInstanceManager.cleanUpInstance()
	end
	
	tbl._unmountPlayerIconInfoStore = if fFlagReplacePlayerIconRoduxWithSignal then function() --[[ line: 240 ]]
		-- upvalues: playerIconInfoStore (copy)
		playerIconInfoStore.cleanUp()
	end else nil
	tbl._mountLeaderboardStore()
	tbl._setIsUsingGamepad()
	local createElement = roactModule.createElement
	local t_1 = {
		leaderboardStore = leaderboardStoreInstanceManager.getLeaderboardStoreInstance,
		TopBarConstants = require(robloxGui.Modules.TopBar.Constants),
		isTenFoot = var42
	}
	var42 = if (fFlagPlayerListReskin and (fFlagEnableMobilePlayerListOnConsole and (guiService.ViewportDisplaySize == Enum.DisplaySize.Large and (if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true)))) or fFlagEnableMobilePlayerListOnConsole then false else tenFootInterfaceModule:IsEnabled()
	tbl.root = createElement(playerListContainer, t_1, { PlayerListRoot = tbl.root })
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
		tbl.disposeEffect = signalsModule.createEffect(function(p0) --[[ line: 278 ]]
			-- upvalues: inExperienceTopBarModule (copy), tbl (ref)
			local getTopBarStore = inExperienceTopBarModule.Stores.GetTopBarStore
			
			if getTopBarStore then
				tbl:SetTopBarEnabled(getTopBarStore(p0).getTopBarCoreGuiEnabled(p0))
			end
		end)
	end
	tbl.store.changed:connect(function(p1, p2) --[[ line: 286 ]]
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

function t:_updateMounted() --[[ line: 300 ]]
	-- upvalues: fFlagPlayerListReskin (ref), fFlagEnableMobilePlayerListOnConsole (ref), guiService (ref), userInputService (ref), tenFootInterfaceModule (ref), roactModule (ref), coreGuiService (ref)
	local var47 = if (fFlagPlayerListReskin and (fFlagEnableMobilePlayerListOnConsole and (guiService.ViewportDisplaySize == Enum.DisplaySize.Large and (if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true)))) or fFlagEnableMobilePlayerListOnConsole then false else tenFootInterfaceModule:IsEnabled()
	
	if not var47 then
		var47 = self.coreGuiEnabled and self.topBarEnabled
		
		if var47 and not self.mounted then
			self._mountLeaderboardStore()
			self._setIsUsingGamepad()
			self.element = roactModule.mount(self.root, coreGuiService, "PlayerList")
			self.mounted = true
			
			return
		elseif not var47 and self.mounted then
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

function t._trackEnabled(p3) --[[ line: 323 ]]
	-- upvalues: starterGuiService (ref), setPlayerListEnabledModule (ref), fFlagPlayerListIgnoreDevGamepadBindings (ref), guiService (ref), constants_1 (ref)
	starterGuiService.CoreGuiChangedSignal:Connect(function(p4, p5) --[[ line: 324 ]]
		-- upvalues: p3 (ref), setPlayerListEnabledModule (copy), fFlagPlayerListIgnoreDevGamepadBindings (copy), guiService (copy), constants_1 (copy)
		if p4 == Enum.CoreGuiType.All or p4 == Enum.CoreGuiType.PlayerList then
			p3.coreGuiEnabled = p5
			p3:_updateMounted()
			p3.store:dispatch(setPlayerListEnabledModule(p5))
			
			if fFlagPlayerListIgnoreDevGamepadBindings and not p5 then
				guiService:SetMenuIsOpen(false, constants_1.PLAYER_LIST_MENU)
			end
		end
	end)
end

if fFlagAddNewPlayerListMobileFocusNav then
	function t:GetIsModal() --[[ line: 339 ]]
		-- upvalues: fFlagPlayerListReskin (ref), fFlagPlayerListUseMobileOnSmallDisplay (ref), guiService (ref), utilityModule (ref), userInputService (ref), fFlagEnableMobilePlayerListOnConsole (ref), fStringPlayerListOverrideTypeModule (ref)
		if not fFlagPlayerListReskin then
			return self.store:getState().displayOptions.isSmallTouchDevice
		elseif _G.__TESTEZ_RUNNING_TEST__ == true then
			return false
		end
		local var48 = fFlagPlayerListUseMobileOnSmallDisplay and guiService.ViewportDisplaySize == Enum.DisplaySize.Small
		local var49 = utilityModule:IsSmallTouchScreen()
		
		if not var49 then
			if guiService.ViewportDisplaySize == Enum.DisplaySize.Large then
				var49 = if if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true then fFlagEnableMobilePlayerListOnConsole else false
			end
			if not var49 and var48 then
				var49 = if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true
				var49 = var49 or fStringPlayerListOverrideTypeModule == "mobile"
			end
		end
		return var49
	end
end
function t:_setupReskin() --[[ line: 348 ]]
	-- upvalues: corePackagesService (ref), robloxGui (ref), playerListModule (ref), parent (ref), fFlagPlayerListReskin (ref), fFlagEnableMobilePlayerListOnConsole (ref), guiService (ref), userInputService (ref), tenFootInterfaceModule (ref), fFlagPlayerListUseMobileOnSmallDisplay (ref), utilityModule (ref), fStringPlayerListOverrideTypeModule (ref), playerContextualMenuStore (ref), playerListVisibilityStore (ref), fFlagPlatformLeaderboardPersistStoreOnRemount (ref), platformLeaderboardsClientModule (ref), signalsModule (ref), constants_1 (ref), userGameSettingsService (ref), playerListContainer (ref), leaderboardStoreInstanceManager (ref), playersService (ref), playerRelationshipStore (ref), makePlayerInfoRequestsModule (ref), playerIconInfoStore (ref), blockingUtilityModule (ref), fFlagBadgeVisibilitySettingEnabled (ref), robloxReplicatedStorageService (ref), coreGuiService (ref), starterGuiService (ref), contextActionService (ref), fFlagTopBarSignalizeSetCores (ref), inExperienceTopBarModule (ref)
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
	
	local function _(p6, p7) --[[ line: 363 | named "translate" ]]
		-- upvalues: robloxTranslatorModule (ref)
		local ok, status = pcall(function() --[[ line: 364 ]]
			-- upvalues: robloxTranslatorModule (copy), p6 (ref)
			return robloxTranslatorModule:FormatByKey(p6)
		end)
		
		return if ok and status and status ~= "" then status else p7
	end
	
	local var56 = "InGame.PlayerList.Leaderboard"
	local ok, status = pcall(function() --[[ line: 364 ]]
		-- upvalues: robloxTranslatorModule (ref), var56 (ref)
		return robloxTranslatorModule:FormatByKey(var56)
	end)
	local var57 = if ok and status and status ~= "" then status else "Leaderboard"
	status = fFlagPlayerListReskin and (fFlagEnableMobilePlayerListOnConsole and (guiService.ViewportDisplaySize == Enum.DisplaySize.Large and (if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true)))
	ok = if status or fFlagEnableMobilePlayerListOnConsole then false else tenFootInterfaceModule:IsEnabled()
	
	if _G.__TESTEZ_RUNNING_TEST__ == true then
		status = false
	else
		local var58 = fFlagPlayerListUseMobileOnSmallDisplay and guiService.ViewportDisplaySize == Enum.DisplaySize.Small
		status = utilityModule:IsSmallTouchScreen()
		
		if not status then
			local var60
			if guiService.ViewportDisplaySize == Enum.DisplaySize.Large then
				status = if if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true then fFlagEnableMobilePlayerListOnConsole else false
			end
			if not status and var58 then
				status = if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true
				status = status or fStringPlayerListOverrideTypeModule == "mobile"
			end
		end
	end
	if not ok then
		local var59
		if guiService.ViewportDisplaySize == Enum.DisplaySize.Large then
			var59 = if if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true then fFlagEnableMobilePlayerListOnConsole else false
		end
		var60 = if var59 then device.Console else device.Unknown
	end
	if status then
		playerContextualMenuStore.setOnDismiss(function() --[[ line: 386 ]]
			-- upvalues: playerContextualMenuStore (copy), playerListVisibilityStore (copy)
			if playerContextualMenuStore.takeSuppressNextDismissRestore() then
				return
			end
			playerListVisibilityStore.setVisible(true)
		end)
	end
	playerContextualMenuStore.setContextMenuOpener(function(p8, p9, p10) --[[ line: 394 ]]
		-- upvalues: contextMenuControllerModule (ref), playerContextualMenuStore (copy), status (ref), playerListVisibilityStore (copy)
		task.spawn(function() --[[ line: 395 ]]
			-- upvalues: contextMenuControllerModule (copy), p8 (ref), playerContextualMenuStore (copy), status (copy), p9 (ref), p10 (ref), playerListVisibilityStore (copy)
			local var72 = contextMenuControllerModule.buildMenuData(p8, playerContextualMenuStore.closeContextMenu, status)
			
			if p8.Parent == nil then return end
			var72.anchorPosition = p9
			
			if playerContextualMenuStore.setMenuDataIfCurrent(var72, p10) and status then
				playerListVisibilityStore.setVisible(false)
			end
		end)
	end)
	local playerListInitialVisibleStateModule = require(parent.PlayerListInitialVisibleState)
	playerListVisibilityStore.reset()
	
	if fFlagPlatformLeaderboardPersistStoreOnRemount then
		platformLeaderboardsClientModule.reset()
	end
	playerListVisibilityStore.setVisible(playerListInitialVisibleStateModule())
	self.SetVisibleChangedEvent = Instance.new("BindableEvent")
	self.VisibilityChangedEvent = Instance.new("BindableEvent")
	
	local function setupVisibilityEffect() --[[ line: 425 ]]
		-- upvalues: self (ref), signalsModule (copy), playerListVisibilityStore (copy)
		local var73 = false
		self._reskinSetVisibleEffect = signalsModule.createEffect(function(p11) --[[ line: 427 ]]
			-- upvalues: playerListVisibilityStore (copy), var73 (write), self (copy)
			local visible = playerListVisibilityStore.getVisible(p11)
			
			if var73 then
				self.SetVisibleChangedEvent:Fire(visible)
				
				return
			end
			var73 = true
		end)
		local var74 = false
		self._reskinVisibilityEffect = signalsModule.createEffect(function(p12) --[[ line: 437 ]]
			-- upvalues: playerListVisibilityStore (copy), var74 (write), self (copy)
			local effectiveVisible = playerListVisibilityStore.getEffectiveVisible(p12)
			
			if var74 then
				self.VisibilityChangedEvent:Fire(effectiveVisible)
				
				return
			end
			var74 = true
		end)
	end
	
	local topBarHeight = constantsModule.TopBarHeight
	
	local _ = function() --[[ line: 450 | named "computeMobileTopInset" ]]
		-- upvalues: constants_1 (copy), constantsModule (ref)
		local MOBILE_EDGE_GAP = constants_1.MOBILE_EDGE_GAP
		
		return math.max(MOBILE_EDGE_GAP, constantsModule.ApplyDisplayScale(MOBILE_EDGE_GAP))
	end
	
	local function computeMobilePosition() --[[ line: 454 ]]
		-- upvalues: topBarHeight (ref), constants_1 (copy), constantsModule (ref)
		local MOBILE_EDGE_GAP = constants_1.MOBILE_EDGE_GAP
		
		return UDim2.new(0.5, 0, 0, topBarHeight + math.max(MOBILE_EDGE_GAP, constantsModule.ApplyDisplayScale(MOBILE_EDGE_GAP)))
	end
	
	local var64, var65 = reactModule.createBinding(computeMobilePosition())
	
	local function resolveContainerProps() --[[ line: 458 ]]
		-- upvalues: status (ref), var64 (ref), constantsModule (ref), topBarHeight (ref)
		if status then
			return {
				tag = "auto-xy",
				AnchorPoint = Vector2.new(0.5, 0),
				Position = var64,
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
	
	local function buildReskinElement() --[[ line: 476 ]]
		-- upvalues: reactModule (ref), foundationProvider (ref), colorMode (ref), var60 (ref), userGameSettingsService (copy), leaderboardScrim (ref), status (ref), foundationModule (ref), resolveContainerProps (ref), playerListContainer (copy), leaderboardStoreInstanceManager (copy), constantsModule (ref), ok (ref), playerListPanel (ref), var57 (ref), playerContextualMenuView (ref)
		return reactModule.createElement(foundationProvider, {
			colorMode = colorMode.Dark,
			device = var60,
			preferences = {
				preferredTransparency = userGameSettingsService.PreferredTransparency
			}
		}, {
			Scrim = reactModule.createElement(leaderboardScrim, { isSmallTouchDevice = status }),
			Container = reactModule.createElement(foundationModule.View, resolveContainerProps(), {
				ReskinContainer = reactModule.createElement(playerListContainer, {
					leaderboardStore = leaderboardStoreInstanceManager.getLeaderboardStoreInstance,
					TopBarConstants = constantsModule,
					isTenFoot = ok
				}, {
					PlayerListPanel = reactModule.createElement(playerListPanel, { isSmallTouchDevice = status, title = var57 })
				})
			}),
			ContextMenu = reactModule.createElement(playerContextualMenuView, { isSmallTouchDevice = status })
		})
	end
	
	local function setupPlayerInfoRequests() --[[ line: 511 ]]
		-- upvalues: playersService (copy), playerRelationshipStore (copy), makePlayerInfoRequestsModule (copy), self (ref), playerIconInfoStore (copy), blockingUtilityModule (copy), fFlagBadgeVisibilitySettingEnabled (copy), robloxReplicatedStorageService (copy)
		local t = {
			getState = function() --[[ line: 513 ]]
				-- upvalues: playersService (copy)
				return { players = playersService:GetPlayers() }
			end,
			dispatch = function(_, p13) --[[ line: 516 ]]
				-- upvalues: playerRelationshipStore (copy)
				if type(p13) ~= "table" then return end
				if p13.type == "SetPlayerIsBlocked" and p13.userId then
					playerRelationshipStore.patchPlayerRelationship(p13.userId, { isBlocked = p13.isBlocked })
					
					return
				elseif p13.type == "SetPlayerFriendStatus" and p13.userId then
					playerRelationshipStore.patchPlayerRelationship(p13.userId, { friendStatus = p13.friendStatus })
				end
			end
		}
		
		local function request(p14) --[[ line: 531 ]]
			-- upvalues: makePlayerInfoRequestsModule (copy), t (ref)
			makePlayerInfoRequestsModule(p14)(t)
		end
		
		for i, v in ipairs(playersService:GetPlayers()) do
			makePlayerInfoRequestsModule(v)(t)
		end
		self._reskinPlayerAddedConn = playersService.PlayerAdded:Connect(request)
		self._reskinPlayerRemovingConn = playersService.PlayerRemoving:Connect(function(p15) --[[ line: 538 ]]
			-- upvalues: playerIconInfoStore (copy), playerRelationshipStore (copy)
			playerIconInfoStore.removePlayer(p15.UserId)
			playerRelationshipStore.removePlayer(p15.UserId)
		end)
		self._reskinBlockedStatusConn = blockingUtilityModule:GetBlockedStatusChangedEvent():Connect(function(p16, p17) --[[ line: 543 ]]
			-- upvalues: playerRelationshipStore (copy)
			local var80 = tonumber(p16)
			
			if var80 then
				playerRelationshipStore.patchPlayerRelationship(var80, { isBlocked = p17 })
			end
		end)
		self._reskinFriendStatusConn = playersService.LocalPlayer.FriendStatusChanged:Connect(function(p18, p19) --[[ line: 549 ]]
			-- upvalues: playerRelationshipStore (copy)
			playerRelationshipStore.patchPlayerRelationship(p18.UserId, { friendStatus = p19 })
		end)
		
		if fFlagBadgeVisibilitySettingEnabled then
			task.spawn(function() --[[ line: 555 ]]
				-- upvalues: robloxReplicatedStorageService (copy), self (copy), playersService (copy), makePlayerInfoRequestsModule (copy), t (ref)
				self._reskinProfileSettingsConn = robloxReplicatedStorageService:WaitForChild("SendPlayerProfileSettings", 1e999).OnClientEvent:Connect(function(p20) --[[ line: 558 ]]
					-- upvalues: playersService (copy), makePlayerInfoRequestsModule (copy), t (copy)
					local var81 = playersService:GetPlayerByUserId(tonumber(p20))
					
					if var81 then
						makePlayerInfoRequestsModule(var81)(t)
					end
				end)
			end)
		end
	end
	
	local function teardownPlayerInfoRequests() --[[ line: 568 ]]
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
	
	local function mountReskin() --[[ line: 592 ]]
		-- upvalues: coreGuiService (copy), reactRobloxModule (ref), buildReskinElement (ref), self (ref), status (ref), var65 (ref), computeMobilePosition (ref), setupPlayerInfoRequests (ref)
		local playerListReskin = Instance.new("ScreenGui")
		playerListReskin.Name = "PlayerListReskin"
		playerListReskin.AutoLocalize = false
		playerListReskin.IgnoreGuiInset = true
		playerListReskin.DisplayOrder = if _G.__TESTEZ_RUNNING_TEST__ == true then -1 else 1
		playerListReskin.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		playerListReskin.Parent = coreGuiService
		local var83 = reactRobloxModule.createRoot(playerListReskin)
		var83:render(buildReskinElement())
		self._reskinRoot = var83
		self._reskinScreenGui = playerListReskin
		
		if status then
			local function connectViewport(p21) --[[ line: 609 ]]
				-- upvalues: self (copy), var65 (copy), computeMobilePosition (copy)
				if self._reskinViewportConn then
					self._reskinViewportConn:Disconnect()
					self._reskinViewportConn = nil
				end
				if p21 then
					self._reskinViewportConn = p21:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ line: 615 ]]
						-- upvalues: var65 (copy), computeMobilePosition (copy)
						var65(computeMobilePosition())
					end)
					var65(computeMobilePosition())
				end
			end
			
			self._reskinCameraConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ line: 621 ]]
				-- upvalues: connectViewport (ref)
				connectViewport(workspace.CurrentCamera)
			end)
			connectViewport(workspace.CurrentCamera)
		end
		setupPlayerInfoRequests()
	end
	
	local function unmountReskin() --[[ line: 629 ]]
		-- upvalues: teardownPlayerInfoRequests (ref), self (ref)
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
	self._reskinCoreGuiConn = starterGuiService.CoreGuiChangedSignal:Connect(function(p22, p23) --[[ line: 675 ]]
		-- upvalues: self (ref)
		if p22 == Enum.CoreGuiType.All or p22 == Enum.CoreGuiType.PlayerList then
			self.coreGuiEnabled = p23
			self:SetTopBarEnabled(self.topBarEnabled)
		end
	end)
	contextActionService:BindCoreAction("RbxPlayerListToggle", function(_, p24, _) --[[ line: 682 ]]
		-- upvalues: self (ref), status (ref), guiService (copy)
		if not self.mounted then
			return Enum.ContextActionResult.Pass
		elseif status then
			return Enum.ContextActionResult.Pass
		elseif guiService.MenuIsOpen then
			return Enum.ContextActionResult.Pass
		elseif p24 == Enum.UserInputState.Begin then
			self:SetVisibility(not self:GetVisibility())
			
			return Enum.ContextActionResult.Sink
		end
		return Enum.ContextActionResult.Pass
	end, false, Enum.KeyCode.Tab)
	
	if fFlagTopBarSignalizeSetCores then
		self._reskinTopBarEffect = signalsModule.createEffect(function(p25) --[[ line: 700 ]]
			-- upvalues: inExperienceTopBarModule (copy), self (ref)
			local getTopBarStore = inExperienceTopBarModule.Stores.GetTopBarStore
			
			if getTopBarStore then
				self:SetTopBarEnabled(getTopBarStore(p25).getTopBarCoreGuiEnabled(p25))
			end
		end)
	end
	return self
end

function t:GetVisibility() --[[ line: 711 ]]
	-- upvalues: fFlagPlayerListReskin (ref), playerListVisibilityStore (ref)
	return if fFlagPlayerListReskin then playerListVisibilityStore.getEffectiveVisible(false) else self.store:getState().displayOptions.isVisible
end

if fFlagAddNewPlayerListFocusNav then
	function t:GetVisibilityChangedEvent() --[[ line: 719 ]]
		return self.VisibilityChangedEvent
	end
end
function t:GetSetVisible() --[[ line: 724 ]]
	-- upvalues: fFlagPlayerListReskin (ref), playerListVisibilityStore (ref)
	return if fFlagPlayerListReskin then playerListVisibilityStore.getVisible(false) else self.store:getState().displayOptions.setVisible
end

function t:GetSetVisibleChangedEvent() --[[ line: 731 ]]
	return self.SetVisibleChangedEvent
end

function t:SetVisibility(p26) --[[ line: 735 ]]
	-- upvalues: fFlagPlayerListReskin (ref), playerContextualMenuStore (ref), playerListVisibilityStore (ref), setPlayerListVisibilityModule (ref)
	if not fFlagPlayerListReskin then
		self.store:dispatch(setPlayerListVisibilityModule(p26))
		
		return
	elseif not p26 then
		playerContextualMenuStore.closeContextMenu()
	end
	playerListVisibilityStore.setVisible(p26)
end

function t:HideTemp(p27, p28) --[[ line: 746 ]]
	-- upvalues: fFlagPlayerListReskin (ref), playerContextualMenuStore (ref), playerListVisibilityStore (ref), setTempHideKeyModule (ref)
	if fFlagPlayerListReskin then
		if p28 and playerContextualMenuStore.getMenuData(false) ~= nil then
			playerContextualMenuStore.closeContextMenu()
		end
		playerListVisibilityStore.setTempHide(p27, p28)
		
		return
	elseif p28 == false then
		p28 = nil
	end
	self.store:dispatch(setTempHideKeyModule(p27, p28))
end

function t:SetTopBarEnabled(p29) --[[ line: 765 ]]
	-- upvalues: fFlagPlayerListReskin (ref), leaderboardStoreInstanceManager (ref)
	if not fFlagPlayerListReskin then
		self.topBarEnabled = p29
		self:_updateMounted()
		
		return
	end
	self.topBarEnabled = p29
	p29 = self.coreGuiEnabled and p29
	
	if p29 and not self.mounted then
		leaderboardStoreInstanceManager.createLeaderboardStoreInstance()
		self._reskin.setupVisibilityEffect()
		self._reskin.mountReskin()
		self.mounted = true
		
		return
	elseif not p29 and self.mounted then
		self._reskin.unmountReskin()
		leaderboardStoreInstanceManager.cleanUpInstance()
		self.mounted = false
	end
end

function t:SetMinimized(b) --[[ line: 785 ]]
	-- upvalues: fFlagPlayerListReskin (ref), setMinimizedModule (ref)
	if fFlagPlayerListReskin then
		return
	end
	self.store:dispatch(setMinimizedModule(b))
end

return t