local ChromeShared = script:FindFirstAncestor("ChromeShared")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local RbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local PlayerGui = game:GetService("Players").LocalPlayer:FindFirstChildOfClass("PlayerGui")
local CryoModule = require(CorePackages.Packages.Cryo)
local ServiceModule = require(ChromeShared.Service)
local ConstantsModule = require(ChromeShared.Unibar.Constants)
local _ = require(CorePackages.Workspace.Packages.Chrome)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableSideSheet = SharedFlagsModule.FFlagEnableSideSheet
local FFlagChromeActivatedMappedSignal = SharedFlagsModule.FFlagChromeActivatedMappedSignal
local FFlagIntegrationsChromeShortcutTelemetryModule = require(ChromeShared.Parent.Flags.FFlagIntegrationsChromeShortcutTelemetry)
local TrackerModule = require(ChromeShared.Analytics.Tracker)
local ChromeAnalyticsModule = {}
ChromeAnalyticsModule.__index = ChromeAnalyticsModule

local function getDynamicEventProps()
	-- upvalues: PlayerGui (copy), ConstantsModule (copy), UserInputService (copy)
	return {
		screen_orientation = if PlayerGui then ConstantsModule.ANALYTICS.SCREEN_ORIENTATION_MAP[PlayerGui.CurrentScreenOrientation] or tostring(PlayerGui.CurrentScreenOrientation) else "Unknown",
		last_input_device = ConstantsModule.ANALYTICS.INPUT_TYPE_MAP[UserInputService:GetLastInputType()] or tostring(UserInputService:GetLastInputType())
	}
end

local function _(Text, Text1): string
	return Text .. Text1
end

local _ = function(p1)
	-- upvalues: ServiceModule (copy)
	return ServiceModule:integrations()[p1]
end

local _ = function(p1)
	-- upvalues: FFlagEnableSideSheet (copy), ServiceModule (copy)
	return if FFlagEnableSideSheet and ServiceModule:withinOpenSideSheet(p1) then "sidesheet" elseif ServiceModule:withinCurrentSubmenu(p1) then ServiceModule:currentSubMenu():get() elseif ServiceModule:withinCurrentTopLevelMenu(p1) then "unibar" else "unknown"
end

