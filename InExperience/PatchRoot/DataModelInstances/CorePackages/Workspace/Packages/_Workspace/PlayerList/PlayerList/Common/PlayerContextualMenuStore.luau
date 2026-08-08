local parent = script.Parent.Parent
local parent_1 = parent.Parent
local guiService = game:GetService("GuiService")
local playersService = game:GetService("Players")
local signalsModule = require(parent_1.Signals)
local resolveDisplayNameModule = require(parent.Common.resolveDisplayName)
local getHeadshotThumbnailModule = require(parent.Common.getHeadshotThumbnail)
local fFlagPlayerListContextMenuTelemetryModule = require(parent.Flags.FFlagPlayerListContextMenuTelemetry)
local _ = require(script.Parent.PlayerListContextMenuTelemetryAction)
local var6 = nil

local function _() --[[ line: 16 | named "getContextMenuTelemetry" ]]
	-- upvalues: var6 (write)
	if var6 == nil then
		var6 = require(script.Parent.PlayerListContextMenuTelemetry)
	end
	return var6
end

local _ = nil
local _ = nil
local var7, var8 = signalsModule.createSignal(nil)
local var9 = var7
local var10 = var8
local _ = nil
local _ = nil
local var11, var12 = signalsModule.createSignal(nil)
local var13 = var11
local var14 = var12

local function setMenuData(value) --[[ line: 69 ]]
	-- upvalues: fFlagPlayerListContextMenuTelemetryModule (ref), var9 (write), var14 (write), var10 (write), var6 (write)
	local var27 = fFlagPlayerListContextMenuTelemetryModule and (value ~= nil and var9(false) == nil)
	var14(nil)
	var10(value)
	
	if var27 then
		if var6 == nil then
			var6 = require(script.Parent.PlayerListContextMenuTelemetry)
		end
		var6.logAction("menu_open", value.telemetry)
	end
end

local var16 = nil
local var17 = nil
local var18 = false
local var19 = 0

local function closeContextMenu() --[[ line: 89 ]]
	-- upvalues: fFlagPlayerListContextMenuTelemetryModule (ref), var9 (write), var6 (write), var19 (write), var14 (write), var10 (write), var17 (write)
	if fFlagPlayerListContextMenuTelemetryModule then
		local var28 = var9(false)
		
		if var28 ~= nil then
			if var6 == nil then
				var6 = require(script.Parent.PlayerListContextMenuTelemetry)
			end
			var6.logAction("menu_close", var28.telemetry)
		end
	end
	var19 += 1
	local var29 = fFlagPlayerListContextMenuTelemetryModule and false
	var14(nil)
	var10(nil)
	
	if var29 then
		if var6 == nil then
			var6 = require(script.Parent.PlayerListContextMenuTelemetry)
		end
		var6.logAction("menu_open", (nil).telemetry)
	end
	var14(nil)
	
	if var17 then
		var17()
	end
end

local function setOnDismiss(value) --[[ line: 106 ]]
	-- upvalues: var17 (write)
	var17 = value
end

local function setSuppressNextDismissRestore(value) --[[ line: 110 ]]
	-- upvalues: var18 (write)
	var18 = value
end

local function takeSuppressNextDismissRestore() --[[ line: 114 ]]
	-- upvalues: var18 (write)
	var18 = false
	
	return var18
end

local function setMenuDataIfCurrent(value, p0) --[[ line: 120 ]]
	-- upvalues: var19 (write), fFlagPlayerListContextMenuTelemetryModule (ref), var9 (write), var14 (write), var10 (write), var6 (write)
	if p0 ~= var19 then
		return false
	end
	local var31 = fFlagPlayerListContextMenuTelemetryModule and (value ~= nil and var9(false) == nil)
	var14(nil)
	var10(value)
	
	if var31 then
		if var6 == nil then
			var6 = require(script.Parent.PlayerListContextMenuTelemetry)
		end
		var6.logAction("menu_open", value.telemetry)
	end
	return true
end

local function buildMenuHeader(p1) --[[ line: 128 ]]
	-- upvalues: resolveDisplayNameModule (ref), getHeadshotThumbnailModule (ref)
	return {
		displayName = resolveDisplayNameModule(p1),
		username = `@{p1.Name}`,
		thumbnail = getHeadshotThumbnailModule(p1.UserId)
	}
end

