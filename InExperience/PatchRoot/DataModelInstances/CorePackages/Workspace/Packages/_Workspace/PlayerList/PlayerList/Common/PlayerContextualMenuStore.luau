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
local var8 = nil
local var9 = nil
local var10 = 0

local function fallbackMenuData(p0, p1) --[[ line: 82 ]]
	-- upvalues: guiService (ref), var10 (write), var7 (write), var9 (write), resolveDisplayNameModule (ref), getHeadshotThumbnailModule (ref)
	local t = {}
	
	if guiService:GetInspectMenuEnabled() then
		table.insert(t, {
			key = "examine",
			label = "Examine avatar",
			onActivated = function() --[[ line: 88 ]]
				-- upvalues: guiService (copy), p0 (ref), var10 (copy), var7 (copy), var9 (copy)
				guiService:InspectPlayerFromUserIdWithCtx(p0.UserId, "leaderBoard")
				var10 += 1
				var7(nil)
				
				if var9 then
					var9()
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
	setMenuData = var7,
	setMenuDataIfCurrent = function(value, p2) --[[ line: 63 ]]
		-- upvalues: var10 (write), var7 (write)
		if p2 == var10 then
			var7(value)
			
			return true
		end
		return false
	end,
	openContextMenu = function(p3, p4) --[[ line: 105 ]]
		-- upvalues: var10 (write), var8 (write), var7 (write), fallbackMenuData (ref)
		var10 += 1
		
		if var8 then
			var8(p3, p4, var10)
			
			return
		end
		var7(fallbackMenuData(p3, p4))
	end,
	closeContextMenu = function() --[[ line: 48 ]]
		-- upvalues: var10 (write), var7 (write), var9 (write)
		var10 += 1
		var7(nil)
		
		if var9 then
			var9()
		end
	end,
	setContextMenuOpener = function(value) --[[ line: 115 ]]
		-- upvalues: var8 (write)
		var8 = value
	end,
	setOnDismiss = function(value) --[[ line: 56 ]]
		-- upvalues: var9 (write)
		var9 = value
	end,
	buildMenuHeader = function(p5) --[[ line: 74 ]]
		-- upvalues: resolveDisplayNameModule (ref), getHeadshotThumbnailModule (ref)
		return {
			displayName = resolveDisplayNameModule(p5),
			username = `@{p5.Name}`,
			thumbnail = getHeadshotThumbnailModule(p5.UserId)
		}
	end,
	reset = function() --[[ line: 119 ]]
		-- upvalues: var10 (write), var7 (write), var8 (write), var9 (write)
		var10 += 1
		var7(nil)
		var8 = nil
		var9 = nil
	end
}