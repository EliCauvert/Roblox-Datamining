local parent = script.Parent.Parent
local parent_1 = parent.Parent
local guiService = game:GetService("GuiService")
local playersService = game:GetService("Players")
local signalsModule = require(parent_1.Signals)
local resolveDisplayNameModule = require(parent.Common.resolveDisplayName)
local getHeadshotThumbnailModule = require(parent.Common.getHeadshotThumbnail)
local _ = require(script.Parent.PlayerListContextMenuTelemetryAction)
local var5 = nil

local function _()
	-- upvalues: var5 (write)
	if var5 == nil then
		var5 = require(script.Parent.PlayerListContextMenuTelemetry)
	end
	return var5
end

local _ = nil
local _ = nil
local var6, var7 = signalsModule.createSignal(nil)
local var8 = var6
local var9 = var7
local _ = nil
local _ = nil
local var10, var11 = signalsModule.createSignal(nil)
local var12 = var10
local var13 = var11

local function setMenuData(value)
	-- upvalues: var8 (write), var13 (write), var9 (write), var5 (write)
	local var26 = value ~= nil and var8(false) == nil
	var13(nil)
	var9(value)
	
	if var26 then
		if var5 == nil then
			var5 = require(script.Parent.PlayerListContextMenuTelemetry)
		end
		var5.logAction("menu_open", value.telemetry)
	end
end

local var15 = nil
local var16 = nil
local var17 = false
local var18 = 0

local function closeContextMenu()
	-- upvalues: var8 (write), var18 (write), var13 (write), var5 (write), var9 (write), var16 (write)
	local var27 = var8(false)
	var18 += 1
	var13(nil)
	
	if var27 == nil then return end
	if var5 == nil then
		var5 = require(script.Parent.PlayerListContextMenuTelemetry)
	end
	var5.logAction("menu_close", var27.telemetry)
	var13(nil)
	var9(nil)
	
	if var16 then
		var16()
	end
end

local function setOnDismiss(value)
	-- upvalues: var16 (write)
	var16 = value
end

local function setSuppressNextDismissRestore(value)
	-- upvalues: var17 (write)
	var17 = value
end

local function takeSuppressNextDismissRestore()
	-- upvalues: var17 (write)
	var17 = false
	
	return var17
end

local function setMenuDataIfCurrent(value, p0)
	-- upvalues: var18 (write), var8 (write), var13 (write), var9 (write), var5 (write)
	if p0 ~= var18 then
		return false
	end
	local var28 = value ~= nil and var8(false) == nil
	var13(nil)
	var9(value)
	
	if var28 then
		if var5 == nil then
			var5 = require(script.Parent.PlayerListContextMenuTelemetry)
		end
		var5.logAction("menu_open", value.telemetry)
	end
	return true
end

local function buildMenuHeader(p1)
	-- upvalues: resolveDisplayNameModule (ref), getHeadshotThumbnailModule (ref)
	return {
		displayName = resolveDisplayNameModule(p1),
		username = `@{p1.Name}`,
		thumbnail = getHeadshotThumbnailModule(p1.UserId)
	}
end

local function fallbackMenuData(p2, p3)
	-- upvalues: guiService (ref), closeContextMenu (ref), playersService (ref), resolveDisplayNameModule (ref), getHeadshotThumbnailModule (ref)
	local t = {}
	
	if guiService:GetInspectMenuEnabled() then
		table.insert(t, {
			key = "examine",
			label = "Examine avatar",
			telemetryAction = "avatar_examine",
			onActivated = function()
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

local _ = function(p4)
	-- upvalues: var8 (write), var5 (write)
	if p4.telemetryAction ~= nil then
		local var30 = var8(false)
		
		if var5 == nil then
			var5 = require(script.Parent.PlayerListContextMenuTelemetry)
		end
		var5.logAction(p4.telemetryAction, var30 and var30.telemetry)
	end
end

return {
	getMenuData = var8,
	setMenuData = setMenuData,
	setMenuDataIfCurrent = setMenuDataIfCurrent,
	openContextMenu = function(p5, p6)
		-- upvalues: var18 (write), var13 (write), var15 (write), fallbackMenuData (ref), var8 (write), var9 (write), var5 (write)
		var18 += 1
		var13(nil)
		
		if var15 then
			var15(p5, p6, var18)
			
			return
		end
		local var31 = fallbackMenuData(p5, p6)
		local var32 = var31 ~= nil and var8(false) == nil
		var13(nil)
		var9(var31)
		
		if var32 then
			if var5 == nil then
				var5 = require(script.Parent.PlayerListContextMenuTelemetry)
			end
			var5.logAction("menu_open", var31.telemetry)
		end
	end,
	closeContextMenu = closeContextMenu,
	setContextMenuOpener = function(value)
		-- upvalues: var15 (write)
		var15 = value
	end,
	setOnDismiss = setOnDismiss,
	setSuppressNextDismissRestore = setSuppressNextDismissRestore,
	takeSuppressNextDismissRestore = takeSuppressNextDismissRestore,
	buildMenuHeader = buildMenuHeader,
	reset = function()
		-- upvalues: var18 (write), var13 (write), var9 (write), var15 (write), var16 (write), var17 (write)
		var18 += 1
		var13(nil)
		var9(nil)
		var13(nil)
		var15 = nil
		var16 = nil
		var17 = false
	end,
	getPendingConfirmKey = var12,
	activateMenuItem = function(p7)
		-- upvalues: var12 (write), var13 (write), var8 (write), var5 (write)
		if p7.requiresConfirm then
			if var12() == p7.key then
				var13(nil)
				
				if p7.telemetryAction ~= nil then
					local var33 = var8(false)
					
					if var5 == nil then
						var5 = require(script.Parent.PlayerListContextMenuTelemetry)
					end
					var5.logAction(p7.telemetryAction, var33 and var33.telemetry)
				end
				if p7.onActivated then
					p7.onActivated()
					
					return
				end
			else
				var13(p7.key)
			end
			return
		elseif var12() ~= nil then
			var13(nil)
		end
		if p7.telemetryAction ~= nil then
			local var34 = var8(false)
			
			if var5 == nil then
				var5 = require(script.Parent.PlayerListContextMenuTelemetry)
			end
			var5.logAction(p7.telemetryAction, var34 and var34.telemetry)
		end
		if p7.onActivated then
			p7.onActivated()
		end
	end
}