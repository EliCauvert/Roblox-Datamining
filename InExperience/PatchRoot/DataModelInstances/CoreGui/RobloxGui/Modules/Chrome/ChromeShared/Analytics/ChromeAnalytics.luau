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
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet
local fFlagChromeActivatedMappedSignal = sharedFlagsModule.FFlagChromeActivatedMappedSignal
local fFlagIntegrationsChromeShortcutTelemetryModule = require(chromeShared.Parent.Flags.FFlagIntegrationsChromeShortcutTelemetry)
local trackerModule = require(chromeShared.Analytics.Tracker)
local _ = { INACTIVE = 0, ACTIVE = 1 }
local _ = { NONE = 0, STARTED = 1, DRAGGED = 2 }
local t = {}
t.__index = t

local function getDynamicEventProps() --[[ line: 96 ]]
	-- upvalues: playerGui (ref), constantsModule (ref), userInputService (ref)
	local var15 = "Unknown"
	
	if playerGui then
		var15 = constantsModule.ANALYTICS.SCREEN_ORIENTATION_MAP[playerGui.CurrentScreenOrientation] or tostring(playerGui.CurrentScreenOrientation)
	end
	return {
		screen_orientation = var15,
		last_input_device = constantsModule.ANALYTICS.INPUT_TYPE_MAP[userInputService:GetLastInputType()] or tostring(userInputService:GetLastInputType())
	}
end

local function _(p0, p1) --[[ line: 113 | named "getTrackerName" ]]
	return p0 .. p1
end

local _ = function(p2) --[[ line: 117 | named "getIntegration" ]]
	-- upvalues: serviceModule (ref)
	return serviceModule:integrations()[p2]
end

local _ = function(p3) --[[ line: 121 | named "getInteractionSource" ]]
	-- upvalues: fFlagEnableSideSheet (ref), serviceModule (ref)
	return if fFlagEnableSideSheet and serviceModule:withinOpenSideSheet(p3) then "sidesheet" elseif serviceModule:withinCurrentSubmenu(p3) then serviceModule:currentSubMenu():get() elseif serviceModule:withinCurrentTopLevelMenu(p3) then "unibar" else "unknown"
end

function t.new() --[[ line: 135 ]]
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
	function tbl._observeIntegration(p4) --[[ line: 156 ]]
		-- upvalues: serviceModule (copy), tbl (ref)
		local var17 = serviceModule:integrations()[p4]
		
		if var17 and var17.windowSize then
			tbl._tracker:set("window_size_" .. p4, var17.windowSize:get())
			var17.windowSize:connect(function(p5) --[[ line: 165 ]]
				-- upvalues: var17 (ref), tbl (copy), p4 (ref)
				if typeof(p5) ~= "UDim2" then return end
				local var18 = var17.windowSize:get()
				local text = "window_size_" .. p4
				
				if tbl._tracker:get("window_status_" .. p4) == 1 then
					if tbl._tracker:get(text) then
						tbl:onWindowResize(p4, var18)
					end
					tbl._tracker:set(text, var18)
				end
			end)
		end
	end
	
	function tbl._resetWindowTrackers(p6) --[[ line: 188 ]]
		-- upvalues: tbl (ref)
		tbl._tracker:reset("window_dposition_" .. p6)
		tbl._tracker:reset("window_position_" .. p6)
		tbl._tracker:reset("window_size_" .. p6)
		tbl._tracker:reset("window_drag_" .. p6)
		tbl._tracker:reset("window_status_" .. p6)
	end
	
	function tbl._defaultWindowTrackers(p7) --[[ line: 196 ]]
		-- upvalues: tbl (ref)
		tbl._resetWindowTrackers(p7)
		tbl._tracker:startTime("window_time_" .. p7)
		tbl._tracker:set("window_status_" .. p7, 1)
	end
	
	function tbl._sendEvent(p8, p9) --[[ line: 202 ]]
		-- upvalues: cryoModule (copy), getDynamicEventProps (copy), tbl (ref), rbxAnalyticsService (copy)
		rbxAnalyticsService:SendEventDeferred(tbl._target, tbl._context, p8, cryoModule.Dictionary.join(getDynamicEventProps(), tbl._defaultProps, p9 or {}))
	end
	
	function tbl._calculateWindowAbsolutePosition(p10, p11) --[[ line: 207 ]]
		-- upvalues: tbl (ref)
		return Vector2.new(p10.X.Scale * tbl._defaultProps.screen_width + p10.X.Offset - p11.Width.Offset / 2, p10.Y.Scale * tbl._defaultProps.screen_height + p10.Y.Offset - p11.Height.Offset / 2)
	end
	
	function tbl._setWindowLastPosition(p12, p13) --[[ line: 216 ]]
		-- upvalues: tbl (ref)
		tbl._tracker:set("window_position_" .. p12, p13)
	end
	
	guiService.MenuOpened:Connect(function() --[[ line: 220 ]]
		-- upvalues: tbl (ref)
		tbl._defaultProps.is_game_menu_opened = not tbl._defaultProps.is_game_menu_opened
	end)
	
	for i, v in serviceModule:integrations() do
		tbl._observeIntegration(v.id)
	end
	serviceModule:onIntegrationRegistered():connect(function(p14) --[[ line: 228 ]]
		-- upvalues: tbl (ref)
		tbl._observeIntegration(p14)
	end)
	serviceModule:onIntegrationActivated():connect(function(p15, p16) --[[ line: 232 ]]
		-- upvalues: fFlagIntegrationsChromeShortcutTelemetryModule (copy), tbl (ref)
		if fFlagIntegrationsChromeShortcutTelemetryModule then
			tbl:onIconActivated(p15, p16)
			
			return
		end
		tbl:onIconActivated(p15)
	end)
	serviceModule:onIntegrationStatusChanged():connect(function(p17, p18) --[[ line: 240 ]]
		-- upvalues: serviceModule (copy), tbl (ref)
		local var20 = serviceModule:integrations()[p17]
		
		if var20 and var20.components.Window then
			if p18 == serviceModule.IntegrationStatus.Window then
				tbl:onWindowOpened(p17)
				
				return
			end
			tbl:onWindowClosed(p17)
		end
	end)
	
	return tbl
