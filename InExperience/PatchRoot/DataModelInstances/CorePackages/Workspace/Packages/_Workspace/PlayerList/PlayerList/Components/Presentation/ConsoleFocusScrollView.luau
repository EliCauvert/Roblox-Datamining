local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent_1.React)
local signalsReactModule = require(parent_1.SignalsReact)
local _ = require(parent_1.LeaderboardStore)
local scrollView = require(parent_1.Foundation).ScrollView
local playerListVisibilityStoreModule = require(parent.Common.PlayerListVisibilityStore)
local playerContextualMenuStoreModule = require(parent.Common.PlayerContextualMenuStore)
local teamListViewModule = require(parent.Components.Presentation.TeamListView)

local function _() --[[ line: 27 | named "isGamepad" ]]
	-- upvalues: userInputService (ref)
	return userInputService:GetLastInputType().Name:find("Gamepad") ~= nil
end

return function(p0) --[[ line: 47 | named "ConsoleFocusScrollView" ]]
	-- upvalues: reactModule (ref), signalsReactModule (ref), playerListVisibilityStoreModule (ref), playerContextualMenuStoreModule (ref), userInputService (ref), guiService (ref), contextActionService (ref), teamListViewModule (ref), scrollView (ref)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(nil)
	local var10 = signalsReactModule.useSignalState(playerListVisibilityStoreModule.getEffectiveVisible)
	local var11 = signalsReactModule.useSignalState(playerContextualMenuStoreModule.getMenuData) ~= nil
	local var12 = var10 and not var11
	local allTeams = p0.allTeams
	local var13 = if p0.isGamepadOverride ~= nil then userInputService:GetLastInputType().Name:find("Gamepad") ~= nil else p0.isGamepadOverride
	local var14 = reactModule.useRef(Enum.OverrideMouseIconBehavior.None)
	local var15 = reactModule.useRef(nil)
	local var16 = reactModule.useRef(false)
	local var17 = reactModule.useRef(false)
	
	local function _() --[[ line: 65 | named "restoreHud" ]]
		-- upvalues: var17 (ref), userInputService (copy), var14 (ref), guiService (copy), var9 (ref), var15 (ref), var16 (ref)
		if not var17.current then return end
		userInputService.OverrideMouseIconBehavior = var14.current
		var14.current = Enum.OverrideMouseIconBehavior.None
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if selectedCoreObject and var9.current and selectedCoreObject:IsDescendantOf(var9.current) then
			guiService.SelectedCoreObject = var15.current
		end
		var15.current = nil
		var17.current = false
		var16.current = false
	end
	
	local _ = function() --[[ line: 80 | named "releaseRosterSelection" ]]
		-- upvalues: guiService (copy), var9 (ref), var16 (ref)
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if selectedCoreObject and var9.current and selectedCoreObject:IsDescendantOf(var9.current) then
			guiService.SelectedCoreObject = nil
		end
		var16.current = false
	end
	
	reactModule.useEffect(function() --[[ line: 89 ]]
		-- upvalues: var10 (ref), var17 (ref), userInputService (copy), var14 (ref), guiService (copy), var9 (ref), var15 (ref), var16 (ref), var11 (ref), var13 (ref), var8 (ref), playerListVisibilityStoreModule (copy), playerContextualMenuStoreModule (copy)
		if var10 then
			if var11 then
				local selectedCoreObject = guiService.SelectedCoreObject
				
				if selectedCoreObject and var9.current and selectedCoreObject:IsDescendantOf(var9.current) then
					guiService.SelectedCoreObject = nil
				end
				var16.current = false
				
				return function() --[[ line: 97 ]] end
			elseif not var16.current and var13 and var8.current then
				if not var17.current then
					var15.current = guiService.SelectedCoreObject
					var14.current = userInputService.OverrideMouseIconBehavior
					var17.current = true
				end
				guiService.SelectedCoreObject = var8.current
				userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
				var16.current = true
			end
			return function() --[[ line: 112 ]]
				-- upvalues: playerListVisibilityStoreModule (copy), var17 (copy), userInputService (copy), var14 (copy), guiService (copy), var9 (copy), var15 (copy), var16 (copy), playerContextualMenuStoreModule (copy)
				if playerListVisibilityStoreModule.getEffectiveVisible(false) then
					if playerContextualMenuStoreModule.getMenuData(false) ~= nil then
						local selectedCoreObject = guiService.SelectedCoreObject
						
						if selectedCoreObject and var9.current and selectedCoreObject:IsDescendantOf(var9.current) then
							guiService.SelectedCoreObject = nil
						end
						var16.current = false
					end
					return
				elseif not var17.current then return end
				userInputService.OverrideMouseIconBehavior = var14.current
				var14.current = Enum.OverrideMouseIconBehavior.None
				local selectedCoreObject = guiService.SelectedCoreObject
				
				if selectedCoreObject and var9.current and selectedCoreObject:IsDescendantOf(var9.current) then
					guiService.SelectedCoreObject = var15.current
				end
				var15.current = nil
				var17.current = false
				var16.current = false
			end
		elseif var17.current then
			userInputService.OverrideMouseIconBehavior = var14.current
			var14.current = Enum.OverrideMouseIconBehavior.None
			local selectedCoreObject = guiService.SelectedCoreObject
			
			if selectedCoreObject and var9.current and selectedCoreObject:IsDescendantOf(var9.current) then
				guiService.SelectedCoreObject = var15.current
			end
			var15.current = nil
			var17.current = false
			var16.current = false
		end
		return function() --[[ line: 92 ]] end
	end, { var10, var11, var13 })
	reactModule.useEffect(function() --[[ line: 121 ]]
		-- upvalues: var12 (ref), var13 (ref), var8 (ref), var16 (ref), var17 (ref), var15 (ref), guiService (copy), var14 (ref), userInputService (copy)
		if not var12 or not var13 or not var8.current then return end
		if var16.current then
			guiService.SelectedCoreObject = var8.current
			
			return
		elseif not var17.current then
			var15.current = guiService.SelectedCoreObject
			var14.current = userInputService.OverrideMouseIconBehavior
			var17.current = true
		end
		guiService.SelectedCoreObject = var8.current
		userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
		var16.current = true
	end, { var12, allTeams, var13 })
	reactModule.useEffect(function() --[[ line: 146 ]]
		-- upvalues: var12 (ref), contextActionService (copy), playerContextualMenuStoreModule (copy), playerListVisibilityStoreModule (copy)
		if var12 then
			contextActionService:BindCoreAction("RbxPlayerListReskinGamepadClose", function(_, p1, _) --[[ line: 150 ]]
				-- upvalues: playerContextualMenuStoreModule (copy), playerListVisibilityStoreModule (copy)
				if p1 == Enum.UserInputState.Begin then
					playerContextualMenuStoreModule.closeContextMenu()
					playerListVisibilityStoreModule.setVisible(false)
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonB)
			
			return function() --[[ line: 161 ]]
				-- upvalues: contextActionService (copy)
				contextActionService:UnbindCoreAction("RbxPlayerListReskinGamepadClose")
			end
		end
		return function() --[[ line: 148 ]] end
	end, { var12 })
	local leaderboardStore = p0.leaderboardStore
	local statColumns = p0.statColumns
	local statWidth = p0.statWidth
	local rowHeight = p0.rowHeight
	local columnHeaderHeight = p0.columnHeaderHeight
	local hasNonNeutralTeams = p0.hasNonNeutralTeams
	local localPlayer = p0.localPlayer
	local onActivated = p0.onActivated
	local t = {}
	
	for i, v in pairs(allTeams) do
		if v then
			table.insert(t, i)
		end
	end
	table.sort(t, function(p2, p3) --[[ line: 181 ]]
		-- upvalues: allTeams (ref)
		if p2 == "Neutral" and p3 ~= "Neutral" then
			return false
		elseif p3 == "Neutral" and p2 ~= "Neutral" then
			return true
		end
		local var24 = allTeams[p2]
		local var25 = allTeams[p3]
		local var26 = if var24 and var24.order then var24.order(false) else 0
		local var27 = if var25 and var25.order then var25.order(false) else 0
		
		return if var26 == var27 then tostring(p2) < tostring(p3) else var26 < var27
	end)
	local var19 = false
	local t_1 = {}
	
	for i_1, v_1 in ipairs(t) do
		local var22 = allTeams[v_1]
		local var23 = nil
		
		if not var19 and (var22 and (var22.players and next(var22.players.getAllData(false)) ~= nil)) then
			var23 = var8
			var19 = true
		end
		t_1[`Team_{tostring(v_1)}`] = reactModule.createElement(teamListViewModule, {
			teamEntry = var22,
			isNeutral = v_1 == "Neutral",
			hasNonNeutralTeams = hasNonNeutralTeams,
			leaderboardStore = leaderboardStore,
			statColumns = statColumns,
			statWidth = statWidth,
			rowHeight = rowHeight,
			columnHeaderHeight = columnHeaderHeight,
			onActivated = onActivated,
			localPlayer = localPlayer,
			firstRowRefForward = var23
		})
	end
	local cloned = table.clone(p0.scrollViewProps)
	cloned.ref = var9
	
	return reactModule.createElement(scrollView, cloned, t_1)
end