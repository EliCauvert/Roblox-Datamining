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

return reactModule.memo(function(p0) --[[ line: 26 | named "EntryView" ]]
	-- upvalues: reactModule (ref), signalsReactModule (ref), var7 (ref), signalsModule (ref), TEAM_LAYOUT_MULTIPLIER (ref), peopleCellModule (ref), resolveDisplayNameModule (ref), statCellModule (ref), leaderboardRowShellModule (ref)
	local player = p0.player
	local leaderboardStore = p0.leaderboardStore
	local var8 = p0.isCurrentUser == true
	local rowHeight = p0.rowHeight
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useCallback(function() --[[ line: 45 ]]
		-- upvalues: p0 (ref), var9 (ref), player (ref)
		if p0.onActivated then
			p0.onActivated(player, if var9.current then var9.current.AbsolutePosition else nil)
		end
	end, { player, p0.onActivated })
	local playerEntry = leaderboardStore.getPlayerEntry(player, false)
	signalsReactModule.useSignalState(if playerEntry then playerEntry.stats.getAllData else var7)
	local var12 = signalsReactModule.useSignalBinding(reactModule.useMemo(function() --[[ line: 59 ]]
		-- upvalues: signalsModule (copy), playerEntry (ref), p0 (ref), TEAM_LAYOUT_MULTIPLIER (copy)
		return signalsModule.createComputed(function(p1) --[[ line: 60 ]]
			-- upvalues: playerEntry (copy), p0 (copy), TEAM_LAYOUT_MULTIPLIER (copy)
			return if playerEntry and p0.teamOrder ~= nil then p0.teamOrder * TEAM_LAYOUT_MULTIPLIER + playerEntry.order(p1) else p0.layoutOrder or 0
		end)
	end, { playerEntry, p0.teamOrder, p0.layoutOrder }))
	local t = {
		PeopleCell = reactModule.createElement(peopleCellModule, {
			layoutOrder = 1,
			displayName = resolveDisplayNameModule(player),
			player = player
		})
	}
	
	for i, v in ipairs(p0.statColumns or {}) do
		t[`Stat_{v.name}`] = reactModule.createElement(statCellModule, {
			statName = v.name,
			playerStat = if playerEntry then playerEntry.stats.getData(v.name, false) else nil,
			statWidth = p0.statWidth,
			rowHeight = rowHeight,
			layoutOrder = i + 1
		})
	end
	return reactModule.createElement(leaderboardRowShellModule, {
		showDivider = true,
		rowHeight = rowHeight,
		layoutOrder = var12,
		isHighlighted = var8,
		onActivated = var10,
		rowRef = var9
	}, t)
end)