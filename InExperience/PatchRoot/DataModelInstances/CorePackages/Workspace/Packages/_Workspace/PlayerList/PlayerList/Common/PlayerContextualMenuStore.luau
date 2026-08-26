local parent = script.Parent.Parent
local parent_1 = parent.Parent
local guiService = game:GetService("GuiService")
local playersService = game:GetService("Players")
local signalsModule = require(parent_1.Signals)
local resolveDisplayNameModule = require(parent.Common.resolveDisplayName)
local getHeadshotThumbnailModule = require(parent.Common.getHeadshotThumbnail)
local _ = require(script.Parent.PlayerListContextMenuTelemetryAction)
local var1 = nil

local function _()
	-- upvalues: var1 (write)
	if var1 == nil then
		var1 = require(script.Parent.PlayerListContextMenuTelemetry)
	end
	return var1
end

local _ = nil
local _ = nil
local var2, var3 = signalsModule.createSignal(nil)
local var4 = var2
local var5 = var3
local _ = nil
local _ = nil
local var6, var7 = signalsModule.createSignal(nil)
local var8 = var6
local var9 = var7

local function setMenuData(value)
	-- upvalues: var4 (write), var9 (write), var5 (write), var1 (write)
	local var10 = value ~= nil and var4(false) == nil
	var9(nil)
	var5(value)
	
	if var10 then
		if var1 == nil then
			var1 = require(script.Parent.PlayerListContextMenuTelemetry)
		end
		var1.logAction("menu_open", value.telemetry)
	end
end

local var10 = nil
local var11 = nil
local var12 = false
local var13 = 0

local function closeContextMenu()
	-- upvalues: var4 (write), var13 (write), var9 (write), var1 (write), var5 (write), var11 (write)
	local var14 = var4(false)
	var13 += 1
	var9(nil)
	
	if var14 == nil then return end
	if var1 == nil then
		var1 = require(script.Parent.PlayerListContextMenuTelemetry)
	end
	var1.logAction("menu_close", var14.telemetry)
	var9(nil)
	var5(nil)
	
	if var11 then
		var11()
	end
end

local function setOnDismiss(value)
	-- upvalues: var11 (write)
	var11 = value
end

local function setSuppressNextDismissRestore(value)
	-- upvalues: var12 (write)
	var12 = value
end

local function takeSuppressNextDismissRestore()
	-- upvalues: var12 (write)
	var12 = false
	
	return var12
end

local function setMenuDataIfCurrent(value, p1)
	-- upvalues: var13 (write), var4 (write), var9 (write), var5 (write), var1 (write)
	if p1 ~= var13 then
		return false
	end
	local var14 = value ~= nil and var4(false) == nil
	var9(nil)
	var5(value)
	
	if var14 then
		if var1 == nil then
			var1 = require(script.Parent.PlayerListContextMenuTelemetry)
		end
		var1.logAction("menu_open", value.telemetry)
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

local function fallbackMenuData(p1, p2)
	-- upvalues: guiService (ref), closeContextMenu (ref), playersService (ref), resolveDisplayNameModule (ref), getHeadshotThumbnailModule (ref)
	local t = {}
	
	if guiService:GetInspectMenuEnabled() then
		table.insert(t, {
			key = "examine",
			label = "Examine avatar",
			telemetryAction = "avatar_examine",
			onActivated = function()
				-- upvalues: guiService (copy), p1 (ref), closeContextMenu (copy)
				guiService:InspectPlayerFromUserIdWithCtx(p1.UserId, "leaderBoard")
				closeContextMenu()
			end
		})
	end
	local localPlayer = playersService.LocalPlayer
	
	return {
		player = p1,
		header = {
			displayName = resolveDisplayNameModule(p1),
			username = `@{p1.Name}`,
			thumbnail = getHeadshotThumbnailModule(p1.UserId)
		},
		items = t,
		anchorPosition = p2,
		telemetry = { isSelf = localPlayer ~= nil and p1 == localPlayer }
	}
end

local _ = function(p1)
	-- upvalues: var4 (write), var1 (write)
	if p1.telemetryAction ~= nil then
		local var14 = var4(false)
		
		if var1 == nil then
			var1 = require(script.Parent.PlayerListContextMenuTelemetry)
		end
		var1.logAction(p1.telemetryAction, var14 and var14.telemetry)
	end
end

return {
	getMenuData = var4,
	setMenuData = setMenuData,
	setMenuDataIfCurrent = setMenuDataIfCurrent,
	openContextMenu = function(p1, p2)
		-- upvalues: var13 (write), var9 (write), var10 (write), fallbackMenuData (ref), var4 (write), var5 (write), var1 (write)
		var13 += 1
		var9(nil)
		
		if var10 then
			var10(p1, p2, var13)
			
			return
		end
		local var14 = fallbackMenuData(p1, p2)
		local var15 = var14 ~= nil and var4(false) == nil
		var9(nil)
		var5(var14)
		
		if var15 then
			if var1 == nil then
				var1 = require(script.Parent.PlayerListContextMenuTelemetry)
			end
			var1.logAction("menu_open", var14.telemetry)
		end
	end,
	closeContextMenu = closeContextMenu,
	setContextMenuOpener = function(value)
		-- upvalues: var10 (write)
		var10 = value
	end,
	setOnDismiss = setOnDismiss,
	setSuppressNextDismissRestore = setSuppressNextDismissRestore,
	takeSuppressNextDismissRestore = takeSuppressNextDismissRestore,
	buildMenuHeader = buildMenuHeader,
	reset = function()
		-- upvalues: var13 (write), var9 (write), var5 (write), var10 (write), var11 (write), var12 (write)
		var13 += 1
		var9(nil)
		var5(nil)
		var9(nil)
		var10 = nil
		var11 = nil
		var12 = false
	end,
	getPendingConfirmKey = var8,
	activateMenuItem = function(p1)
		-- upvalues: var8 (write), var9 (write), var4 (write), var1 (write)
		if p1.requiresConfirm then
			if var8() == p1.key then
				var9(nil)
				
				if p1.telemetryAction ~= nil then
					local var14 = var4(false)
					
					if var1 == nil then
						var1 = require(script.Parent.PlayerListContextMenuTelemetry)
					end
					var1.logAction(p1.telemetryAction, var14 and var14.telemetry)
				end
				if p1.onActivated then
					p1.onActivated()
					
					return
				end
			else
				var9(p1.key)
			end
			return
		elseif var8() ~= nil then
			var9(nil)
		end
		if p1.telemetryAction ~= nil then
			local var15 = var4(false)
			
			if var1 == nil then
				var1 = require(script.Parent.PlayerListContextMenuTelemetry)
			end
			var1.logAction(p1.telemetryAction, var15 and var15.telemetry)
		end
		if p1.onActivated then
			p1.onActivated()
		end
	end
}