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
	local var14 = "Unknown"
	
	if playerGui then
		var14 = constantsModule.ANALYTICS.SCREEN_ORIENTATION_MAP[playerGui.CurrentScreenOrientation] or tostring(playerGui.CurrentScreenOrientation)
	end
	return {
		screen_orientation = var14,
		last_input_device = constantsModule.ANALYTICS.INPUT_TYPE_MAP[userInputService:GetLastInputType()] or tostring(userInputService:GetLastInputType())
	}
end

local function _(p0, p1)
	return p0 .. p1
end

local _ = function(p2)
	-- upvalues: serviceModule (ref)
	return serviceModule:integrations()[p2]
end

local _ = function(p3)
	-- upvalues: fFlagEnableSideSheet (ref), serviceModule (ref)
	return if fFlagEnableSideSheet and serviceModule:withinOpenSideSheet(p3) then "sidesheet" elseif serviceModule:withinCurrentSubmenu(p3) then serviceModule:currentSubMenu():get() elseif serviceModule:withinCurrentTopLevelMenu(p3) then "unibar" else "unknown"
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
	function tbl._observeIntegration(p4)
		-- upvalues: serviceModule (copy), tbl (ref)
		local var16 = serviceModule:integrations()[p4]
		
		if var16 and var16.windowSize then
			tbl._tracker:set("window_size_" .. p4, var16.windowSize:get())
			var16.windowSize:connect(function(p5)
				-- upvalues: var16 (ref), tbl (copy), p4 (ref)
				if typeof(p5) ~= "UDim2" then return end
				local var17 = var16.windowSize:get()
				local text = "window_size_" .. p4
				
				if tbl._tracker:get("window_status_" .. p4) == 1 then
					if tbl._tracker:get(text) then
						tbl:onWindowResize(p4, var17)
					end
					tbl._tracker:set(text, var17)
				end
			end)
		end
	end
	
	function tbl._resetWindowTrackers(p6)
		-- upvalues: tbl (ref)
		tbl._tracker:reset("window_dposition_" .. p6)
		tbl._tracker:reset("window_position_" .. p6)
		tbl._tracker:reset("window_size_" .. p6)
		tbl._tracker:reset("window_drag_" .. p6)
		tbl._tracker:reset("window_status_" .. p6)
	end
	
	function tbl._defaultWindowTrackers(p7)
		-- upvalues: tbl (ref)
		tbl._resetWindowTrackers(p7)
		tbl._tracker:startTime("window_time_" .. p7)
		tbl._tracker:set("window_status_" .. p7, 1)
	end
	
	function tbl._sendEvent(p8, p9)
		-- upvalues: cryoModule (copy), getDynamicEventProps (copy), tbl (ref), rbxAnalyticsService (copy)
		rbxAnalyticsService:SendEventDeferred(tbl._target, tbl._context, p8, cryoModule.Dictionary.join(getDynamicEventProps(), tbl._defaultProps, p9 or {}))
	end
	
	function tbl._calculateWindowAbsolutePosition(p10, p11)
		-- upvalues: tbl (ref)
		return Vector2.new(p10.X.Scale * tbl._defaultProps.screen_width + p10.X.Offset - p11.Width.Offset / 2, p10.Y.Scale * tbl._defaultProps.screen_height + p10.Y.Offset - p11.Height.Offset / 2)
	end
	
	function tbl._setWindowLastPosition(p12, p13)
		-- upvalues: tbl (ref)
		tbl._tracker:set("window_position_" .. p12, p13)
	end
	
	guiService.MenuOpened:Connect(function()
		-- upvalues: tbl (ref)
		tbl._defaultProps.is_game_menu_opened = not tbl._defaultProps.is_game_menu_opened
	end)
	
	for i, v in serviceModule:integrations() do
		tbl._observeIntegration(v.id)
	end
	serviceModule:onIntegrationRegistered():connect(function(p14)
		-- upvalues: tbl (ref)
		tbl._observeIntegration(p14)
	end)
	serviceModule:onIntegrationActivated():connect(function(p15, p16)
		-- upvalues: fFlagIntegrationsChromeShortcutTelemetryModule (copy), tbl (ref)
		if fFlagIntegrationsChromeShortcutTelemetryModule then
			tbl:onIconActivated(p15, p16)
			
			return
		end
		tbl:onIconActivated(p15)
	end)
	serviceModule:onIntegrationStatusChanged():connect(function(p17, p18)
		-- upvalues: serviceModule (copy), tbl (ref)
		local var19 = serviceModule:integrations()[p17]
		
		if var19 and var19.components.Window then
			if p18 == serviceModule.IntegrationStatus.Window then
				tbl:onWindowOpened(p17)
				
				return
			end
			tbl:onWindowClosed(p17)
		end
	end)
	
	return tbl
end

function t:setScreenSize(p19)
	self._defaultProps.screen_width = p19.X
	self._defaultProps.screen_height = p19.Y
	
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

function t:onIconTouchBegan(p20)
	self._tracker:set("icon_drag_" .. p20, 1)
	
	return nil
end

function t:onIconDrag(p21)
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