function ChromeAnalyticsModule.new()
	-- upvalues: RbxAnalyticsService (copy), TrackerModule (copy), ChromeAnalyticsModule (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), ServiceModule (copy), CryoModule (copy), getDynamicEventProps (copy), GuiService (copy), FFlagIntegrationsChromeShortcutTelemetryModule (copy)
	local self = setmetatable({
		_target = "client",
		_context = "chrome",
		_defaultProps = {
			screen_width = 0,
			screen_height = 0,
			is_game_menu_opened = false,
			universeid = tostring(game.GameId),
			placeid = tostring(game.PlaceId),
			sessionid = RbxAnalyticsService:GetSessionId()
		},
		_tracker = TrackerModule.new()
	}, ChromeAnalyticsModule)
	
	if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then
		self._defaultProps.playsessionid = RbxAnalyticsService:GetPlaySessionId()
	end
	function self._observeIntegration(Id)
		-- upvalues: ServiceModule (upval), self (copy)
		local IntegrationsResultEntry = ServiceModule:integrations()[Id]
		
		if IntegrationsResultEntry and IntegrationsResultEntry.windowSize then
			self._tracker:set("window_size_" .. Id, IntegrationsResultEntry.windowSize:get())
			IntegrationsResultEntry.windowSize:connect(function(p1)
				-- upvalues: IntegrationsResultEntry (copy), self (upval), Id (copy)
				if typeof(p1) ~= "UDim2" then return end
				local GetResult = IntegrationsResultEntry.windowSize:get()
				local Text = "window_size_" .. Id
				
				if self._tracker:get("window_status_" .. Id) == 1 then
					if self._tracker:get(Text) then
						self:onWindowResize(Id, GetResult)
					end
					self._tracker:set(Text, GetResult)
				end
			end)
		end
	end
	
	function self._resetWindowTrackers(Text)
		-- upvalues: self (copy)
		self._tracker:reset("window_dposition_" .. Text)
		self._tracker:reset("window_position_" .. Text)
		self._tracker:reset("window_size_" .. Text)
		self._tracker:reset("window_drag_" .. Text)
		self._tracker:reset("window_status_" .. Text)
	end
	
	function self._defaultWindowTrackers(Text)
		-- upvalues: self (copy)
		self._resetWindowTrackers(Text)
		self._tracker:startTime("window_time_" .. Text)
		self._tracker:set("window_status_" .. Text, 1)
	end
	
	function self._sendEvent(ICONACTIVATED, p1)
		-- upvalues: CryoModule (upval), getDynamicEventProps (upval), self (copy), RbxAnalyticsService (upval)
		RbxAnalyticsService:SendEventDeferred(self._target, self._context, ICONACTIVATED, (CryoModule.Dictionary.join(getDynamicEventProps(), self._defaultProps, p1 or {})))
	end
	
	function self._calculateWindowAbsolutePosition(Vector, GetResult): Vector2
		-- upvalues: self (copy)
		return Vector2.new(Vector.X.Scale * self._defaultProps.screen_width + Vector.X.Offset - GetResult.Width.Offset / 2, Vector.Y.Scale * self._defaultProps.screen_height + Vector.Y.Offset - GetResult.Height.Offset / 2)
	end
	
	function self._setWindowLastPosition(Integration_id, Vector)
		-- upvalues: self (copy)
		self._tracker:set("window_position_" .. Integration_id, Vector)
	end
	
	GuiService.MenuOpened:Connect(function()
		-- upvalues: self (copy)
		self._defaultProps.is_game_menu_opened = not self._defaultProps.is_game_menu_opened
	end)
	
	for _, value in ServiceModule:integrations() do
		self._observeIntegration(value.id)
	end
	ServiceModule:onIntegrationRegistered():connect(function(p1)
		-- upvalues: self (copy)
		self._observeIntegration(p1)
	end)
	ServiceModule:onIntegrationActivated():connect(function(Integration_id, p1)
		-- upvalues: FFlagIntegrationsChromeShortcutTelemetryModule (upval), self (copy)
		if FFlagIntegrationsChromeShortcutTelemetryModule then
			self:onIconActivated(Integration_id, p1)
			
			return
		else
			self:onIconActivated(Integration_id)
		end
	end)
	ServiceModule:onIntegrationStatusChanged():connect(function(Integration_id, Window)
		-- upvalues: ServiceModule (upval), self (copy)
		local IntegrationsResultEntry = ServiceModule:integrations()[Integration_id]
		
		if IntegrationsResultEntry and IntegrationsResultEntry.components.Window then
			if Window == ServiceModule.IntegrationStatus.Window then
				self:onWindowOpened(Integration_id)
				
				return
			end
			self:onWindowClosed(Integration_id)
		end
	end)
	
	return self
end

function ChromeAnalyticsModule:setScreenSize(Vector)
	self._defaultProps.screen_width = Vector.X
	self._defaultProps.screen_height = Vector.Y
	
	return nil
end

function ChromeAnalyticsModule:onIconActivated(Integration_id, p1)
	-- upvalues: ServiceModule (copy), FFlagChromeActivatedMappedSignal (copy), ConstantsModule (copy), FFlagEnableSideSheet (copy), FFlagIntegrationsChromeShortcutTelemetryModule (copy)
	local IntegrationsResultEntry = ServiceModule:integrations()[Integration_id]
	
	if IntegrationsResultEntry then
		local GetResult = IntegrationsResultEntry.notification:get()
		self._sendEvent(ConstantsModule.ANALYTICS.ICON_ACTIVATED, {
			integration_id = Integration_id,
			source = if FFlagEnableSideSheet and ServiceModule:withinOpenSideSheet(Integration_id) then "sidesheet" elseif ServiceModule:withinCurrentSubmenu(Integration_id) then ServiceModule:currentSubMenu():get() elseif ServiceModule:withinCurrentTopLevelMenu(Integration_id) then "unibar" else "unknown",
			notification_count = GetResult.type == "count" and tonumber(GetResult.value) or 0,
			is_toggle_on = if IntegrationsResultEntry.isActivated then if FFlagChromeActivatedMappedSignal then not IntegrationsResultEntry.isActivated:get() else not IntegrationsResultEntry.isActivated() else nil,
			used_shortcut = if FFlagIntegrationsChromeShortcutTelemetryModule and p1 then p1.fromShortcut or false else nil
		})
	end
	return nil
end

function ChromeAnalyticsModule:onIconTouchBegan(Text)
	self._tracker:set("icon_drag_" .. Text, 1)
	
	return nil
