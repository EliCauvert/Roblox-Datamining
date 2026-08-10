local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsModule = require(parent_1.Signals)
local signalsReactModule = require(parent_1.SignalsReact)
local view = require(parent_1.Foundation).View
local _ = require(parent_1.LeaderboardStore)
local teamEntryViewModule = require(parent.Components.Presentation.TeamEntryView)
local entryViewModule = require(parent.Components.Presentation.EntryView)
local _ = require(parent.Common.computeStatColumns)
local fFlagPlayerListReskinConsoleFocusNavModule = require(parent.Flags.FFlagPlayerListReskinConsoleFocusNav)
local var6 = signalsModule.createSignal({})
local var7 = signalsModule.createSignal(0)

return reactModule.memo(function(p0) --[[ line: 29 | named "TeamListView" ]]
	-- upvalues: signalsReactModule (ref), var6 (ref), var7 (ref), reactModule (ref), teamEntryViewModule (ref), fFlagPlayerListReskinConsoleFocusNavModule (ref), entryViewModule (ref), view (ref)
	local teamEntry = p0.teamEntry
	local players = teamEntry.players
	local var8 = signalsReactModule.useSignalState(if players then players.getAllData else var6)
	local var9 = signalsReactModule.useSignalState(if players then players.getCount else var7)
	local var10 = signalsReactModule.useSignalBinding(teamEntry.order)
	local var11 = not (p0.isNeutral and (not p0.hasNonNeutralTeams or var9 == 0))
	
	if p0.isNeutral and var9 == 0 then
		return nil
	end
	local t = {}
	
	if var11 then
		t.TeamHeader = reactModule.createElement(teamEntryViewModule, {
			name = teamEntry.name,
			color = teamEntry.color,
			order = teamEntry.order,
			teamStats = teamEntry.stats,
			statColumns = p0.statColumns,
			statWidth = p0.statWidth,
			rowHeight = p0.columnHeaderHeight
		})
	end
	if players then
		local var16
		local var13 = teamEntry.order(false)
		local userId = nil
		
		if fFlagPlayerListReskinConsoleFocusNavModule then
			local var14 = 1e999
			
			for i in pairs(var8) do
				local playerEntry = p0.leaderboardStore.getPlayerEntry(i, false)
				var16 = if playerEntry then playerEntry.order(false) else 0
				
				if var16 < var14 or (var16 == var14 and (userId ~= nil and i.UserId < userId)) then
					var14 = var16
					userId = i.UserId
				end
			end
		end
		for i in pairs(var8) do
			var16 = entryViewModule
			t[`Player_{i.UserId}`] = reactModule.createElement(var16, {
				player = i,
				leaderboardStore = p0.leaderboardStore,
				statColumns = p0.statColumns,
				statWidth = p0.statWidth,
				teamOrder = var13,
				onActivated = p0.onActivated,
				rowHeight = p0.rowHeight,
				isCurrentUser = p0.localPlayer ~= nil and i == p0.localPlayer,
				rowRefForward = if i.UserId == userId then p0.firstRowRefForward else nil
			})
		end
	end
	return reactModule.createElement(view, { tag = "col size-full-0 auto-y", LayoutOrder = var10 }, t)
end)