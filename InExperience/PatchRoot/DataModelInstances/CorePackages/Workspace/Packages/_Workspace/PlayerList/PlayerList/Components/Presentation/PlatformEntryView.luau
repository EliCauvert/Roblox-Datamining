local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsModule = require(parent_1.Signals)
local signalsReactModule = require(parent_1.SignalsReact)
local localizationService = game:GetService("LocalizationService")
local numberLocalization = require(parent_1.Localization).NumberLocalization
local constantsModule = require(parent.Common.Constants)
local fFlagPlayerListReskinOptimizationModule = require(parent.Flags.FFlagPlayerListReskinOptimization)
local leaderboardRowShellModule = require(parent.Components.Presentation.LeaderboardRowShell)
local leaderboardTextCellModule = require(parent.Components.Presentation.LeaderboardTextCell)
local peopleCellModule = require(parent.Components.Presentation.PeopleCell)
local t = { Rank = "Rank", People = "People", Score = "-" }
local var10 = signalsModule.createSignal(nil)
local platformLeaderboardUnrankedLabel = game:DefineFastString("PlatformLeaderboardUnrankedLabel", "100+")
local var12 = signalsModule.createSignal(nil)

local function formatScoreCell(p0) --[[ line: 30 ]]
	-- upvalues: numberLocalization (ref), localizationService (ref)
	return if p0 == nil then "-" else numberLocalization.localize(p0, localizationService.RobloxLocaleId)
end

local function formatRankCell(p1) --[[ line: 37 ]]
	-- upvalues: platformLeaderboardUnrankedLabel (ref)
	return if p1 == nil then platformLeaderboardUnrankedLabel else tostring(p1)
end

local function rankToLayoutOrder(p2) --[[ line: 41 ]]
	return if p2 == nil then 1000000 else p2
end

return reactModule.memo(function(p3) --[[ line: 61 | named "PlatformEntryViewImpl" ]]
	-- upvalues: signalsReactModule (ref), var10 (ref), var12 (ref), reactModule (ref), t (ref), formatScoreCell (ref), formatRankCell (ref), fFlagPlayerListReskinOptimizationModule (ref), rankToLayoutOrder (ref), constantsModule (ref), leaderboardRowShellModule (ref), leaderboardTextCellModule (ref), peopleCellModule (ref)
	local var16 = p3.isHeader == true
	local var17 = signalsReactModule.useSignalBinding(p3.scoreGetter or var10)
	local var18 = signalsReactModule.useSignalBinding(p3.rankGetter or var12)
	local scoreLabel = p3.scoreLabel
	local rowHeight = p3.rowHeight or (if var16 then constantsModule.PLATFORM_HEADER_HEIGHT else constantsModule.PLATFORM_ROW_HEIGHT)
	
	return reactModule.createElement(leaderboardRowShellModule, {
		rowHeight = rowHeight,
		layoutOrder = if fFlagPlayerListReskinOptimizationModule then reactModule.useMemo(function() --[[ line: 86 ]]
			-- upvalues: p3 (ref), var18 (ref), rankToLayoutOrder (copy)
			return if p3.layoutOrder == nil then var18:map(rankToLayoutOrder) else p3.layoutOrder
		end, { p3.layoutOrder, var18 }) elseif p3.layoutOrder ~= nil then var18:map(rankToLayoutOrder) else p3.layoutOrder,
		isHighlighted = p3.isViewer == true,
		showDivider = p3.showDivider == true,
		flexTag = constantsModule.PLATFORM_ROW_FLEX_TAG
	}, {
		RankCell = reactModule.createElement(leaderboardTextCellModule, {
			layoutOrder = 1,
			text = reactModule.useMemo(function() --[[ line: 75 ]]
				-- upvalues: var16 (ref), t (copy), var18 (ref), formatRankCell (copy)
				return if var16 then t.Rank else var18:map(formatRankCell)
			end, { var16, var18 }),
			width = p3.rankWidth or constantsModule.PLATFORM_RANK_WIDTH,
			rowHeight = rowHeight,
			textTag = if var16 then "size-full text-caption-small text-align-x-left content-muted" else "size-full text-body-small text-align-x-left content-default"
		}),
		PeopleCell = reactModule.createElement(peopleCellModule, {
			layoutOrder = 2,
			displayName = if var16 then p3.peopleHeaderText or t.People else p3.displayName or "-",
			textTag = if var16 then "size-full text-caption-small text-align-x-left content-muted" else nil,
			truncate = not var16
		}),
		ScoreCell = reactModule.createElement(leaderboardTextCellModule, {
			layoutOrder = 3,
			text = reactModule.useMemo(function() --[[ line: 68 ]]
				-- upvalues: var16 (ref), scoreLabel (ref), t (copy), var17 (ref), formatScoreCell (copy)
				return if var16 then scoreLabel or t.Score else var17:map(formatScoreCell)
			end, { var16, var17, scoreLabel }),
			width = p3.scoreWidth or constantsModule.PLATFORM_SCORE_WIDTH,
			rowHeight = rowHeight,
			textTag = if var16 then "size-full text-caption-small text-align-x-right content-muted" else "size-full text-body-small text-align-x-right content-default"
		})
	})
end)