end

function ChromeAnalyticsModule:onIconDrag(Integration_id)
	-- upvalues: ConstantsModule (copy), FFlagEnableSideSheet (copy), ServiceModule (copy)
	local Text = "icon_drag_" .. Integration_id
	
	if self._tracker:get(Text) == 1 then
		self._tracker:set(Text, 2)
		self._sendEvent(ConstantsModule.ANALYTICS.ICON_DRAG_START, {
			integration_id = Integration_id,
			source = if FFlagEnableSideSheet and ServiceModule:withinOpenSideSheet(Integration_id) then "sidesheet" elseif ServiceModule:withinCurrentSubmenu(Integration_id) then ServiceModule:currentSubMenu():get() elseif ServiceModule:withinCurrentTopLevelMenu(Integration_id) then "unibar" else "unknown"
		})
	end
	return nil
end

function ChromeAnalyticsModule:onIconTouchEnded(Integration_id, Vector, Will_reposition)
	-- upvalues: ServiceModule (copy), ConstantsModule (copy), FFlagEnableSideSheet (copy)
	local Text = "icon_drag_" .. Integration_id
	local GetResult = self._tracker:get(Text)
	local IntegrationsResultEntry = ServiceModule:integrations()[Integration_id]
	
	if IntegrationsResultEntry and IntegrationsResultEntry.windowSize and GetResult == 2 then
		self._tracker:reset(Text)
		self._setWindowLastPosition(Integration_id, Vector)
		local GetResult1 = IntegrationsResultEntry.windowSize:get()
		self._sendEvent(ConstantsModule.ANALYTICS.ICON_DRAG_END, {
			integration_id = Integration_id,
			source = if FFlagEnableSideSheet and ServiceModule:withinOpenSideSheet(Integration_id) then "sidesheet" elseif ServiceModule:withinCurrentSubmenu(Integration_id) then ServiceModule:currentSubMenu():get() elseif ServiceModule:withinCurrentTopLevelMenu(Integration_id) then "unibar" else "unknown",
			window_position_x = Vector.X,
			window_position_y = Vector.Y,
			window_width = GetResult1.Width.Offset,
			window_height = GetResult1.Height.Offset,
			will_reposition = Will_reposition
		})
	end
	return nil
end

function ChromeAnalyticsModule:onWindowOpened(Integration_id)
	-- upvalues: ServiceModule (copy), ConstantsModule (copy)
	local IntegrationsResultEntry = ServiceModule:integrations()[Integration_id]
	local GetResult = self._tracker:get("window_status_" .. Integration_id)
	
	if IntegrationsResultEntry and GetResult ~= 1 then
		self._defaultWindowTrackers(Integration_id)
		
		if not self._tracker:get("window_dposition_" .. Integration_id) and IntegrationsResultEntry.windowSize then
			local GetResult1 = IntegrationsResultEntry.windowSize:get()
			
			if GetResult1 then
				self:setWindowDefaultPosition(Integration_id, (self._calculateWindowAbsolutePosition(ServiceModule:windowPosition(IntegrationsResultEntry.id) or (IntegrationsResultEntry.startingWindowPosition or UDim2.fromOffset(0, 0)), GetResult1)))
			end
		end
		self._sendEvent(ConstantsModule.ANALYTICS.WINDOW_OPENED, { integration_id = Integration_id })
	end
	return nil
end

function ChromeAnalyticsModule:onWindowClosed(Integration_id)
	-- upvalues: ConstantsModule (copy)
	if self._tracker:get("window_status_" .. Integration_id) == 1 then
		self._sendEvent(ConstantsModule.ANALYTICS.WINDOW_CLOSED, {
			integration_id = Integration_id,
			total_open_time = self._tracker:finishTime("window_time_" .. Integration_id)
		})
		self._resetWindowTrackers(Integration_id)
	end
	return nil
end

function ChromeAnalyticsModule:onWindowTouchBegan(Text, _)
	-- upvalues: ServiceModule (copy)
	local IntegrationsResultEntry = ServiceModule:integrations()[Text]
	
	if IntegrationsResultEntry and IntegrationsResultEntry.windowSize then
		self._tracker:set("window_drag_" .. Text, 1)
	end
	return nil
end

