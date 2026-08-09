local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsModule = require(parent_1.Signals)
local signalsReactModule = require(parent_1.SignalsReact)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local usePreferences = foundationModule.Hooks.usePreferences
local _ = require(parent_1.LeaderboardStore)
local statCellModule = require(parent.Components.Presentation.StatCell)
local playerBadgeModule = require(parent.Components.Presentation.PlayerBadge)
local resolveDisplayNameModule = require(parent.Common.resolveDisplayName)
local constantsModule = require(parent.Common.Constants)
local _ = require(parent.Common.computeStatColumns)
local ROW_FLEX_TAG = constantsModule.ROW_FLEX_TAG
local TEAM_LAYOUT_MULTIPLIER = constantsModule.TEAM_LAYOUT_MULTIPLIER
local var8 = signalsModule.createSignal({})

return reactModule.memo(function(p0) --[[ line: 31 | named "EntryView" ]]
	-- upvalues: useTokens (ref), usePreferences (ref), reactModule (ref), signalsReactModule (ref), var8 (ref), signalsModule (ref), TEAM_LAYOUT_MULTIPLIER (ref), view (ref), text (ref), resolveDisplayNameModule (ref), playerBadgeModule (ref), statCellModule (ref), foundationModule (ref), ROW_FLEX_TAG (ref)
	local player = p0.player
	local leaderboardStore = p0.leaderboardStore
	local var9 = p0.isCurrentUser == true
	local rowHeight = p0.rowHeight
	local var10 = useTokens()
	local var11 = usePreferences()
	local var12 = reactModule.useRef(nil)
	local var13 = reactModule.useCallback(function() --[[ line: 52 ]]
		-- upvalues: p0 (ref), var12 (ref), player (ref)
		if p0.onActivated then
			p0.onActivated(player, if var12.current then var12.current.AbsolutePosition else nil)
		end
	end, { player, p0.onActivated })
	local playerEntry = leaderboardStore.getPlayerEntry(player, false)
	signalsReactModule.useSignalState(if playerEntry then playerEntry.stats.getAllData else var8)
	local var15 = signalsReactModule.useSignalBinding(reactModule.useMemo(function() --[[ line: 66 ]]
		-- upvalues: signalsModule (copy), playerEntry (ref), p0 (ref), TEAM_LAYOUT_MULTIPLIER (copy)
		return signalsModule.createComputed(function(p1) --[[ line: 67 ]]
			-- upvalues: playerEntry (copy), p0 (copy), TEAM_LAYOUT_MULTIPLIER (copy)
			return if playerEntry and p0.teamOrder ~= nil then p0.teamOrder * TEAM_LAYOUT_MULTIPLIER + playerEntry.order(p1) else p0.layoutOrder or 0
		end)
	end, { playerEntry, p0.teamOrder, p0.layoutOrder }))
	local t = {
		PeopleCell = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-x-left align-y-center fill gap-xsmall size-0-full clip"
		}, {
			NameText = reactModule.createElement(text, {
				tag = "auto-xy text-body-small text-align-x-left content-default",
				LayoutOrder = 1,
				Text = resolveDisplayNameModule(player)
			}),
			Badge = reactModule.createElement(playerBadgeModule, { layoutOrder = 2, player = player })
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
	local overMedia100 = var10.Color.OverMedia.OverMedia_100
	
	return reactModule.createElement(view, {
		Size = UDim2.new(1, 0, 0, rowHeight),
		LayoutOrder = var15,
		onActivated = var13,
		ref = var12
	}, {
		Highlight = if var9 then reactModule.createElement(view, {
			ZIndex = 0,
			backgroundStyle = {
				Color3 = overMedia100.Color3,
				Transparency = overMedia100.Transparency * var11.preferredTransparency
			},
			Size = UDim2.fromScale(1, 1)
		}) else nil,
		Divider = reactModule.createElement(foundationModule.Divider, {
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, 0)
		}),
		RowContent = reactModule.createElement(view, { tag = `size-full {ROW_FLEX_TAG}` }, t)
	})
end)