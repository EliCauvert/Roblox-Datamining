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

return function(p0)
	-- upvalues: reactModule (ref), signalsReactModule (ref), playerListVisibilityStoreModule (ref), playerContextualMenuStoreModule (ref), userInputService (ref), useGamepadStickScrollModule (ref), guiService (ref), contextActionService (ref), teamListViewModule (ref), scrollView (ref)
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(nil)
	local var11 = signalsReactModule.useSignalState(playerListVisibilityStoreModule.getEffectiveVisible)
	local var12 = signalsReactModule.useSignalState(playerContextualMenuStoreModule.getMenuData) ~= nil
	local var13 = var11 and not var12
	local allTeams = p0.allTeams
	local var14 = if p0.isGamepadOverride ~= nil then userInputService:GetLastInputType().Name:find("Gamepad") ~= nil else p0.isGamepadOverride
	useGamepadStickScrollModule({ scrollingFrameRef = var10, enabled = var13 })
	local var15 = reactModule.useRef(Enum.OverrideMouseIconBehavior.None)
	local var16 = reactModule.useRef(nil)
	local var17 = reactModule.useRef(false)
	local var18 = reactModule.useRef(false)
	
	local function _()
		-- upvalues: var18 (ref), userInputService (copy), var15 (ref), guiService (copy), var10 (ref), var16 (ref), var17 (ref)
		if not var18.current then return end
		userInputService.OverrideMouseIconBehavior = var15.current
		var15.current = Enum.OverrideMouseIconBehavior.None
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if selectedCoreObject and var10.current and selectedCoreObject:IsDescendantOf(var10.current) then
			guiService.SelectedCoreObject = var16.current
		end
		var16.current = nil
		var18.current = false
		var17.current = false
	end
	
	local _ = function()
		-- upvalues: guiService (copy), var10 (ref), var17 (ref)
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if selectedCoreObject and var10.current and selectedCoreObject:IsDescendantOf(var10.current) then
			guiService.SelectedCoreObject = nil
		end
		var17.current = false
	end
	
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), var18 (ref), userInputService (copy), var15 (ref), guiService (copy), var10 (ref), var16 (ref), var17 (ref), var12 (ref), var14 (ref), var9 (ref), playerListVisibilityStoreModule (copy), playerContextualMenuStoreModule (copy)
		if var11 then
			if var12 then
				local selectedCoreObject = guiService.SelectedCoreObject
				
				if selectedCoreObject and var10.current and selectedCoreObject:IsDescendantOf(var10.current) then
					guiService.SelectedCoreObject = nil
				end
				var17.current = false
				
				return function() end
			elseif not var17.current and var14 and var9.current then
				if not var18.current then
					var16.current = guiService.SelectedCoreObject
					var15.current = userInputService.OverrideMouseIconBehavior
					var18.current = true
				end
				guiService.SelectedCoreObject = var9.current
				userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
				var17.current = true
			end
			return function()
				-- upvalues: playerListVisibilityStoreModule (copy), var18 (copy), userInputService (copy), var15 (copy), guiService (copy), var10 (copy), var16 (copy), var17 (copy), playerContextualMenuStoreModule (copy)
				if playerListVisibilityStoreModule.getEffectiveVisible(false) then
					if playerContextualMenuStoreModule.getMenuData(false) ~= nil then
						local selectedCoreObject = guiService.SelectedCoreObject
						
						if selectedCoreObject and var10.current and selectedCoreObject:IsDescendantOf(var10.current) then
							guiService.SelectedCoreObject = nil
						end
						var17.current = false
					end
					return
				elseif not var18.current then return end
				userInputService.OverrideMouseIconBehavior = var15.current
				var15.current = Enum.OverrideMouseIconBehavior.None
				local selectedCoreObject = guiService.SelectedCoreObject
				
				if selectedCoreObject and var10.current and selectedCoreObject:IsDescendantOf(var10.current) then
					guiService.SelectedCoreObject = var16.current
				end
				var16.current = nil
				var18.current = false
				var17.current = false
			end
		elseif var18.current then
			userInputService.OverrideMouseIconBehavior = var15.current
			var15.current = Enum.OverrideMouseIconBehavior.None
			local selectedCoreObject = guiService.SelectedCoreObject
			
			if selectedCoreObject and var10.current and selectedCoreObject:IsDescendantOf(var10.current) then
				guiService.SelectedCoreObject = var16.current
			end
			var16.current = nil
			var18.current = false
			var17.current = false
		end
		return function() end
	end, { var11, var12, var14 })
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), var14 (ref), var9 (ref), var17 (ref), var18 (ref), var16 (ref), guiService (copy), var15 (ref), userInputService (copy)
		if not var13 or not var14 or not var9.current then return end
		if var17.current then
			guiService.SelectedCoreObject = var9.current
			
			return
		elseif not var18.current then
			var16.current = guiService.SelectedCoreObject
			var15.current = userInputService.OverrideMouseIconBehavior
			var18.current = true
		end
		guiService.SelectedCoreObject = var9.current
		userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
		var17.current = true
	end, { var13, allTeams, var14 })
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), contextActionService (copy), playerContextualMenuStoreModule (copy), playerListVisibilityStoreModule (copy)
		if var13 then
			contextActionService:BindCoreAction("RbxPlayerListReskinGamepadClose", function(_, p1, _)
				-- upvalues: playerContextualMenuStoreModule (copy), playerListVisibilityStoreModule (copy)
				if p1 == Enum.UserInputState.Begin then
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
	end, { var13 })
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
	table.sort(t, function(p2, p3)
		-- upvalues: allTeams (ref)
		if p2 == "Neutral" and p3 ~= "Neutral" then
			return false
		elseif p3 == "Neutral" and p2 ~= "Neutral" then
			return true
		end
		local var25 = allTeams[p2]
		local var26 = allTeams[p3]
		local var27 = if var25 and var25.order then var25.order(false) else 0
		local var28 = if var26 and var26.order then var26.order(false) else 0
		
		return if var27 == var28 then tostring(p2) < tostring(p3) else var27 < var28
	end)
	local var20 = false
	local t_1 = {}
	
	for i_1, v_1 in ipairs(t) do
		local var23 = allTeams[v_1]
		local var24 = nil
		
		if not var20 and (var23 and (var23.players and next(var23.players.getAllData(false)) ~= nil)) then
			var24 = var9
			var20 = true
		end
		t_1[`Team_{tostring(v_1)}`] = reactModule.createElement(teamListViewModule, {
			teamEntry = var23,
			isNeutral = v_1 == "Neutral",
			hasNonNeutralTeams = hasNonNeutralTeams,
			leaderboardStore = leaderboardStore,
			statColumns = statColumns,
			statWidth = statWidth,
			rowHeight = rowHeight,
			columnHeaderHeight = columnHeaderHeight,
			onActivated = onActivated,
			localPlayer = localPlayer,
			firstRowRefForward = var24
		})
	end
	local cloned = table.clone(p0.scrollViewProps)
	cloned.ref = var10
	
	return reactModule.createElement(scrollView, cloned, t_1)
end