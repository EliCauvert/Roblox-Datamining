local chromeShared = script:FindFirstAncestor("ChromeShared")
local corePackagesService = game:GetService("CorePackages")
local localizationService = game:GetService("LocalizationService")
local userInputService = game:GetService("UserInputService")
local gamepadService = game:GetService("GamepadService")
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local appCommonLibModule = require(corePackagesService.Workspace.Packages.AppCommonLib)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local chromeModule = require(corePackagesService.Workspace.Packages.Chrome)
local sideSheetPlacement = chromeModule.Enums.SideSheetPlacement
local signal = appCommonLibModule.Signal
local focusUtils = chromeModule.FocusUtils
local focusOnChromeSignal = focusUtils.FocusOnChromeSignal
local focusOffChromeSignal = focusUtils.FocusOffChromeSignal
local chromeUtilsModule = require(chromeShared.Service.ChromeUtils)
local localStoreModule = require(chromeShared.Service.LocalStore)
local viewportUtilModule = require(chromeShared.Service.ViewportUtil)
local windowSizeSignalModule = require(chromeShared.Service.WindowSizeSignal)
local observableValue = chromeUtilsModule.ObservableValue
local notifySignal = chromeUtilsModule.NotifySignal
local availabilitySignal = chromeUtilsModule.AvailabilitySignal
local constantsModule = require(chromeShared.Unibar.Constants)
local shortcutServiceModule = require(chromeShared.Service.ShortcutService)
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local fFlagIntegrationsChromeShortcutTelemetryModule = require(chromeShared.Parent.Flags.FFlagIntegrationsChromeShortcutTelemetry)
local chromeDeprecateMRUs = game:DefineFastFlag("ChromeDeprecateMRUs", false)
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet
local fIntSideSheetVariant = sharedFlagsModule.FIntSideSheetVariant
local fFlagEnableChromeWindowsNotInMenu = require(chromeShared.Flags).FFlagEnableChromeWindowsNotInMenu
local _ = nil
local _ = nil
local _ = nil
local inExperienceSideSheetModule = require(corePackagesService.Workspace.Packages.InExperienceSideSheet)
local toggleSideSheet = inExperienceSideSheetModule.toggleSideSheet
local getSideSheetVisibility = inExperienceSideSheetModule.getSideSheetVisibility
local registerSideSheetIntegrations = inExperienceSideSheetModule.registerSideSheetIntegrations
local t = {}
t.__index = t
t.AvailabilitySignal = chromeUtilsModule.AvailabilitySignalState
t.IntegrationStatus = { None = 0, Icon = 1, Window = 2 }

function noop() end

local t_1 = {
	id = "div",
	label = "div",
	hideNotificationCountWhileOpen = false,
	initialAvailability = t.AvailabilitySignal.Unavailable,
	availability = availabilitySignal.new(t.AvailabilitySignal.Unavailable),
	notification = notifySignal.new(),
	components = {},
	sideSheetPlacement = if fFlagEnableSideSheet then sideSheetPlacement.None else nil
}

function createUnibarLayoutInfo(p0, p1)
	return Rect.new(p0, p0 + p1)
end