function t:onIconTouchEnded(p22, p23, p24)
	-- upvalues: serviceModule (ref), constantsModule (ref), fFlagEnableSideSheet (ref)
	local text = "icon_drag_" .. p22
	local var22 = serviceModule:integrations()[p22]
	
	if var22 and var22.windowSize and self._tracker:get(text) == 2 then
		self._tracker:reset(text)
		self._setWindowLastPosition(p22, p23)
		local var23 = var22.windowSize:get()
		self._sendEvent(constantsModule.ANALYTICS.ICON_DRAG_END, {
			integration_id = p22,
			source = if fFlagEnableSideSheet and serviceModule:withinOpenSideSheet(p22) then "sidesheet" elseif serviceModule:withinCurrentSubmenu(p22) then serviceModule:currentSubMenu():get() elseif serviceModule:withinCurrentTopLevelMenu(p22) then "unibar" else "unknown",
			window_position_x = p23.X,
			window_position_y = p23.Y,
			window_width = var23.Width.Offset,
			window_height = var23.Height.Offset,
			will_reposition = p24
		})
	end
	return nil
end

function t:onWindowOpened(p25)
	-- upvalues: serviceModule (ref), constantsModule (ref)
	local var24 = serviceModule:integrations()[p25]
	
	if var24 and self._tracker:get("window_status_" .. p25) ~= 1 then
		self._defaultWindowTrackers(p25)
		
		if not self._tracker:get("window_dposition_" .. p25) and var24.windowSize then
			local var25 = var24.windowSize:get()
			
			if var25 then
				self:setWindowDefaultPosition(p25, self._calculateWindowAbsolutePosition(serviceModule:windowPosition(var24.id) or (var24.startingWindowPosition or UDim2.fromOffset(0, 0)), var25))
			end
		end
		self._sendEvent(constantsModule.ANALYTICS.WINDOW_OPENED, { integration_id = p25 })
	end
	return nil
end

function t:onWindowClosed(p26)
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

function t:onWindowTouchBegan(p27, _)
	-- upvalues: serviceModule (ref)
	local var26 = serviceModule:integrations()[p27]
	
	if var26 and var26.windowSize then
		self._tracker:set("window_drag_" .. p27, 1)
	end
	return nil
end

function t:onWindowDrag(p28, p29)
	-- upvalues: serviceModule (ref), constantsModule (ref)
	local text = "window_drag_" .. p28
	local var28 = serviceModule:integrations()[p28]
	
	if var28 and var28.windowSize and self._tracker:get(text) == 1 then
		local var29 = self._tracker:get("window_position_" .. p28)
		
		if var29 then
			local vector2 = Vector2.new(p29.X - var29.X, p29.Y - var29.Y)
			
			if vector2.X ~= 0 or vector2.Y ~= 0 then
				self._tracker:set(text, 2)
				local var31 = var28.windowSize:get()
				self._sendEvent(constantsModule.ANALYTICS.WINDOW_DRAG_START, {
					integration_id = p28,
					position_x = var29.X,
					position_y = var29.Y,
					width = var31.Width.Offset,
					height = var31.Height.Offset,
					is_starting_position = self._tracker:get("window_dposition_" .. p28) == var29
				})
			end
		end
	end
	return nil
end

function t:onWindowTouchEnded(p30, p31, p32)
	-- upvalues: serviceModule (ref), constantsModule (ref)
	local var32 = serviceModule:integrations()[p30]
	
	if self._tracker:get("icon_drag_" .. p30) == 2 then
		return self:onIconTouchEnded(p30, p31, p32)
	end
	local text = "window_drag_" .. p30
	
	if var32 and var32.windowSize and self._tracker:get(text) == 2 then
		local var34 = var32.windowSize:get()
		self._tracker:reset(text)
		self._setWindowLastPosition(p30, p31)
		self._sendEvent(constantsModule.ANALYTICS.WINDOW_DRAG_END, {
			integration_id = p30,
			position_x = p31.X,
			position_y = p31.Y,
			width = var34.Width.Offset,
			height = var34.Height.Offset,
			will_autoposition = p32
		})
	end
	return nil
end

function t:setWindowDefaultPosition(p33, p34)
	self._tracker:set("window_dposition_" .. p33, p34)
	self._setWindowLastPosition(p33, p34)
	
	return nil
end

function t:onWindowResize(p35, p36)
	-- upvalues: serviceModule (ref), constantsModule (ref)
	local var35 = serviceModule:integrations()[p35]
	
	if var35 and var35.windowSize then
		local text = "window_size_" .. p35
		local var37 = self._tracker:get(text)
		local var38 = self._tracker:get("window_position_" .. p35)
		local var39 = if var38 then Vector2.new(var38.X + (var37.Width.Offset - p36.Width.Offset) / 2, var38.Y + (var37.Height.Offset - p36.Height.Offset) / 2) else nil
		
		if var39 then
			self._setWindowLastPosition(p35, var39)
		end
		self._tracker:set(text, p36)
		self._sendEvent(constantsModule.ANALYTICS.WINDOW_RESIZE, {
			integration_id = p35,
			previous_position_x = if var38 then var38.X else nil,
			previous_position_y = if var38 then var38.Y else nil,
			previous_width = if var37 then var37.Width.Offset else nil,
			previous_height = if var37 then var37.Height.Offset else nil,
			current_position_x = if var39 then var39.X else nil,
			current_position_y = if var39 then var39.Y else nil,
			current_width = p36.Width.Offset,
			current_height = p36.Height.Offset
		})
	end
	return nil
end

t.default = t.new()

return t