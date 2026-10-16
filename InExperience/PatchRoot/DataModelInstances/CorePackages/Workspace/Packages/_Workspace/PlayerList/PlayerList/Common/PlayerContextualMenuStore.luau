local Parent = script.Parent.Parent
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local SignalsModule = require(Parent.Parent.Signals)
local ResolveDisplayNameModule = require(Parent.Common.resolveDisplayName)
local GetHeadshotThumbnailModule = require(Parent.Common.getHeadshotThumbnail)
local _ = require(script.Parent.PlayerListContextMenuTelemetryAction)
local PlayerListContextMenuTelemetryModule = nil

local function _() --[[ Line: 15 | Named "getContextMenuTelemetry" ]]
	-- upvalues: PlayerListContextMenuTelemetryModule (ref)
	if PlayerListContextMenuTelemetryModule == nil then
		PlayerListContextMenuTelemetryModule = require(script.Parent.PlayerListContextMenuTelemetry)
	end
	return PlayerListContextMenuTelemetryModule
end

local Signal = nil
local Signal2 = nil
Signal, Signal2 = SignalsModule.createSignal(nil)
local Signal1 = nil
local Signal2_1 = nil
Signal1, Signal2_1 = SignalsModule.createSignal(nil)
local Tbl = {}
local Count = 0

local _ = function(Key) --[[ Line: 79 | Named "consumeOnceGroup" ]]
	-- upvalues: Count (ref), Tbl (copy)
	Count += 1
	local Count1: number = Count
	Tbl[Key] = Count1
	task.delay(5, function() --[[ Line: 83 ]]
		-- upvalues: Tbl (upval), Key (copy), Count1 (copy)
		if Tbl[Key] == Count1 then
			Tbl[Key] = nil
		end
	end)
end

local function setMenuData(p1) --[[ Line: 90 ]]
	-- upvalues: Signal (ref), Signal2_1 (ref), Tbl (copy), Signal2 (ref), PlayerListContextMenuTelemetryModule (ref)
	local NoSignalResult: boolean = p1 ~= nil and Signal(false) == nil
	Signal2_1(nil)
	table.clear(Tbl)
	Signal2(p1)
	
	if NoSignalResult then
		if PlayerListContextMenuTelemetryModule == nil then
			PlayerListContextMenuTelemetryModule = require(script.Parent.PlayerListContextMenuTelemetry)
		end
		PlayerListContextMenuTelemetryModule.logAction("menu_open", p1.telemetry)
	end
end

local Callback1 = nil
local Callback = nil
local SuppressNextDismissRestore = false
local Count1 = 0

local function closeContextMenu() --[[ Line: 112 ]]
	-- upvalues: Signal (ref), Count1 (ref), Signal2_1 (ref), PlayerListContextMenuTelemetryModule (ref), Tbl (copy), Signal2 (ref), Callback (ref)
	local SignalResult = Signal(false)
	Count1 += 1
	Signal2_1(nil)
	
	if SignalResult == nil then return end
	if PlayerListContextMenuTelemetryModule == nil then
		PlayerListContextMenuTelemetryModule = require(script.Parent.PlayerListContextMenuTelemetry)
	end
	PlayerListContextMenuTelemetryModule.logAction("menu_close", SignalResult.telemetry)
	Signal2_1(nil)
	table.clear(Tbl)
	Signal2(nil)
	
	if Callback then
		Callback()
	end
end

local function fallbackMenuData(Player: Player, AnchorPosition) --[[ Line: 160 ]]
	-- upvalues: GuiService (copy), closeContextMenu (copy), Players (copy), ResolveDisplayNameModule (copy), GetHeadshotThumbnailModule (copy)
	local Items = {}
	
	if GuiService:GetInspectMenuEnabled() then
		table.insert(Items, {
			key = "examine",
			label = "Examine avatar",
			telemetryAction = "avatar_examine",
			onActivated = function() --[[ Line: 167 ]]
				-- upvalues: GuiService (upval), Player (copy), closeContextMenu (upval)
				GuiService:InspectPlayerFromUserIdWithCtx(Player.UserId, "leaderBoard")
				closeContextMenu()
			end
		})
	end
	local LocalPlayer = Players.LocalPlayer
	
	return {
		player = Player,
		header = {
			displayName = ResolveDisplayNameModule(Player),
			username = `@{Player.Name}`,
			thumbnail = GetHeadshotThumbnailModule(Player.UserId)
		},
		items = Items,
		anchorPosition = AnchorPosition,
		telemetry = { isSelf = LocalPlayer ~= nil and Player == LocalPlayer }
	}
end

local v1 = nil
local Player = nil

local _ = function(p1) --[[ Line: 247 | Named "logItemActivated" ]]
	-- upvalues: Signal (ref), PlayerListContextMenuTelemetryModule (ref)
	if p1.telemetryAction ~= nil then
		local SignalResult = Signal(false)
		
		if PlayerListContextMenuTelemetryModule == nil then
			PlayerListContextMenuTelemetryModule = require(script.Parent.PlayerListContextMenuTelemetry)
		end
		PlayerListContextMenuTelemetryModule.logAction(p1.telemetryAction, SignalResult and SignalResult.telemetry)
	end
end

