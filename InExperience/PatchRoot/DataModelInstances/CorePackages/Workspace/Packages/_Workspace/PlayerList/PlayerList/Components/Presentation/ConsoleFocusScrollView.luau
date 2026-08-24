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
local openContextMenu = playerContextualMenuStoreModule.openContextMenu
local teamListViewModule = require(parent.Components.Presentation.TeamListView)

local function _()
	-- upvalues: userInputService (ref)
	return userInputService:GetLastInputType().Name:find("Gamepad") ~= nil
end

return function(p0)
	-- upvalues: reactModule (ref), signalsReactModule (ref), playerListVisibilityStoreModule (ref), userInputService (ref), guiService (ref), contextActionService (ref), playerContextualMenuStoreModule (ref), teamListViewModule (ref), openContextMenu (ref), scrollView (ref)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(nil)
	local var10 = signalsReactModule.useSignalState(playerListVisibilityStoreModule.getEffectiveVisible)
	local allTeams = p0.allTeams
	local var11 = reactModule.useRef(Enum.OverrideMouseIconBehavior.None)
	local var12 = reactModule.useRef(nil)
	local var13 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var13 (ref), userInputService (copy), var8 (ref), var12 (ref), guiService (copy), var11 (ref), var9 (ref)
		if not var10 or var13.current then
			return function() end
		elseif userInputService:GetLastInputType().Name:find("Gamepad") ~= nil and var8.current then
			var12.current = guiService.SelectedCoreObject
			var11.current = userInputService.OverrideMouseIconBehavior
			guiService.SelectedCoreObject = var8.current
			userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
			var13.current = true
		end
		return function()
			-- upvalues: var13 (copy), userInputService (copy), var11 (copy), guiService (copy), var9 (copy), var12 (copy)
			if var13.current then
				userInputService.OverrideMouseIconBehavior = var11.current
				var11.current = Enum.OverrideMouseIconBehavior.None
				local selectedCoreObject = guiService.SelectedCoreObject
				
				if selectedCoreObject and var9.current and selectedCoreObject:IsDescendantOf(var9.current) then
					guiService.SelectedCoreObject = var12.current
				end
				var12.current = nil
				var13.current = false
			end
		end
	end, { var10 })
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), userInputService (copy), var8 (ref), var13 (ref), var12 (ref), guiService (copy), var11 (ref)
		if not var10 or userInputService:GetLastInputType().Name:find("Gamepad") == nil or not var8.current then return end
		if var13.current then
			guiService.SelectedCoreObject = var8.current
			
			return
		end
		var12.current = guiService.SelectedCoreObject
		var11.current = userInputService.OverrideMouseIconBehavior
		guiService.SelectedCoreObject = var8.current
		userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
		var13.current = true
	end, { var10, allTeams })
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), contextActionService (copy), playerContextualMenuStoreModule (copy), playerListVisibilityStoreModule (copy)
		if var10 then
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
	end, { var10 })
	local leaderboardStore = p0.leaderboardStore
	local statColumns = p0.statColumns
	local statWidth = p0.statWidth
	local rowHeight = p0.rowHeight
	local columnHeaderHeight = p0.columnHeaderHeight
	local hasNonNeutralTeams = p0.hasNonNeutralTeams
	local localPlayer = p0.localPlayer
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
		local var20 = allTeams[p2]
		local var21 = allTeams[p3]
		local var22 = if var20 and var20.order then var20.order(false) else 0
		local var23 = if var21 and var21.order then var21.order(false) else 0
		
		return if var22 == var23 then tostring(p2) < tostring(p3) else var22 < var23
	end)
	local var15 = false
	local t_1 = {}
	
	for i_1, v_1 in ipairs(t) do
		local var18 = allTeams[v_1]
		local var19 = nil
		
		if not var15 and (var18 and (var18.players and next(var18.players.getAllData(false)) ~= nil)) then
			var19 = var8
			var15 = true
		end
		t_1[`Team_{tostring(v_1)}`] = reactModule.createElement(teamListViewModule, {
			teamEntry = var18,
			isNeutral = v_1 == "Neutral",
			hasNonNeutralTeams = hasNonNeutralTeams,
			leaderboardStore = leaderboardStore,
			statColumns = statColumns,
			statWidth = statWidth,
			rowHeight = rowHeight,
			columnHeaderHeight = columnHeaderHeight,
			onActivated = openContextMenu,
			localPlayer = localPlayer,
			firstRowRefForward = var19
		})
	end
	local cloned = table.clone(p0.scrollViewProps)
	cloned.ref = var9
	
	return reactModule.createElement(scrollView, cloned, t_1)
end