function t.new()
	-- upvalues: localizationService (ref), fFlagEnableConsoleExpControls (ref), shortcutServiceModule (ref), chromeUtilsModule (ref), observableValue (ref), notifySignal (ref), localization (ref), signal (ref), isInExperienceUIVREnabled (ref), t (ref), viewportUtilModule (ref), chromeDeprecateMRUs (ref), focusOnChromeSignal (ref), focusOffChromeSignal (ref)
	local t_1 = {
		_shortcutService = if fFlagEnableConsoleExpControls then shortcutServiceModule.new() else nil,
		_layout = chromeUtilsModule.ObservableValue.new(createUnibarLayoutInfo(Vector2.zero, Vector2.zero)),
		_menuAbsolutePosition = Vector2.zero,
		_menuAbsoluteSizeOpen = Vector2.zero,
		_currentSubMenu = chromeUtilsModule.ObservableValue.new(nil),
		_selectedItem = chromeUtilsModule.ObservableValue.new(nil),
		_selectedItemIdx = 0,
		_integrations = {},
		_integrationsConnections = {},
		_integrationsStatus = {},
		_menuConfig = {},
		_subMenuConfig = {},
		_subMenuNotifications = {},
		_menuList = observableValue.new({}),
		_windowList = observableValue.new({}),
		_dragConnection = {},
		_windowPositions = observableValue.new({}),
		_totalNotifications = notifySignal.new(true),
		_mostRecentlyUsedAndPinnedLimit = -1,
		_localization = localization.new(localizationService.RobloxLocaleId),
		_localizedLabelKeys = {},
		_currentShortcutBar = observableValue.new(nil),
		_notificationIndicator = observableValue.new(nil),
		_orderAlignment = observableValue.new(Enum.HorizontalAlignment.Left),
		_onIntegrationRegistered = signal.new(),
		_onIntegrationActivated = signal.new(),
		_onIntegrationStatusChanged = signal.new(),
		_onIntegrationHovered = signal.new(),
		_triggerMenuIcon = signal.new(),
		_triggerVRToggleButton = if isInExperienceUIVREnabled then signal.new() else nil,
		_topBarVisibility = if isInExperienceUIVREnabled then observableValue.new(nil) else nil,
		_inFocusNav = observableValue.new(false)
	}
	local tbl = setmetatable(t_1, t)
	viewportUtilModule.viewport:connect(function(p2)
		-- upvalues: chromeDeprecateMRUs (copy), tbl (ref)
		if chromeDeprecateMRUs then
			tbl:updateWindowSizeSignals()
			
			return
		end
		tbl:updateScreenSize(p2.size, p2.isMobileDevice, p2.portraitOrientation, p2.tinyPortrait)
	end, true)
	
	if fFlagEnableConsoleExpControls then
		t_1._shortcutService.onShortcutBarChanged:connect(function(p3)
			-- upvalues: tbl (ref)
			tbl._currentShortcutBar:set(p3)
		end)
	end
	focusOnChromeSignal:connect(function(p4)
		-- upvalues: t_1 (ref), tbl (ref)
		if p4 and not t_1._subMenuConfig.nine_dot[p4] then
			tbl:setSelected(p4)
		end
		tbl:enableFocusNav()
	end)
	focusOffChromeSignal:connect(function()
		-- upvalues: tbl (ref), fFlagEnableConsoleExpControls (copy)
		tbl:disableFocusNav()
		
		if fFlagEnableConsoleExpControls then
			tbl:setShortcutBar(nil)
		end
	end)
	
	return tbl
end

function t.storeChromeInteracted(_)
	-- upvalues: localStoreModule (ref)
	if localStoreModule.isEnabled() then
		localStoreModule.storeForLocalPlayer("ChromeInteracted3", true)
	end
end

function t:updateScreenSize(_, p5, p6, p7)
	-- upvalues: constantsModule (ref)
	local var21 = if p5 then if p7 then constantsModule.MOBILE_TINY_PORTRAIT_SLOTS - constantsModule.CORE_SLOTS elseif p6 then constantsModule.MOBILE_PORTRAIT_SLOTS - constantsModule.CORE_SLOTS else constantsModule.MOBILE_LANDSCAPE_SLOTS - constantsModule.CORE_SLOTS else constantsModule.NON_MOBILE_SLOTS - constantsModule.CORE_SLOTS
	
	if var21 ~= self._mostRecentlyUsedAndPinnedLimit then
		self._mostRecentlyUsedAndPinnedLimit = var21
		self:updateMenuList()
		self:updateNotificationTotals()
	end
	self:updateWindowSizeSignals()
end

function t:updateWindowSizeSignals()
	for i, v in self._integrations do
		if v.windowSize then
			v.windowSize:updateConstraints()
		end
	end
end

function t:notificationIndicator()
	return self._notificationIndicator
end

