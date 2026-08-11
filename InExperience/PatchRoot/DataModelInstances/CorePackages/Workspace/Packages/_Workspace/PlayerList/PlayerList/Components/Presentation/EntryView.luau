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
local constantsModule = require(parent.Common.Constants)
local _ = require(parent.Common.computeStatColumns)
local fFlagPlayerListPeopleCellGapFixModule = require(parent.Flags.FFlagPlayerListPeopleCellGapFix)
local fFlagPlayerListReskinConsoleFocusNavModule = require(parent.Flags.FFlagPlayerListReskinConsoleFocusNav)
local TEAM_LAYOUT_MULTIPLIER = constantsModule.TEAM_LAYOUT_MULTIPLIER
local var10 = signalsModule.createSignal({})
local t = { Selectable = true }

local function buildEntryViewElement(p0, p1, p2, p3, p4, p5) --[[ line: 51 ]]
	-- upvalues: reactModule (ref), peopleCellModule (ref), resolveDisplayNameModule (ref), fFlagPlayerListPeopleCellGapFixModule (ref), statCellModule (ref), leaderboardRowShellModule (ref)
	local rowHeight = p0.rowHeight
	local t = {
		PeopleCell = reactModule.createElement(peopleCellModule, {
			layoutOrder = 1,
			displayName = resolveDisplayNameModule(p0.player),
			player = p0.player,
			truncate = fFlagPlayerListPeopleCellGapFixModule
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

local function useEntryViewCore(p6) --[[ line: 95 ]]
	-- upvalues: reactModule (ref), signalsReactModule (ref), var10 (ref), signalsModule (ref), TEAM_LAYOUT_MULTIPLIER (ref)
	local var17 = reactModule.useRef(nil)
	local var18 = reactModule.useCallback(function() --[[ line: 98 ]]
		-- upvalues: p6 (ref), var17 (ref)
		if p6.onActivated then
			p6.onActivated(p6.player, if var17.current then var17.current.AbsolutePosition else nil)
		end
	end, { p6.player, p6.onActivated })
	local playerEntry = p6.leaderboardStore.getPlayerEntry(p6.player, false)
	signalsReactModule.useSignalState(if playerEntry then playerEntry.stats.getAllData else var10)
	
	return var17, playerEntry, signalsReactModule.useSignalBinding(reactModule.useMemo(function() --[[ line: 112 ]]
		-- upvalues: signalsModule (copy), playerEntry (ref), p6 (ref), TEAM_LAYOUT_MULTIPLIER (copy)
		return signalsModule.createComputed(function(p7) --[[ line: 113 ]]
			-- upvalues: playerEntry (copy), p6 (copy), TEAM_LAYOUT_MULTIPLIER (copy)
			return if playerEntry and p6.teamOrder ~= nil then p6.teamOrder * TEAM_LAYOUT_MULTIPLIER + playerEntry.order(p7) else p6.layoutOrder or 0
		end)
	end, { playerEntry, p6.teamOrder, p6.layoutOrder })), var18
end

local function EntryViewBase(p8) --[[ line: 127 ]]
	-- upvalues: useEntryViewCore (ref), buildEntryViewElement (ref)
	local var20, var21, var22, var23 = useEntryViewCore(p8)
	
	return buildEntryViewElement(p8, var21, var22, var23, var20, nil)
end

local function EntryViewFocusNav(p9) --[[ line: 135 ]]
	-- upvalues: useEntryViewCore (ref), reactModule (ref), buildEntryViewElement (ref), t (ref)
	local var24, var25, var26, var27 = useEntryViewCore(p9)
	local rowRefForward = p9.rowRefForward
	
	return buildEntryViewElement(p9, var25, var26, var27, reactModule.useCallback(function(p10) --[[ line: 139 ]]
		-- upvalues: var24 (ref), rowRefForward (ref)
		var24.current = p10
		
		if rowRefForward then
			if typeof(rowRefForward) == "function" then
				rowRefForward(p10)
				
				return
			end
			rowRefForward.current = p10
		end
	end, { var24, rowRefForward }), t)
end

return reactModule.memo(function(p11) --[[ line: 155 | named "EntryView" ]]
	-- upvalues: fFlagPlayerListReskinConsoleFocusNavModule (ref), reactModule (ref), EntryViewFocusNav (ref), EntryViewBase (ref)
	return if fFlagPlayerListReskinConsoleFocusNavModule then reactModule.createElement(EntryViewFocusNav, p11) else reactModule.createElement(EntryViewBase, p11)
end)