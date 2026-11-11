local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local SignalsReactModule = require(Parent1.SignalsReact)
local View = require(Parent1.Foundation).View
local _ = require(Parent1.LeaderboardStore)
local TeamEntryViewModule = require(Parent.Components.Presentation.TeamEntryView)
local EntryViewModule = require(Parent.Components.Presentation.EntryView)
local _ = require(Parent.Common.computeStatColumns)
local Signal = require(Parent1.Signals).createSignal({})

return ReactModule.memo(function(p1)
	-- upvalues: SignalsReactModule (copy), Signal (copy), ReactModule (copy), TeamEntryViewModule (copy), EntryViewModule (copy), View (copy)
	local TeamEntry = p1.teamEntry
	local Players = TeamEntry.players
	local UseSignalStateResult = SignalsReactModule.useSignalState(if Players then Players.getAllData else Signal)
	local Count = if Players then Players.getCount(false) else 0
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(TeamEntry.order)
	local Elements = {}
	
	if not (p1.isNeutral and (not p1.hasNonNeutralTeams or Count == 0)) then
		Elements.TeamHeader = ReactModule.createElement(TeamEntryViewModule, {
			name = TeamEntry.name,
			color = TeamEntry.color,
			order = TeamEntry.order,
			teamStats = TeamEntry.stats,
			statColumns = p1.statColumns,
			statWidth = p1.statWidth,
			rowHeight = p1.columnHeaderHeight
		})
	end
	if Players then
		local OrderResult = TeamEntry.order(false)
		
		for Player in pairs(UseSignalStateResult) do
			Elements[`Player_{Player.UserId}`] = ReactModule.createElement(EntryViewModule, {
				player = Player,
				leaderboardStore = p1.leaderboardStore,
				statColumns = p1.statColumns,
				statWidth = p1.statWidth,
				teamOrder = OrderResult,
				onActivated = p1.onActivated,
				rowHeight = p1.rowHeight,
				isCurrentUser = p1.localPlayer ~= nil and Player == p1.localPlayer
			})
		end
	end
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = UseSignalBindingResult
	}, Elements)
end)