function t:toggleSubMenu(p8)
	-- upvalues: fFlagEnableSideSheet (ref), toggleSideSheet (write)
	if fFlagEnableSideSheet and toggleSideSheet then
		toggleSideSheet(true)
		
		return
	elseif not self._subMenuConfig[p8] then
		warn("Not a valid subMenuId:" .. p8)
		
		return
	elseif self._currentSubMenu:get() == p8 then
		self._currentSubMenu:set(nil)
		
		return
	end
	self._currentSubMenu:set(p8)
end

function t:currentSubMenu()
	return self._currentSubMenu
end

function t:inFocusNav()
	return self._inFocusNav
end

function t:enableFocusNav()
	-- upvalues: gamepadService (ref), fFlagEnableConsoleExpControls (ref), constantsModule (ref)
	if gamepadService.GamepadCursorEnabled then return end
	if not self._inFocusNav:get() then
		self._inFocusNav:set(true)
	end
	if fFlagEnableConsoleExpControls then
		self:setShortcutBar(constantsModule.UNIBAR_SHORTCUTBAR_ID)
	end
end

function t:disableFocusNav()
	-- upvalues: gamepadService (ref)
	if gamepadService.GamepadCursorEnabled then return end
	if self._inFocusNav:get() then
		self._inFocusNav:set(false)
		self._selectedItem:set(nil)
		self._currentSubMenu:set(nil)
	end
end

function t:toggleWindow(p9)
	-- upvalues: t (ref), localStoreModule (ref)
	if self._integrations[p9].components.Window then
		if self._integrationsStatus[p9] and self._integrationsStatus[p9] ~= t.IntegrationStatus.None and self._integrationsStatus[p9] ~= t.IntegrationStatus.Icon then
			self._integrationsStatus[p9] = t.IntegrationStatus.Icon
		else
			self._integrationsStatus[p9] = t.IntegrationStatus.Window
		end
		self._onIntegrationStatusChanged:fire(p9, self._integrationsStatus[p9])
	end
	if localStoreModule.isEnabled() and self._integrations[p9] and self._integrations[p9].persistWindowState then
		local chromeWindowStatus = localStoreModule.loadForLocalPlayer("ChromeWindowStatus") or {}
		chromeWindowStatus[p9] = self._integrationsStatus[p9] == t.IntegrationStatus.Window
		localStoreModule.storeForLocalPlayer("ChromeWindowStatus", chromeWindowStatus)
	end
	self:updateMenuList()
end

function t:isWindowOpen(p10)
	-- upvalues: t (ref)
	return self._integrations[p10].components.Window and self._integrationsStatus[p10] == t.IntegrationStatus.Window
end

function t:menuList()
	return self._menuList
end

function t:windowList()
	return self._windowList
end

function t:dragConnection(p11)
	return if self._integrations[p11] then self._dragConnection[p11] else nil
end

function t:updateLocalization(p12)
	local _ = ""
	local _ = ""
	self._localizedLabelKeys[p12.id] = {}
	self._localizedLabelKeys[p12.id].label = p12.label
	local label = p12.label
	local ok, status = pcall(function()
		-- upvalues: label (write), self (ref)
		label = self._localization:Format(label)
	end)
	
	if not ok then
		label = p12.label
		warn(status)
	end
	p12.label = label
	
	if p12.secondaryAction then
		self._localizedLabelKeys[p12.id].secondaryActionLabel = p12.secondaryAction.label
		local label_1 = p12.secondaryAction.label
		local ok_1, status_1 = pcall(function()
			-- upvalues: label_1 (write), self (ref)
			label_1 = self._localization:Format(label_1)
		end)
		
		if not ok_1 then
			label_1 = p12.secondaryAction.label
			warn(status_1)
		end
		p12.secondaryAction.label = label_1
	end
	return p12
end

