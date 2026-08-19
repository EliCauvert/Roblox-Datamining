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
local var7 = signalsModule.createSignal({})
local t = { Selectable = true }

local function buildEntryViewElement(p0, p1, p2, p3, p4, p5) --[[ line: 45 ]]
	-- upvalues: reactModule (ref), peopleCellModule (ref), resolveDisplayNameModule (ref), statCellModule (ref), leaderboardRowShellModule (ref)
	local rowHeight = p0.rowHeight
	local t = {
		PeopleCell = reactModule.createElement(peopleCellModule, {
			layoutOrder = 1,
			truncate = true,
			displayName = resolveDisplayNameModule(p0.player),
			player = p0.player
		})
	}
	
	for i, v in ipairs(p0.statColumns or {}) do
		t[`Stat_{v.name}`] = reactModule.createElement(statCellModule, {
			statName = v.name,
			playerStat = if p1 then p1.stats.getData(v.name, false) else nil,
			statWidth = p0.statWidth,
			rowHeight = rowHeight,
			layoutOrder = i + 1
		})
	end
	return reactModule.createElement(leaderboardRowShellModule, {
		showDivider = true,
		rowHeight = rowHeight,
		layoutOrder = p2,
		isHighlighted = p0.isCurrentUser == true,
		onActivated = p3,
		rowRef = p4,
		selection = p5
	}, t)
end

local function useEntryViewCore(p6) --[[ line: 88 ]]
	-- upvalues: reactModule (ref), signalsReactModule (ref), var7 (ref), signalsModule (ref), TEAM_LAYOUT_MULTIPLIER (ref)
	local var12 = reactModule.useRef(nil)
	local var13 = reactModule.useCallback(function() --[[ line: 91 ]]
		-- upvalues: p6 (ref), var12 (ref)
		if p6.onActivated then
			p6.onActivated(p6.player, if var12.current then var12.current.AbsolutePosition else nil)
		end
	end, { p6.player, p6.onActivated })
	local playerEntry = p6.leaderboardStore.getPlayerEntry(p6.player, false)
	signalsReactModule.useSignalState(if playerEntry then playerEntry.stats.getAllData else var7)
	
	return var12, playerEntry, signalsReactModule.useSignalBinding(reactModule.useMemo(function() --[[ line: 105 ]]
		-- upvalues: signalsModule (copy), playerEntry (ref), p6 (ref), TEAM_LAYOUT_MULTIPLIER (copy)
		return signalsModule.createComputed(function(p7) --[[ line: 106 ]]
			-- upvalues: playerEntry (copy), p6 (copy), TEAM_LAYOUT_MULTIPLIER (copy)
			return if playerEntry and p6.teamOrder ~= nil then p6.teamOrder * TEAM_LAYOUT_MULTIPLIER + playerEntry.order(p7) else p6.layoutOrder or 0
		end)
	end, { playerEntry, p6.teamOrder, p6.layoutOrder })), var13
end

return reactModule.memo(function(p8) --[[ line: 120 | named "EntryView" ]]
	-- upvalues: useEntryViewCore (ref), reactModule (ref), buildEntryViewElement (ref), t (ref)
	local var15, var16, var17, var18 = useEntryViewCore(p8)
	local rowRefForward = p8.rowRefForward
	
	return buildEntryViewElement(p8, var16, var17, var18, reactModule.useCallback(function(p9) --[[ line: 124 ]]
		-- upvalues: var15 (ref), rowRefForward (ref)
		var15.current = p9
		
		if rowRefForward then
			if typeof(rowRefForward) == "function" then
				rowRefForward(p9)
				
				return
			end
			rowRefForward.current = p9
		end
	end, { var15, rowRefForward }), t)
end)