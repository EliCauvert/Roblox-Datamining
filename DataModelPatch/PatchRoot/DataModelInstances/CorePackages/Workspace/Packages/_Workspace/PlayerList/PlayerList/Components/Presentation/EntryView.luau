local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local SignalsModule = require(Parent1.Signals)
local SignalsReactModule = require(Parent1.SignalsReact)
local _ = require(Parent1.LeaderboardStore)
local StatCellModule = require(Parent.Components.Presentation.StatCell)
local LeaderboardRowShellModule = require(Parent.Components.Presentation.LeaderboardRowShell)
local PeopleCellModule = require(Parent.Components.Presentation.PeopleCell)
local ResolveDisplayNameModule = require(Parent.Common.resolveDisplayName)
local _ = require(Parent.Common.computeStatColumns)
local TEAMLAYOUTMULTIPLIER = require(Parent.Common.Constants).TEAM_LAYOUT_MULTIPLIER
local Signal = SignalsModule.createSignal({})

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), SignalsReactModule (copy), Signal (copy), SignalsModule (copy), TEAMLAYOUTMULTIPLIER (copy), PeopleCellModule (copy), ResolveDisplayNameModule (copy), StatCellModule (copy), LeaderboardRowShellModule (copy)
	local Player = p1.player
	local IsIsCurrentUser = p1.isCurrentUser == true
	local RowHeight = p1.rowHeight
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseRefResult (copy), Player (copy)
		if p1.onActivated then
			p1.onActivated(Player, if UseRefResult.current then UseRefResult.current.AbsolutePosition else nil)
		end
	end, { Player, p1.onActivated })
	local PlayerEntry = p1.leaderboardStore.getPlayerEntry(Player, false)
	SignalsReactModule.useSignalState(if PlayerEntry then PlayerEntry.stats.getAllData else Signal)
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), PlayerEntry (copy), p1 (copy), TEAMLAYOUTMULTIPLIER (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: PlayerEntry (upval), p1 (upval), TEAMLAYOUTMULTIPLIER (upval)
			return if PlayerEntry and p1.teamOrder ~= nil then p1.teamOrder * TEAMLAYOUTMULTIPLIER + PlayerEntry.order(p2) else p1.layoutOrder or 0
		end)
	end, { PlayerEntry, p1.teamOrder, p1.layoutOrder })))
	local StatColumns = p1.statColumns or {}
	local config = {
		PeopleCell = ReactModule.createElement(PeopleCellModule, {
			layoutOrder = 1,
			displayName = ResolveDisplayNameModule(Player),
			player = Player
		})
	}
	
	for i, statColumn in ipairs(StatColumns) do
		config[`Stat_{statColumn.name}`] = ReactModule.createElement(StatCellModule, {
			statName = statColumn.name,
			playerStat = if PlayerEntry then PlayerEntry.stats.getData(statColumn.name, false) else nil,
			statWidth = p1.statWidth,
			rowHeight = RowHeight,
			layoutOrder = i + 1
		})
	end
	return ReactModule.createElement(LeaderboardRowShellModule, {
		showDivider = true,
		rowHeight = RowHeight,
		layoutOrder = UseSignalBindingResult,
		isHighlighted = IsIsCurrentUser,
		onActivated = UseResult,
		rowRef = UseRefResult
	}, config)
end)