function t:register(p13)
	-- upvalues: fFlagEnableSideSheet (ref), sideSheetPlacement (ref), t (ref), availabilitySignal (ref), notifySignal (ref), windowSizeSignalModule (ref), constantsModule (ref), fFlagEnableConsoleExpControls (ref), gamepadService (ref)
	if self._integrations[p13.id] then
		warn(string.format(p13.id .. "already registered", debug.traceback()))
		
		for i, v in self._integrationsConnections[p13.id] do
			v:disconnect()
		end
	end
	self._integrationsConnections[p13.id] = {}
	local id = self._integrationsConnections[p13.id]
	
	if fFlagEnableSideSheet and p13.sideSheetPlacement == nil then
		p13.sideSheetPlacement = sideSheetPlacement.Vertical
	end
	if p13.initialAvailability == nil then
		p13.initialAvailability = t.AvailabilitySignal.Unavailable
	end
	if p13.availability == nil then
		p13.availability = availabilitySignal.new(p13.initialAvailability or t.AvailabilitySignal.Unavailable)
	end
	if p13.notification == nil then
		p13.notification = notifySignal.new()
	end
	if p13.components == nil then
		p13.components = {}
	end
	if p13.availability then
		id[#id + 1] = p13.availability:connect(function()
			-- upvalues: self (ref), p13 (write)
			self:availabilityChanged(p13)
		end)
	end
	if p13.notification and not p13.notification:excludeFromTotalCounts() then
		id[#id + 1] = p13.notification:connect(function()
			-- upvalues: self (ref)
			self:updateNotificationTotals()
		end)
	end
	if p13.windowSize == nil and p13.components and p13.components.Window then
		p13.windowSize = windowSizeSignalModule.new()
	end
	if t:getWindowStatusFromStore(p13.id) and p13.persistWindowState or p13.windowDefaultOpen then
		self._integrationsStatus[p13.id] = t.IntegrationStatus.Window
		self._onIntegrationStatusChanged:fire(p13.id, self._integrationsStatus[p13.id])
	end
	local uDim2 = UDim2.fromOffset(constantsModule.MENU_ICON_SCREEN_SIDE_OFFSET, constantsModule.WINDOW_DEFAULT_PADDING)
	
	if p13.startingWindowPosition then
		uDim2 = if p13.persistWindowState then self:getWindowPositionFromStore(p13.id) or p13.startingWindowPosition else p13.startingWindowPosition
	end
	self._windowPositions[p13.id] = uDim2
	p13 = self:updateLocalization(p13)
	local var24 = p13
	self._integrations[p13.id] = var24
	
	if fFlagEnableConsoleExpControls and p13.selected then
		id[#id + 1] = self:selectedItem():connect(function(p14)
			-- upvalues: var24 (ref), gamepadService (copy), p13 (write)
			if var24.id == p14 then
				if gamepadService.GamepadCursorEnabled then return end
				p13.selected(var24)
			end
		end)
	end
	return var24
end

function t:createIconProps(p15, p16)
	-- upvalues: t_1 (ref)
	p16 = p16 or 0
	
	return if self._integrations[p15] then {
		isDivider = false,
		id = p15,
		children = {},
		order = p16,
		component = self._integrations[p15].components.Icon,
		integration = self._integrations[p15],
		activated = function()
			-- upvalues: self (ref), p15 (ref)
			self:activate(p15)
		end
	} else {
		id = p15,
		children = {},
		order = p16,
		activated = noop,
		integration = t_1
	}
end

function t:isIntegrationValid(p17)
	-- upvalues: t (ref)
	local var26 = self._integrations[p17]
	
	if var26 then
		local availability = var26.availability
		
		return availability and availability:get() ~= t.AvailabilitySignal.Unavailable
	end
	return false
end

