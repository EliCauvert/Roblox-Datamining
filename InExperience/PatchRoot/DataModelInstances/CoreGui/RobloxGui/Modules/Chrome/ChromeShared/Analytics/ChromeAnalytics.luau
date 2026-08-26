local chromeShared = script:FindFirstAncestor("ChromeShared")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local playerGui = game:GetService("Players").LocalPlayer:FindFirstChildOfClass("PlayerGui")
local cryoModule = require(corePackagesService.Packages.Cryo)
local serviceModule = require(chromeShared.Service)
local constantsModule = require(chromeShared.Unibar.Constants)
local _ = require(corePackagesService.Workspace.Packages.Chrome)
local fFlagEnableSideSheet = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableSideSheet
local fFlagIntegrationsChromeShortcutTelemetryModule = require(chromeShared.Parent.Flags.FFlagIntegrationsChromeShortcutTelemetry)
local trackerModule = require(chromeShared.Analytics.Tracker)
local _ = { INACTIVE = 0, ACTIVE = 1 }
local _ = { NONE = 0, STARTED = 1, DRAGGED = 2 }
local t = {}
t.__index = t

local function getDynamicEventProps()
	-- upvalues: playerGui (ref), constantsModule (ref), userInputService (ref)
	local var1 = "Unknown"
	
	if playerGui then
		var1 = constantsModule.ANALYTICS.SCREEN_ORIENTATION_MAP[playerGui.CurrentScreenOrientation] or tostring(playerGui.CurrentScreenOrientation)
	end
	return {
		screen_orientation = var1,
		last_input_device = constantsModule.ANALYTICS.INPUT_TYPE_MAP[userInputService:GetLastInputType()] or tostring(userInputService:GetLastInputType())
	}
end

local function _(p1, p2)
	return p1 .. p1
end

local _ = function(p1)
	-- upvalues: serviceModule (ref)
	return serviceModule:integrations()[p1]
end

local _ = function(p1)
	-- upvalues: fFlagEnableSideSheet (ref), serviceModule (ref)
	return if fFlagEnableSideSheet and serviceModule:withinOpenSideSheet(p1) then "sidesheet" elseif serviceModule:withinCurrentSubmenu(p1) then serviceModule:currentSubMenu():get() elseif serviceModule:withinCurrentTopLevelMenu(p1) then "unibar" else "unknown"
end

function t.new()
	-- upvalues: rbxAnalyticsService (ref), trackerModule (ref), t (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), serviceModule (ref), cryoModule (ref), getDynamicEventProps (ref), guiService (ref), fFlagIntegrationsChromeShortcutTelemetryModule (ref)
	local tbl = setmetatable({
		_target = "client",
		_context = "chrome",
		_defaultProps = {
			screen_width = 0,
			screen_height = 0,
			is_game_menu_opened = false,
			universeid = tostring(game.GameId),
			placeid = tostring(game.PlaceId),
			sessionid = rbxAnalyticsService:GetSessionId()
		},
		_tracker = trackerModule.new()
	}, t)
	
	if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then
		tbl._defaultProps.playsessionid = rbxAnalyticsService:GetPlaySessionId()
	end
	function tbl._observeIntegration(p1)
		-- upvalues: serviceModule (copy), tbl (ref)
		local var1 = serviceModule:integrations()[p1]
		
		if var1 and var1.windowSize then
			tbl._tracker:set("window_size_" .. p4, var1.windowSize:get())
			var1.windowSize:connect(function(p2)
				-- upvalues: var1 (ref), tbl (copy), p1 (ref)
				if typeof(p2) ~= "UDim2" then return end
				local var2 = var1.windowSize:get()
				local text = "window_size_" .. p4
				
				if tbl._tracker:get("window_status_" .. p4) == 1 then
					if tbl._tracker:get(text) then
						tbl:onWindowResize(p1, var2)
					end
					tbl._tracker:set(text, var2)
				end
			end)
		end
	end
	
	function tbl._resetWindowTrackers(p1)
		-- upvalues: tbl (ref)
		tbl._tracker:reset("window_dposition_" .. p6)
		tbl._tracker:reset("window_position_" .. p6)
		tbl._tracker:reset("window_size_" .. p6)
		tbl._tracker:reset("window_drag_" .. p6)
		tbl._tracker:reset("window_status_" .. p6)
	end
	
	function tbl._defaultWindowTrackers(p1)
		-- upvalues: tbl (ref)
		tbl._resetWindowTrackers(p1)
		tbl._tracker:startTime("window_time_" .. p7)
		tbl._tracker:set("window_status_" .. p7, 1)
	end
	
	function tbl._sendEvent(p1, p2)
		-- upvalues: cryoModule (copy), getDynamicEventProps (copy), tbl (ref), rbxAnalyticsService (copy)
		rbxAnalyticsService:SendEventDeferred(tbl._target, tbl._context, p1, cryoModule.Dictionary.join(getDynamicEventProps(), tbl._defaultProps, p2 or {}))
	end
	
	function tbl._calculateWindowAbsolutePosition(p1, p2)
		-- upvalues: tbl (ref)
		return Vector2.new(p1.X.Scale * tbl._defaultProps.screen_width + p1.X.Offset - p2.Width.Offset / 2, p1.Y.Scale * tbl._defaultProps.screen_height + p1.Y.Offset - p2.Height.Offset / 2)
	end
	
	function tbl._setWindowLastPosition(p1, p2)
		-- upvalues: tbl (ref)
		tbl._tracker:set("window_position_" .. p12, p2)
	end
	
	guiService.MenuOpened:Connect(function()
		-- upvalues: tbl (ref)
		tbl._defaultProps.is_game_menu_opened = not tbl._defaultProps.is_game_menu_opened
	end)
	
	for i, v in serviceModule:integrations() do
		tbl._observeIntegration(v.id)
	end
	serviceModule:onIntegrationRegistered():connect(function(p1)
		-- upvalues: tbl (ref)
		tbl._observeIntegration(p1)
	end)
	serviceModule:onIntegrationActivated():connect(function(p1, p2)
		-- upvalues: fFlagIntegrationsChromeShortcutTelemetryModule (copy), tbl (ref)
		if fFlagIntegrationsChromeShortcutTelemetryModule then
			tbl:onIconActivated(p1, p2)
			
			return
		end
		tbl:onIconActivated(p1)
	end)
	serviceModule:onIntegrationStatusChanged():connect(function(p1, p2)
		-- upvalues: serviceModule (copy), tbl (ref)
		local var1 = serviceModule:integrations()[p1]
		
		if var1 and var1.components.Window then
			if p2 == serviceModule.IntegrationStatus.Window then
				tbl:onWindowOpened(p1)
				
				return
			end
			tbl:onWindowClosed(p1)
		end
	end)
	
	return tbl
