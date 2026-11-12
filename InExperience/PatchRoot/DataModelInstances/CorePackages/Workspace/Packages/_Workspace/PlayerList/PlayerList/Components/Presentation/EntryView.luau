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
local config = { Selectable = true }

local function buildEntryViewElement(p1, p2, LayoutOrder, OnActivated, RowRef, Selection)
	-- upvalues: ReactModule (copy), PeopleCellModule (copy), ResolveDisplayNameModule (copy), StatCellModule (copy), LeaderboardRowShellModule (copy)
	local RowHeight = p1.rowHeight
	local StatColumns = p1.statColumns or {}
	local config = {
		PeopleCell = ReactModule.createElement(PeopleCellModule, {
			layoutOrder = 1,
			truncate = true,
			displayName = ResolveDisplayNameModule(p1.player),
			player = p1.player
		})
	}
	
	for i, statColumn in ipairs(StatColumns) do
		config[`Stat_{statColumn.name}`] = ReactModule.createElement(StatCellModule, {
			statName = statColumn.name,
			playerStat = if p2 then p2.stats.getData(statColumn.name, false) else nil,
			statWidth = p1.statWidth,
			rowHeight = RowHeight,
			layoutOrder = i + 1
		})
	end
	return ReactModule.createElement(LeaderboardRowShellModule, {
		showDivider = true,
		rowHeight = RowHeight,
		layoutOrder = LayoutOrder,
		isHighlighted = p1.isCurrentUser == true,
		onActivated = OnActivated,
		rowRef = RowRef,
		selection = Selection
	}, config)
end

local function useEntryViewCore(p3)
	-- upvalues: ReactModule (copy), SignalsReactModule (copy), Signal (copy), SignalsModule (copy), TEAMLAYOUTMULTIPLIER (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p3 (copy), UseRefResult (copy)
		if p3.onActivated then
			p3.onActivated(p3.player, if UseRefResult.current then UseRefResult.current.AbsolutePosition else nil, UseRefResult.current)
		end
	end, { p3.player, p3.onActivated })
	local PlayerEntry = p3.leaderboardStore.getPlayerEntry(p3.player, false)
	SignalsReactModule.useSignalState(if PlayerEntry then PlayerEntry.stats.getAllData else Signal)
	
	return UseRefResult, PlayerEntry, SignalsReactModule.useSignalBinding((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), PlayerEntry (copy), p3 (copy), TEAMLAYOUTMULTIPLIER (upval)
		return SignalsModule.createComputed(function(p4)
			-- upvalues: PlayerEntry (upval), p3 (upval), TEAMLAYOUTMULTIPLIER (upval)
			return if PlayerEntry and p3.teamOrder ~= nil then p3.teamOrder * TEAMLAYOUTMULTIPLIER + PlayerEntry.order(p4) else p3.layoutOrder or 0
		end)
	end, { PlayerEntry, p3.teamOrder, p3.layoutOrder }))), UseResult
end

return ReactModule.memo(function(p3)
	-- upvalues: useEntryViewCore (copy), ReactModule (copy), buildEntryViewElement (copy), config (copy)
	local UseEntryViewCoreResult, UseEntryViewCoreResult2, UseEntryViewCoreResult3, UseEntryViewCoreResult4 = useEntryViewCore(p3)
	local RowRefForwardFunction = p3.rowRefForward
	
	return buildEntryViewElement(p3, UseEntryViewCoreResult2, UseEntryViewCoreResult3, UseEntryViewCoreResult4, ReactModule.useCallback(function(Current)
		-- upvalues: UseEntryViewCoreResult (copy), RowRefForwardFunction (copy)
		UseEntryViewCoreResult.current = Current
		
		if RowRefForwardFunction then
			if typeof(RowRefForwardFunction) == "function" then
				RowRefForwardFunction(Current)
				
				return
			end
			RowRefForwardFunction.current = Current
		end
	end, { UseEntryViewCoreResult, RowRefForwardFunction }), config)
end)