function t:updateMenuList()
	-- upvalues: t_1 (ref), fFlagEnableSideSheet (ref), fFlagEnableChromeWindowsNotInMenu (ref)
	local var27 = 0
	local var28 = 0
	
	local function iconProps(p18)
		-- upvalues: var28 (write), self (ref)
		var28 += 1
		
		return self:createIconProps(p18, var28)
	end
	
	local function windowProps(p19)
		-- upvalues: var28 (write), self (ref), t_1 (copy)
		var28 += 1
		
		return if self._integrations[p19] then {
			id = p19,
			children = {},
			order = var28,
			component = self._integrations[p19].components.Window,
			activated = noop,
			integration = self._integrations[p19]
		} else {
			id = p19,
			children = {},
			order = var28,
			activated = noop,
			integration = t_1
		}
	end
	
	local function divider(_)
		-- upvalues: var27 (write), var28 (write), t_1 (copy)
		var27 += 1
		var28 += 1
		
		return {
			isDivider = true,
			id = "DIV" .. var27,
			order = var28,
			children = {},
			activated = noop,
			integration = t_1
		}
	end
	
	local function collectMenu(p20, p21, p22)
		-- upvalues: divider (ref), var27 (write), collectMenu (ref), fFlagEnableSideSheet (copy), self (ref), var28 (write), windowProps (ref), iconProps (ref)
		local var36 = 0
		
		for i, v in pairs(p20) do
			if type(v) == "table" then
				if not #p21.children then
					table.insert(p21.children, divider(var27))
				end
				if collectMenu(v, p21, p22) > 0 then
					table.insert(p21.children, divider(var27))
				end
			end
			if typeof(v) ~= "string" then
				error(`Only tables or strings should be passed into the items list, received {v} (at key {i})`)
			end
			if fFlagEnableSideSheet or not self._subMenuConfig[v] then
				if self:isIntegrationValid(v) then
					if self:isWindowOpen(v) then
						table.insert(p22, windowProps(v))
						table.insert(p21.children, iconProps(v))
						var36 += 1
					else
						table.insert(p21.children, iconProps(v))
						var36 += 1
					end
				end
			elseif self:isIntegrationValid(v) then
				var28 += 1
				local var37 = self:createIconProps(v, var28)
				var36 += 1
				collectMenu(self._subMenuConfig[v], var37, p22)
				
				if #var37.children > 0 then
					table.insert(p21.children, var37)
				end
			end
		end
		return var36
	end
	
	local t = { children = {} }
	local t_2 = {}
	collectMenu(self._menuConfig, t, t_2)
	
	if #t.children and t.children[#t.children] and t.children[#t.children].isDivider then
		table.remove(t.children, #t.children)
	end
	if fFlagEnableChromeWindowsNotInMenu then
		local t_3 = {}
		
		for i, v in t_2 do
			t_3[v.id] = true
		end
		for i_1, v_1 in self._integrations do
			if self:isWindowOpen(i_1) and not t_3[i_1] then
				table.insert(t_2, windowProps(i_1))
			end
		end
	end
	self._menuList:set(t.children)
	self._windowList:set(t_2)
	self:repairSelected()
end

if fFlagEnableSideSheet then
	function t:updateSideSheet()
		-- upvalues: sideSheetPlacement (ref), fIntSideSheetVariant (ref), registerSideSheetIntegrations (write)
		local var38 = 0
		local t = {}
		local t_1 = {}
		local t_2 = {}
		local t_3 = {}
		
		local function addIntegration(p23)
			-- upvalues: self (ref), sideSheetPlacement (copy), t_1 (write), var38 (write), t_2 (ref), t_3 (ref), fIntSideSheetVariant (copy), t (write)
			local var44 = self._integrations[p23]
			
			if not var44 or var44.sideSheetPlacement == sideSheetPlacement.None or not self:isIntegrationValid(p23) then return end
			if var44.sideSheetPlacement == sideSheetPlacement.Unibar then
				table.insert(t_1, self:createIconProps(p23, var38))
				
				return
			elseif var44.sideSheetPlacement == sideSheetPlacement.Page then
				table.insert(t_2, self:createIconProps(p23, var38))
				
				return
			elseif var44.sideSheetPlacement == sideSheetPlacement.SessionAction then
				table.insert(t_3, self:createIconProps(p23, var38))
				
				return
			elseif var44.sideSheetPlacement == sideSheetPlacement.Vertical and fIntSideSheetVariant ~= 0 then
				table.insert(t_2, self:createIconProps(p23, var38))
				
				return
			end
			table.insert(t, self:createIconProps(p23, var38))
		end
		
		for i, v in self._menuConfig do
			for i_3, v_1 in v do
				var38 += 1
				addIntegration(v_1)
			end
		end
		for i, v_1 in self._subMenuConfig do
			for i_3, v_2 in v_1 do
				var38 += 1
				addIntegration(v_2)
			end
		end
		if fIntSideSheetVariant == 0 then
			for i, v_2 in t do
				table.insert(t_1, v_2)
			end
			t = t_1
			t_1 = {}
		end
		registerSideSheetIntegrations({
			unibarIntegrations = t_1,
			toggleIntegrations = t,
			pageIntegrations = t_2,
			sessionActionIntegrations = t_3
		})
	end
end
function t:availabilityChanged(_)
	-- upvalues: fFlagEnableSideSheet (ref)
	self:updateNotificationTotals()
	self:updateMenuList()
	
	if fFlagEnableSideSheet then
		self:updateSideSheet()
	end
end

function t:subMenuNotifications(p24)
	-- upvalues: notifySignal (ref)
	if not self._subMenuNotifications[p24] then
		self._subMenuNotifications[p24] = notifySignal.new(true)
	end
	return self._subMenuNotifications[p24]
end

function t:totalNotifications()
	return self._totalNotifications
end

function t:onIntegrationRegistered()
	return self._onIntegrationRegistered
end

function t:onIntegrationActivated()
	return self._onIntegrationActivated
end

function t:onIntegrationHovered()
	return self._onIntegrationHovered
end

function t:onIntegrationStatusChanged()
	return self._onIntegrationStatusChanged
end

function t:integrations()
	return self._integrations
end

function t:updateNotificationTotals()
	-- upvalues: t (ref)
	local var45 = 0
	
	for i, v in self._integrations do
		if v.availability:get() ~= t.AvailabilitySignal.Unavailable and v.availability:get() ~= t.AvailabilitySignal.Pinned and not v.notification:excludeFromTotalCounts() then
			local var49 = v.notification:get()
			
			if var49 and var49.type == "count" then
				assert(typeof(var49.value) == "number", "Expected count value to be number")
				var45 += var49.value
			end
		end
	end
	self._totalNotifications:fireCount(var45)
	
	for i_1, v_1 in self._subMenuNotifications do
		local var46 = self:withinCurrentTopLevelMenu(i_1)
		local var47 = 0
		
		if var46 then
			for i_2, v_2 in var46.children do
				if not self:withinCurrentTopLevelMenu(v_2.id) and v_2.integration.availability:get() ~= t.AvailabilitySignal.Unavailable and not v_2.integration.notification:excludeFromTotalCounts() then
					local var48 = v_2.integration.notification:get()
					
					if var48 and var48.type == "count" then
						assert(typeof(var48.value) == "number", "Expected count value to be number")
						var47 += var48.value
					end
				end
			end
			v_1:fireCount(var47)
		end
	end
end

function t:configureMenu(p25)
	self._menuConfig = p25
	self:updateNotificationTotals()
	self:updateMenuList()
end

function t:configureSubMenu(p26, p27)
	-- upvalues: notifySignal (ref), fFlagEnableSideSheet (ref)
	self._subMenuConfig[p26] = p27
	
	if not self._subMenuNotifications[p26] then
		self._subMenuNotifications[p26] = notifySignal.new(true)
	end
	self:updateNotificationTotals()
	self:updateMenuList()
	
	if fFlagEnableSideSheet then
		self:updateSideSheet()
	end
end

if fFlagEnableConsoleExpControls then
	function t:registerShortcut(p28)
		-- upvalues: t (ref)
		self._shortcutService:registerShortcut(p28)
		local idShortcut = self._shortcutService:getShortcut(p28.id)
		
		if idShortcut.integration and self._integrations[idShortcut.integration] then
			local integration = self._integrations[idShortcut.integration]
			
			if integration.availability:get() == t.AvailabilitySignal.Unavailable then
				idShortcut.availability:unavailable()
			end
			integration.availability:connect(function()
				-- upvalues: integration (ref), t (copy), idShortcut (ref)
				local var51 = integration.availability:get()
				
				if var51 == t.AvailabilitySignal.Unavailable then
					idShortcut.availability:unavailable()
					
					return
				elseif var51 == t.AvailabilitySignal.Available or var51 == t.AvailabilitySignal.Pinned then
					idShortcut.availability:available()
				end
			end)
		end
	end
	
	function t:activateShortcut(p29)
		-- upvalues: fFlagIntegrationsChromeShortcutTelemetryModule (ref)
		local var52 = self._shortcutService:getShortcut(p29)
		
		if var52.integration then
			if var52.activated then
				if fFlagIntegrationsChromeShortcutTelemetryModule then
					self._shortcutService:activateShortcut(p29)
					self._onIntegrationActivated:fire(var52.integration, { fromShortcut = true })
					
					return
				end
			elseif fFlagIntegrationsChromeShortcutTelemetryModule then
				self:activate(var52.integration, { fromShortcut = true })
				
				return
			end
			self:activate(var52.integration)
			
			return
		else
			self._shortcutService:activateShortcut(p29)
		end
	end
	
	function t:configureShortcutBar(p30, p31)
		self._shortcutService:configureShortcutBar(p30, p31)
	end
	
	function t:setShortcutBar(p32)
		self._shortcutService:setShortcutBar(p32)
	end
	
	function t:getCurrentShortcutBar()
		return self._currentShortcutBar
	end
	
	function t:getShortcutsFromBar(p33)
		return self._shortcutService:getShortcutsFromBar(p33, self._integrations)
	end
	
	function t:getCurrentShortcuts()
		return self:getShortcutsFromBar(self._currentShortcutBar:get())
	end
	
	function t:onShortcutBarChanged()
		return self._shortcutService.onShortcutBarChanged
	end
	
	function t:selectMenuIcon()
		self._triggerMenuIcon:fire()
	end
	
	function t:onTriggerMenuIcon()
		return self._triggerMenuIcon
	end
	
	function t:setHideShortcutBar(p34, p35)
		self._shortcutService:setHideShortcutBar(p34, p35)
	end
	
	function t:getHideShortcutBar()
		return self._shortcutService:getHideShortcutBar()
	end
end
if isInExperienceUIVREnabled then
	function t:onTriggerVRToggleButton()
		return self._triggerVRToggleButton
	end
	
	function t:showTopBar()
		return self._topBarVisibility:get()
	end
	
	function t:getTopBarVisibiity()
		return self._topBarVisibility
	end
	
	function t:connectTopBarVisibility(p36)
		self._topBarVisibility = p36
	end
end
function t:gesture(p37, p38, p39)
	if self._integrations[p37] then
		self._dragConnection[p37] = { connection = p38, inputObject = p39 }
	end
end

function t:withinCurrentTopLevelMenu(p40)
	for i, v in self._menuList:get() do
		if v.id == p40 then
			return v, i
		end
	end
	return nil, 0
end

function t:withinCurrentSubmenu(p41)
	local var53 = self._currentSubMenu:get()
	
	if not var53 then
		return false
	end
	local children = nil
	
	for i, v in self._menuList:get() do
		if v.id == var53 then
			children = v.children
			break
		end
	end
	if not children then
		return false
	end
	for i, v in children do
		if v.id == p41 then
			return true
		end
	end
	return false
end

if fFlagEnableSideSheet then
	function t:withinOpenSideSheet(p42)
		-- upvalues: getSideSheetVisibility (write), sideSheetPlacement (ref)
		if not getSideSheetVisibility() then
			return false
		end
		for i, v in self._integrations do
			if v.id == p42 and v.sideSheetPlacement ~= sideSheetPlacement.None then
				return true
			end
		end
		return false
	end
end
function t:windowPosition(p43)
	return self._windowPositions[p43]
end

function t:updateWindowPosition(p44, p45)
	-- upvalues: localStoreModule (ref)
	if localStoreModule.isEnabled() and self._integrations[p44] and self._integrations[p44].persistWindowState then
		local chromeWindowPosition = localStoreModule.loadForLocalPlayer("ChromeWindowPosition") or {}
		chromeWindowPosition[p44] = { p45.X.Scale, p45.X.Offset, p45.Y.Scale, p45.Y.Offset }
		localStoreModule.storeForLocalPlayer("ChromeWindowPosition", chromeWindowPosition)
	end
	self._windowPositions[p44] = p45
end

function t.getWindowStatusFromStore(_, p46)
	-- upvalues: localStoreModule (ref)
	return if localStoreModule.isEnabled() then (localStoreModule.loadForLocalPlayer("ChromeWindowStatus") or {})[p46] or false else nil
end

function t.getWindowPositionFromStore(_, p47)
	-- upvalues: localStoreModule (ref)
	if not localStoreModule.isEnabled() then
		return nil
	end
	local var55 = (localStoreModule.loadForLocalPlayer("ChromeWindowPosition") or {})[p47] or nil
	
	return if var55 then UDim2.new(var55[1], var55[2], var55[3], var55[4]) else nil
end

function t:activate(p48, p49)
	-- upvalues: fFlagIntegrationsChromeShortcutTelemetryModule (ref), fFlagEnableConsoleExpControls (ref)
	local var56 = nil
	
	if self._integrations[p48] then
		local activated = self._integrations[p48].activated
		
		if fFlagIntegrationsChromeShortcutTelemetryModule then
			self._onIntegrationActivated:fire(p48, p49)
		else
			self._onIntegrationActivated:fire(p48)
		end
		self:storeChromeInteracted()
		
		if activated then
			local ok, status = pcall(function()
				-- upvalues: activated (ref), self (ref), p48 (ref), fFlagEnableConsoleExpControls (copy)
				activated(self._integrations[p48])
				
				if not fFlagEnableConsoleExpControls then
					self:disableFocusNav()
				end
			end)
			
			if not ok then
				warn("ChromeService: activate error thrown for " .. p48)
				var56 = status
			end
		elseif self._subMenuConfig[p48] then
			self:toggleSubMenu(p48)
		end
		self:toggleWindow(p48)
		if self._currentSubMenu:get() ~= p48 then
			self._currentSubMenu:set(nil)
		end
	end
	if var56 then
		error(var56)
	end
end

function t:selectedItem()
	return self._selectedItem
end

function t:setSelected(p50)
	-- upvalues: userInputService (ref)
	local var57, var58 = self:withinCurrentTopLevelMenu(p50 or "")
	
	if not var57 then return end
	local lastInputType = userInputService:GetLastInputType()
	local var60 = self._currentSubMenu:get()
	
	if var60 and var60 ~= p50 and not (if lastInputType ~= Enum.UserInputType.MouseButton1 then lastInputType == Enum.UserInputType.Touch else true) then
		self:toggleSubMenu(var60)
	end
	self._selectedItemIdx = var58
	self._selectedItem:set(p50)
end

function t:setSelectedByOffset(p51)
	local var61 = self._menuList:get()
	local _, var62 = self:withinCurrentTopLevelMenu(self._selectedItem:get() or "")
	
	if var62 > 0 then
		self:setSelected(var61[math.clamp(var62 + p51, 1, #var61)].id)
	end
end

function t:repairSelected()
	if self._selectedItem:get() then
		local _, var63 = self:withinCurrentTopLevelMenu(self._selectedItem:get() or "")
		
		if var63 == 0 then
			var63 = self._selectedItemIdx
		end
		local var64 = self._menuList:get()
		self:setSelected(var64[math.clamp(var63, 1, #var64)].id)
	end
end

function t:configureOrderAlignment(p52)
	if self._orderAlignment:get() ~= p52 then
		self._orderAlignment:set(p52)
		self:updateMenuList()
	end
end

function t:orderAlignment()
	return self._orderAlignment
end

function t:setMenuAbsolutePosition(p53)
	if p53 ~= self._menuAbsolutePosition then
		self._menuAbsolutePosition = p53
		self._layout:set(createUnibarLayoutInfo(p53, self._menuAbsoluteSizeOpen))
	end
end

function t:setMenuAbsoluteSize(p54)
	if p54 ~= self._menuAbsoluteSizeOpen then
		self._menuAbsoluteSizeOpen = p54
		self._layout:set(createUnibarLayoutInfo(self._menuAbsolutePosition, p54))
	end
end

function t:layout()
	return self._layout
end

return t