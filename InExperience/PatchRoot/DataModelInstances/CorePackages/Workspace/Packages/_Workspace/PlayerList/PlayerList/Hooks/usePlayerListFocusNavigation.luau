local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local _ = require(Parent1.Signals)
local UseFocusGuiObjectFunction = require(Parent1.ReactFocusNavigation).useFocusGuiObject
local FocusNavHelperModule = require(Parent.Common.FocusNavHelper)
local _ = require(Parent1.LeaderboardStore)
local ConstantsModule = require(Parent.Common.Constants)

return function() --[[ Line: 57 | Named "usePlayerListFocusNavigation" ]]
	-- upvalues: UseFocusGuiObjectFunction (copy), ReactModule (copy), FocusNavHelperModule (copy), ConstantsModule (copy), GuiService (copy)
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef({})
	local UseResult = ReactModule.useCallback(function(p1, p2) --[[ Line: 66 ]]
		-- upvalues: FocusNavHelperModule (upval), UseRefResult2 (copy), UseFocusGuiObjectResult (copy), UseRefResult (copy)
		local NextPlayerInstance = FocusNavHelperModule.getNextPlayerInstance(UseRefResult2.current, p1, p2)
		
		if NextPlayerInstance then
			UseFocusGuiObjectResult(NextPlayerInstance.object)
			
			return
		else
			UseFocusGuiObjectResult(UseRefResult.current)
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 78 ]]
		-- upvalues: UseRefResult1 (copy), ConstantsModule (upval), UseRefResult2 (copy), UseFocusGuiObjectResult (copy), UseRefResult (copy), FocusNavHelperModule (upval)
		if UseRefResult1.current and UseRefResult1.current ~= ConstantsModule.SELECTED_TITLE_PLAYER_ID then
			for _, value in UseRefResult2.current do
				for _, player in value.players do
					if player.userId == UseRefResult1.current then
						UseFocusGuiObjectResult(player.object)
						
						return
					end
				end
			end
		end
		if UseRefResult.current then
			UseFocusGuiObjectResult(UseRefResult.current)
			
			return
		end
		local FirstPlayerInstance = FocusNavHelperModule.getFirstPlayerInstance(UseRefResult2.current)
		
		if FirstPlayerInstance then
			UseFocusGuiObjectResult(FirstPlayerInstance.object)
		end
	end, {})
	local UseResult2 = ReactModule.useCallback(function(p1) --[[ Line: 104 ]]
		-- upvalues: UseRefResult2 (copy)
		return function(UserId, Object, Order) --[[ Line: 105 ]]
			-- upvalues: UseRefResult2 (upval), p1 (copy)
			if Object and UseRefResult2.current[p1] then
				UseRefResult2.current[p1].players[UserId] = { userId = UserId, object = Object, order = Order }
				
				return
			end
		end
	end, {})
	local UseResult3 = ReactModule.useCallback(function(p1) --[[ Line: 118 ]]
		-- upvalues: UseRefResult2 (copy), GuiService (upval), UseResult (copy)
		return function(p2) --[[ Line: 119 ]]
			-- upvalues: UseRefResult2 (upval), p1 (copy), GuiService (upval), UseResult (upval)
			local CurrentEntry = UseRefResult2.current[p1]
			
			if not CurrentEntry then return end
			local Player = CurrentEntry.players[p2]
			
			if not Player then return end
			if GuiService.SelectedCoreObject == Player.object then
				UseResult(Player, p1)
			end
			UseRefResult2.current[p1].players[p2] = nil
		end
	end, {})
	local UseResult4 = ReactModule.useCallback(function(TeamId, Order) --[[ Line: 138 ]]
		-- upvalues: UseResult2 (copy), UseResult3 (copy), UseRefResult2 (copy)
		local config = {
			teamId = TeamId,
			order = Order,
			players = {},
			registerPlayerInstance = UseResult2(TeamId),
			unregisterPlayerInstance = UseResult3(TeamId)
		}
		UseRefResult2.current[TeamId] = config
		
		return config
	end, {})
	local UseResult5 = ReactModule.useCallback(function(p1) --[[ Line: 152 ]]
		-- upvalues: UseRefResult2 (copy)
		UseRefResult2.current[p1] = nil
	end, {})
	local UseResult6 = ReactModule.useCallback(function(Current) --[[ Line: 156 ]]
		-- upvalues: UseRefResult (copy)
		UseRefResult.current = Current
	end, {})
	local UseResult7 = ReactModule.useCallback(function(Current) --[[ Line: 160 ]]
		-- upvalues: UseRefResult1 (copy)
		UseRefResult1.current = Current
	end, {})
	local UseResult8 = ReactModule.useCallback(function(p1) --[[ Line: 164 ]]
		-- upvalues: UseFocusGuiObjectResult (copy), UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy)
		if p1 then
			UseFocusGuiObjectResult(nil)
		end
		UseRefResult.current = nil
		UseRefResult1.current = nil
		UseRefResult2.current = {}
	end, {})
	
	return ReactModule.useMemo(function() --[[ Line: 175 ]]
		-- upvalues: UseResult1 (copy), UseResult4 (copy), UseResult5 (copy), UseResult6 (copy), UseResult7 (copy), UseResult8 (copy)
		return {
			getFocus = UseResult1,
			registerTeamInstance = UseResult4,
			unregisterTeamInstance = UseResult5,
			setTitlePlayerInstance = UseResult6,
			setSelectedPlayerId = UseResult7,
			cleanup = UseResult8
		}
	end, {
		UseResult1, UseResult4, UseResult5, UseResult6, UseResult7, UseResult8
	})
end