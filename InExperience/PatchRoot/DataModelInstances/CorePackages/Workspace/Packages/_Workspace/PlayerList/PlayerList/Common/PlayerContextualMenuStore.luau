local parent = script.Parent.Parent
local guiService = game:GetService("GuiService")
local signalsModule = require(parent.Parent.Signals)
local resolveDisplayNameModule = require(parent.Common.resolveDisplayName)
local getHeadshotThumbnailModule = require(parent.Common.getHeadshotThumbnail)
local _ = nil
local _ = nil
local var4, var5 = signalsModule.createSignal(nil)
local var6 = var4
local var7 = var5
local _ = nil
local _ = nil
local var8, var9 = signalsModule.createSignal(nil)
local var10 = var8
local var11 = var9

local function setMenuData(value) --[[ line: 49 ]]
	-- upvalues: var11 (write), var7 (write)
	var11(nil)
	var7(value)
end

local var13 = nil
local var14 = nil
local var15 = false
local var16 = 0

local function fallbackMenuData(p0, p1) --[[ line: 102 ]]
	-- upvalues: guiService (ref), var16 (write), var11 (write), var7 (write), var14 (write), resolveDisplayNameModule (ref), getHeadshotThumbnailModule (ref)
	local t = {}
	
	if guiService:GetInspectMenuEnabled() then
		table.insert(t, {
			key = "examine",
			label = "Examine avatar",
			onActivated = function() --[[ line: 108 ]]
				-- upvalues: guiService (copy), p0 (ref), var16 (copy), var11 (copy), var7 (copy), var14 (copy)
				guiService:InspectPlayerFromUserIdWithCtx(p0.UserId, "leaderBoard")
				var16 += 1
				var11(nil)
				var7(nil)
				var11(nil)
				
				if var14 then
					var14()
				end
			end
		})
	end
	return {
		player = p0,
		header = {
			displayName = resolveDisplayNameModule(p0),
			username = `@{p0.Name}`,
			thumbnail = getHeadshotThumbnailModule(p0.UserId)
		},
		items = t,
		anchorPosition = p1
	}
end

return {
	getMenuData = var6,
	setMenuData = setMenuData,
	setMenuDataIfCurrent = function(value, p2) --[[ line: 86 ]]
		-- upvalues: var16 (write), var11 (write), var7 (write)
		if p2 == var16 then
			var11(nil)
			var7(value)
			
			return true
		end
		return false
	end,
	openContextMenu = function(p3, p4) --[[ line: 125 ]]
		-- upvalues: var16 (write), var11 (write), var13 (write), fallbackMenuData (ref), var7 (write)
		var16 += 1
		var11(nil)
		
		if var13 then
			var13(p3, p4, var16)
			
			return
		end
		local var19 = fallbackMenuData(p3, p4)
		var11(nil)
		var7(var19)
	end,
	closeContextMenu = function() --[[ line: 63 ]]
		-- upvalues: var16 (write), var11 (write), var7 (write), var14 (write)
		var16 += 1
		var11(nil)
		var7(nil)
		var11(nil)
		
		if var14 then
			var14()
		end
	end,
	setContextMenuOpener = function(value) --[[ line: 138 ]]
		-- upvalues: var13 (write)
		var13 = value
	end,
	setOnDismiss = function(value) --[[ line: 72 ]]
		-- upvalues: var14 (write)
		var14 = value
	end,
	setSuppressNextDismissRestore = function(value) --[[ line: 76 ]]
		-- upvalues: var15 (write)
		var15 = value
	end,
	takeSuppressNextDismissRestore = function() --[[ line: 80 ]]
		-- upvalues: var15 (write)
		var15 = false
		
		return var15
	end,
	buildMenuHeader = function(p5) --[[ line: 94 ]]
		-- upvalues: resolveDisplayNameModule (ref), getHeadshotThumbnailModule (ref)
		return {
			displayName = resolveDisplayNameModule(p5),
			username = `@{p5.Name}`,
			thumbnail = getHeadshotThumbnailModule(p5.UserId)
		}
	end,
	reset = function() --[[ line: 142 ]]
		-- upvalues: var16 (write), var11 (write), var7 (write), var13 (write), var14 (write), var15 (write)
		var16 += 1
		var11(nil)
		var7(nil)
		var11(nil)
		var13 = nil
		var14 = nil
		var15 = false
	end,
	getPendingConfirmKey = var10,
	activateMenuItem = function(p6) --[[ line: 151 ]]
		-- upvalues: var10 (write), var11 (write)
		if p6.requiresConfirm then
			if var10() == p6.key then
				var11(nil)
				
				if p6.onActivated then
					p6.onActivated()
					
					return
				end
			else
				var11(p6.key)
			end
			return
		elseif var10() ~= nil then
			var11(nil)
		end
		if p6.onActivated then
			p6.onActivated()
		end
	end
}