end

function t:setScreenSize(p19) --[[ line: 254 ]]
	self._defaultProps.screen_width = p19.X
	self._defaultProps.screen_height = p19.Y
	
	return nil
end

function t:onIconActivated(_, _) --[[ line: 260 ]]
	-- upvalues: serviceModule (ref), fFlagChromeActivatedMappedSignal (ref), constantsModule (ref), fFlagEnableSideSheet (ref), fFlagIntegrationsChromeShortcutTelemetryModule (ref)
-- FATAL: Failed to generate AST for `onIconActivated` function:
runtime : [KeyError] :11990: 135
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end

function t:onIconTouchBegan(p20) --[[ line: 292 ]]
	self._tracker:set("icon_drag_" .. p20, 1)
	
	return nil
end

function t:onIconDrag(p21) --[[ line: 297 ]]
	-- upvalues: constantsModule (ref), fFlagEnableSideSheet (ref), serviceModule (ref)
	local text = "icon_drag_" .. p21
	
	if self._tracker:get(text) == 1 then
		self._tracker:set(text, 2)
		self._sendEvent(constantsModule.ANALYTICS.ICON_DRAG_START, {
			integration_id = p21,
			source = if fFlagEnableSideSheet and serviceModule:withinOpenSideSheet(p21) then "sidesheet" elseif serviceModule:withinCurrentSubmenu(p21) then serviceModule:currentSubMenu():get() elseif serviceModule:withinCurrentTopLevelMenu(p21) then "unibar" else "unknown"
		})
	end
	return nil
end

function t:onIconTouchEnded(p22, p23, p24) --[[ line: 310 ]]
	-- upvalues: serviceModule (ref), constantsModule (ref), fFlagEnableSideSheet (ref)
	local text = "icon_drag_" .. p22
	local var23 = serviceModule:integrations()[p22]
	
	if var23 and var23.windowSize and self._tracker:get(text) == 2 then
		self._tracker:reset(text)
		self._setWindowLastPosition(p22, p23)
		local var24 = var23.windowSize:get()
		self._sendEvent(constantsModule.ANALYTICS.ICON_DRAG_END, {
			integration_id = p22,
			source = if fFlagEnableSideSheet and serviceModule:withinOpenSideSheet(p22) then "sidesheet" elseif serviceModule:withinCurrentSubmenu(p22) then serviceModule:currentSubMenu():get() elseif serviceModule:withinCurrentTopLevelMenu(p22) then "unibar" else "unknown",
			window_position_x = p23.X,
			window_position_y = p23.Y,
			window_width = var24.Width.Offset,
			window_height = var24.Height.Offset,
			will_reposition = p24
		})
	end
	return nil
end