end

function t:setScreenSize(p1)
	self._defaultProps.screen_width = p1.X
	self._defaultProps.screen_height = p1.Y
	
	return nil
end

function t:onIconActivated(_, _)
	-- upvalues: serviceModule (ref), constantsModule (ref), fFlagEnableSideSheet (ref), fFlagIntegrationsChromeShortcutTelemetryModule (ref)
-- FATAL: Failed to generate AST for `onIconActivated` function:
runtime : [KeyError] :11990: 134
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end

function t:onIconTouchBegan(p1)
	self._tracker:set("icon_drag_" .. p20, 1)
	
	return nil
end

function t:onIconDrag(p1)
	-- upvalues: constantsModule (ref), fFlagEnableSideSheet (ref), serviceModule (ref)
	local text = "icon_drag_" .. p21
	
	if self._tracker:get(text) == 1 then
		self._tracker:set(text, 2)
		self._sendEvent(constantsModule.ANALYTICS.ICON_DRAG_START, {
			integration_id = p1,
			source = if fFlagEnableSideSheet and serviceModule:withinOpenSideSheet(p1) then "sidesheet" elseif serviceModule:withinCurrentSubmenu(p1) then serviceModule:currentSubMenu():get() elseif serviceModule:withinCurrentTopLevelMenu(p1) then "unibar" else "unknown"
		})
	end
	return nil
end

function t:onIconTouchEnded(p1, p2, p3)
	-- upvalues: serviceModule (ref), constantsModule (ref), fFlagEnableSideSheet (ref)
	local text = "icon_drag_" .. p22
	local var1 = serviceModule:integrations()[p1]
	
	if var1 and var1.windowSize and self._tracker:get(text) == 2 then
		self._tracker:reset(text)
		self._setWindowLastPosition(p1, p2)
		local var2 = var1.windowSize:get()
		self._sendEvent(constantsModule.ANALYTICS.ICON_DRAG_END, {
			integration_id = p1,
			source = if fFlagEnableSideSheet and serviceModule:withinOpenSideSheet(p1) then "sidesheet" elseif serviceModule:withinCurrentSubmenu(p1) then serviceModule:currentSubMenu():get() elseif serviceModule:withinCurrentTopLevelMenu(p1) then "unibar" else "unknown",
			window_position_x = p2.X,
			window_position_y = p2.Y,
			window_width = var2.Width.Offset,
			window_height = var2.Height.Offset,
			will_reposition = p3
		})
	end
	return nil
end

