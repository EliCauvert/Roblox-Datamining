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
local useGamepadStickScrollModule = require(parent.Hooks.useGamepadStickScroll)

local function _()
	-- upvalues: userInputService (ref)
	return userInputService:GetLastInputType().Name:find("Gamepad") ~= nil
end

return function(p1)
	-- upvalues: reactModule (ref), signalsReactModule (ref), playerListVisibilityStoreModule (ref), playerContextualMenuStoreModule (ref), userInputService (ref), useGamepadStickScrollModule (ref), guiService (ref), contextActionService (ref), teamListViewModule (ref), scrollView (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	local var3 = signalsReactModule.useSignalState(playerListVisibilityStoreModule.getEffectiveVisible)
	local var4 = signalsReactModule.useSignalState(playerContextualMenuStoreModule.getMenuData) ~= nil
	local var5 = var3 and not var4
	local allTeams = p1.allTeams
	local var6 = if p1.isGamepadOverride ~= nil then userInputService:GetLastInputType().Name:find("Gamepad") ~= nil else p1.isGamepadOverride
	useGamepadStickScrollModule({ scrollingFrameRef = var2, enabled = var5 })
	local var7 = reactModule.useRef(Enum.OverrideMouseIconBehavior.None)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(false)
	local var10 = reactModule.useRef(false)
	
	local function _()
		-- upvalues: var10 (ref), userInputService (copy), var7 (ref), guiService (copy), var2 (ref), var8 (ref), var9 (ref)
		if not var10.current then return end
		userInputService.OverrideMouseIconBehavior = var7.current
		var7.current = Enum.OverrideMouseIconBehavior.None
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if selectedCoreObject and var2.current and selectedCoreObject:IsDescendantOf(var2.current) then
			guiService.SelectedCoreObject = var8.current
		end
		var8.current = nil
		var10.current = false
		var9.current = false
	end
	
	local _ = function()
		-- upvalues: guiService (copy), var2 (ref), var9 (ref)
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if selectedCoreObject and var2.current and selectedCoreObject:IsDescendantOf(var2.current) then
			guiService.SelectedCoreObject = nil
		end
		var9.current = false
	end
	
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var10 (ref), userInputService (copy), var7 (ref), guiService (copy), var2 (ref), var8 (ref), var9 (ref), var4 (ref), var6 (ref), var1 (ref), playerListVisibilityStoreModule (copy), playerContextualMenuStoreModule (copy)
		if var3 then
			if var4 then
				local selectedCoreObject = guiService.SelectedCoreObject
				
				if selectedCoreObject and var2.current and selectedCoreObject:IsDescendantOf(var2.current) then
					guiService.SelectedCoreObject = nil
				end
				var9.current = false
				
				return function() end
			elseif not var9.current and var6 and var1.current then
				if not var10.current then
					var8.current = guiService.SelectedCoreObject
					var7.current = userInputService.OverrideMouseIconBehavior
					var10.current = true
				end
				guiService.SelectedCoreObject = var1.current
				userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
				var9.current = true
			end
			return function()
				-- upvalues: playerListVisibilityStoreModule (copy), var10 (copy), userInputService (copy), var7 (copy), guiService (copy), var2 (copy), var8 (copy), var9 (copy), playerContextualMenuStoreModule (copy)
				if playerListVisibilityStoreModule.getEffectiveVisible(false) then
					if playerContextualMenuStoreModule.getMenuData(false) ~= nil then
						local selectedCoreObject = guiService.SelectedCoreObject
						
						if selectedCoreObject and var2.current and selectedCoreObject:IsDescendantOf(var2.current) then
							guiService.SelectedCoreObject = nil
						end
						var9.current = false
					end
					return
				elseif not var10.current then return end
				userInputService.OverrideMouseIconBehavior = var7.current
				var7.current = Enum.OverrideMouseIconBehavior.None
				local selectedCoreObject = guiService.SelectedCoreObject
				
				if selectedCoreObject and var2.current and selectedCoreObject:IsDescendantOf(var2.current) then
					guiService.SelectedCoreObject = var8.current
				end
				var8.current = nil
				var10.current = false
				var9.current = false
			end
		elseif var10.current then
			userInputService.OverrideMouseIconBehavior = var7.current
			var7.current = Enum.OverrideMouseIconBehavior.None
			local selectedCoreObject = guiService.SelectedCoreObject
			
			if selectedCoreObject and var2.current and selectedCoreObject:IsDescendantOf(var2.current) then
				guiService.SelectedCoreObject = var8.current
			end
			var8.current = nil
			var10.current = false
			var9.current = false
		end
		return function() end
	end, { var3, var4, var6 })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var6 (ref), var1 (ref), var9 (ref), var10 (ref), var8 (ref), guiService (copy), var7 (ref), userInputService (copy)
		if not var5 or not var6 or not var1.current then return end
		if var9.current then
			guiService.SelectedCoreObject = var1.current
			
			return
		elseif not var10.current then
			var8.current = guiService.SelectedCoreObject
			var7.current = userInputService.OverrideMouseIconBehavior
			var10.current = true
		end
		guiService.SelectedCoreObject = var1.current
		userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
		var9.current = true
	end, { var5, allTeams, var6 })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), contextActionService (copy), playerContextualMenuStoreModule (copy), playerListVisibilityStoreModule (copy)
		if var5 then
			contextActionService:BindCoreAction("RbxPlayerListReskinGamepadClose", function(_, p2, _)
				-- upvalues: playerContextualMenuStoreModule (copy), playerListVisibilityStoreModule (copy)
				if p2 == Enum.UserInputState.Begin then
					playerContextualMenuStoreModule.closeContextMenu()
					playerListVisibilityStoreModule.setVisible(false)
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonB)
			
			return function()
				-- upvalues: contextActionService (copy)
				contextActionService:UnbindCoreAction("RbxPlayerListReskinGamepadClose")
			end
		end
		return function() end
	end, { var5 })
	local leaderboardStore = p1.leaderboardStore
	local statColumns = p1.statColumns
	local statWidth = p1.statWidth
	local rowHeight = p1.rowHeight
	local columnHeaderHeight = p1.columnHeaderHeight
	local hasNonNeutralTeams = p1.hasNonNeutralTeams
	local localPlayer = p1.localPlayer
	local onActivated = p1.onActivated
	local t = {}
	
	for i, v in pairs(allTeams) do
		if v then
			table.insert(t, i)
		end
	end
	table.sort(t, function(p2, p3)
		-- upvalues: allTeams (ref)
		if p2 == "Neutral" and p3 ~= "Neutral" then
			return false
		elseif p3 == "Neutral" and p2 ~= "Neutral" then
			return true
		end
		local var11 = allTeams[p2]
		local var12 = allTeams[p3]
		local var13 = if var11 and var11.order then var11.order(false) else 0
		local var14 = if var12 and var12.order then var12.order(false) else 0
		
		return if var13 == var14 then tostring(p2) < tostring(p3) else var13 < var14
	end)
	local var11 = false
	local t_1 = {}
	
	for i_1, v_1 in ipairs(t) do
		local var12 = allTeams[v_1]
		local var13 = nil
		
		if not var11 and (var12 and (var12.players and next(var12.players.getAllData(false)) ~= nil)) then
			var13 = var1
			var11 = true
		end
		t_1[`Team_{tostring(v_1)}`] = reactModule.createElement(teamListViewModule, {
			teamEntry = var12,
			isNeutral = v_1 == "Neutral",
			hasNonNeutralTeams = hasNonNeutralTeams,
			leaderboardStore = leaderboardStore,
			statColumns = statColumns,
			statWidth = statWidth,
			rowHeight = rowHeight,
			columnHeaderHeight = columnHeaderHeight,
			onActivated = onActivated,
			localPlayer = localPlayer,
			firstRowRefForward = var13
		})
	end
	local cloned = table.clone(p1.scrollViewProps)
	cloned.ref = var2
	
	return reactModule.createElement(scrollView, cloned, t_1)
end