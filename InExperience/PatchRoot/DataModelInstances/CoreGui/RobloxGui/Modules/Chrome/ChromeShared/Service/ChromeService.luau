local chromeShared = script:FindFirstAncestor("ChromeShared")
local corePackagesService = game:GetService("CorePackages")
local localizationService = game:GetService("LocalizationService")
local userInputService = game:GetService("UserInputService")
local gamepadService = game:GetService("GamepadService")
local reverse = require(corePackagesService.Packages.LuauPolyfill).Array.reverse
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
local fFlagReverseUnibarModule = require(script.Parent.Parent.Parent.Flags.FFlagReverseUnibar)
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

function noop() --[[ line: 100 ]] end

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

function createUnibarLayoutInfo(p0, p1) --[[ line: 244 ]]
	return Rect.new(p0, p0 + p1)
end

function t.new() --[[ line: 248 ]]
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
	viewportUtilModule.viewport:connect(function(p2) --[[ line: 291 ]]
		-- upvalues: chromeDeprecateMRUs (copy), tbl (ref)
		if chromeDeprecateMRUs then
			tbl:updateWindowSizeSignals()
			
			return
		end
		tbl:updateScreenSize(p2.size, p2.isMobileDevice, p2.portraitOrientation, p2.tinyPortrait)
	end, true)
	
	if fFlagEnableConsoleExpControls then
		t_1._shortcutService.onShortcutBarChanged:connect(function(p3) --[[ line: 305 ]]
			-- upvalues: tbl (ref)
			tbl._currentShortcutBar:set(p3)
		end)
	end
	focusOnChromeSignal:connect(function(p4) --[[ line: 309 ]]
		-- upvalues: t_1 (ref), tbl (ref)
		if p4 and not t_1._subMenuConfig.nine_dot[p4] then
			tbl:setSelected(p4)
		end
		tbl:enableFocusNav()
	end)
	focusOffChromeSignal:connect(function() --[[ line: 316 ]]
		-- upvalues: tbl (ref), fFlagEnableConsoleExpControls (copy)
		tbl:disableFocusNav()
		
		if fFlagEnableConsoleExpControls then
			tbl:setShortcutBar(nil)
		end
	end)
	
	return tbl
end

function t.storeChromeInteracted(_) --[[ line: 328 ]]
	-- upvalues: localStoreModule (ref)
	if localStoreModule.isEnabled() then
		localStoreModule.storeForLocalPlayer("ChromeInteracted3", true)
	end
end

function t:updateScreenSize(_, p5, p6, p7) --[[ line: 334 ]]
	-- upvalues: constantsModule (ref)
	local var22 = if p5 then if p7 then constantsModule.MOBILE_TINY_PORTRAIT_SLOTS - constantsModule.CORE_SLOTS elseif p6 then constantsModule.MOBILE_PORTRAIT_SLOTS - constantsModule.CORE_SLOTS else constantsModule.MOBILE_LANDSCAPE_SLOTS - constantsModule.CORE_SLOTS else constantsModule.NON_MOBILE_SLOTS - constantsModule.CORE_SLOTS
	
	if var22 ~= self._mostRecentlyUsedAndPinnedLimit then
		self._mostRecentlyUsedAndPinnedLimit = var22
		self:updateMenuList()
		self:updateNotificationTotals()
	end
	self:updateWindowSizeSignals()
end

function t:updateWindowSizeSignals() --[[ line: 370 ]]
	for i, v in self._integrations do
		if v.windowSize then
			v.windowSize:updateConstraints()
		end
	end
end

function t:notificationIndicator() --[[ line: 378 ]]
	return self._notificationIndicator
end

function t:toggleSubMenu(p8) --[[ line: 382 ]]
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

function t:currentSubMenu() --[[ line: 402 ]]
	return self._currentSubMenu
end

function t:inFocusNav() --[[ line: 406 ]]
	return self._inFocusNav
end

function t:enableFocusNav() --[[ line: 410 ]]
	-- upvalues: gamepadService (ref), fFlagEnableConsoleExpControls (ref), constantsModule (ref)
	if gamepadService.GamepadCursorEnabled then return end
	if not self._inFocusNav:get() then
		self._inFocusNav:set(true)
	end
	if fFlagEnableConsoleExpControls then
		self:setShortcutBar(constantsModule.UNIBAR_SHORTCUTBAR_ID)
	end
