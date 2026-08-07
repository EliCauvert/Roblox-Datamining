local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local _ = require(parent_1.Signals)
local useFocusGuiObject = require(parent_1.ReactFocusNavigation).useFocusGuiObject
local focusNavHelperModule = require(parent.Common.FocusNavHelper)
local _ = require(parent_1.LeaderboardStore)
local constantsModule = require(parent.Common.Constants)

return function() --[[ line: 57 | named "usePlayerListFocusNavigation" ]]
	-- upvalues: useFocusGuiObject (ref), reactModule (ref), focusNavHelperModule (ref), constantsModule (ref), guiService (ref)
	local var4 = useFocusGuiObject()
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef({})
	local var8 = reactModule.useCallback(function(p0, p1) --[[ line: 66 ]]
		-- upvalues: focusNavHelperModule (copy), var7 (ref), var4 (ref), var5 (ref)
		local nextPlayerInstance = focusNavHelperModule.getNextPlayerInstance(var7.current, p0, p1)
		
		if nextPlayerInstance then
			var4(nextPlayerInstance.object)
			
			return
		end
		var4(var5.current)
	end, {})
	local var9 = reactModule.useCallback(function() --[[ line: 78 ]]
		-- upvalues: var6 (ref), constantsModule (copy), var7 (ref), var4 (ref), var5 (ref), focusNavHelperModule (copy)
		if var6.current and var6.current ~= constantsModule.SELECTED_TITLE_PLAYER_ID then
			for i, v in var7.current do
				for i_1, v_1 in v.players do
					if v_1.userId == var6.current then
						var4(v_1.object)
						
						return
					end
				end
			end
		end
		if var5.current then
			var4(var5.current)
			
			return
		end
		local firstPlayerInstance = focusNavHelperModule.getFirstPlayerInstance(var7.current)
		
		if firstPlayerInstance then
			var4(firstPlayerInstance.object)
		end
	end, {})
	local var10 = reactModule.useCallback(function(p2) --[[ line: 104 ]]
		-- upvalues: var7 (ref)
		return function(p3, p4, p5) --[[ line: 105 ]]
			-- upvalues: var7 (copy), p2 (ref)
			if p4 and var7.current[p2] then
				var7.current[p2].players[p3] = { userId = p3, object = p4, order = p5 }
				
				return
			end
		end
	end, {})
	local var11 = reactModule.useCallback(function(p6) --[[ line: 118 ]]
		-- upvalues: var7 (ref), guiService (copy), var8 (ref)
		return function(p7) --[[ line: 119 ]]
			-- upvalues: var7 (copy), p6 (ref), guiService (copy), var8 (copy)
			local var19 = var7.current[p6]
			
			if not var19 then return end
			local var20 = var19.players[p7]
			
			if not var20 then return end
			if guiService.SelectedCoreObject == var20.object then
				var8(var20, p6)
			end
			var7.current[p6].players[p7] = nil
		end
	end, {})
	local var12 = reactModule.useCallback(function(p8, p9) --[[ line: 138 ]]
		-- upvalues: var10 (ref), var11 (ref), var7 (ref)
		local t = {
			teamId = p8,
			order = p9,
			players = {},
			registerPlayerInstance = var10(p8),
			unregisterPlayerInstance = var11(p8)
		}
		var7.current[p8] = t
		
		return t
	end, {})
	local var13 = reactModule.useCallback(function(p10) --[[ line: 152 ]]
		-- upvalues: var7 (ref)
		var7.current[p10] = nil
	end, {})
	local var14 = reactModule.useCallback(function(p11) --[[ line: 156 ]]
		-- upvalues: var5 (ref)
		var5.current = p11
	end, {})
	local var15 = reactModule.useCallback(function(p12) --[[ line: 160 ]]
		-- upvalues: var6 (ref)
		var6.current = p12
	end, {})
	local var16 = reactModule.useCallback(function(p13) --[[ line: 164 ]]
		-- upvalues: var4 (ref), var5 (ref), var6 (ref), var7 (ref)
		if p13 then
			var4(nil)
		end
		var5.current = nil
		var6.current = nil
		var7.current = {}
	end, {})
	
	return reactModule.useMemo(function() --[[ line: 175 ]]
		-- upvalues: var9 (ref), var12 (ref), var13 (ref), var14 (ref), var15 (ref), var16 (ref)
		return {
			getFocus = var9,
			registerTeamInstance = var12,
			unregisterTeamInstance = var13,
			setTitlePlayerInstance = var14,
			setSelectedPlayerId = var15,
			cleanup = var16
		}
	end, {
		var9, var12, var13, var14, var15, var16
	})
end