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
local playerIconInfoStoreModule = require(corePackagesService.Workspace.Packages.PlayerIconInfoStore)
local constants_1 = playerListModule.Common.Constants
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
local fFlagPlayerListReskin = playerListModule.Flags.FFlagPlayerListReskin
local playerListContainer = playerListModule.Container.PlayerListContainer
local leaderboardStoreInstanceManager = playerListModule.LeaderboardStoreInstanceManager
local playerListVisibilityStore = playerListModule.PlayerListVisibilityStore
local playerContextualMenuStore = playerListModule.PlayerContextualMenuStore
local playerIconInfoStore = playerIconInfoStoreModule.PlayerIconInfoStore
local fFlagTopBarSignalizeSetCores = inExperienceTopBarModule.Flags.FFlagTopBarSignalizeSetCores

local function _() --[[ line: 76 | named "isUnderTestEZ" ]]
	return _G.__TESTEZ_RUNNING_TEST__ == true
end

local _ = function() --[[ line: 82 | named "resolveIsTenFoot" ]]
	-- upvalues: fFlagEnableMobilePlayerListOnConsole (ref), tenFootInterfaceModule (ref)
	return if fFlagEnableMobilePlayerListOnConsole then false else tenFootInterfaceModule:IsEnabled()
end

local _ = function() --[[ line: 88 | named "isTouchOrGamepadInput" ]]
	-- upvalues: userInputService (ref)
	return if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true
end

local _ = function() --[[ line: 94 | named "isLargeConsoleLayout" ]]
	-- upvalues: fFlagEnableMobilePlayerListOnConsole (ref), guiService (ref), userInputService (ref)
	return fFlagEnableMobilePlayerListOnConsole and (guiService.ViewportDisplaySize == Enum.DisplaySize.Large and (if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true))
end

local _ = function() --[[ line: 100 | named "isSmallTouchScreen" ]]
	-- upvalues: fFlagPlayerListUseMobileOnSmallDisplay (ref), guiService (ref), utilityModule (ref), fFlagEnableMobilePlayerListOnConsole (ref), userInputService (ref), fStringPlayerListOverrideTypeModule (ref)
	if _G.__TESTEZ_RUNNING_TEST__ == true then
		return false
	end
	local var37 = fFlagPlayerListUseMobileOnSmallDisplay and guiService.ViewportDisplaySize == Enum.DisplaySize.Small
	local var38 = utilityModule:IsSmallTouchScreen()
	
	if not var38 then
		var38 = fFlagEnableMobilePlayerListOnConsole and (guiService.ViewportDisplaySize == Enum.DisplaySize.Large and (if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true))
		
		if not var38 and var37 then
			var38 = if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true
			var38 = var38 or fStringPlayerListOverrideTypeModule == "mobile"
		end
	end
	return var38
end

local function setupSettings(value) --[[ line: 112 ]]
	-- upvalues: setSettingsModule (ref), userGameSettingsService (ref)
	local function _() --[[ line: 113 | named "updateSettings" ]]
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
	userGameSettingsService:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() --[[ line: 122 ]]
		-- upvalues: value (ref), setSettingsModule (copy), userGameSettingsService (copy)
		value:dispatch(setSettingsModule({
			reducedMotion = userGameSettingsService.ReducedMotion,
			preferredTransparency = userGameSettingsService.PreferredTransparency
		}))
	end)
	userGameSettingsService:GetPropertyChangedSignal("ReducedMotion"):Connect(function() --[[ line: 125 ]]
		-- upvalues: value (ref), setSettingsModule (copy), userGameSettingsService (copy)
		value:dispatch(setSettingsModule({
			reducedMotion = userGameSettingsService.ReducedMotion,
			preferredTransparency = userGameSettingsService.PreferredTransparency
		}))
	end)
end

local t = {}
t.__index = t