function t:onWindowOpened(p25) --[[ line: 337 ]]
	-- upvalues: serviceModule (ref), constantsModule (ref)
	local var25 = serviceModule:integrations()[p25]
	
	if var25 and self._tracker:get("window_status_" .. p25) ~= 1 then
		self._defaultWindowTrackers(p25)
		
		if not self._tracker:get("window_dposition_" .. p25) and var25.windowSize then
			local var26 = var25.windowSize:get()
			
			if var26 then
				self:setWindowDefaultPosition(p25, self._calculateWindowAbsolutePosition(serviceModule:windowPosition(var25.id) or (var25.startingWindowPosition or UDim2.fromOffset(0, 0)), var26))
			end
		end
		self._sendEvent(constantsModule.ANALYTICS.WINDOW_OPENED, { integration_id = p25 })
	end
	return nil
end

function t:onWindowClosed(p26) --[[ line: 363 ]]
	-- upvalues: constantsModule (ref)
	if self._tracker:get("window_status_" .. p26) == 1 then
		self._sendEvent(constantsModule.ANALYTICS.WINDOW_CLOSED, {
			integration_id = p26,
			total_open_time = self._tracker:finishTime("window_time_" .. p26)
		})
		self._resetWindowTrackers(p26)
	end
	return nil
end

function t:onWindowTouchBegan(p27, _) --[[ line: 376 ]]
	-- upvalues: serviceModule (ref)
	local var27 = serviceModule:integrations()[p27]
	
	if var27 and var27.windowSize then
		self._tracker:set("window_drag_" .. p27, 1)
	end
	return nil
end

function t:onWindowDrag(p28, p29) --[[ line: 384 ]]
	-- upvalues: serviceModule (ref), constantsModule (ref)
	local text = "window_drag_" .. p28
	local var29 = serviceModule:integrations()[p28]
	
	if var29 and var29.windowSize and self._tracker:get(text) == 1 then
		local var30 = self._tracker:get("window_position_" .. p28)
		
		if var30 then
			local vector2 = Vector2.new(p29.X - var30.X, p29.Y - var30.Y)
			
			if vector2.X ~= 0 or vector2.Y ~= 0 then
				self._tracker:set(text, 2)
				local var32 = var29.windowSize:get()
				self._sendEvent(constantsModule.ANALYTICS.WINDOW_DRAG_START, {
					integration_id = p28,
					position_x = var30.X,
					position_y = var30.Y,
					width = var32.Width.Offset,
					height = var32.Height.Offset,
					is_starting_position = self._tracker:get("window_dposition_" .. p28) == var30
				})
			end
		end
	end
	return nil
end

function t:onWindowTouchEnded(p30, p31, p32) --[[ line: 417 ]]
	-- upvalues: serviceModule (ref), constantsModule (ref)
	local var33 = serviceModule:integrations()[p30]
	
	if self._tracker:get("icon_drag_" .. p30) == 2 then
		return self:onIconTouchEnded(p30, p31, p32)
	end
	local text = "window_drag_" .. p30
	
	if var33 and var33.windowSize and self._tracker:get(text) == 2 then
		local var35 = var33.windowSize:get()
		self._tracker:reset(text)
		self._setWindowLastPosition(p30, p31)
		self._sendEvent(constantsModule.ANALYTICS.WINDOW_DRAG_END, {
			integration_id = p30,
			position_x = p31.X,
			position_y = p31.Y,
			width = var35.Width.Offset,
			height = var35.Height.Offset,
			will_autoposition = p32
		})
	end
	return nil
end

function t:setWindowDefaultPosition(p33, p34) --[[ line: 449 ]]
	self._tracker:set("window_dposition_" .. p33, p34)
	self._setWindowLastPosition(p33, p34)
	
	return nil
end

function t:onWindowResize(p35, p36) --[[ line: 455 ]]
	-- upvalues: serviceModule (ref), constantsModule (ref)
	local var36 = serviceModule:integrations()[p35]
	
	if var36 and var36.windowSize then
		local text = "window_size_" .. p35
		local var38 = self._tracker:get(text)
		local var39 = self._tracker:get("window_position_" .. p35)
		local var40 = if var39 then Vector2.new(var39.X + (var38.Width.Offset - p36.Width.Offset) / 2, var39.Y + (var38.Height.Offset - p36.Height.Offset) / 2) else nil
		
		if var40 then
			self._setWindowLastPosition(p35, var40)
		end
		self._tracker:set(text, p36)
		self._sendEvent(constantsModule.ANALYTICS.WINDOW_RESIZE, {
			integration_id = p35,
			previous_position_x = if var39 then var39.X else nil,
			previous_position_y = if var39 then var39.Y else nil,
			previous_width = if var38 then var38.Width.Offset else nil,
			previous_height = if var38 then var38.Height.Offset else nil,
			current_position_x = if var40 then var40.X else nil,
			current_position_y = if var40 then var40.Y else nil,
			current_width = p36.Width.Offset,
			current_height = p36.Height.Offset
		})
	end
	return nil
end

t.default = t.new()

return t