function ChromeAnalyticsModule:onWindowDrag(Text, Vector)
	-- upvalues: ServiceModule (copy), ConstantsModule (copy)
	local Text1 = "window_drag_" .. Text
	local GetResult = self._tracker:get(Text1)
	local IntegrationsResultEntry = ServiceModule:integrations()[Text]
	
	if IntegrationsResultEntry and IntegrationsResultEntry.windowSize and GetResult == 1 then
		local GetResult1 = self._tracker:get("window_position_" .. Text)
		
		if GetResult1 then
			local _Vector2 = Vector2.new(Vector.X - GetResult1.X, Vector.Y - GetResult1.Y)
			
			if _Vector2.X ~= 0 or _Vector2.Y ~= 0 then
				self._tracker:set(Text1, 2)
				local GetResult11 = IntegrationsResultEntry.windowSize:get()
				self._sendEvent(ConstantsModule.ANALYTICS.WINDOW_DRAG_START, {
					integration_id = Text,
					position_x = GetResult1.X,
					position_y = GetResult1.Y,
					width = GetResult11.Width.Offset,
					height = GetResult11.Height.Offset,
					is_starting_position = self._tracker:get("window_dposition_" .. Text) == GetResult1
				})
			end
		end
	end
	return nil
end

function ChromeAnalyticsModule:onWindowTouchEnded(Integration_id, Vector, Will_autoposition)
	-- upvalues: ServiceModule (copy), ConstantsModule (copy)
	local IntegrationsResultEntry = ServiceModule:integrations()[Integration_id]
	
	if self._tracker:get("icon_drag_" .. Integration_id) == 2 then
		return self:onIconTouchEnded(Integration_id, Vector, Will_autoposition)
	end
	local Text = "window_drag_" .. Integration_id
	local GetResult = self._tracker:get(Text)
	
	if IntegrationsResultEntry and IntegrationsResultEntry.windowSize and GetResult == 2 then
		local GetResult1 = IntegrationsResultEntry.windowSize:get()
		self._tracker:reset(Text)
		self._setWindowLastPosition(Integration_id, Vector)
		self._sendEvent(ConstantsModule.ANALYTICS.WINDOW_DRAG_END, {
			integration_id = Integration_id,
			position_x = Vector.X,
			position_y = Vector.Y,
			width = GetResult1.Width.Offset,
			height = GetResult1.Height.Offset,
			will_autoposition = Will_autoposition
		})
	end
	return nil
end

function ChromeAnalyticsModule:setWindowDefaultPosition(Integration_id, WindowAbsolutePosition)
	self._tracker:set("window_dposition_" .. Integration_id, WindowAbsolutePosition)
	self._setWindowLastPosition(Integration_id, WindowAbsolutePosition)
	
	return nil
end

function ChromeAnalyticsModule:onWindowResize(Integration_id, GetResult)
	-- upvalues: ServiceModule (copy), ConstantsModule (copy)
	local IntegrationsResultEntry = ServiceModule:integrations()[Integration_id]
	
	if IntegrationsResultEntry and IntegrationsResultEntry.windowSize then
		local Text = "window_size_" .. Integration_id
		local GetResult1 = self._tracker:get(Text)
		local GetResult2 = self._tracker:get("window_position_" .. Integration_id)
		local _Vector2 = if GetResult2 then Vector2.new(GetResult2.X + (GetResult1.Width.Offset - GetResult.Width.Offset) / 2, GetResult2.Y + (GetResult1.Height.Offset - GetResult.Height.Offset) / 2) else nil
		
		if _Vector2 then
			self._setWindowLastPosition(Integration_id, _Vector2)
		end
		self._tracker:set(Text, GetResult)
		self._sendEvent(ConstantsModule.ANALYTICS.WINDOW_RESIZE, {
			integration_id = Integration_id,
			previous_position_x = GetResult2 and GetResult2.X or nil,
			previous_position_y = GetResult2 and GetResult2.Y or nil,
			previous_width = GetResult1 and GetResult1.Width.Offset or nil,
			previous_height = GetResult1 and GetResult1.Height.Offset or nil,
			current_position_x = _Vector2 and _Vector2.X or nil,
			current_position_y = _Vector2 and _Vector2.Y or nil,
			current_width = GetResult.Width.Offset,
			current_height = GetResult.Height.Offset
		})
	end
	return nil
end

ChromeAnalyticsModule.default = ChromeAnalyticsModule.new()

return ChromeAnalyticsModule