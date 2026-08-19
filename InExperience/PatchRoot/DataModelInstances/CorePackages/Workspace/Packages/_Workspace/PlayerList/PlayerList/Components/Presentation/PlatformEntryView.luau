local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsModule = require(parent_1.Signals)
local signalsReactModule = require(parent_1.SignalsReact)
local localizationService = game:GetService("LocalizationService")
local numberLocalization = require(parent_1.Localization).NumberLocalization
local constantsModule = require(parent.Common.Constants)
local leaderboardRowShellModule = require(parent.Components.Presentation.LeaderboardRowShell)
local leaderboardTextCellModule = require(parent.Components.Presentation.LeaderboardTextCell)
local peopleCellModule = require(parent.Components.Presentation.PeopleCell)
local _ = { Rank = "Rank", People = "People", Score = "-" }
local var8 = signalsModule.createSignal(nil)
local platformLeaderboardUnrankedLabel = game:DefineFastString("PlatformLeaderboardUnrankedLabel", "100+")
local var10 = signalsModule.createSignal(nil)

local function formatScoreCell(p0) --[[ line: 29 ]]
	-- upvalues: numberLocalization (ref), localizationService (ref)
	return if p0 == nil then "-" else numberLocalization.localize(p0, localizationService.RobloxLocaleId)
end

local function formatRankCell(p1) --[[ line: 36 ]]
	-- upvalues: platformLeaderboardUnrankedLabel (ref)
	return if p1 == nil then platformLeaderboardUnrankedLabel else tostring(p1)
end

local function rankToLayoutOrder(p2) --[[ line: 40 ]]
	return if p2 == nil then 1000000 else p2
end

return reactModule.memo(function(p3) --[[ line: 63 | named "PlatformEntryViewImpl" ]]
	-- upvalues: signalsReactModule (ref), var8 (ref), var10 (ref), reactModule (ref), formatScoreCell (ref), formatRankCell (ref), rankToLayoutOrder (ref), constantsModule (ref), leaderboardRowShellModule (ref), leaderboardTextCellModule (ref), peopleCellModule (ref)
	local var14 = p3.isHeader == true
	local var15 = signalsReactModule.useSignalBinding(p3.scoreGetter or var8)
	local var16 = signalsReactModule.useSignalBinding(p3.rankGetter or var10)
	local scoreLabel = p3.scoreLabel
	local var17 = reactModule.useMemo(function() --[[ line: 70 ]]
		-- upvalues: var14 (ref), scoreLabel (ref), var15 (ref), formatScoreCell (copy)
		return if var14 then scoreLabel or "-" else var15:map(formatScoreCell)
	end, { var14, var15, scoreLabel })
	local rankHeaderText = p3.rankHeaderText
	local rowHeight = p3.rowHeight or (if var14 then constantsModule.PLATFORM_HEADER_HEIGHT else constantsModule.PLATFORM_ROW_HEIGHT)
	
	return reactModule.createElement(leaderboardRowShellModule, {
		rowHeight = rowHeight,
		layoutOrder = reactModule.useMemo(function() --[[ line: 87 ]]
			-- upvalues: p3 (ref), var16 (ref), rankToLayoutOrder (copy)
			return if p3.layoutOrder == nil then var16:map(rankToLayoutOrder) else p3.layoutOrder
		end, { p3.layoutOrder, var16 }),
		isHighlighted = p3.isViewer == true and p3.highlightViewerRow ~= false,
		showDivider = p3.showDivider == true,
		flexTag = constantsModule.PLATFORM_ROW_FLEX_TAG
	}, {
		RankCell = reactModule.createElement(leaderboardTextCellModule, {
			layoutOrder = 1,
			text = reactModule.useMemo(function() --[[ line: 78 ]]
				-- upvalues: var14 (ref), rankHeaderText (ref), var16 (ref), formatRankCell (copy)
				return if var14 then rankHeaderText or "Rank" else var16:map(formatRankCell)
			end, { var14, var16, rankHeaderText }),
			width = p3.rankWidth or constantsModule.PLATFORM_RANK_WIDTH,
			rowHeight = rowHeight,
			textTag = if var14 then "size-full text-caption-small text-align-x-left content-muted" else "size-full text-body-small text-align-x-left content-default"
		}),
		PeopleCell = reactModule.createElement(peopleCellModule, {
			layoutOrder = 2,
			displayName = if var14 then p3.peopleHeaderText or "People" else p3.displayName or "-",
			textTag = if var14 then "size-full text-caption-small text-align-x-left content-muted" else nil,
			truncate = not var14
		}),
		ScoreCell = reactModule.createElement(leaderboardTextCellModule, {
			layoutOrder = 3,
			text = var17,
			width = p3.scoreWidth or constantsModule.PLATFORM_SCORE_WIDTH,
			rowHeight = rowHeight,
			textTag = if var14 then "size-full text-caption-small text-align-x-right content-muted" else "size-full text-body-small text-align-x-right content-default"
		})
	})
end)