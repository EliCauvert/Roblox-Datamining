local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local SignalsModule = require(Parent1.Signals)
local SignalsReactModule = require(Parent1.SignalsReact)
local View = require(Parent1.Foundation).View
local _ = require(Parent1.LeaderboardStore)
local TeamEntryViewModule = require(Parent.Components.Presentation.TeamEntryView)
local EntryViewModule = require(Parent.Components.Presentation.EntryView)
local _ = require(Parent.Common.computeStatColumns)
local Signal = SignalsModule.createSignal({})
local Signal1 = SignalsModule.createSignal(0)

return ReactModule.memo(function(p1) --[[ Line: 27 | Named "TeamListView" ]]
	-- upvalues: SignalsReactModule (copy), Signal (copy), Signal1 (copy), ReactModule (copy), TeamEntryViewModule (copy), EntryViewModule (copy), View (copy)
	local TeamEntry = p1.teamEntry
	local Players = TeamEntry.players
	local UseSignalStateResult = SignalsReactModule.useSignalState(if Players then Players.getAllData else Signal)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(if Players then Players.getCount else Signal1)
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(TeamEntry.order)
	local Inverted = not (p1.isNeutral and (not p1.hasNonNeutralTeams or UseSignalStateResult1 == 0))
	
	if p1.isNeutral and UseSignalStateResult1 == 0 then
		return nil
	end
	local Elements = {}
	
	if Inverted then
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
		local UserId = nil
		local v1 = 1e999
		
		for Player in pairs(UseSignalStateResult) do
			local PlayerEntry = p1.leaderboardStore.getPlayerEntry(Player, false)
			local OrderResult1 = if PlayerEntry then PlayerEntry.order(false) else 0
			local IsUserIdAbove: boolean = OrderResult1 == v1 and (UserId ~= nil and UserId > Player.UserId)
			
			if OrderResult1 < v1 or IsUserIdAbove then
				v1 = OrderResult1
				UserId = Player.UserId
			end
		end
		for Player1 in pairs(UseSignalStateResult) do
			Elements[`Player_{Player1.UserId}`] = ReactModule.createElement(EntryViewModule, {
				player = Player1,
				leaderboardStore = p1.leaderboardStore,
				statColumns = p1.statColumns,
				statWidth = p1.statWidth,
				teamOrder = OrderResult,
				onActivated = p1.onActivated,
				rowHeight = p1.rowHeight,
				isCurrentUser = p1.localPlayer ~= nil and Player1 == p1.localPlayer,
				rowRefForward = if Player1.UserId == UserId then p1.firstRowRefForward else nil
			})
		end
	end
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = UseSignalBindingResult
	}, Elements)
end)