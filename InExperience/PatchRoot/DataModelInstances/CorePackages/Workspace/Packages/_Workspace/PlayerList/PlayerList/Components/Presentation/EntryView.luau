local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsModule = require(parent_1.Signals)
local signalsReactModule = require(parent_1.SignalsReact)
local _ = require(parent_1.LeaderboardStore)
local statCellModule = require(parent.Components.Presentation.StatCell)
local leaderboardRowShellModule = require(parent.Components.Presentation.LeaderboardRowShell)
local peopleCellModule = require(parent.Components.Presentation.PeopleCell)
local resolveDisplayNameModule = require(parent.Common.resolveDisplayName)
local _ = require(parent.Common.computeStatColumns)
local TEAM_LAYOUT_MULTIPLIER = require(parent.Common.Constants).TEAM_LAYOUT_MULTIPLIER
local var1 = signalsModule.createSignal({})
local t = { Selectable = true }

local function buildEntryViewElement(p1, p2, p3, p4, p5, p6)
	-- upvalues: reactModule (ref), peopleCellModule (ref), resolveDisplayNameModule (ref), statCellModule (ref), leaderboardRowShellModule (ref)
	local rowHeight = p1.rowHeight
	local t = {
		PeopleCell = reactModule.createElement(peopleCellModule, {
			layoutOrder = 1,
			truncate = true,
			displayName = resolveDisplayNameModule(p1.player),
			player = p1.player
		})
	}
	
	for i, v in ipairs(p1.statColumns or {}) do
		t[`Stat_{v.name}`] = reactModule.createElement(statCellModule, {
			statName = v.name,
			playerStat = if p2 then p2.stats.getData(v.name, false) else nil,
			statWidth = p1.statWidth,
			rowHeight = rowHeight,
			layoutOrder = i + 1
		})
	end
	return reactModule.createElement(leaderboardRowShellModule, {
		showDivider = true,
		rowHeight = rowHeight,
		layoutOrder = p3,
		isHighlighted = p1.isCurrentUser == true,
		onActivated = p4,
		rowRef = p5,
		selection = p6
	}, t)
end

local function useEntryViewCore(p7)
	-- upvalues: reactModule (ref), signalsReactModule (ref), var1 (ref), signalsModule (ref), TEAM_LAYOUT_MULTIPLIER (ref)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useCallback(function()
		-- upvalues: p7 (ref), var2 (ref)
		if p7.onActivated then
			p7.onActivated(p7.player, if var2.current then var2.current.AbsolutePosition else nil, var2.current)
		end
	end, { p7.player, p7.onActivated })
	local playerEntry = p7.leaderboardStore.getPlayerEntry(p7.player, false)
	signalsReactModule.useSignalState(if playerEntry then playerEntry.stats.getAllData else var1)
	
	return var2, playerEntry, signalsReactModule.useSignalBinding(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), playerEntry (ref), p7 (ref), TEAM_LAYOUT_MULTIPLIER (copy)
		return signalsModule.createComputed(function(p8)
			-- upvalues: playerEntry (copy), p7 (copy), TEAM_LAYOUT_MULTIPLIER (copy)
			return if playerEntry and p7.teamOrder ~= nil then p7.teamOrder * TEAM_LAYOUT_MULTIPLIER + playerEntry.order(p8) else p7.layoutOrder or 0
		end)
	end, { playerEntry, p7.teamOrder, p7.layoutOrder })), var3
end

return reactModule.memo(function(p7)
	-- upvalues: useEntryViewCore (ref), reactModule (ref), buildEntryViewElement (ref), t (ref)
	local var2, var3, var4, var5 = useEntryViewCore(p7)
	local rowRefForward = p7.rowRefForward
	
	return buildEntryViewElement(p7, var3, var4, var5, reactModule.useCallback(function(p8)
		-- upvalues: var2 (ref), rowRefForward (ref)
		var2.current = p8
		
		if rowRefForward then
			if typeof(rowRefForward) == "function" then
				rowRefForward(p8)
				
				return
			end
			rowRefForward.current = p8
		end
	end, { var2, rowRefForward }), t)
end)