local function fallbackMenuData(p2, p3) --[[ line: 136 ]]
	-- upvalues: guiService (ref), closeContextMenu (ref), playersService (ref), resolveDisplayNameModule (ref), getHeadshotThumbnailModule (ref)
	local t = {}
	
	if guiService:GetInspectMenuEnabled() then
		table.insert(t, {
			key = "examine",
			label = "Examine avatar",
			telemetryAction = "avatar_examine",
			onActivated = function() --[[ line: 143 ]]
				-- upvalues: guiService (copy), p2 (ref), closeContextMenu (copy)
				guiService:InspectPlayerFromUserIdWithCtx(p2.UserId, "leaderBoard")
				closeContextMenu()
			end
		})
	end
	local localPlayer = playersService.LocalPlayer
	
	return {
		player = p2,
		header = {
			displayName = resolveDisplayNameModule(p2),
			username = `@{p2.Name}`,
			thumbnail = getHeadshotThumbnailModule(p2.UserId)
		},
		items = t,
		anchorPosition = p3,
		telemetry = { isSelf = localPlayer ~= nil and p2 == localPlayer }
	}
end

local _ = function(p4) --[[ line: 190 | named "logItemActivated" ]]
	-- upvalues: fFlagPlayerListContextMenuTelemetryModule (ref), var9 (write), var6 (write)
	if fFlagPlayerListContextMenuTelemetryModule and p4.telemetryAction ~= nil then
		local var33 = var9(false)
		
		if var6 == nil then
			var6 = require(script.Parent.PlayerListContextMenuTelemetry)
		end
		var6.logAction(p4.telemetryAction, var33 and var33.telemetry)
	end
end

return {
	getMenuData = var9,
	setMenuData = setMenuData,
	setMenuDataIfCurrent = setMenuDataIfCurrent,
	openContextMenu = function(p5, p6) --[[ line: 162 ]]
		-- upvalues: var19 (write), var14 (write), var16 (write), fallbackMenuData (ref), fFlagPlayerListContextMenuTelemetryModule (ref), var9 (write), var10 (write), var6 (write)
		var19 += 1
		var14(nil)
		
		if var16 then
			var16(p5, p6, var19)
			
			return
		end
		local var34 = fallbackMenuData(p5, p6)
		local var35 = fFlagPlayerListContextMenuTelemetryModule and (var34 ~= nil and var9(false) == nil)
		var14(nil)
		var10(var34)
		
		if var35 then
			if var6 == nil then
				var6 = require(script.Parent.PlayerListContextMenuTelemetry)
			end
			var6.logAction("menu_open", var34.telemetry)
		end
	end,
	closeContextMenu = closeContextMenu,
	setContextMenuOpener = function(value) --[[ line: 175 ]]
		-- upvalues: var16 (write)
		var16 = value
	end,
	setOnDismiss = setOnDismiss,
	setSuppressNextDismissRestore = setSuppressNextDismissRestore,
	takeSuppressNextDismissRestore = takeSuppressNextDismissRestore,
	buildMenuHeader = buildMenuHeader,
	reset = function() --[[ line: 179 ]]
		-- upvalues: var19 (write), fFlagPlayerListContextMenuTelemetryModule (ref), var9 (write), var14 (write), var10 (write), var6 (write), var16 (write), var17 (write), var18 (write)
		var19 += 1
		local var36 = fFlagPlayerListContextMenuTelemetryModule and false
		var14(nil)
		var10(nil)
		
		if var36 then
			if var6 == nil then
				var6 = require(script.Parent.PlayerListContextMenuTelemetry)
			end
			var6.logAction("menu_open", (nil).telemetry)
		end
		var14(nil)
		var16 = nil
		var17 = nil
		var18 = false
	end,
	getPendingConfirmKey = var13,
	activateMenuItem = function(p7) --[[ line: 197 ]]
		-- upvalues: var13 (write), var14 (write), fFlagPlayerListContextMenuTelemetryModule (ref), var9 (write), var6 (write)
		if p7.requiresConfirm then
			if var13() == p7.key then
				var14(nil)
				
				if fFlagPlayerListContextMenuTelemetryModule and fFlagPlayerListContextMenuTelemetryModule and p7.telemetryAction ~= nil then
					local var38 = var9(false)
					
					if var6 == nil then
						var6 = require(script.Parent.PlayerListContextMenuTelemetry)
					end
					var6.logAction(p7.telemetryAction, var38 and var38.telemetry)
				end
				if p7.onActivated then
					p7.onActivated()
					
					return
				end
			else
				var14(p7.key)
			end
			return
		elseif var13() ~= nil then
			var14(nil)
		end
		if fFlagPlayerListContextMenuTelemetryModule and fFlagPlayerListContextMenuTelemetryModule and p7.telemetryAction ~= nil then
			local var39 = var9(false)
			
			if var6 == nil then
				var6 = require(script.Parent.PlayerListContextMenuTelemetry)
			end
			var6.logAction(p7.telemetryAction, var39 and var39.telemetry)
		end
		if p7.onActivated then
			p7.onActivated()
		end
	end
}