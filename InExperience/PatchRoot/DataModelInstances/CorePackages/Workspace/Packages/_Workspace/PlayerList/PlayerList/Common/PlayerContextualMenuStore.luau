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
local t = {}
local var10 = 0

local _ = function(p1)
	-- upvalues: var10 (write), t (ref)
	var10 += 1
	local var11 = var10
	t[p1] = var11
	task.delay(5, function()
		-- upvalues: t (copy), p1 (ref), var11 (ref)
		if t[p1] == var11 then
			t[p1] = nil
		end
	end)
end

local function setMenuData(value)
	-- upvalues: var4 (write), var9 (write), t (ref), var5 (write), var1 (write)
	local var11 = value ~= nil and var4(false) == nil
	var9(nil)
	table.clear(t)
	var5(value)
	
	if var11 then
		if var1 == nil then
			var1 = require(script.Parent.PlayerListContextMenuTelemetry)
		end
		var1.logAction("menu_open", value.telemetry)
	end
end

local var11 = nil
local var12 = nil
local var13 = false
local var14 = 0

local function closeContextMenu()
	-- upvalues: var4 (write), var14 (write), var9 (write), var1 (write), t (ref), var5 (write), var12 (write)
	local var15 = var4(false)
	var14 += 1
	var9(nil)
	
	if var15 == nil then return end
	if var1 == nil then
		var1 = require(script.Parent.PlayerListContextMenuTelemetry)
	end
	var1.logAction("menu_close", var15.telemetry)
	var9(nil)
	table.clear(t)
	var5(nil)
	
	if var12 then
		var12()
	end
end

local function setOnDismiss(value)
	-- upvalues: var12 (write)
	var12 = value
end

local function setSuppressNextDismissRestore(value)
	-- upvalues: var13 (write)
	var13 = value
end

local function takeSuppressNextDismissRestore()
	-- upvalues: var13 (write)
	var13 = false
	
	return var13
end

local function setMenuDataIfCurrent(value, p1)
	-- upvalues: var14 (write), setMenuData (ref)
	if p1 == var14 then
		setMenuData(value)
		
		return true
	end
	return false
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

local function openContextMenu(p1, p2, p3)
	-- upvalues: var14 (write), var9 (write), var11 (write), setMenuData (ref), fallbackMenuData (ref)
	var14 += 1
	var9(nil)
	
	if var11 then
		var11(p1, p2, var14, p3)
		
		return
	end
	setMenuData(fallbackMenuData(p1, p2))
end

local var15 = nil
local var16 = nil

local _ = function(p1)
	-- upvalues: var4 (write), var1 (write)
	if p1.telemetryAction ~= nil then
		local var17 = var4(false)
		
		if var1 == nil then
			var1 = require(script.Parent.PlayerListContextMenuTelemetry)
		end
		var1.logAction(p1.telemetryAction, var17 and var17.telemetry)
	end
end

return {
	getMenuData = var4,
	setMenuData = setMenuData,
	setMenuDataIfCurrent = setMenuDataIfCurrent,
	openContextMenu = openContextMenu,
	toggleContextMenu = function(p1, p2, p3)
		-- upvalues: var4 (write), closeContextMenu (ref), var16 (write), var15 (write), var14 (write), var9 (write), var11 (write), setMenuData (ref), fallbackMenuData (ref)
		local var17 = var4(false)
		
		if var17 ~= nil and var17.player == p1 then
			closeContextMenu()
			
			return
		end
		var16 = p1
		var15 = p3
		var14 += 1
		var9(nil)
		
		if var11 then
			var11(p1, p2, var14, nil)
			
			return
		end
		setMenuData(fallbackMenuData(p1, p2))
	end,
	getAnchorRow = function()
		-- upvalues: var4 (write), var16 (write), var15 (write)
		local var17 = var4(false)
		
		return if var17 == nil or var17.player ~= var16 then nil else var15
	end,
	closeContextMenu = closeContextMenu,
	setContextMenuOpener = function(value)
		-- upvalues: var11 (write)
		var11 = value
	end,
	setOnDismiss = setOnDismiss,
	setSuppressNextDismissRestore = setSuppressNextDismissRestore,
	takeSuppressNextDismissRestore = takeSuppressNextDismissRestore,
	buildMenuHeader = buildMenuHeader,
	reset = function()
		-- upvalues: var14 (write), var9 (write), t (ref), var5 (write), var11 (write), var12 (write), var13 (write), var15 (write), var16 (write)
		var14 += 1
		var9(nil)
		table.clear(t)
		var5(nil)
		var9(nil)
		var11 = nil
		var12 = nil
		var13 = false
		var15 = nil
		var16 = nil
	end,
	getPendingConfirmKey = var8,
	activateMenuItem = function(p1)
		-- upvalues: t (ref), var8 (write), var10 (write), var9 (write), var4 (write), var1 (write)
		if p1.onceGroup ~= nil and t[p1.onceGroup] ~= nil then return end
		if p1.requiresConfirm then
			if var8() == p1.key then
				if p1.onceGroup ~= nil then
					local onceGroup = p1.onceGroup
					var10 += 1
					local var17 = var10
					t[onceGroup] = var17
					task.delay(5, function()
						-- upvalues: t (copy), onceGroup (ref), var17 (ref)
						if t[onceGroup] == var17 then
							t[onceGroup] = nil
						end
					end)
				end
				var9(nil)
				
				if p1.telemetryAction ~= nil then
					local var18 = var4(false)
					
					if var1 == nil then
						var1 = require(script.Parent.PlayerListContextMenuTelemetry)
					end
					var1.logAction(p1.telemetryAction, var18 and var18.telemetry)
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
		if p1.onceGroup ~= nil then
			local onceGroup = p1.onceGroup
			var10 += 1
			local var19 = var10
			t[onceGroup] = var19
			task.delay(5, function()
				-- upvalues: t (copy), onceGroup (ref), var19 (ref)
				if t[onceGroup] == var19 then
					t[onceGroup] = nil
				end
			end)
		end
		if p1.telemetryAction ~= nil then
			local var20 = var4(false)
			
			if var1 == nil then
				var1 = require(script.Parent.PlayerListContextMenuTelemetry)
			end
			var1.logAction(p1.telemetryAction, var20 and var20.telemetry)
		end
		if p1.onActivated then
			p1.onActivated()
		end
	end
}