return {
	getMenuData = Signal,
	setMenuData = setMenuData,
	setMenuDataIfCurrent = function(p1, Count): boolean --[[ Line: 144 ]]
		-- upvalues: Count1 (ref), setMenuData (copy)
		if Count == Count1 then
			setMenuData(p1)
			
			return true
		else
			return false
		end
	end,
	openContextMenu = function(Player, AnchorPosition, p1) --[[ Line: 186 ]]
		-- upvalues: Count1 (ref), Signal2_1 (ref), Callback1 (ref), setMenuData (copy), fallbackMenuData (copy)
		Count1 += 1
		Signal2_1(nil)
		
		if Callback1 then
			Callback1(Player, AnchorPosition, Count1, p1)
			
			return
		else
			setMenuData((fallbackMenuData(Player, AnchorPosition)))
		end
	end,
	toggleContextMenu = function(Player1, AnchorPosition, p1) --[[ Line: 214 ]]
		-- upvalues: Signal (ref), closeContextMenu (copy), Player (ref), v1 (ref), Count1 (ref), Signal2_1 (ref), Callback1 (ref), setMenuData (copy), fallbackMenuData (copy)
		local SignalResult = Signal(false)
		
		if SignalResult ~= nil and SignalResult.player == Player1 then
			closeContextMenu()
			
			return
		end
		Player = Player1
		v1 = p1
		Count1 += 1
		Signal2_1(nil)
		
		if Callback1 then
			Callback1(Player1, AnchorPosition, Count1, nil)
			
			return
		else
			setMenuData((fallbackMenuData(Player1, AnchorPosition)))
		end
	end,
	getAnchorRow = function() --[[ Line: 205 ]]
		-- upvalues: Signal (ref), Player (ref), v1 (ref)
		local SignalResult = Signal(false)
		
		return if SignalResult == nil or SignalResult.player ~= Player then nil else v1
	end,
	closeContextMenu = closeContextMenu,
	setContextMenuOpener = function(Value) --[[ Line: 225 ]]
		-- upvalues: Callback1 (ref)
		Callback1 = Value
	end,
	setOnDismiss = function(Value) --[[ Line: 130 ]]
		-- upvalues: Callback (ref)
		Callback = Value
	end,
	setSuppressNextDismissRestore = function(Value) --[[ Line: 134 ]]
		-- upvalues: SuppressNextDismissRestore (ref)
		SuppressNextDismissRestore = Value
	end,
	takeSuppressNextDismissRestore = function(): boolean --[[ Line: 138 ]]
		-- upvalues: SuppressNextDismissRestore (ref)
		local SuppressNextDismissRestore1: boolean = SuppressNextDismissRestore
		SuppressNextDismissRestore = false
		
		return SuppressNextDismissRestore1
	end,
	buildMenuHeader = function(Player) --[[ Line: 152 ]]
		-- upvalues: ResolveDisplayNameModule (copy), GetHeadshotThumbnailModule (copy)
		return {
			displayName = ResolveDisplayNameModule(Player),
			username = `@{Player.Name}`,
			thumbnail = GetHeadshotThumbnailModule(Player.UserId)
		}
	end,
	reset = function() --[[ Line: 234 ]]
		-- upvalues: Count1 (ref), Signal2_1 (ref), Tbl (copy), Signal2 (ref), Callback1 (ref), Callback (ref), SuppressNextDismissRestore (ref), v1 (ref), Player (ref)
		Count1 += 1
		Signal2_1(nil)
		table.clear(Tbl)
		Signal2(nil)
		Signal2_1(nil)
		Callback1 = nil
		Callback = nil
		SuppressNextDismissRestore = false
		v1 = nil
		Player = nil
	end,
	getPendingConfirmKey = Signal1,
	activateMenuItem = function(p1) --[[ Line: 254 ]]
		-- upvalues: Tbl (copy), Signal1 (ref), Count (ref), Signal2_1 (ref), Signal (ref), PlayerListContextMenuTelemetryModule (ref)
		if p1.onceGroup ~= nil and Tbl[p1.onceGroup] ~= nil then return end
		if p1.requiresConfirm then
			if Signal1() == p1.key then
				if p1.onceGroup ~= nil then
					local OnceGroup = p1.onceGroup
					Count += 1
					local Count1: number = Count
					Tbl[OnceGroup] = Count1
					task.delay(5, function() --[[ Line: 83 ]]
						-- upvalues: Tbl (upval), OnceGroup (copy), Count1 (copy)
						if Tbl[OnceGroup] == Count1 then
							Tbl[OnceGroup] = nil
						end
					end)
				end
				Signal2_1(nil)
				
				if p1.telemetryAction ~= nil then
					local SignalResult = Signal(false)
					
					if PlayerListContextMenuTelemetryModule == nil then
						PlayerListContextMenuTelemetryModule = require(script.Parent.PlayerListContextMenuTelemetry)
					end
					PlayerListContextMenuTelemetryModule.logAction(p1.telemetryAction, SignalResult and SignalResult.telemetry)
				end
				if p1.onActivated then
					p1.onActivated()
					
					return
				end
			else
				Signal2_1(p1.key)
			end
			return
		else
			if Signal1() ~= nil then
				Signal2_1(nil)
			end
			if p1.onceGroup ~= nil then
				local OnceGroup1 = p1.onceGroup
				Count += 1
				local Count2: number = Count
				Tbl[OnceGroup1] = Count2
				task.delay(5, function() --[[ Line: 83 ]]
					-- upvalues: Tbl (upval), OnceGroup1 (copy), Count2 (copy)
					if Tbl[OnceGroup1] == Count2 then
						Tbl[OnceGroup1] = nil
					end
				end)
			end
			if p1.telemetryAction ~= nil then
				local SignalResult = Signal(false)
				
				if PlayerListContextMenuTelemetryModule == nil then
					PlayerListContextMenuTelemetryModule = require(script.Parent.PlayerListContextMenuTelemetry)
				end
				PlayerListContextMenuTelemetryModule.logAction(p1.telemetryAction, SignalResult and SignalResult.telemetry)
			end
			if p1.onActivated then
				p1.onActivated()
			end
		end
	end
}