end

function t:disableFocusNav() --[[ line: 423 ]]
	-- upvalues: gamepadService (ref)
	if gamepadService.GamepadCursorEnabled then return end
	if self._inFocusNav:get() then
		self._inFocusNav:set(false)
		self._selectedItem:set(nil)
		self._currentSubMenu:set(nil)
	end
end

function t:toggleWindow(p9) --[[ line: 435 ]]
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

function t:isWindowOpen(p10) --[[ line: 461 ]]
	-- upvalues: t (ref)
	return self._integrations[p10].components.Window and self._integrationsStatus[p10] == t.IntegrationStatus.Window
end

function t:menuList() --[[ line: 465 ]]
	return self._menuList
end

function t:windowList() --[[ line: 469 ]]
	return self._windowList
end

function t:dragConnection(p11) --[[ line: 473 ]]
	return if self._integrations[p11] then self._dragConnection[p11] else nil
end

function t:updateLocalization(p12) --[[ line: 481 ]]
	local _ = ""
	local _ = ""
	self._localizedLabelKeys[p12.id] = {}
	self._localizedLabelKeys[p12.id].label = p12.label
	local label = p12.label
	local ok, status = pcall(function() --[[ line: 492 ]]
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
		local ok_1, status_1 = pcall(function() --[[ line: 506 ]]
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

function t:register(p13) --[[ line: 521 ]]
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
		id[#id + 1] = p13.availability:connect(function() --[[ line: 556 ]]
			-- upvalues: self (ref), p13 (write)
			self:availabilityChanged(p13)
		end)
	end
	if p13.notification and not p13.notification:excludeFromTotalCounts() then
		id[#id + 1] = p13.notification:connect(function() --[[ line: 562 ]]
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
	local var25 = p13
	self._integrations[p13.id] = var25
	
	if fFlagEnableConsoleExpControls and p13.selected then
		id[#id + 1] = self:selectedItem():connect(function(p14) --[[ line: 596 ]]
			-- upvalues: var25 (ref), gamepadService (copy), p13 (write)
			if var25.id == p14 then
				if gamepadService.GamepadCursorEnabled then return end
				p13.selected(var25)
			end
		end)
	end
	return var25
end

function t:createIconProps(p15, p16) --[[ line: 609 ]]
	-- upvalues: t_1 (ref)
	p16 = p16 or 0
	
	return if self._integrations[p15] then {
		isDivider = false,
		id = p15,
		children = {},
		order = p16,
		component = self._integrations[p15].components.Icon,
		integration = self._integrations[p15],
		activated = function() --[[ line: 619 ]]
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

function reverseOrder(p17) --[[ line: 634 ]]
	local p17Count = #p17
	local t = {}
	
	for i = 1, p17Count do
		t[i] = p17[i].order
	end
	for i_1 = 1, p17Count do
		p17[i_1].order = t[p17Count - i_1 + 1]
	end
end

function t:isIntegrationValid(p18) --[[ line: 645 ]]
	-- upvalues: t (ref)
	local var29 = self._integrations[p18]
	
	if var29 then
		local availability = var29.availability
		
		return availability and availability:get() ~= t.AvailabilitySignal.Unavailable
	end
	return false
end

function t:updateMenuList() --[[ line: 658 ]]
	-- upvalues: t_1 (ref), fFlagEnableSideSheet (ref), fFlagReverseUnibarModule (ref), reverse (ref), fFlagEnableChromeWindowsNotInMenu (ref)
	local var30 = 0
	local var31 = 0
	
	local function iconProps(p19) --[[ line: 662 ]]
		-- upvalues: var31 (write), self (ref)
		var31 += 1
		
		return self:createIconProps(p19, var31)
	end
	
	local function windowProps(p20) --[[ line: 667 ]]
		-- upvalues: var31 (write), self (ref), t_1 (copy)
		var31 += 1
		
		return if self._integrations[p20] then {
			id = p20,
			children = {},
			order = var31,
			component = self._integrations[p20].components.Window,
			activated = noop,
			integration = self._integrations[p20]
		} else {
			id = p20,
			children = {},
			order = var31,
			activated = noop,
			integration = t_1
		}
	end
	
	local function divider(_) --[[ line: 689 ]]
		-- upvalues: var30 (write), var31 (write), t_1 (copy)
		var30 += 1
		var31 += 1
		
		return {
			isDivider = true,
			id = "DIV" .. var30,
			order = var31,
			children = {},
			activated = noop,
			integration = t_1
		}
	end
	
	local function collectMenu(p21, p22, p23) --[[ line: 702 ]]
		-- upvalues: divider (ref), var30 (write), collectMenu (ref), fFlagEnableSideSheet (copy), self (ref), var31 (write), windowProps (ref), iconProps (ref)
		local var39 = 0
		
		for i, v in pairs(p21) do
			if type(v) == "table" then
				if not #p22.children then
					table.insert(p22.children, divider(var30))
				end
				if collectMenu(v, p22, p23) > 0 then
					table.insert(p22.children, divider(var30))
				end
			end
			if typeof(v) ~= "string" then
				error(`Only tables or strings should be passed into the items list, received {v} (at key {i})`)
			end
			if fFlagEnableSideSheet or not self._subMenuConfig[v] then
				if self:isIntegrationValid(v) then
					if self:isWindowOpen(v) then
						table.insert(p23, windowProps(v))
						table.insert(p22.children, iconProps(v))
						var39 += 1
					else
						table.insert(p22.children, iconProps(v))
						var39 += 1
					end
				end
			elseif self:isIntegrationValid(v) then
				var31 += 1
				local var40 = self:createIconProps(v, var31)
				var39 += 1
				collectMenu(self._subMenuConfig[v], var40, p23)
				
				if #var40.children > 0 then
					table.insert(p22.children, var40)
				end
			end
		end
		return var39
	end
	
	local t = { children = {} }
	local t_2 = {}
	collectMenu(self._menuConfig, t, t_2)
	
	if #t.children and t.children[#t.children] and t.children[#t.children].isDivider then
		table.remove(t.children, #t.children)
	end
	if not fFlagReverseUnibarModule and self._orderAlignment:get() == Enum.HorizontalAlignment.Left then
		t.children = reverse(t.children)
		reverseOrder(t.children)
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
	function t:updateSideSheet() --[[ line: 783 ]]
		-- upvalues: sideSheetPlacement (ref), fFlagReverseUnibarModule (ref), reverse (ref), fIntSideSheetVariant (ref), registerSideSheetIntegrations (write)
		local var41 = 0
		local t = {}
		local t_1 = {}
		local t_2 = {}
		local t_3 = {}
		
		local function addIntegration(p24) --[[ line: 790 ]]
			-- upvalues: self (ref), sideSheetPlacement (copy), t_1 (write), var41 (write), t_2 (ref), t_3 (ref), t (write)
			local var47 = self._integrations[p24]
			
			if not var47 or var47.sideSheetPlacement == sideSheetPlacement.None or not self:isIntegrationValid(p24) then return end
			if var47.sideSheetPlacement == sideSheetPlacement.Unibar then
				table.insert(t_1, self:createIconProps(p24, var41))
				
				return
			elseif var47.sideSheetPlacement == sideSheetPlacement.Page then
				table.insert(t_2, self:createIconProps(p24, var41))
				
				return
			elseif var47.sideSheetPlacement == sideSheetPlacement.SessionAction then
				table.insert(t_3, self:createIconProps(p24, var41))
				
				return
			end
			table.insert(t, self:createIconProps(p24, var41))
		end
		
		for i, v in self._menuConfig do
			for i_3, v_1 in v do
				var41 += 1
				addIntegration(v_1)
			end
		end
		for i, v_1 in self._subMenuConfig do
			for i_3, v_2 in v_1 do
				var41 += 1
				addIntegration(v_2)
			end
		end
		if not fFlagReverseUnibarModule and self._orderAlignment:get() == Enum.HorizontalAlignment.Left then
			t_1 = reverse(t_1)
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
function t:availabilityChanged(_) --[[ line: 849 ]]
	-- upvalues: fFlagEnableSideSheet (ref)
	self:updateNotificationTotals()
	self:updateMenuList()
	
	if fFlagEnableSideSheet then
		self:updateSideSheet()
	end
end

function t:subMenuNotifications(p25) --[[ line: 857 ]]
	-- upvalues: notifySignal (ref)
	if not self._subMenuNotifications[p25] then
		self._subMenuNotifications[p25] = notifySignal.new(true)
	end
	return self._subMenuNotifications[p25]
end

function t:totalNotifications() --[[ line: 864 ]]
	return self._totalNotifications
end

function t:onIntegrationRegistered() --[[ line: 868 ]]
	return self._onIntegrationRegistered
end

function t:onIntegrationActivated() --[[ line: 872 ]]
	return self._onIntegrationActivated
end

function t:onIntegrationHovered() --[[ line: 876 ]]
	return self._onIntegrationHovered
end

function t:onIntegrationStatusChanged() --[[ line: 880 ]]
	return self._onIntegrationStatusChanged
end

function t:integrations() --[[ line: 884 ]]
	return self._integrations
end

function t:updateNotificationTotals() --[[ line: 888 ]]
	-- upvalues: t (ref)
	local var48 = 0
	
	for i, v in self._integrations do
		if v.availability:get() ~= t.AvailabilitySignal.Unavailable and v.availability:get() ~= t.AvailabilitySignal.Pinned and not v.notification:excludeFromTotalCounts() then
			local var52 = v.notification:get()
			
			if var52 and var52.type == "count" then
				assert(typeof(var52.value) == "number", "Expected count value to be number")
				var48 += var52.value
			end
		end
	end
	self._totalNotifications:fireCount(var48)
	
	for i_1, v_1 in self._subMenuNotifications do
		local var49 = self:withinCurrentTopLevelMenu(i_1)
		local var50 = 0
		
		if var49 then
			for i_2, v_2 in var49.children do
				if not self:withinCurrentTopLevelMenu(v_2.id) and v_2.integration.availability:get() ~= t.AvailabilitySignal.Unavailable and not v_2.integration.notification:excludeFromTotalCounts() then
					local var51 = v_2.integration.notification:get()
					
					if var51 and var51.type == "count" then
						assert(typeof(var51.value) == "number", "Expected count value to be number")
						var50 += var51.value
					end
				end
			end
			v_1:fireCount(var50)
		end
	end
end

function t:configureMenu(p26) --[[ line: 932 ]]
	self._menuConfig = p26
	self:updateNotificationTotals()
	self:updateMenuList()
end

function t:configureSubMenu(p27, p28) --[[ line: 938 ]]
	-- upvalues: notifySignal (ref), fFlagEnableSideSheet (ref)
	self._subMenuConfig[p27] = p28
	
	if not self._subMenuNotifications[p27] then
		self._subMenuNotifications[p27] = notifySignal.new(true)
	end
	self:updateNotificationTotals()
	self:updateMenuList()
	
	if fFlagEnableSideSheet then
		self:updateSideSheet()
	end
end

if fFlagEnableConsoleExpControls then
	function t:registerShortcut(p29) --[[ line: 951 ]]
		-- upvalues: t (ref)
		self._shortcutService:registerShortcut(p29)
		local idShortcut = self._shortcutService:getShortcut(p29.id)
		
		if idShortcut.integration and self._integrations[idShortcut.integration] then
			local integration = self._integrations[idShortcut.integration]
			
			if integration.availability:get() == t.AvailabilitySignal.Unavailable then
				idShortcut.availability:unavailable()
			end
			integration.availability:connect(function() --[[ line: 959 ]]
				-- upvalues: integration (ref), t (copy), idShortcut (ref)
				local var54 = integration.availability:get()
				
				if var54 == t.AvailabilitySignal.Unavailable then
					idShortcut.availability:unavailable()
					
					return
				elseif var54 == t.AvailabilitySignal.Available or var54 == t.AvailabilitySignal.Pinned then
					idShortcut.availability:available()
				end
			end)
		end
	end
	
	function t:activateShortcut(p30) --[[ line: 973 ]]
		-- upvalues: fFlagIntegrationsChromeShortcutTelemetryModule (ref)
		local var55 = self._shortcutService:getShortcut(p30)
		
		if var55.integration then
			if var55.activated then
				if fFlagIntegrationsChromeShortcutTelemetryModule then
					self._shortcutService:activateShortcut(p30)
					self._onIntegrationActivated:fire(var55.integration, { fromShortcut = true })
					
					return
				end
			elseif fFlagIntegrationsChromeShortcutTelemetryModule then
				self:activate(var55.integration, { fromShortcut = true })
				
				return
			end
			self:activate(var55.integration)
			
			return
		else
			self._shortcutService:activateShortcut(p30)
		end
	end
	
	function t:configureShortcutBar(p31, p32) --[[ line: 993 ]]
		self._shortcutService:configureShortcutBar(p31, p32)
	end
	
	function t:setShortcutBar(p33) --[[ line: 997 ]]
		self._shortcutService:setShortcutBar(p33)
	end
	
	function t:getCurrentShortcutBar() --[[ line: 1001 ]]
		return self._currentShortcutBar
	end
	
	function t:getShortcutsFromBar(p34) --[[ line: 1005 ]]
		return self._shortcutService:getShortcutsFromBar(p34, self._integrations)
	end
	
	function t:getCurrentShortcuts() --[[ line: 1009 ]]
		return self:getShortcutsFromBar(self._currentShortcutBar:get())
	end
	
	function t:onShortcutBarChanged() --[[ line: 1013 ]]
		return self._shortcutService.onShortcutBarChanged
	end
	
	function t:selectMenuIcon() --[[ line: 1017 ]]
		self._triggerMenuIcon:fire()
	end
	
	function t:onTriggerMenuIcon() --[[ line: 1021 ]]
		return self._triggerMenuIcon
	end
	
	function t:setHideShortcutBar(p35, p36) --[[ line: 1025 ]]
		self._shortcutService:setHideShortcutBar(p35, p36)
	end
	
	function t:getHideShortcutBar() --[[ line: 1029 ]]
		return self._shortcutService:getHideShortcutBar()
	end
end
if isInExperienceUIVREnabled then
	function t:onTriggerVRToggleButton() --[[ line: 1035 ]]
		return self._triggerVRToggleButton
	end
	
	function t:showTopBar() --[[ line: 1039 ]]
		return self._topBarVisibility:get()
	end
	
	function t:getTopBarVisibiity() --[[ line: 1043 ]]
		return self._topBarVisibility
	end
	
	function t:connectTopBarVisibility(p37) --[[ line: 1047 ]]
		self._topBarVisibility = p37
	end
end
function t:gesture(p38, p39, p40) --[[ line: 1052 ]]
	if self._integrations[p38] then
		self._dragConnection[p38] = { connection = p39, inputObject = p40 }
	end
end

function t:withinCurrentTopLevelMenu(p41) --[[ line: 1065 ]]
	for i, v in self._menuList:get() do
		if v.id == p41 then
			return v, i
		end
	end
	return nil, 0
end

function t:withinCurrentSubmenu(p42) --[[ line: 1075 ]]
	local var56 = self._currentSubMenu:get()
	
	if not var56 then
		return false
	end
	local children = nil
	
	for i, v in self._menuList:get() do
		if v.id == var56 then
			children = v.children
			break
		end
	end
	if not children then
		return false
	end
	for i, v in children do
		if v.id == p42 then
			return true
		end
	end
	return false
end

if fFlagEnableSideSheet then
	function t:withinOpenSideSheet(p43) --[[ line: 1105 ]]
		-- upvalues: getSideSheetVisibility (write), sideSheetPlacement (ref)
		if not getSideSheetVisibility() then
			return false
		end
		for i, v in self._integrations do
			if v.id == p43 and v.sideSheetPlacement ~= sideSheetPlacement.None then
				return true
			end
		end
		return false
	end
end
function t:windowPosition(p44) --[[ line: 1120 ]]
	return self._windowPositions[p44]
end

function t:updateWindowPosition(p45, p46) --[[ line: 1124 ]]
	-- upvalues: localStoreModule (ref)
	if localStoreModule.isEnabled() and self._integrations[p45] and self._integrations[p45].persistWindowState then
		local chromeWindowPosition = localStoreModule.loadForLocalPlayer("ChromeWindowPosition") or {}
		chromeWindowPosition[p45] = { p46.X.Scale, p46.X.Offset, p46.Y.Scale, p46.Y.Offset }
		localStoreModule.storeForLocalPlayer("ChromeWindowPosition", chromeWindowPosition)
	end
	self._windowPositions[p45] = p46
end

function t.getWindowStatusFromStore(_, p47) --[[ line: 1137 ]]
	-- upvalues: localStoreModule (ref)
	return if localStoreModule.isEnabled() then (localStoreModule.loadForLocalPlayer("ChromeWindowStatus") or {})[p47] or false else nil
end

function t.getWindowPositionFromStore(_, p48) --[[ line: 1147 ]]
	-- upvalues: localStoreModule (ref)
	if not localStoreModule.isEnabled() then
		return nil
	end
	local var58 = (localStoreModule.loadForLocalPlayer("ChromeWindowPosition") or {})[p48] or nil
	
	return if var58 then UDim2.new(var58[1], var58[2], var58[3], var58[4]) else nil
end

function t:activate(p49, p50) --[[ line: 1158 ]]
	-- upvalues: fFlagIntegrationsChromeShortcutTelemetryModule (ref), fFlagEnableConsoleExpControls (ref)
	local var59 = nil
	
	if self._integrations[p49] then
		local activated = self._integrations[p49].activated
		
		if fFlagIntegrationsChromeShortcutTelemetryModule then
			self._onIntegrationActivated:fire(p49, p50)
		else
			self._onIntegrationActivated:fire(p49)
		end
		self:storeChromeInteracted()
		
		if activated then
			local ok, status = pcall(function() --[[ line: 1174 ]]
				-- upvalues: activated (ref), self (ref), p49 (ref), fFlagEnableConsoleExpControls (copy)
				activated(self._integrations[p49])
				
				if not fFlagEnableConsoleExpControls then
					self:disableFocusNav()
				end
			end)
			
			if not ok then
				warn("ChromeService: activate error thrown for " .. p49)
				var59 = status
			end
		elseif self._subMenuConfig[p49] then
			self:toggleSubMenu(p49)
		end
		self:toggleWindow(p49)
		if self._currentSubMenu:get() ~= p49 then
			self._currentSubMenu:set(nil)
		end
	end
	if var59 then
		error(var59)
	end
end

function t:selectedItem() --[[ line: 1202 ]]
	return self._selectedItem
end

function t:setSelected(p51) --[[ line: 1206 ]]
	-- upvalues: userInputService (ref)
	local var60, var61 = self:withinCurrentTopLevelMenu(p51 or "")
	
	if not var60 then return end
	local lastInputType = userInputService:GetLastInputType()
	local var63 = self._currentSubMenu:get()
	
	if var63 and var63 ~= p51 and not (if lastInputType ~= Enum.UserInputType.MouseButton1 then lastInputType == Enum.UserInputType.Touch else true) then
		self:toggleSubMenu(var63)
	end
	self._selectedItemIdx = var61
	self._selectedItem:set(p51)
end

function t:setSelectedByOffset(p52) --[[ line: 1224 ]]
	local var64 = self._menuList:get()
	local _, var65 = self:withinCurrentTopLevelMenu(self._selectedItem:get() or "")
	
	if var65 > 0 then
		self:setSelected(var64[math.clamp(var65 + p52, 1, #var64)].id)
	end
end

function t:repairSelected() --[[ line: 1234 ]]
	if self._selectedItem:get() then
		local _, var66 = self:withinCurrentTopLevelMenu(self._selectedItem:get() or "")
		
		if var66 == 0 then
			var66 = self._selectedItemIdx
		end
		local var67 = self._menuList:get()
		self:setSelected(var67[math.clamp(var66, 1, #var67)].id)
	end
end

function t:configureOrderAlignment(p53) --[[ line: 1248 ]]
	if self._orderAlignment:get() ~= p53 then
		self._orderAlignment:set(p53)
		self:updateMenuList()
	end
end

function t:orderAlignment() --[[ line: 1255 ]]
	return self._orderAlignment
end

function t:setMenuAbsolutePosition(p54) --[[ line: 1259 ]]
	if p54 ~= self._menuAbsolutePosition then
		self._menuAbsolutePosition = p54
		self._layout:set(createUnibarLayoutInfo(p54, self._menuAbsoluteSizeOpen))
	end
end

function t:setMenuAbsoluteSize(p55) --[[ line: 1266 ]]
	if p55 ~= self._menuAbsoluteSizeOpen then
		self._menuAbsoluteSizeOpen = p55
		self._layout:set(createUnibarLayoutInfo(self._menuAbsolutePosition, p55))
	end
end

function t:layout() --[[ line: 1273 ]]
	return self._layout
end

return t