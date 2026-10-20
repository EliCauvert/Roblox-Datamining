local ChromeShared = script:FindFirstAncestor("ChromeShared")
local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local UserInputService = game:GetService("UserInputService")
local GamepadService = game:GetService("GamepadService")
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local ChromeModule = require(CorePackages.Workspace.Packages.Chrome)
local SideSheetPlacement = ChromeModule.Enums.SideSheetPlacement
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local FocusUtils = ChromeModule.FocusUtils
local FocusOnChromeSignal = FocusUtils.FocusOnChromeSignal
local FocusOffChromeSignal = FocusUtils.FocusOffChromeSignal
local ChromeUtilsModule = require(ChromeShared.Service.ChromeUtils)
local LocalStoreModule = require(ChromeShared.Service.LocalStore)
local ViewportUtilModule = require(ChromeShared.Service.ViewportUtil)
local WindowSizeSignalModule = require(ChromeShared.Service.WindowSizeSignal)
local ObservableValue = ChromeUtilsModule.ObservableValue
local NotifySignal = ChromeUtilsModule.NotifySignal
local AvailabilitySignal = ChromeUtilsModule.AvailabilitySignal
local ConstantsModule = require(ChromeShared.Unibar.Constants)
local ShortcutServiceModule = require(ChromeShared.Service.ShortcutService)
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local IsPioneerLaunchFunction = require(CorePackages.Workspace.Packages.PioneerUtils).isPioneerLaunch
local FFlagIntegrationsChromeShortcutTelemetryModule = require(ChromeShared.Parent.Flags.FFlagIntegrationsChromeShortcutTelemetry)
local ChromeDeprecateMRUs = game:DefineFastFlag("ChromeDeprecateMRUs", false)
local IsSideSheetEnabledModule = require(CorePackages.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local FFlagEnableSideSheetWidgets = SharedFlagsModule.FFlagEnableSideSheetWidgets
local FFlagEnableChromeWindowsNotInMenu = require(ChromeShared.Flags).FFlagEnableChromeWindowsNotInMenu
local FFlagChromeNineDotActivityIndicator = require(ChromeShared.Flags).FFlagChromeNineDotActivityIndicator
local ToggleSideSheetFunction = nil
local GetSideSheetVisibilityFunction = nil
local RegisterSideSheetIntegrationsFunction = nil
local InExperienceSideSheetModule = require(CorePackages.Workspace.Packages.InExperienceSideSheet)
ToggleSideSheetFunction = InExperienceSideSheetModule.toggleSideSheet
GetSideSheetVisibilityFunction = InExperienceSideSheetModule.getSideSheetVisibility
RegisterSideSheetIntegrationsFunction = InExperienceSideSheetModule.registerSideSheetIntegrations
local ChromeService = {}
ChromeService.__index = ChromeService
ChromeService.AvailabilitySignal = ChromeUtilsModule.AvailabilitySignalState
ChromeService.IntegrationStatus = { None = 0, Icon = 1, Window = 2 }

function noop() end

local Integration = {
	id = "div",
	label = "div",
	hideNotificationCountWhileOpen = false,
	initialAvailability = ChromeService.AvailabilitySignal.Unavailable,
	availability = AvailabilitySignal.new(ChromeService.AvailabilitySignal.Unavailable),
	notification = NotifySignal.new(),
	components = {},
	sideSheetPlacement = if IsSideSheetEnabledModule then SideSheetPlacement.None else nil
}

function createUnibarLayoutInfo(p1, p2): Rect
	return Rect.new(p1, p1 + p2)
end

function ChromeService.new()
	-- upvalues: LocalizationService (copy), FFlagEnableConsoleExpControls (copy), ShortcutServiceModule (copy), ChromeUtilsModule (copy), ObservableValue (copy), NotifySignal (copy), Localization (copy), FFlagChromeNineDotActivityIndicator (copy), Signal (copy), IsInExperienceUIVREnabled (copy), ChromeService (copy), ViewportUtilModule (copy), ChromeDeprecateMRUs (copy), FocusOnChromeSignal (copy), FocusOffChromeSignal (copy)
	local config = {
		_shortcutService = if FFlagEnableConsoleExpControls then ShortcutServiceModule.new() else nil,
		_layout = ChromeUtilsModule.ObservableValue.new(createUnibarLayoutInfo(Vector2.zero, Vector2.zero)),
		_menuAbsolutePosition = Vector2.zero,
		_menuAbsoluteSizeOpen = Vector2.zero,
		_currentSubMenu = ChromeUtilsModule.ObservableValue.new(nil),
		_selectedItem = ChromeUtilsModule.ObservableValue.new(nil),
		_selectedItemIdx = 0,
		_integrations = {},
		_integrationsConnections = {},
		_integrationsStatus = {},
		_menuConfig = {},
		_subMenuConfig = {},
		_subMenuNotifications = {},
		_menuList = ObservableValue.new({}),
		_windowList = ObservableValue.new({}),
		_dragConnection = {},
		_windowPositions = ObservableValue.new({}),
		_totalNotifications = NotifySignal.new(true),
		_mostRecentlyUsedAndPinnedLimit = -1,
		_localization = Localization.new(LocalizationService.RobloxLocaleId),
		_localizedLabelKeys = {},
		_currentShortcutBar = ObservableValue.new(nil),
		_notificationIndicator = ObservableValue.new(nil),
		_nineDotActivityIndicatorVisible = if FFlagChromeNineDotActivityIndicator then ObservableValue.new(false) else nil,
		_nineDotActivityIndicatorKeys = if FFlagChromeNineDotActivityIndicator then {} else nil,
		_orderAlignment = ObservableValue.new(Enum.HorizontalAlignment.Left),
		_onIntegrationRegistered = Signal.new(),
		_onIntegrationActivated = Signal.new(),
		_onIntegrationStatusChanged = Signal.new(),
		_onIntegrationHovered = Signal.new(),
		_triggerMenuIcon = Signal.new(),
		_triggerVRToggleButton = if IsInExperienceUIVREnabled then Signal.new() else nil,
		_topBarVisibility = if IsInExperienceUIVREnabled then ObservableValue.new(nil) else nil,
		_inFocusNav = ObservableValue.new(false)
	}
	local self = setmetatable(config, ChromeService)
	ViewportUtilModule.viewport:connect(function(p1)
		-- upvalues: ChromeDeprecateMRUs (upval), self (copy)
		if ChromeDeprecateMRUs then
			self:updateWindowSizeSignals()
			
			return
		else
			self:updateScreenSize(p1.size, p1.isMobileDevice, p1.portraitOrientation, p1.tinyPortrait)
		end
	end, true)
	
	if FFlagEnableConsoleExpControls then
		config._shortcutService.onShortcutBarChanged:connect(function(p1)
			-- upvalues: self (copy)
			self._currentShortcutBar:set(p1)
		end)
	end
	if FFlagChromeNineDotActivityIndicator then
		config._currentSubMenu:connect(function()
			-- upvalues: self (copy)
			self:updateNineDotActivityIndicatorVisible()
		end)
	end
	FocusOnChromeSignal:connect(function(p1)
		-- upvalues: config (copy), self (copy)
		if p1 and not config._subMenuConfig.nine_dot[p1] then
			self:setSelected(p1)
		end
		self:enableFocusNav()
	end)
	FocusOffChromeSignal:connect(function()
		-- upvalues: self (copy), FFlagEnableConsoleExpControls (upval)
		self:disableFocusNav()
		
		if FFlagEnableConsoleExpControls then
			self:setShortcutBar(nil)
		end
	end)
	
	return self
end

function ChromeService:storeChromeInteracted()
	-- upvalues: LocalStoreModule (copy)
	if LocalStoreModule.isEnabled() then
		LocalStoreModule.storeForLocalPlayer("ChromeInteracted3", true)
	end
end

function ChromeService:updateScreenSize(_, IsMobileDevice, PortraitOrientation, TinyPortrait)
	-- upvalues: ConstantsModule (copy)
	local MOBILETINYPORTRAITSLOTSDelta = if IsMobileDevice then if TinyPortrait then ConstantsModule.MOBILE_TINY_PORTRAIT_SLOTS - ConstantsModule.CORE_SLOTS elseif PortraitOrientation then ConstantsModule.MOBILE_PORTRAIT_SLOTS - ConstantsModule.CORE_SLOTS else ConstantsModule.MOBILE_LANDSCAPE_SLOTS - ConstantsModule.CORE_SLOTS else ConstantsModule.NON_MOBILE_SLOTS - ConstantsModule.CORE_SLOTS
	
	if MOBILETINYPORTRAITSLOTSDelta ~= self._mostRecentlyUsedAndPinnedLimit then
		self._mostRecentlyUsedAndPinnedLimit = MOBILETINYPORTRAITSLOTSDelta
		self:updateMenuList()
		self:updateNotificationTotals()
	end
	self:updateWindowSizeSignals()
end

function ChromeService.updateWindowSizeSignals(p1)
	for _, integration in p1._integrations do
		if integration.windowSize then
			integration.windowSize:updateConstraints()
		end
	end
end

function ChromeService:notificationIndicator()
	return self._notificationIndicator
end

function ChromeService:nineDotActivityIndicatorVisible()
	return self._nineDotActivityIndicatorVisible
end

function ChromeService:setNineDotActivityIndicatorVisible(p2, p3)
	self._nineDotActivityIndicatorKeys[p2] = if p3 then true else nil
	self:updateNineDotActivityIndicatorVisible()
end

function ChromeService:updateNineDotActivityIndicatorVisible()
	self._nineDotActivityIndicatorVisible:set(self._currentSubMenu:get() ~= "nine_dot" and next(self._nineDotActivityIndicatorKeys) ~= nil)
end

function ChromeService:toggleSubMenu(GetResult)
	-- upvalues: IsSideSheetEnabledModule (copy), ToggleSideSheetFunction (ref)
	if IsSideSheetEnabledModule and ToggleSideSheetFunction then
		ToggleSideSheetFunction(true)
		
		return
	end
	if not self._subMenuConfig[GetResult] then
		warn("Not a valid subMenuId:" .. GetResult)
		
		return
	end
	if self._currentSubMenu:get() == GetResult then
		self._currentSubMenu:set(nil)
		
		return
	else
		self._currentSubMenu:set(GetResult)
	end
end

function ChromeService:currentSubMenu()
	return self._currentSubMenu
end

function ChromeService:inFocusNav()
	return self._inFocusNav
end

function ChromeService:enableFocusNav()
	-- upvalues: GamepadService (copy), FFlagEnableConsoleExpControls (copy), ConstantsModule (copy)
	if GamepadService.GamepadCursorEnabled then return end
	if not self._inFocusNav:get() then
		self._inFocusNav:set(true)
	end
	if FFlagEnableConsoleExpControls then
		self:setShortcutBar(ConstantsModule.UNIBAR_SHORTCUTBAR_ID)
	end
end

function ChromeService:disableFocusNav()
	-- upvalues: GamepadService (copy)
	if GamepadService.GamepadCursorEnabled then return end
	if self._inFocusNav:get() then
		self._inFocusNav:set(false)
		self._selectedItem:set(nil)
		self._currentSubMenu:set(nil)
	end
end

function ChromeService:toggleWindow(Key)
	-- upvalues: ChromeService (copy), LocalStoreModule (copy)
	if self._integrations[Key].components.Window then
		if self._integrationsStatus[Key] and self._integrationsStatus[Key] ~= ChromeService.IntegrationStatus.None and self._integrationsStatus[Key] ~= ChromeService.IntegrationStatus.Icon then
			self._integrationsStatus[Key] = ChromeService.IntegrationStatus.Icon
		else
			self._integrationsStatus[Key] = ChromeService.IntegrationStatus.Window
		end
		self._onIntegrationStatusChanged:fire(Key, self._integrationsStatus[Key])
	end
	if LocalStoreModule.isEnabled() and self._integrations[Key] and self._integrations[Key].persistWindowState then
		local ChromeWindowStatus = LocalStoreModule.loadForLocalPlayer("ChromeWindowStatus") or {}
		ChromeWindowStatus[Key] = self._integrationsStatus[Key] == ChromeService.IntegrationStatus.Window
		LocalStoreModule.storeForLocalPlayer("ChromeWindowStatus", ChromeWindowStatus)
	end
	self:updateMenuList()
end

function ChromeService:isWindowOpen(Id): boolean
	-- upvalues: ChromeService (copy)
	return self._integrations[Id].components.Window and self._integrationsStatus[Id] == ChromeService.IntegrationStatus.Window
end

function ChromeService:menuList()
	return self._menuList
end

function ChromeService:windowList()
	return self._windowList
end

function ChromeService.dragConnection(p2, p3)
	return if p2._integrations[p3] then p2._dragConnection[p3] else nil
end

function ChromeService:updateLocalization(Integration)
	local Label = ""
	local Label1 = ""
	self._localizedLabelKeys[Integration.id] = {}
	self._localizedLabelKeys[Integration.id].label = Integration.label
	Label = Integration.label
	local Success, Result = pcall(function()
		-- upvalues: Label (ref), self (copy)
		Label = self._localization:Format(Label)
	end)
	
	if not Success then
		Label = Integration.label
		warn(Result)
	end
	Integration.label = Label
	
	if Integration.secondaryAction then
		self._localizedLabelKeys[Integration.id].secondaryActionLabel = Integration.secondaryAction.label
		Label1 = Integration.secondaryAction.label
		local Success1, Result1 = pcall(function()
			-- upvalues: Label1 (ref), self (copy)
			Label1 = self._localization:Format(Label1)
		end)
		
		if not Success1 then
			Label1 = Integration.secondaryAction.label
			warn(Result1)
		end
		Integration.secondaryAction.label = Label1
	end
	return Integration
end

function ChromeService:register(Integration)
	-- upvalues: IsSideSheetEnabledModule (copy), SideSheetPlacement (copy), ChromeService (copy), AvailabilitySignal (copy), NotifySignal (copy), WindowSizeSignalModule (copy), ConstantsModule (copy), FFlagEnableConsoleExpControls (copy), GamepadService (copy)
	if self._integrations[Integration.id] then
		warn(string.format(Integration.id .. "already registered", debug.traceback()))
		
		for _, value in self._integrationsConnections[Integration.id] do
			value:disconnect()
		end
	end
	self._integrationsConnections[Integration.id] = {}
	local IntegrationsConnection = self._integrationsConnections[Integration.id]
	
	if IsSideSheetEnabledModule and Integration.sideSheetPlacement == nil then
		Integration.sideSheetPlacement = SideSheetPlacement.BelowFold
	end
	if Integration.initialAvailability == nil then
		Integration.initialAvailability = ChromeService.AvailabilitySignal.Unavailable
	end
	if Integration.availability == nil then
		Integration.availability = AvailabilitySignal.new(Integration.initialAvailability or ChromeService.AvailabilitySignal.Unavailable)
	end
	if Integration.notification == nil then
		Integration.notification = NotifySignal.new()
	end
	if Integration.components == nil then
		Integration.components = {}
	end
	if Integration.availability then
		IntegrationsConnection[#IntegrationsConnection + 1] = Integration.availability:connect(function()
			-- upvalues: self (copy), Integration (ref)
			self:availabilityChanged(Integration)
		end)
	end
	if Integration.notification and not Integration.notification:excludeFromTotalCounts() then
		IntegrationsConnection[#IntegrationsConnection + 1] = Integration.notification:connect(function()
			-- upvalues: self (copy)
			self:updateNotificationTotals()
		end)
	end
	if Integration.windowSize == nil and Integration.components and Integration.components.Window then
		Integration.windowSize = WindowSizeSignalModule.new()
	end
	if ChromeService:getWindowStatusFromStore(Integration.id) and Integration.persistWindowState or Integration.windowDefaultOpen then
		self._integrationsStatus[Integration.id] = ChromeService.IntegrationStatus.Window
		self._onIntegrationStatusChanged:fire(Integration.id, self._integrationsStatus[Integration.id])
	end
	self._windowPositions[Integration.id] = if Integration.startingWindowPosition then Integration.persistWindowState and self:getWindowPositionFromStore(Integration.id) or Integration.startingWindowPosition else UDim2.fromOffset(ConstantsModule.MENU_ICON_SCREEN_SIDE_OFFSET, ConstantsModule.WINDOW_DEFAULT_PADDING)
	Integration = self:updateLocalization(Integration)
	local UpdateLocalizationResult = Integration
	self._integrations[Integration.id] = UpdateLocalizationResult
	
	if FFlagEnableConsoleExpControls and Integration.selected then
		IntegrationsConnection[#IntegrationsConnection + 1] = self:selectedItem():connect(function(Id)
			-- upvalues: UpdateLocalizationResult (copy), GamepadService (upval), Integration (ref)
			if UpdateLocalizationResult.id == Id then
				if GamepadService.GamepadCursorEnabled then return end
				Integration.selected(UpdateLocalizationResult)
			end
		end)
	end
	return UpdateLocalizationResult
end

function ChromeService.createIconProps(p2, Id, Count)
	-- upvalues: Integration (copy)
	local Count1 = Count or 0
	
	return if p2._integrations[Id] then {
		isDivider = false,
		id = Id,
		children = {},
		order = Count1,
		component = p2._integrations[Id].components.Icon,
		integration = p2._integrations[Id],
		activated = function()
			-- upvalues: p2 (copy), Id (copy)
			p2:activate(Id)
		end
	} else {
		id = Id,
		children = {},
		order = Count1,
		activated = noop,
		integration = Integration
	}
end

function ChromeService:createWidgetProps(Id, Count)
	local Integration = self._integrations[Id]
	
	return if Integration and Integration.components.Widget then {
		id = Id,
		children = {},
		order = Count or 0,
		component = Integration.components.Widget,
		integration = Integration,
		activated = noop
	} else nil
end

function ChromeService:isIntegrationValid(p2): boolean
	-- upvalues: ChromeService (copy)
	local Integration = self._integrations[p2]
	
	if Integration then
		local Availability = Integration.availability
		
		return Availability and Availability:get() ~= ChromeService.AvailabilitySignal.Unavailable
	else
		return false
	end
end

function ChromeService:updateMenuList()
	-- upvalues: Integration (copy), IsSideSheetEnabledModule (copy), FFlagEnableChromeWindowsNotInMenu (copy)
	local Count = 0
	local Count1 = 0
	
	local function iconProps(Id)
		-- upvalues: Count1 (ref), self (copy)
		Count1 += 1
		
		return self:createIconProps(Id, Count1)
	end
	
	local function windowProps(Id)
		-- upvalues: Count1 (ref), self (copy), Integration (upval)
		Count1 += 1
		
		return if self._integrations[Id] then {
			id = Id,
			children = {},
			order = Count1,
			component = self._integrations[Id].components.Window,
			activated = noop,
			integration = self._integrations[Id]
		} else {
			id = Id,
			children = {},
			order = Count1,
			activated = noop,
			integration = Integration
		}
	end
	
	local function divider(_)
		-- upvalues: Count (ref), Count1 (ref), Integration (upval)
		Count += 1
		Count1 += 1
		
		return {
			isDivider = true,
			id = "DIV" .. Count,
			order = Count1,
			children = {},
			activated = noop,
			integration = Integration
		}
	end
	
	local function collectMenu(MenuConfig, IconProps, List): number
		-- upvalues: divider (copy), Count (ref), collectMenu (copy), IsSideSheetEnabledModule (upval), self (copy), Count1 (ref), windowProps (copy), iconProps (copy)
		local Count2 = 0
		
		for i, Id in pairs(MenuConfig) do
			if type(Id) == "table" then
				if not #IconProps.children then
					table.insert(IconProps.children, (divider(Count)))
				end
				if collectMenu(Id, IconProps, List) > 0 then
					table.insert(IconProps.children, (divider(Count)))
				end
			else
				if typeof(Id) ~= "string" then
					error(`Only tables or strings should be passed into the items list, received {Id} (at key {i})`)
				end
				if IsSideSheetEnabledModule or not self._subMenuConfig[Id] then
					if self:isIntegrationValid(Id) then
						if self:isWindowOpen(Id) then
							table.insert(List, (windowProps(Id)))
							table.insert(IconProps.children, iconProps(Id))
							Count2 += 1
						else
							table.insert(IconProps.children, iconProps(Id))
							Count2 += 1
						end
					end
				elseif self:isIntegrationValid(Id) then
					Count1 += 1
					local IconProps1 = self:createIconProps(Id, Count1)
					Count2 += 1
					collectMenu(self._subMenuConfig[Id], IconProps1, List)
					
					if #IconProps1.children > 0 then
						table.insert(IconProps.children, IconProps1)
					end
				end
			end
		end
		return Count2
	end
	
	local config = { children = {} }
	local List = {}
	collectMenu(self._menuConfig, config, List)
	
	if #config.children and config.children[#config.children] and config.children[#config.children].isDivider then
		table.remove(config.children, #config.children)
	end
	if FFlagEnableChromeWindowsNotInMenu then
		local t = {}
		
		for i, value in List do
			t[value.id] = true
		end
		for i, _ in self._integrations do
			if self:isWindowOpen(i) and not t[i] then
				table.insert(List, (windowProps(i)))
			end
		end
	end
	self._menuList:set(config.children)
	self._windowList:set(List)
	self:repairSelected()
end

if IsSideSheetEnabledModule then
	function ChromeService.updateSideSheet(p2)
		-- upvalues: SideSheetPlacement (copy), FFlagEnableSideSheetWidgets (copy), IsPioneerLaunchFunction (copy), RegisterSideSheetIntegrationsFunction (ref)
		local Count = 0
		local AboveFoldIntegrations = {}
		local UnibarIntegrations = {}
		local BelowFoldIntegrations = {}
		local SessionActionIntegrations = {}
		local ScrollableContentTopWidgetIntegrations = {}
		local ScrollableContentBottomWidgetIntegrations = {}
		
		local function addIntegration(Id)
			-- upvalues: p2 (copy), SideSheetPlacement (upval), UnibarIntegrations (copy), Count (ref), AboveFoldIntegrations (copy), BelowFoldIntegrations (copy), SessionActionIntegrations (copy), FFlagEnableSideSheetWidgets (upval), IsPioneerLaunchFunction (upval), ScrollableContentTopWidgetIntegrations (copy), ScrollableContentBottomWidgetIntegrations (copy)
			local Integration = p2._integrations[Id]
			
			if not Integration or Integration.sideSheetPlacement == SideSheetPlacement.None or not p2:isIntegrationValid(Id) then return end
			if Integration.sideSheetPlacement == SideSheetPlacement.Unibar then
				table.insert(UnibarIntegrations, p2:createIconProps(Id, Count))
				
				return
			end
			if Integration.sideSheetPlacement == SideSheetPlacement.AboveFold then
				table.insert(AboveFoldIntegrations, p2:createIconProps(Id, Count))
				
				return
			end
			if Integration.sideSheetPlacement == SideSheetPlacement.BelowFold then
				table.insert(BelowFoldIntegrations, p2:createIconProps(Id, Count))
				
				return
			end
			if Integration.sideSheetPlacement == SideSheetPlacement.SessionAction then
				table.insert(SessionActionIntegrations, p2:createIconProps(Id, Count))
				
				return
			end
			if Integration.sideSheetPlacement == SideSheetPlacement.ScrollableContentTop then
				if FFlagEnableSideSheetWidgets or IsPioneerLaunchFunction() then
					local WidgetProps = p2:createWidgetProps(Id, Count)
					
					if WidgetProps then
						table.insert(ScrollableContentTopWidgetIntegrations, WidgetProps)
						
						return
					end
				end
			elseif Integration.sideSheetPlacement == SideSheetPlacement.ScrollableContentBottom and (FFlagEnableSideSheetWidgets or IsPioneerLaunchFunction()) then
				local WidgetProps = p2:createWidgetProps(Id, Count)
				
				if WidgetProps then
					table.insert(ScrollableContentBottomWidgetIntegrations, WidgetProps)
				end
			end
		end
		
		for _, value in p2._menuConfig do
			for _, value1 in value do
				Count += 1
				addIntegration(value1)
			end
		end
		for _, value2 in p2._subMenuConfig do
			for _, value3 in value2 do
				Count += 1
				addIntegration(value3)
			end
		end
		RegisterSideSheetIntegrationsFunction({
			unibarIntegrations = UnibarIntegrations,
			aboveFoldIntegrations = AboveFoldIntegrations,
			belowFoldIntegrations = BelowFoldIntegrations,
			sessionActionIntegrations = SessionActionIntegrations,
			scrollableContentTopWidgetIntegrations = ScrollableContentTopWidgetIntegrations,
			scrollableContentBottomWidgetIntegrations = ScrollableContentBottomWidgetIntegrations
		})
	end
end
function ChromeService:availabilityChanged(_)
	-- upvalues: IsSideSheetEnabledModule (copy)
	self:updateNotificationTotals()
	self:updateMenuList()
	
	if IsSideSheetEnabledModule then
		self:updateSideSheet()
	end
end

function ChromeService:subMenuNotifications(p3)
	-- upvalues: NotifySignal (copy)
	if not self._subMenuNotifications[p3] then
		self._subMenuNotifications[p3] = NotifySignal.new(true)
	end
	return self._subMenuNotifications[p3]
end

function ChromeService:totalNotifications()
	return self._totalNotifications
end

function ChromeService:onIntegrationRegistered()
	return self._onIntegrationRegistered
end

function ChromeService:onIntegrationActivated()
	return self._onIntegrationActivated
end

function ChromeService:onIntegrationHovered()
	return self._onIntegrationHovered
end

function ChromeService:onIntegrationStatusChanged()
	return self._onIntegrationStatusChanged
end

function ChromeService:integrations()
	return self._integrations
end

function ChromeService:updateNotificationTotals()
	-- upvalues: ChromeService (copy)
	local NewValue = 0
	
	for _, integration in self._integrations do
		if integration.availability:get() ~= ChromeService.AvailabilitySignal.Unavailable and integration.availability:get() ~= ChromeService.AvailabilitySignal.Pinned and not integration.notification:excludeFromTotalCounts() then
			local GetResult = integration.notification:get()
			
			if GetResult and GetResult.type == "count" then
				assert(typeof(GetResult.value) == "number", "Expected count value to be number")
				NewValue += GetResult.value
			end
		end
	end
	self._totalNotifications:fireCount(NewValue)
	
	for i, subMenuNotification in self._subMenuNotifications do
		local WithinCurrentTopLevelMenuResult = self:withinCurrentTopLevelMenu(i)
		local NewValue1 = 0
		
		if WithinCurrentTopLevelMenuResult then
			for _, child in WithinCurrentTopLevelMenuResult.children do
				if not self:withinCurrentTopLevelMenu(child.id) and child.integration.availability:get() ~= ChromeService.AvailabilitySignal.Unavailable and not child.integration.notification:excludeFromTotalCounts() then
					local GetResult = child.integration.notification:get()
					
					if GetResult and GetResult.type == "count" then
						assert(typeof(GetResult.value) == "number", "Expected count value to be number")
						NewValue1 += GetResult.value
					end
				end
			end
			subMenuNotification:fireCount(NewValue1)
		end
	end
end

function ChromeService:configureMenu(_menuConfig)
	self._menuConfig = _menuConfig
	self:updateNotificationTotals()
	self:updateMenuList()
end

function ChromeService:configureSubMenu(p3, p4)
	-- upvalues: NotifySignal (copy), IsSideSheetEnabledModule (copy)
	self._subMenuConfig[p3] = p4
	
	if not self._subMenuNotifications[p3] then
		self._subMenuNotifications[p3] = NotifySignal.new(true)
	end
	self:updateNotificationTotals()
	self:updateMenuList()
	
	if IsSideSheetEnabledModule then
		self:updateSideSheet()
	end
end

if FFlagEnableConsoleExpControls then
	function ChromeService:registerShortcut(p3)
		-- upvalues: ChromeService (copy)
		self._shortcutService:registerShortcut(p3)
		local Shortcut = self._shortcutService:getShortcut(p3.id)
		
		if Shortcut.integration and self._integrations[Shortcut.integration] then
			local Integration = self._integrations[Shortcut.integration]
			
			if Integration.availability:get() == ChromeService.AvailabilitySignal.Unavailable then
				Shortcut.availability:unavailable()
			end
			Integration.availability:connect(function()
				-- upvalues: Integration (copy), ChromeService (upval), Shortcut (copy)
				local GetResult = Integration.availability:get()
				
				if GetResult == ChromeService.AvailabilitySignal.Unavailable then
					Shortcut.availability:unavailable()
					
					return
				end
				if GetResult == ChromeService.AvailabilitySignal.Available or GetResult == ChromeService.AvailabilitySignal.Pinned then
					Shortcut.availability:available()
				end
			end)
		end
	end
	
	function ChromeService:activateShortcut(p3)
		-- upvalues: FFlagIntegrationsChromeShortcutTelemetryModule (copy)
		local Shortcut = self._shortcutService:getShortcut(p3)
		
		if not Shortcut.integration then
			self._shortcutService:activateShortcut(p3)
		elseif Shortcut.activated then
			if FFlagIntegrationsChromeShortcutTelemetryModule then
				self._shortcutService:activateShortcut(p3)
				self._onIntegrationActivated:fire(Shortcut.integration, { fromShortcut = true })
				
				return
			end
		elseif FFlagIntegrationsChromeShortcutTelemetryModule then
			self:activate(Shortcut.integration, { fromShortcut = true })
			
			return
		else
			self:activate(Shortcut.integration)
			
			return
		end
	end
	
	function ChromeService:configureShortcutBar(p3, p4)
		self._shortcutService:configureShortcutBar(p3, p4)
	end
	
	function ChromeService:setShortcutBar(UNIBARSHORTCUTBARID)
		self._shortcutService:setShortcutBar(UNIBARSHORTCUTBARID)
	end
	
	function ChromeService:getCurrentShortcutBar()
		return self._currentShortcutBar
	end
	
	function ChromeService:getShortcutsFromBar(GetResult)
		return self._shortcutService:getShortcutsFromBar(GetResult, self._integrations)
	end
	
	function ChromeService:getCurrentShortcuts()
		return self:getShortcutsFromBar(self._currentShortcutBar:get())
	end
	
	function ChromeService:onShortcutBarChanged()
		return self._shortcutService.onShortcutBarChanged
	end
	
	function ChromeService:selectMenuIcon()
		self._triggerMenuIcon:fire()
	end
	
	function ChromeService:onTriggerMenuIcon()
		return self._triggerMenuIcon
	end
	
	function ChromeService:setHideShortcutBar(p3, p4)
		self._shortcutService:setHideShortcutBar(p3, p4)
	end
	
	function ChromeService:getHideShortcutBar()
		return self._shortcutService:getHideShortcutBar()
	end
end
if IsInExperienceUIVREnabled then
	function ChromeService:onTriggerVRToggleButton()
		return self._triggerVRToggleButton
	end
	
	function ChromeService:showTopBar()
		return self._topBarVisibility:get()
	end
	
	function ChromeService:getTopBarVisibiity()
		return self._topBarVisibility
	end
	
	function ChromeService:connectTopBarVisibility(_topBarVisibility)
		self._topBarVisibility = _topBarVisibility
	end
end
function ChromeService:gesture(p3, Connection, InputObject)
	if self._integrations[p3] then
		self._dragConnection[p3] = { connection = Connection, inputObject = InputObject }
	end
end

function ChromeService.withinCurrentTopLevelMenu(p3, GetResult)
	for i, value in p3._menuList:get() do
		if value.id == GetResult then
			return value, i
		end
	end
	return nil, 0
end

function ChromeService:withinCurrentSubmenu(Id): boolean
	local GetResult = self._currentSubMenu:get()
	
	if not GetResult then
		return false
	end
	local Children = nil
	
	for _, value in self._menuList:get() do
		if value.id == GetResult then
			Children = value.children
			break
		end
	end
	if not Children then
		return false
	end
	for _, child in Children do
		if child.id == Id then
			return true
		end
	end
	return false
end

if IsSideSheetEnabledModule then
	function ChromeService.withinOpenSideSheet(p4, Id): boolean
		-- upvalues: GetSideSheetVisibilityFunction (ref), SideSheetPlacement (copy)
		if not GetSideSheetVisibilityFunction() then
			return false
		end
		for _, integration in p4._integrations do
			if integration.id == Id and integration.sideSheetPlacement ~= SideSheetPlacement.None then
				return true
			end
		end
		return false
	end
end
function ChromeService:windowPosition(p4)
	return self._windowPositions[p4]
end

function ChromeService:updateWindowPosition(Key, Vector)
	-- upvalues: LocalStoreModule (copy)
	if LocalStoreModule.isEnabled() and self._integrations[Key] and self._integrations[Key].persistWindowState then
		local ChromeWindowPosition = LocalStoreModule.loadForLocalPlayer("ChromeWindowPosition") or {}
		ChromeWindowPosition[Key] = {
			Vector.X.Scale,
			Vector.X.Offset,
			Vector.Y.Scale,
			Vector.Y.Offset
		}
		LocalStoreModule.storeForLocalPlayer("ChromeWindowPosition", ChromeWindowPosition)
	end
	self._windowPositions[Key] = Vector
end

function ChromeService:getWindowStatusFromStore(Id)
	-- upvalues: LocalStoreModule (copy)
	return if LocalStoreModule.isEnabled() then (LocalStoreModule.loadForLocalPlayer("ChromeWindowStatus") or {})[Id] or false else nil
end

function ChromeService:getWindowPositionFromStore(Id)
	-- upvalues: LocalStoreModule (copy)
	if LocalStoreModule.isEnabled() then
		local ChromeWindowPositionEntry = (LocalStoreModule.loadForLocalPlayer("ChromeWindowPosition") or {})[Id] or nil
		
		return if ChromeWindowPositionEntry then UDim2.new(ChromeWindowPositionEntry[1], ChromeWindowPositionEntry[2], ChromeWindowPositionEntry[3], ChromeWindowPositionEntry[4]) else nil
	else
		return nil
	end
end

function ChromeService:activate(Integration, p4)
	-- upvalues: FFlagIntegrationsChromeShortcutTelemetryModule (copy), FFlagEnableConsoleExpControls (copy)
	local v1 = nil
	
	if self._integrations[Integration] then
		local ActivatedFunction = self._integrations[Integration].activated
		
		if FFlagIntegrationsChromeShortcutTelemetryModule then
			self._onIntegrationActivated:fire(Integration, p4)
		else
			self._onIntegrationActivated:fire(Integration)
		end
		self:storeChromeInteracted()
		
		if ActivatedFunction then
			local Success, Result = pcall(function()
				-- upvalues: ActivatedFunction (copy), self (copy), Integration (copy), FFlagEnableConsoleExpControls (upval)
				ActivatedFunction(self._integrations[Integration])
				
				if not FFlagEnableConsoleExpControls then
					self:disableFocusNav()
				end
			end)
			
			if not Success then
				warn("ChromeService: activate error thrown for " .. Integration)
				v1 = Result
			end
		else
			if self._subMenuConfig[Integration] then
				self:toggleSubMenu(Integration)
			end
			self:toggleWindow(Integration)
		end
		if self._currentSubMenu:get() ~= Integration then
			self._currentSubMenu:set(nil)
		end
	end
	if v1 then
		error(v1)
	end
end

function ChromeService:selectedItem()
	return self._selectedItem
end

function ChromeService:setSelected(Id)
	-- upvalues: UserInputService (copy)
	local WithinCurrentTopLevelMenuResult, WithinCurrentTopLevelMenuResult2 = self:withinCurrentTopLevelMenu(Id or "")
	
	if not WithinCurrentTopLevelMenuResult then return end
	local LastInputType = UserInputService:GetLastInputType()
	local IsLastInputTypeMatch: boolean = LastInputType == Enum.UserInputType.MouseButton1 or LastInputType == Enum.UserInputType.Touch
	local GetResult = self._currentSubMenu:get()
	
	if GetResult and GetResult ~= Id and not IsLastInputTypeMatch then
		self:toggleSubMenu(GetResult)
	end
	self._selectedItemIdx = WithinCurrentTopLevelMenuResult2
	self._selectedItem:set(Id)
end

function ChromeService:setSelectedByOffset(p4: number)
	local GetResult = self._menuList:get()
	local _, WithinCurrentTopLevelMenuResult2 = self:withinCurrentTopLevelMenu(self._selectedItem:get() or "")
	
	if WithinCurrentTopLevelMenuResult2 > 0 then
		self:setSelected(GetResult[math.clamp(WithinCurrentTopLevelMenuResult2 + p4, 1, #GetResult)].id)
	end
end

function ChromeService:repairSelected()
	if self._selectedItem:get() then
		local _, WithinCurrentTopLevelMenuResult2 = self:withinCurrentTopLevelMenu(self._selectedItem:get() or "")
		
		if WithinCurrentTopLevelMenuResult2 == 0 then
			WithinCurrentTopLevelMenuResult2 = self._selectedItemIdx
		end
		local GetResult = self._menuList:get()
		self:setSelected(GetResult[math.clamp(WithinCurrentTopLevelMenuResult2, 1, #GetResult)].id)
	end
end

function ChromeService:configureOrderAlignment(p4)
	if self._orderAlignment:get() ~= p4 then
		self._orderAlignment:set(p4)
		self:updateMenuList()
	end
end

function ChromeService:orderAlignment()
	return self._orderAlignment
end

function ChromeService:setMenuAbsolutePosition(_menuAbsolutePosition)
	if _menuAbsolutePosition ~= self._menuAbsolutePosition then
		self._menuAbsolutePosition = _menuAbsolutePosition
		self._layout:set(createUnibarLayoutInfo(_menuAbsolutePosition, self._menuAbsoluteSizeOpen))
	end
end

function ChromeService:setMenuAbsoluteSize(_menuAbsoluteSizeOpen)
	if _menuAbsoluteSizeOpen ~= self._menuAbsoluteSizeOpen then
		self._menuAbsoluteSizeOpen = _menuAbsoluteSizeOpen
		self._layout:set(createUnibarLayoutInfo(self._menuAbsolutePosition, _menuAbsoluteSizeOpen))
	end
end

function ChromeService:layout()
	return self._layout
end

return ChromeService