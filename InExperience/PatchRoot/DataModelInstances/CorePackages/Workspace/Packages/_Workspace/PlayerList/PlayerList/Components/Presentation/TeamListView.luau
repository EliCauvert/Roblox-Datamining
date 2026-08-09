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
local var5 = signalsModule.createSignal({})

return reactModule.memo(function(p0) --[[ line: 28 | named "TeamListView" ]]
	-- upvalues: signalsReactModule (ref), var5 (ref), reactModule (ref), teamEntryViewModule (ref), entryViewModule (ref), view (ref)
	local teamEntry = p0.teamEntry
	local players = teamEntry.players
	local var6 = signalsReactModule.useSignalState(if players then players.getAllData else var5)
	local var7 = if players then players.getCount(false) else 0
	local var8 = signalsReactModule.useSignalBinding(teamEntry.order)
	local t = {}
	
	if p0.isNeutral and (not p0.hasNonNeutralTeams or var7 == 0) then
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
		local var10 = teamEntry.order(false)
		
		for i in pairs(var6) do
			t[`Player_{i.UserId}`] = reactModule.createElement(entryViewModule, {
				player = i,
				leaderboardStore = p0.leaderboardStore,
				statColumns = p0.statColumns,
				statWidth = p0.statWidth,
				teamOrder = var10,
				onActivated = p0.onActivated,
				rowHeight = p0.rowHeight,
				isCurrentUser = p0.localPlayer ~= nil and i == p0.localPlayer
			})
		end
	end
	return reactModule.createElement(view, { tag = "col size-full-0 auto-y", LayoutOrder = var8 }, t)
end)