function t:onWindowOpened(p1)
	-- upvalues: serviceModule (ref), constantsModule (ref)
	local var1 = serviceModule:integrations()[p1]
	
	if var1 and self._tracker:get("window_status_" .. p25) ~= 1 then
		self._defaultWindowTrackers(p1)
		
		if not self._tracker:get("window_dposition_" .. p25) and var1.windowSize then
			local var2 = var1.windowSize:get()
			
			if var2 then
				self:setWindowDefaultPosition(p1, self._calculateWindowAbsolutePosition(serviceModule:windowPosition(var1.id) or (var1.startingWindowPosition or UDim2.fromOffset(0, 0)), var2))
			end
		end
		self._sendEvent(constantsModule.ANALYTICS.WINDOW_OPENED, { integration_id = p1 })
	end
	return nil
end

function t:onWindowClosed(p1)
	-- upvalues: constantsModule (ref)
	if self._tracker:get("window_status_" .. p26) == 1 then
		self._sendEvent(constantsModule.ANALYTICS.WINDOW_CLOSED, {
			integration_id = p1,
			total_open_time = self._tracker:finishTime("window_time_" .. p26)
		})
		self._resetWindowTrackers(p1)
	end
	return nil
end

function t:onWindowTouchBegan(p1, _)
	-- upvalues: serviceModule (ref)
	local var1 = serviceModule:integrations()[p1]
	
	if var1 and var1.windowSize then
		self._tracker:set("window_drag_" .. p27, 1)
	end
	return nil
end

function t:onWindowDrag(p1, p2)
	-- upvalues: serviceModule (ref), constantsModule (ref)
	local text = "window_drag_" .. p28
	local var1 = serviceModule:integrations()[p1]
	
	if var1 and var1.windowSize and self._tracker:get(text) == 1 then
		local var2 = self._tracker:get("window_position_" .. p28)
		
		if var2 then
			local vector2 = Vector2.new(p2.X - var2.X, p2.Y - var2.Y)
			
			if vector2.X ~= 0 or vector2.Y ~= 0 then
				self._tracker:set(text, 2)
				local var3 = var1.windowSize:get()
				self._sendEvent(constantsModule.ANALYTICS.WINDOW_DRAG_START, {
					integration_id = p1,
					position_x = var2.X,
					position_y = var2.Y,
					width = var3.Width.Offset,
					height = var3.Height.Offset,
					is_starting_position = self._tracker:get("window_dposition_" .. p28) == var2
				})
			end
		end
	end
	return nil
end

function t:onWindowTouchEnded(p1, p2, p3)
	-- upvalues: serviceModule (ref), constantsModule (ref)
	local var1 = serviceModule:integrations()[p1]
	
	if self._tracker:get("icon_drag_" .. p30) == 2 then
		return self:onIconTouchEnded(p1, p2, p3)
	end
	local text = "window_drag_" .. p30
	
	if var1 and var1.windowSize and self._tracker:get(text) == 2 then
		local var2 = var1.windowSize:get()
		self._tracker:reset(text)
		self._setWindowLastPosition(p1, p2)
		self._sendEvent(constantsModule.ANALYTICS.WINDOW_DRAG_END, {
			integration_id = p1,
			position_x = p2.X,
			position_y = p2.Y,
			width = var2.Width.Offset,
			height = var2.Height.Offset,
			will_autoposition = p3
		})
	end
	return nil
end

function t:setWindowDefaultPosition(p1, p2)
	self._tracker:set("window_dposition_" .. p33, p2)
	self._setWindowLastPosition(p1, p2)
	
	return nil
end

function t:onWindowResize(p1, p2)
	-- upvalues: serviceModule (ref), constantsModule (ref)
	local var1 = serviceModule:integrations()[p1]
	
	if var1 and var1.windowSize then
		local text = "window_size_" .. p35
		local var2 = self._tracker:get(text)
		local var3 = self._tracker:get("window_position_" .. p35)
		local var4 = if var3 then Vector2.new(var3.X + (var2.Width.Offset - p2.Width.Offset) / 2, var3.Y + (var2.Height.Offset - p2.Height.Offset) / 2) else nil
		
		if var4 then
			self._setWindowLastPosition(p1, var4)
		end
		self._tracker:set(text, p2)
		self._sendEvent(constantsModule.ANALYTICS.WINDOW_RESIZE, {
			integration_id = p1,
			previous_position_x = if var3 then var3.X else nil,
			previous_position_y = if var3 then var3.Y else nil,
			previous_width = if var2 then var2.Width.Offset else nil,
			previous_height = if var2 then var2.Height.Offset else nil,
			current_position_x = if var4 then var4.X else nil,
			current_position_y = if var4 then var4.Y else nil,
			current_width = p2.Width.Offset,
			current_height = p2.Height.Offset
		})
	end
	return nil
end

t.default = t.new()

return t