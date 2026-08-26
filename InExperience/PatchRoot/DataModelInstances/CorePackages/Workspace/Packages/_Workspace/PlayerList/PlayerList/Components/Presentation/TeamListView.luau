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
local var1 = signalsModule.createSignal({})
local var2 = signalsModule.createSignal(0)

return reactModule.memo(function(p1)
	-- upvalues: signalsReactModule (ref), var1 (ref), var2 (ref), reactModule (ref), teamEntryViewModule (ref), entryViewModule (ref), view (ref)
	local teamEntry = p1.teamEntry
	local players = teamEntry.players
	local var3 = signalsReactModule.useSignalState(if players then players.getAllData else var1)
	local var4 = signalsReactModule.useSignalState(if players then players.getCount else var2)
	local var5 = signalsReactModule.useSignalBinding(teamEntry.order)
	local var6 = not (p1.isNeutral and (not p1.hasNonNeutralTeams or var4 == 0))
	
	if p1.isNeutral and var4 == 0 then
		return nil
	end
	local t = {}
	
	if var6 then
		t.TeamHeader = reactModule.createElement(teamEntryViewModule, {
			name = teamEntry.name,
			color = teamEntry.color,
			order = teamEntry.order,
			teamStats = teamEntry.stats,
			statColumns = p1.statColumns,
			statWidth = p1.statWidth,
			rowHeight = p1.columnHeaderHeight
		})
	end
	if players then
		local createElement
		local var7 = teamEntry.order(false)
		local userId = nil
		local var8 = 1e999
		
		for i in pairs(var3) do
			local playerEntry = p1.leaderboardStore.getPlayerEntry(i, false)
			createElement = if playerEntry then playerEntry.order(false) else 0
			
			if createElement < var8 or (createElement == var8 and (userId ~= nil and i.UserId < userId)) then
				var8 = createElement
				userId = i.UserId
			end
		end
		for i_1 in pairs(var3) do
			createElement = reactModule.createElement
			t[`Player_{i_1.UserId}`] = createElement(entryViewModule, {
				player = i_1,
				leaderboardStore = p1.leaderboardStore,
				statColumns = p1.statColumns,
				statWidth = p1.statWidth,
				teamOrder = var7,
				onActivated = p1.onActivated,
				rowHeight = p1.rowHeight,
				isCurrentUser = p1.localPlayer ~= nil and i_1 == p1.localPlayer,
				rowRefForward = if i_1.UserId == userId then p1.firstRowRefForward else nil
			})
		end
	end
	return reactModule.createElement(view, { tag = "col size-full-0 auto-y", LayoutOrder = var5 }, t)
end)