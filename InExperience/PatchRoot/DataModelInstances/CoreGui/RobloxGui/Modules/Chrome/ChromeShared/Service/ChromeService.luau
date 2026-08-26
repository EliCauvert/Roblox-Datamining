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

function createUnibarLayoutInfo(p1, p2)
	return Rect.new(p1, p1 + p2)
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
	viewportUtilModule.viewport:connect(function(p1)
		-- upvalues: chromeDeprecateMRUs (copy), tbl (ref)
		if chromeDeprecateMRUs then
			tbl:updateWindowSizeSignals()
			
			return
		end
		tbl:updateScreenSize(p1.size, p1.isMobileDevice, p1.portraitOrientation, p1.tinyPortrait)
	end, true)
	
	if fFlagEnableConsoleExpControls then
		t_1._shortcutService.onShortcutBarChanged:connect(function(p1)
			-- upvalues: tbl (ref)
			tbl._currentShortcutBar:set(p1)
		end)
	end
	focusOnChromeSignal:connect(function(p1)
		-- upvalues: t_1 (ref), tbl (ref)
		if p1 and not t_1._subMenuConfig.nine_dot[p1] then
			tbl:setSelected(p1)
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

function t:updateScreenSize(_, p1, p2, p3)
	-- upvalues: constantsModule (ref)
	local var1 = if p1 then if p3 then constantsModule.MOBILE_TINY_PORTRAIT_SLOTS - constantsModule.CORE_SLOTS elseif p2 then constantsModule.MOBILE_PORTRAIT_SLOTS - constantsModule.CORE_SLOTS else constantsModule.MOBILE_LANDSCAPE_SLOTS - constantsModule.CORE_SLOTS else constantsModule.NON_MOBILE_SLOTS - constantsModule.CORE_SLOTS
	
	if var1 ~= self._mostRecentlyUsedAndPinnedLimit then
		self._mostRecentlyUsedAndPinnedLimit = var1
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

function t:toggleSubMenu(p1)
	-- upvalues: fFlagEnableSideSheet (ref), toggleSideSheet (write)
	if fFlagEnableSideSheet and toggleSideSheet then
		toggleSideSheet(true)
		
		return
	elseif not self._subMenuConfig[p1] then
		warn("Not a valid subMenuId:" .. p8)
		
		return
	elseif self._currentSubMenu:get() == p1 then
		self._currentSubMenu:set(nil)
		
		return
	end
	self._currentSubMenu:set(p1)
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

function t:toggleWindow(p1)
	-- upvalues: t (ref), localStoreModule (ref)
	if self._integrations[p1].components.Window then
		if self._integrationsStatus[p1] and self._integrationsStatus[p1] ~= t.IntegrationStatus.None and self._integrationsStatus[p1] ~= t.IntegrationStatus.Icon then
			self._integrationsStatus[p1] = t.IntegrationStatus.Icon
		else
			self._integrationsStatus[p1] = t.IntegrationStatus.Window
		end
		self._onIntegrationStatusChanged:fire(p1, self._integrationsStatus[p1])
	end
	if localStoreModule.isEnabled() and self._integrations[p1] and self._integrations[p1].persistWindowState then
		local chromeWindowStatus = localStoreModule.loadForLocalPlayer("ChromeWindowStatus") or {}
		chromeWindowStatus[p1] = self._integrationsStatus[p1] == t.IntegrationStatus.Window
		localStoreModule.storeForLocalPlayer("ChromeWindowStatus", chromeWindowStatus)
	end
	self:updateMenuList()
end

function t:isWindowOpen(p1)
	-- upvalues: t (ref)
	return self._integrations[p1].components.Window and self._integrationsStatus[p1] == t.IntegrationStatus.Window
end

function t:menuList()
	return self._menuList
end

function t:windowList()
	return self._windowList
end

function t:dragConnection(p1)
	return if self._integrations[p1] then self._dragConnection[p1] else nil
end

function t:updateLocalization(p1)
	local _ = ""
	local _ = ""
	self._localizedLabelKeys[p1.id] = {}
	self._localizedLabelKeys[p1.id].label = p1.label
	local label = p1.label
	local ok, status = pcall(function()
		-- upvalues: label (write), self (ref)
		label = self._localization:Format(label)
	end)
	
	if not ok then
		label = p1.label
		warn(status)
	end
	p1.label = label
	
	if p1.secondaryAction then
		self._localizedLabelKeys[p1.id].secondaryActionLabel = p1.secondaryAction.label
		local label_1 = p1.secondaryAction.label
		local ok_1, status_1 = pcall(function()
			-- upvalues: label_1 (write), self (ref)
			label_1 = self._localization:Format(label_1)
		end)
		
		if not ok_1 then
			label_1 = p1.secondaryAction.label
			warn(status_1)
		end
		p1.secondaryAction.label = label_1
	end
	return p1
end

function t:register(p1)
	-- upvalues: fFlagEnableSideSheet (ref), sideSheetPlacement (ref), t (ref), availabilitySignal (ref), notifySignal (ref), windowSizeSignalModule (ref), constantsModule (ref), fFlagEnableConsoleExpControls (ref), gamepadService (ref)
	if self._integrations[p1.id] then
		warn(string.format(p1.id .. "already registered", debug.traceback()))
		
		for i, v in self._integrationsConnections[p1.id] do
			v:disconnect()
		end
	end
	self._integrationsConnections[p1.id] = {}
	local id = self._integrationsConnections[p1.id]
	
	if fFlagEnableSideSheet and p1.sideSheetPlacement == nil then
		p1.sideSheetPlacement = sideSheetPlacement.Vertical
	end
	if p1.initialAvailability == nil then
		p1.initialAvailability = t.AvailabilitySignal.Unavailable
	end
	if p1.availability == nil then
		p1.availability = availabilitySignal.new(p1.initialAvailability or t.AvailabilitySignal.Unavailable)
	end
	if p1.notification == nil then
		p1.notification = notifySignal.new()
	end
	if p1.components == nil then
		p1.components = {}
	end
	if p1.availability then
		id[#id + 1] = p1.availability:connect(function()
			-- upvalues: self (ref), p1 (write)
			self:availabilityChanged(p1)
		end)
	end
	if p1.notification and not p1.notification:excludeFromTotalCounts() then
		id[#id + 1] = p1.notification:connect(function()
			-- upvalues: self (ref)
			self:updateNotificationTotals()
		end)
	end
	if p1.windowSize == nil and p1.components and p1.components.Window then
		p1.windowSize = windowSizeSignalModule.new()
	end
	if t:getWindowStatusFromStore(p1.id) and p1.persistWindowState or p1.windowDefaultOpen then
		self._integrationsStatus[p1.id] = t.IntegrationStatus.Window
		self._onIntegrationStatusChanged:fire(p1.id, self._integrationsStatus[p1.id])
	end
	local uDim2 = UDim2.fromOffset(constantsModule.MENU_ICON_SCREEN_SIDE_OFFSET, constantsModule.WINDOW_DEFAULT_PADDING)
	
	if p1.startingWindowPosition then
		uDim2 = if p1.persistWindowState then self:getWindowPositionFromStore(p1.id) or p1.startingWindowPosition else p1.startingWindowPosition
	end
	self._windowPositions[p1.id] = uDim2
	p1 = self:updateLocalization(p1)
	local var1 = p1
	self._integrations[p1.id] = var1
	
	if fFlagEnableConsoleExpControls and p1.selected then
		id[#id + 1] = self:selectedItem():connect(function(p2)
			-- upvalues: var1 (ref), gamepadService (copy), p1 (write)
			if var1.id == p2 then
				if gamepadService.GamepadCursorEnabled then return end
				p1.selected(var1)
			end
		end)
	end
	return var1
end

function t:createIconProps(p2, p3)
	-- upvalues: t_1 (ref)
	p3 = p3 or 0
	
	return if self._integrations[p2] then {
		isDivider = false,
		id = p2,
		children = {},
		order = p3,
		component = self._integrations[p2].components.Icon,
		integration = self._integrations[p2],
		activated = function()
			-- upvalues: self (ref), p2 (ref)
			self:activate(p2)
		end
	} else {
		id = p2,
		children = {},
		order = p3,
		activated = noop,
		integration = t_1
	}
end

function t:isIntegrationValid(p2)
	-- upvalues: t (ref)
	local var2 = self._integrations[p2]
	
	if var2 then
		local availability = var2.availability
		
		return availability and availability:get() ~= t.AvailabilitySignal.Unavailable
	end
	return false
end

function t:updateMenuList()
	-- upvalues: t_1 (ref), fFlagEnableSideSheet (ref), fFlagEnableChromeWindowsNotInMenu (ref)
	local var2 = 0
	local var3 = 0
	
	local function iconProps(p2)
		-- upvalues: var3 (write), self (ref)
		var3 += 1
		
		return self:createIconProps(p2, var3)
	end
	
	local function windowProps(p2)
		-- upvalues: var3 (write), self (ref), t_1 (copy)
		var3 += 1
		
		return if self._integrations[p2] then {
			id = p2,
			children = {},
			order = var3,
			component = self._integrations[p2].components.Window,
			activated = noop,
			integration = self._integrations[p2]
		} else {
			id = p2,
			children = {},
			order = var3,
			activated = noop,
			integration = t_1
		}
	end
	
	local function divider(_)
		-- upvalues: var2 (write), var3 (write), t_1 (copy)
		var2 += 1
		var3 += 1
		
		return {
			isDivider = true,
			id = "DIV" .. var27,
			order = var3,
			children = {},
			activated = noop,
			integration = t_1
		}
	end
	
	local function collectMenu(p2, p3, p4)
		-- upvalues: divider (ref), var2 (write), collectMenu (ref), fFlagEnableSideSheet (copy), self (ref), var3 (write), windowProps (ref), iconProps (ref)
		local var4 = 0
		
		for i, v in pairs(p2) do
			if type(v) == "table" then
				if not #p3.children then
					table.insert(p3.children, divider(var2))
				end
				if collectMenu(v, p3, p4) > 0 then
					table.insert(p3.children, divider(var2))
				end
			end
			if typeof(v) ~= "string" then
				error(`Only tables or strings should be passed into the items list, received {v} (at key {i})`)
			end
			if fFlagEnableSideSheet or not self._subMenuConfig[v] then
				if self:isIntegrationValid(v) then
					if self:isWindowOpen(v) then
						table.insert(p4, windowProps(v))
						table.insert(p3.children, iconProps(v))
						var4 += 1
					else
						table.insert(p3.children, iconProps(v))
						var4 += 1
					end
				end
			elseif self:isIntegrationValid(v) then
				var3 += 1
				local var5 = self:createIconProps(v, var3)
				var4 += 1
				collectMenu(self._subMenuConfig[v], var5, p4)
				
				if #var5.children > 0 then
					table.insert(p3.children, var5)
				end
			end
		end
		return var4
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
		local var6 = 0
		local t = {}
		local t_1 = {}
		local t_2 = {}
		local t_3 = {}
		
		local function addIntegration(p5)
			-- upvalues: self (ref), sideSheetPlacement (copy), t_1 (write), var6 (write), t_2 (ref), t_3 (ref), fIntSideSheetVariant (copy), t (write)
			local var7 = self._integrations[p5]
			
			if not var7 or var7.sideSheetPlacement == sideSheetPlacement.None or not self:isIntegrationValid(p5) then return end
			if var7.sideSheetPlacement == sideSheetPlacement.Unibar then
				table.insert(t_1, self:createIconProps(p5, var6))
				
				return
			elseif var7.sideSheetPlacement == sideSheetPlacement.Page then
				table.insert(t_2, self:createIconProps(p5, var6))
				
				return
			elseif var7.sideSheetPlacement == sideSheetPlacement.SessionAction then
				table.insert(t_3, self:createIconProps(p5, var6))
				
				return
			elseif var7.sideSheetPlacement == sideSheetPlacement.Vertical and fIntSideSheetVariant ~= 0 then
				table.insert(t_2, self:createIconProps(p5, var6))
				
				return
			end
			table.insert(t, self:createIconProps(p5, var6))
		end
		
		for i, v in self._menuConfig do
			for i_3, v_1 in v do
				var6 += 1
				addIntegration(v_1)
			end
		end
		for i, v_1 in self._subMenuConfig do
			for i_3, v_2 in v_1 do
				var6 += 1
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

function t:subMenuNotifications(p5)
	-- upvalues: notifySignal (ref)
	if not self._subMenuNotifications[p5] then
		self._subMenuNotifications[p5] = notifySignal.new(true)
	end
	return self._subMenuNotifications[p5]
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
	local var7 = 0
	
	for i, v in self._integrations do
		if v.availability:get() ~= t.AvailabilitySignal.Unavailable and v.availability:get() ~= t.AvailabilitySignal.Pinned and not v.notification:excludeFromTotalCounts() then
			local var8 = v.notification:get()
			
			if var8 and var8.type == "count" then
				assert(typeof(var8.value) == "number", "Expected count value to be number")
				var7 += var8.value
			end
		end
	end
	self._totalNotifications:fireCount(var7)
	
	for i_1, v_1 in self._subMenuNotifications do
		local var9 = self:withinCurrentTopLevelMenu(i_1)
		local var10 = 0
		
		if var9 then
			for i_2, v_2 in var9.children do
				if not self:withinCurrentTopLevelMenu(v_2.id) and v_2.integration.availability:get() ~= t.AvailabilitySignal.Unavailable and not v_2.integration.notification:excludeFromTotalCounts() then
					local var11 = v_2.integration.notification:get()
					
					if var11 and var11.type == "count" then
						assert(typeof(var11.value) == "number", "Expected count value to be number")
						var10 += var11.value
					end
				end
			end
			v_1:fireCount(var10)
		end
	end
end

function t:configureMenu(p5)
	self._menuConfig = p5
	self:updateNotificationTotals()
	self:updateMenuList()
end

function t:configureSubMenu(p5, p6)
	-- upvalues: notifySignal (ref), fFlagEnableSideSheet (ref)
	self._subMenuConfig[p5] = p6
	
	if not self._subMenuNotifications[p5] then
		self._subMenuNotifications[p5] = notifySignal.new(true)
	end
	self:updateNotificationTotals()
	self:updateMenuList()
	
	if fFlagEnableSideSheet then
		self:updateSideSheet()
	end
end

if fFlagEnableConsoleExpControls then
	function t:registerShortcut(p5)
		-- upvalues: t (ref)
		self._shortcutService:registerShortcut(p5)
		local idShortcut = self._shortcutService:getShortcut(p5.id)
		
		if idShortcut.integration and self._integrations[idShortcut.integration] then
			local integration = self._integrations[idShortcut.integration]
			
			if integration.availability:get() == t.AvailabilitySignal.Unavailable then
				idShortcut.availability:unavailable()
			end
			integration.availability:connect(function()
				-- upvalues: integration (ref), t (copy), idShortcut (ref)
				local var12 = integration.availability:get()
				
				if var12 == t.AvailabilitySignal.Unavailable then
					idShortcut.availability:unavailable()
					
					return
				elseif var12 == t.AvailabilitySignal.Available or var12 == t.AvailabilitySignal.Pinned then
					idShortcut.availability:available()
				end
			end)
		end
	end
	
	function t:activateShortcut(p5)
		-- upvalues: fFlagIntegrationsChromeShortcutTelemetryModule (ref)
		local var12 = self._shortcutService:getShortcut(p5)
		
		if var12.integration then
			if var12.activated then
				if fFlagIntegrationsChromeShortcutTelemetryModule then
					self._shortcutService:activateShortcut(p5)
					self._onIntegrationActivated:fire(var12.integration, { fromShortcut = true })
					
					return
				end
			elseif fFlagIntegrationsChromeShortcutTelemetryModule then
				self:activate(var12.integration, { fromShortcut = true })
				
				return
			end
			self:activate(var12.integration)
			
			return
		else
			self._shortcutService:activateShortcut(p5)
		end
	end
	
	function t:configureShortcutBar(p5, p6)
		self._shortcutService:configureShortcutBar(p5, p6)
	end
	
	function t:setShortcutBar(p5)
		self._shortcutService:setShortcutBar(p5)
	end
	
	function t:getCurrentShortcutBar()
		return self._currentShortcutBar
	end
	
	function t:getShortcutsFromBar(p5)
		return self._shortcutService:getShortcutsFromBar(p5, self._integrations)
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
	
	function t:setHideShortcutBar(p5, p6)
		self._shortcutService:setHideShortcutBar(p5, p6)
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
	
	function t:connectTopBarVisibility(p5)
		self._topBarVisibility = p5
	end
end
function t:gesture(p5, p6, p7)
	if self._integrations[p5] then
		self._dragConnection[p5] = { connection = p6, inputObject = p7 }
	end
end

function t:withinCurrentTopLevelMenu(p5)
	for i, v in self._menuList:get() do
		if v.id == p5 then
			return v, i
		end
	end
	return nil, 0
end

function t:withinCurrentSubmenu(p6)
	local var12 = self._currentSubMenu:get()
	
	if not var12 then
		return false
	end
	local children = nil
	
	for i, v in self._menuList:get() do
		if v.id == var12 then
			children = v.children
			break
		end
	end
	if not children then
		return false
	end
	for i, v in children do
		if v.id == p6 then
			return true
		end
	end
	return false
end

if fFlagEnableSideSheet then
	function t:withinOpenSideSheet(p7)
		-- upvalues: getSideSheetVisibility (write), sideSheetPlacement (ref)
		if not getSideSheetVisibility() then
			return false
		end
		for i, v in self._integrations do
			if v.id == p7 and v.sideSheetPlacement ~= sideSheetPlacement.None then
				return true
			end
		end
		return false
	end
end
function t:windowPosition(p7)
	return self._windowPositions[p7]
end

function t:updateWindowPosition(p7, p8)
	-- upvalues: localStoreModule (ref)
	if localStoreModule.isEnabled() and self._integrations[p7] and self._integrations[p7].persistWindowState then
		local chromeWindowPosition = localStoreModule.loadForLocalPlayer("ChromeWindowPosition") or {}
		chromeWindowPosition[p7] = { p8.X.Scale, p8.X.Offset, p8.Y.Scale, p8.Y.Offset }
		localStoreModule.storeForLocalPlayer("ChromeWindowPosition", chromeWindowPosition)
	end
	self._windowPositions[p7] = p8
end

function t.getWindowStatusFromStore(_, p7)
	-- upvalues: localStoreModule (ref)
	return if localStoreModule.isEnabled() then (localStoreModule.loadForLocalPlayer("ChromeWindowStatus") or {})[p7] or false else nil
end

function t.getWindowPositionFromStore(_, p7)
	-- upvalues: localStoreModule (ref)
	if not localStoreModule.isEnabled() then
		return nil
	end
	local var13 = (localStoreModule.loadForLocalPlayer("ChromeWindowPosition") or {})[p7] or nil
	
	return if var13 then UDim2.new(var13[1], var13[2], var13[3], var13[4]) else nil
end

function t:activate(p7, p8)
	-- upvalues: fFlagIntegrationsChromeShortcutTelemetryModule (ref), fFlagEnableConsoleExpControls (ref)
	local var13 = nil
	
	if self._integrations[p7] then
		local activated = self._integrations[p7].activated
		
		if fFlagIntegrationsChromeShortcutTelemetryModule then
			self._onIntegrationActivated:fire(p7, p8)
		else
			self._onIntegrationActivated:fire(p7)
		end
		self:storeChromeInteracted()
		
		if activated then
			local ok, status = pcall(function()
				-- upvalues: activated (ref), self (ref), p7 (ref), fFlagEnableConsoleExpControls (copy)
				activated(self._integrations[p7])
				
				if not fFlagEnableConsoleExpControls then
					self:disableFocusNav()
				end
			end)
			
			if not ok then
				warn("ChromeService: activate error thrown for " .. p48)
				var13 = status
			end
		elseif self._subMenuConfig[p7] then
			self:toggleSubMenu(p7)
		end
		self:toggleWindow(p7)
		if self._currentSubMenu:get() ~= p7 then
			self._currentSubMenu:set(nil)
		end
	end
	if var13 then
		error(var13)
	end
end

function t:selectedItem()
	return self._selectedItem
end

function t:setSelected(p7)
	-- upvalues: userInputService (ref)
	local var13, var14 = self:withinCurrentTopLevelMenu(p7 or "")
	
	if not var13 then return end
	local lastInputType = userInputService:GetLastInputType()
	local var15 = self._currentSubMenu:get()
	
	if var15 and var15 ~= p7 and not (if lastInputType ~= Enum.UserInputType.MouseButton1 then lastInputType == Enum.UserInputType.Touch else true) then
		self:toggleSubMenu(var15)
	end
	self._selectedItemIdx = var14
	self._selectedItem:set(p7)
end

function t:setSelectedByOffset(p7)
	local var13 = self._menuList:get()
	local _, var14 = self:withinCurrentTopLevelMenu(self._selectedItem:get() or "")
	
	if var14 > 0 then
		self:setSelected(var13[math.clamp(var14 + p7, 1, #var13)].id)
	end
end

function t:repairSelected()
	if self._selectedItem:get() then
		local _, var13 = self:withinCurrentTopLevelMenu(self._selectedItem:get() or "")
		
		if var13 == 0 then
			var13 = self._selectedItemIdx
		end
		local var14 = self._menuList:get()
		self:setSelected(var14[math.clamp(var13, 1, #var14)].id)
	end
end

function t:configureOrderAlignment(p7)
	if self._orderAlignment:get() ~= p7 then
		self._orderAlignment:set(p7)
		self:updateMenuList()
	end
end

function t:orderAlignment()
	return self._orderAlignment
end

function t:setMenuAbsolutePosition(p7)
	if p7 ~= self._menuAbsolutePosition then
		self._menuAbsolutePosition = p7
		self._layout:set(createUnibarLayoutInfo(p7, self._menuAbsoluteSizeOpen))
	end
end

function t:setMenuAbsoluteSize(p7)
	if p7 ~= self._menuAbsoluteSizeOpen then
		self._menuAbsoluteSizeOpen = p7
		self._layout:set(createUnibarLayoutInfo(self._menuAbsolutePosition, p7))
	end
end

function t:layout()
	return self._layout
end

return t