function t.new() --[[ line: 133 ]]
	-- upvalues: t (ref), fFlagPlayerListReskin (ref), globalConfigModule (ref), roactModule (ref), roduxModule (ref), reducerModule (ref), setupSettings (ref), starterGuiService (ref), setPlayerListEnabledModule (ref), setSmallTouchDeviceModule (ref), fFlagPlayerListUseMobileOnSmallDisplay (ref), guiService (ref), utilityModule (ref), fFlagEnableMobilePlayerListOnConsole (ref), userInputService (ref), fStringPlayerListOverrideTypeModule (ref), setTenFootInterfaceModule (ref), tenFootInterfaceModule (ref), setSubjectToChinaPoliciesModule (ref), cachedPolicyServiceModule (ref), constants (ref), roactRoduxModule (ref), playerListSwitcherModule (ref), apolloProvider (ref), apolloClientModule (ref), setIsUsingGamepadModule (ref), leaderboardStoreInstanceManager (ref), fFlagReplacePlayerIconRoduxWithSignal (ref), playerIconInfoStore (ref), playerListContainer (ref), robloxGui (ref), coreGuiService (ref), fFlagAddNewPlayerListFocusNav (ref), fFlagTopBarSignalizeSetCores (ref), signalsModule (ref), inExperienceTopBarModule (ref)
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
	coroutine.wrap(function() --[[ line: 163 ]]
		-- upvalues: tbl (ref), setSmallTouchDeviceModule (copy), fFlagPlayerListUseMobileOnSmallDisplay (copy), guiService (copy), utilityModule (copy), fFlagEnableMobilePlayerListOnConsole (copy), userInputService (copy), fStringPlayerListOverrideTypeModule (copy)
		local var41
		local store = tbl.store
		
		if _G.__TESTEZ_RUNNING_TEST__ == true then
			var41 = false
		else
			local var40 = fFlagPlayerListUseMobileOnSmallDisplay and guiService.ViewportDisplaySize == Enum.DisplaySize.Small
			var41 = utilityModule:IsSmallTouchScreen()
			
			if not var41 then
				var41 = fFlagEnableMobilePlayerListOnConsole and (guiService.ViewportDisplaySize == Enum.DisplaySize.Large and (if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true))
				
				if not var41 and var40 then
					var41 = if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true
					var41 = var41 or fStringPlayerListOverrideTypeModule == "mobile"
				end
			end
		end
		store:dispatch(setSmallTouchDeviceModule(var41))
	end)()
	tbl.store:dispatch(setTenFootInterfaceModule(if fFlagEnableMobilePlayerListOnConsole then false else tenFootInterfaceModule:IsEnabled()))
	coroutine.wrap(function() --[[ line: 169 ]]
		-- upvalues: tbl (ref), setSubjectToChinaPoliciesModule (copy), cachedPolicyServiceModule (copy)
		tbl.store:dispatch(setSubjectToChinaPoliciesModule(cachedPolicyServiceModule:IsSubjectToChinaPolicies()))
	end)()
	tbl:_trackEnabled()
	tbl.root = roactModule.createElement(roactRoduxModule.StoreProvider, { store = tbl.store }, {
		Switcher = roactModule.createElement(playerListSwitcherModule, {
			appStyleForUiModeStyleProvider = {
				themeName = constants.ThemeName.Dark,
				fontName = constants.FontName.Gotham
			},
			setLayerCollectorEnabled = function(value) --[[ line: 185 ]]
				-- upvalues: tbl (ref)
				if tbl.layerCollectorRef.current then
					tbl.layerCollectorRef.current.Enabled = value
					
					return
				end
			end
		})
	})
	tbl.root = roactModule.createElement(apolloProvider, { client = apolloClientModule }, { StoreProvider = tbl.root })
	
	function tbl._setIsUsingGamepad() --[[ line: 199 ]]
		-- upvalues: userInputService (copy), tbl (ref), setIsUsingGamepadModule (copy)
		local lastInputType = userInputService:GetLastInputType()
		tbl.store:dispatch(setIsUsingGamepadModule((lastInputType and lastInputType.Name:find("Gamepad")) ~= nil))
	end
	
	function tbl._mountLeaderboardStore() --[[ line: 205 ]]
		-- upvalues: leaderboardStoreInstanceManager (copy)
		leaderboardStoreInstanceManager.createLeaderboardStoreInstance()
	end
	
	function tbl._unmountLeaderboardStore() --[[ line: 209 ]]
		-- upvalues: leaderboardStoreInstanceManager (copy)
		leaderboardStoreInstanceManager.cleanUpInstance()
	end
	
	tbl._unmountPlayerIconInfoStore = if fFlagReplacePlayerIconRoduxWithSignal then function() --[[ line: 214 ]]
		-- upvalues: playerIconInfoStore (copy)
		playerIconInfoStore.cleanUp()
	end else nil
	tbl._mountLeaderboardStore()
	tbl._setIsUsingGamepad()
	tbl.root = roactModule.createElement(playerListContainer, {
		leaderboardStore = leaderboardStoreInstanceManager.getLeaderboardStoreInstance,
		TopBarConstants = require(robloxGui.Modules.TopBar.Constants),
		isTenFoot = if fFlagEnableMobilePlayerListOnConsole then false else tenFootInterfaceModule:IsEnabled()
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
		tbl.disposeEffect = signalsModule.createEffect(function(p0) --[[ line: 252 ]]
			-- upvalues: inExperienceTopBarModule (copy), tbl (ref)
			local getTopBarStore = inExperienceTopBarModule.Stores.GetTopBarStore
			
			if getTopBarStore then
				tbl:SetTopBarEnabled(getTopBarStore(p0).getTopBarCoreGuiEnabled(p0))
			end
		end)
	end
	tbl.store.changed:connect(function(p1, p2) --[[ line: 260 ]]
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

function t:_updateMounted() --[[ line: 274 ]]
	-- upvalues: fFlagEnableMobilePlayerListOnConsole (ref), tenFootInterfaceModule (ref), roactModule (ref), coreGuiService (ref)
	if not (if fFlagEnableMobilePlayerListOnConsole then false else tenFootInterfaceModule:IsEnabled()) then
		local topBarEnabled = self.coreGuiEnabled and self.topBarEnabled
		
		if topBarEnabled and not self.mounted then
			self._mountLeaderboardStore()
			self._setIsUsingGamepad()
			self.element = roactModule.mount(self.root, coreGuiService, "PlayerList")
			self.mounted = true
			
			return
		elseif not topBarEnabled and self.mounted then
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

function t._trackEnabled(p3) --[[ line: 297 ]]
	-- upvalues: starterGuiService (ref), setPlayerListEnabledModule (ref), fFlagPlayerListIgnoreDevGamepadBindings (ref), guiService (ref), constants_1 (ref)
	starterGuiService.CoreGuiChangedSignal:Connect(function(p4, p5) --[[ line: 298 ]]
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
	function t:GetIsModal() --[[ line: 313 ]]
		-- upvalues: fFlagPlayerListReskin (ref), fFlagPlayerListUseMobileOnSmallDisplay (ref), guiService (ref), utilityModule (ref), fFlagEnableMobilePlayerListOnConsole (ref), userInputService (ref), fStringPlayerListOverrideTypeModule (ref)
		if not fFlagPlayerListReskin then
			return self.store:getState().displayOptions.isSmallTouchDevice
		elseif _G.__TESTEZ_RUNNING_TEST__ == true then
			return false
		end
		local var44 = fFlagPlayerListUseMobileOnSmallDisplay and guiService.ViewportDisplaySize == Enum.DisplaySize.Small
		local var45 = utilityModule:IsSmallTouchScreen()
		
		if not var45 then
			var45 = fFlagEnableMobilePlayerListOnConsole and (guiService.ViewportDisplaySize == Enum.DisplaySize.Large and (if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true))
			
			if not var45 and var44 then
				var45 = if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true
				var45 = var45 or fStringPlayerListOverrideTypeModule == "mobile"
			end
		end
		return var45
	end
end
function t:_setupReskin() --[[ line: 322 ]]
	-- upvalues: corePackagesService (ref), robloxGui (ref), playerListModule (ref), parent (ref), fFlagEnableMobilePlayerListOnConsole (ref), tenFootInterfaceModule (ref), fFlagPlayerListUseMobileOnSmallDisplay (ref), guiService (ref), utilityModule (ref), userInputService (ref), fStringPlayerListOverrideTypeModule (ref), playerContextualMenuStore (ref), playerListVisibilityStore (ref), signalsModule (ref), userGameSettingsService (ref), playerListContainer (ref), leaderboardStoreInstanceManager (ref), playersService (ref), makePlayerInfoRequestsModule (ref), playerIconInfoStore (ref), fFlagBadgeVisibilitySettingEnabled (ref), robloxReplicatedStorageService (ref), coreGuiService (ref), starterGuiService (ref), contextActionService (ref), fFlagTopBarSignalizeSetCores (ref), inExperienceTopBarModule (ref)
	local reactModule = require(corePackagesService.Packages.React)
	local reactRobloxModule = require(corePackagesService.Packages.ReactRoblox)
	local constantsModule = require(robloxGui.Modules.TopBar.Constants)
	local foundationModule = require(corePackagesService.Packages.Foundation)
	local foundationProvider = foundationModule.FoundationProvider
	local theme = foundationModule.Enums.Theme
	local device = foundationModule.Enums.Device
	local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
	local playerListPanel = playerListModule.Presentation.PlayerListPanel
	local playerContextualMenuView = playerListModule.Presentation.PlayerContextualMenuView
	local leaderboardScrim = playerListModule.Presentation.LeaderboardScrim
	local contextMenuControllerModule = require(parent.ContextMenuController)
	
	local function _(p6, p7) --[[ line: 337 | named "translate" ]]
		-- upvalues: robloxTranslatorModule (ref)
		local ok, status = pcall(function() --[[ line: 338 ]]
			-- upvalues: robloxTranslatorModule (copy), p6 (ref)
			return robloxTranslatorModule:FormatByKey(p6)
		end)
		
		return if ok and status and status ~= "" then status else p7
	end
	
	local var52 = "InGame.PlayerList.Leaderboard"
	local ok, status = pcall(function() --[[ line: 338 ]]
		-- upvalues: robloxTranslatorModule (ref), var52 (ref)
		return robloxTranslatorModule:FormatByKey(var52)
	end)
	local var53 = if ok and status and status ~= "" then status else "Leaderboard"
	ok = if fFlagEnableMobilePlayerListOnConsole then false else tenFootInterfaceModule:IsEnabled()
	
	if _G.__TESTEZ_RUNNING_TEST__ == true then
		status = false
	else
		local var54 = fFlagPlayerListUseMobileOnSmallDisplay and guiService.ViewportDisplaySize == Enum.DisplaySize.Small
		status = utilityModule:IsSmallTouchScreen()
		
		if not status then
			local var55
			status = fFlagEnableMobilePlayerListOnConsole and (guiService.ViewportDisplaySize == Enum.DisplaySize.Large and (if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true))
			
			if not status and var54 then
				status = if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true
				status = status or fStringPlayerListOverrideTypeModule == "mobile"
			end
		end
	end
	if not tenFootInterfaceModule:IsEnabled() then
		var55 = if fFlagEnableMobilePlayerListOnConsole and (guiService.ViewportDisplaySize == Enum.DisplaySize.Large and (if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then userInputService.PreferredInput == Enum.PreferredInput.Gamepad else true)) then device.Console else device.Unknown
	end
	if status then
		playerContextualMenuStore.setOnDismiss(function() --[[ line: 360 ]]
			-- upvalues: playerListVisibilityStore (copy)
			playerListVisibilityStore.setVisible(true)
		end)
	end
	playerContextualMenuStore.setContextMenuOpener(function(p8, p9, p10) --[[ line: 365 ]]
		-- upvalues: contextMenuControllerModule (ref), playerContextualMenuStore (copy), status (ref), playerListVisibilityStore (copy)
		task.spawn(function() --[[ line: 366 ]]
			-- upvalues: contextMenuControllerModule (copy), p8 (ref), playerContextualMenuStore (copy), status (copy), p9 (ref), p10 (ref), playerListVisibilityStore (copy)
			local var62 = contextMenuControllerModule.buildMenuData(p8, playerContextualMenuStore.closeContextMenu, status)
			
			if p8.Parent == nil then return end
			var62.anchorPosition = p9
			
			if playerContextualMenuStore.setMenuDataIfCurrent(var62, p10) and status then
				playerListVisibilityStore.setVisible(false)
			end
		end)
	end)
	local playerListInitialVisibleStateModule = require(parent.PlayerListInitialVisibleState)
	playerListVisibilityStore.reset()
	playerListVisibilityStore.setVisible(playerListInitialVisibleStateModule())
	self.SetVisibleChangedEvent = Instance.new("BindableEvent")
	self.VisibilityChangedEvent = Instance.new("BindableEvent")
	
	local function setupVisibilityEffect() --[[ line: 393 ]]
		-- upvalues: self (ref), signalsModule (copy), playerListVisibilityStore (copy)
		local var63 = false
		self._reskinSetVisibleEffect = signalsModule.createEffect(function(p11) --[[ line: 395 ]]
			-- upvalues: playerListVisibilityStore (copy), var63 (write), self (copy)
			local visible = playerListVisibilityStore.getVisible(p11)
			
			if var63 then
				self.SetVisibleChangedEvent:Fire(visible)
				
				return
			end
			var63 = true
		end)
		local var64 = false
		self._reskinVisibilityEffect = signalsModule.createEffect(function(p12) --[[ line: 405 ]]
			-- upvalues: playerListVisibilityStore (copy), var64 (write), self (copy)
			local effectiveVisible = playerListVisibilityStore.getEffectiveVisible(p12)
			
			if var64 then
				self.VisibilityChangedEvent:Fire(effectiveVisible)
				
				return
			end
			var64 = true
		end)
	end
	
	local topBarHeight = constantsModule.TopBarHeight
	local var58 = reactModule.createElement(foundationProvider, {
		theme = theme.Dark,
		device = var55,
		preferences = {
			preferredTransparency = userGameSettingsService.PreferredTransparency
		}
	}, {
		Scrim = reactModule.createElement(leaderboardScrim, { isSmallTouchDevice = status }),
		Container = reactModule.createElement(foundationModule.View, (function() --[[ line: 418 | named "resolveContainerProps" ]]
			-- upvalues: status (ref), constantsModule (ref), topBarHeight (ref)
			if not status then
				return {
					tag = "auto-xy",
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.new(1, -4, 0, 4 + topBarHeight),
					Size = UDim2.fromOffset(0, 0)
				}
			end
			local currentCamera = workspace.CurrentCamera
			local var67 = if currentCamera then currentCamera.ViewportSize else Vector2.new(0, 0)
			
			return if var67.X < var67.Y then {
				tag = "auto-xy",
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, constantsModule.ApplyDisplayScale(constantsModule.ScreenSideOffset), 0.5, topBarHeight / 2),
				Size = UDim2.fromOffset(0, 0)
			} else {
				tag = "auto-xy",
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, topBarHeight / 2),
				Size = UDim2.fromOffset(0, 0)
			}
		end)(), {
			ReskinContainer = reactModule.createElement(playerListContainer, {
				leaderboardStore = leaderboardStoreInstanceManager.getLeaderboardStoreInstance,
				TopBarConstants = constantsModule,
				isTenFoot = ok
			}, {
				PlayerListPanel = reactModule.createElement(playerListPanel, { isSmallTouchDevice = status, title = var53 })
			})
		}),
		ContextMenu = reactModule.createElement(playerContextualMenuView, { isSmallTouchDevice = status })
	})
	
	local function setupPlayerInfoRequests() --[[ line: 488 ]]
		-- upvalues: playersService (copy), makePlayerInfoRequestsModule (copy), self (ref), playerIconInfoStore (copy), fFlagBadgeVisibilitySettingEnabled (copy), robloxReplicatedStorageService (copy)
		local t = {
			getState = function() --[[ line: 490 ]]
				-- upvalues: playersService (copy)
				return { players = playersService:GetPlayers() }
			end,
			dispatch = function() --[[ line: 493 ]] end
		}
		
		local function request(p13) --[[ line: 495 ]]
			-- upvalues: makePlayerInfoRequestsModule (copy), t (ref)
			makePlayerInfoRequestsModule(p13)(t)
		end
		
		for i, v in ipairs(playersService:GetPlayers()) do
			makePlayerInfoRequestsModule(v)(t)
		end
		self._reskinPlayerAddedConn = playersService.PlayerAdded:Connect(request)
		self._reskinPlayerRemovingConn = playersService.PlayerRemoving:Connect(function(p14) --[[ line: 502 ]]
			-- upvalues: playerIconInfoStore (copy)
			playerIconInfoStore.removePlayer(p14.UserId)
		end)
		
		if fFlagBadgeVisibilitySettingEnabled then
			task.spawn(function() --[[ line: 506 ]]
				-- upvalues: robloxReplicatedStorageService (copy), self (copy), playersService (copy), makePlayerInfoRequestsModule (copy), t (ref)
				self._reskinProfileSettingsConn = robloxReplicatedStorageService:WaitForChild("SendPlayerProfileSettings", 1e999).OnClientEvent:Connect(function(p15) --[[ line: 509 ]]
					-- upvalues: playersService (copy), makePlayerInfoRequestsModule (copy), t (copy)
					local var70 = playersService:GetPlayerByUserId(tonumber(p15))
					
					if var70 then
						makePlayerInfoRequestsModule(var70)(t)
					end
				end)
			end)
		end
	end
	
	local _ = function() --[[ line: 519 | named "teardownPlayerInfoRequests" ]]
		-- upvalues: self (ref)
		if self._reskinPlayerAddedConn then
			self._reskinPlayerAddedConn:Disconnect()
			self._reskinPlayerAddedConn = nil
		end
		if self._reskinPlayerRemovingConn then
			self._reskinPlayerRemovingConn:Disconnect()
			self._reskinPlayerRemovingConn = nil
		end
		if self._reskinProfileSettingsConn then
			self._reskinProfileSettingsConn:Disconnect()
			self._reskinProfileSettingsConn = nil
		end
	end
	
	local function mountReskin() --[[ line: 534 ]]
		-- upvalues: coreGuiService (copy), reactRobloxModule (ref), var58 (ref), self (ref), setupPlayerInfoRequests (ref)
		local playerListReskin = Instance.new("ScreenGui")
		playerListReskin.Name = "PlayerListReskin"
		playerListReskin.AutoLocalize = false
		playerListReskin.IgnoreGuiInset = true
		playerListReskin.DisplayOrder = if _G.__TESTEZ_RUNNING_TEST__ == true then -1 else 1
		playerListReskin.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		playerListReskin.Parent = coreGuiService
		local var72 = reactRobloxModule.createRoot(playerListReskin)
		var72:render(var58)
		self._reskinRoot = var72
		self._reskinScreenGui = playerListReskin
		setupPlayerInfoRequests()
	end
	
	local function unmountReskin() --[[ line: 553 ]]
		-- upvalues: self (ref)
		if self._reskinPlayerAddedConn then
			self._reskinPlayerAddedConn:Disconnect()
			self._reskinPlayerAddedConn = nil
		end
		if self._reskinPlayerRemovingConn then
			self._reskinPlayerRemovingConn:Disconnect()
			self._reskinPlayerRemovingConn = nil
		end
		if self._reskinProfileSettingsConn then
			self._reskinProfileSettingsConn:Disconnect()
			self._reskinProfileSettingsConn = nil
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
	self._reskinCoreGuiConn = starterGuiService.CoreGuiChangedSignal:Connect(function(p16, p17) --[[ line: 591 ]]
		-- upvalues: self (ref)
		if p16 == Enum.CoreGuiType.All or p16 == Enum.CoreGuiType.PlayerList then
			self.coreGuiEnabled = p17
			self:SetTopBarEnabled(self.topBarEnabled)
		end
	end)
	contextActionService:BindCoreAction("RbxPlayerListToggle", function(_, p18, _) --[[ line: 598 ]]
		-- upvalues: self (ref), status (ref), guiService (copy)
		if not self.mounted then
			return Enum.ContextActionResult.Pass
		elseif status then
			return Enum.ContextActionResult.Pass
		elseif guiService.MenuIsOpen then
			return Enum.ContextActionResult.Pass
		elseif p18 == Enum.UserInputState.Begin then
			self:SetVisibility(not self:GetVisibility())
			
			return Enum.ContextActionResult.Sink
		end
		return Enum.ContextActionResult.Pass
	end, false, Enum.KeyCode.Tab)
	
	if fFlagTopBarSignalizeSetCores then
		self._reskinTopBarEffect = signalsModule.createEffect(function(p19) --[[ line: 616 ]]
			-- upvalues: inExperienceTopBarModule (copy), self (ref)
			local getTopBarStore = inExperienceTopBarModule.Stores.GetTopBarStore
			
			if getTopBarStore then
				self:SetTopBarEnabled(getTopBarStore(p19).getTopBarCoreGuiEnabled(p19))
			end
		end)
	end
	return self
end

function t:GetVisibility() --[[ line: 627 ]]
	-- upvalues: fFlagPlayerListReskin (ref), playerListVisibilityStore (ref)
	return if fFlagPlayerListReskin then playerListVisibilityStore.getEffectiveVisible(false) else self.store:getState().displayOptions.isVisible
end

if fFlagAddNewPlayerListFocusNav then
	function t:GetVisibilityChangedEvent() --[[ line: 635 ]]
		return self.VisibilityChangedEvent
	end
end
function t:GetSetVisible() --[[ line: 640 ]]
	-- upvalues: fFlagPlayerListReskin (ref), playerListVisibilityStore (ref)
	return if fFlagPlayerListReskin then playerListVisibilityStore.getVisible(false) else self.store:getState().displayOptions.setVisible
end

function t:GetSetVisibleChangedEvent() --[[ line: 647 ]]
	return self.SetVisibleChangedEvent
end

function t:SetVisibility(p20) --[[ line: 651 ]]
	-- upvalues: fFlagPlayerListReskin (ref), playerContextualMenuStore (ref), playerListVisibilityStore (ref), setPlayerListVisibilityModule (ref)
	if not fFlagPlayerListReskin then
		self.store:dispatch(setPlayerListVisibilityModule(p20))
		
		return
	elseif not p20 then
		playerContextualMenuStore.closeContextMenu()
	end
	playerListVisibilityStore.setVisible(p20)
end

function t:HideTemp(p21, p22) --[[ line: 662 ]]
	-- upvalues: fFlagPlayerListReskin (ref), playerContextualMenuStore (ref), playerListVisibilityStore (ref), setTempHideKeyModule (ref)
	if fFlagPlayerListReskin then
		if p22 and playerContextualMenuStore.getMenuData(false) ~= nil then
			playerContextualMenuStore.closeContextMenu()
		end
		playerListVisibilityStore.setTempHide(p21, p22)
		
		return
	elseif p22 == false then
		p22 = nil
	end
	self.store:dispatch(setTempHideKeyModule(p21, p22))
end

function t:SetTopBarEnabled(p23) --[[ line: 681 ]]
	-- upvalues: fFlagPlayerListReskin (ref), leaderboardStoreInstanceManager (ref)
	if not fFlagPlayerListReskin then
		self.topBarEnabled = p23
		self:_updateMounted()
		
		return
	end
	self.topBarEnabled = p23
	p23 = self.coreGuiEnabled and p23
	
	if p23 and not self.mounted then
		leaderboardStoreInstanceManager.createLeaderboardStoreInstance()
		self._reskin.setupVisibilityEffect()
		self._reskin.mountReskin()
		self.mounted = true
		
		return
	elseif not p23 and self.mounted then
		self._reskin.unmountReskin()
		leaderboardStoreInstanceManager.cleanUpInstance()
		self.mounted = false
	end
end

function t:SetMinimized(b) --[[ line: 701 ]]
	-- upvalues: fFlagPlayerListReskin (ref), setMinimizedModule (ref)
	if fFlagPlayerListReskin then
		return
	end
	self.store:dispatch(setMinimizedModule(b))
end

return t