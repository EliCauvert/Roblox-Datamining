local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local _ = require(parent_1.Signals)
local useFocusGuiObject = require(parent_1.ReactFocusNavigation).useFocusGuiObject
local focusNavHelperModule = require(parent.Common.FocusNavHelper)
local _ = require(parent_1.LeaderboardStore)
local constantsModule = require(parent.Common.Constants)

return function()
	-- upvalues: useFocusGuiObject (ref), reactModule (ref), focusNavHelperModule (ref), constantsModule (ref), guiService (ref)
	local var1 = useFocusGuiObject()
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef({})
	local var5 = reactModule.useCallback(function(p1, p2)
		-- upvalues: focusNavHelperModule (copy), var4 (ref), var1 (ref), var2 (ref)
		local nextPlayerInstance = focusNavHelperModule.getNextPlayerInstance(var4.current, p1, p2)
		
		if nextPlayerInstance then
			var1(nextPlayerInstance.object)
			
			return
		end
		var1(var2.current)
	end, {})
	local var6 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), constantsModule (copy), var4 (ref), var1 (ref), var2 (ref), focusNavHelperModule (copy)
		if var3.current and var3.current ~= constantsModule.SELECTED_TITLE_PLAYER_ID then
			for i, v in var4.current do
				for i_1, v_1 in v.players do
					if v_1.userId == var3.current then
						var1(v_1.object)
						
						return
					end
				end
			end
		end
		if var2.current then
			var1(var2.current)
			
			return
		end
		local firstPlayerInstance = focusNavHelperModule.getFirstPlayerInstance(var4.current)
		
		if firstPlayerInstance then
			var1(firstPlayerInstance.object)
		end
	end, {})
	local var7 = reactModule.useCallback(function(p1)
		-- upvalues: var4 (ref)
		return function(p2, p3, p4)
			-- upvalues: var4 (copy), p1 (ref)
			if p3 and var4.current[p1] then
				var4.current[p1].players[p2] = { userId = p2, object = p3, order = p4 }
				
				return
			end
		end
	end, {})
	local var8 = reactModule.useCallback(function(p1)
		-- upvalues: var4 (ref), guiService (copy), var5 (ref)
		return function(p2)
			-- upvalues: var4 (copy), p1 (ref), guiService (copy), var5 (copy)
			local var9 = var4.current[p1]
			
			if not var9 then return end
			local var10 = var9.players[p2]
			
			if not var10 then return end
			if guiService.SelectedCoreObject == var10.object then
				var5(var10, p1)
			end
			var4.current[p1].players[p2] = nil
		end
	end, {})
	local var9 = reactModule.useCallback(function(p1, p2)
		-- upvalues: var7 (ref), var8 (ref), var4 (ref)
		local t = {
			teamId = p1,
			order = p2,
			players = {},
			registerPlayerInstance = var7(p1),
			unregisterPlayerInstance = var8(p1)
		}
		var4.current[p1] = t
		
		return t
	end, {})
	local var10 = reactModule.useCallback(function(p1)
		-- upvalues: var4 (ref)
		var4.current[p1] = nil
	end, {})
	local var11 = reactModule.useCallback(function(p1)
		-- upvalues: var2 (ref)
		var2.current = p1
	end, {})
	local var12 = reactModule.useCallback(function(p1)
		-- upvalues: var3 (ref)
		var3.current = p1
	end, {})
	local var13 = reactModule.useCallback(function(p1)
		-- upvalues: var1 (ref), var2 (ref), var3 (ref), var4 (ref)
		if p1 then
			var1(nil)
		end
		var2.current = nil
		var3.current = nil
		var4.current = {}
	end, {})
	
	return reactModule.useMemo(function()
		-- upvalues: var6 (ref), var9 (ref), var10 (ref), var11 (ref), var12 (ref), var13 (ref)
		return {
			getFocus = var6,
			registerTeamInstance = var9,
			unregisterTeamInstance = var10,
			setTitlePlayerInstance = var11,
			setSelectedPlayerId = var12,
			cleanup = var13
		}
	end, {
		var6, var9, var10, var11, var12, var13
	})
end