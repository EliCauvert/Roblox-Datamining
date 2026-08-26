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
local var1 = signalsModule.createSignal(nil)
local platformLeaderboardUnrankedLabel = game:DefineFastString("PlatformLeaderboardUnrankedLabel", "100+")
local var2 = signalsModule.createSignal(nil)

local function formatScoreCell(p1)
	-- upvalues: numberLocalization (ref), localizationService (ref)
	return if p1 == nil then "-" else numberLocalization.localize(p1, localizationService.RobloxLocaleId)
end

local function formatRankCell(p1)
	-- upvalues: platformLeaderboardUnrankedLabel (ref)
	return if p1 == nil then platformLeaderboardUnrankedLabel else tostring(p1)
end

local function rankToLayoutOrder(p1)
	return if p1 == nil then 1000000 else p1
end

return reactModule.memo(function(p1)
	-- upvalues: signalsReactModule (ref), var1 (ref), var2 (ref), reactModule (ref), formatScoreCell (ref), formatRankCell (ref), rankToLayoutOrder (ref), constantsModule (ref), leaderboardRowShellModule (ref), leaderboardTextCellModule (ref), peopleCellModule (ref)
	local var3 = p1.isHeader == true
	local var4 = signalsReactModule.useSignalBinding(p1.scoreGetter or var1)
	local var5 = signalsReactModule.useSignalBinding(p1.rankGetter or var2)
	local scoreLabel = p1.scoreLabel
	local var6 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), scoreLabel (ref), var4 (ref), formatScoreCell (copy)
		return if var3 then scoreLabel or "-" else var4:map(formatScoreCell)
	end, { var3, var4, scoreLabel })
	local rankHeaderText = p1.rankHeaderText
	local rowHeight = p1.rowHeight or (if var3 then constantsModule.PLATFORM_HEADER_HEIGHT else constantsModule.PLATFORM_ROW_HEIGHT)
	
	return reactModule.createElement(leaderboardRowShellModule, {
		rowHeight = rowHeight,
		layoutOrder = reactModule.useMemo(function()
			-- upvalues: p1 (ref), var5 (ref), rankToLayoutOrder (copy)
			return if p1.layoutOrder == nil then var5:map(rankToLayoutOrder) else p1.layoutOrder
		end, { p1.layoutOrder, var5 }),
		isHighlighted = p1.isViewer == true and p1.highlightViewerRow ~= false,
		showDivider = p1.showDivider == true,
		flexTag = constantsModule.PLATFORM_ROW_FLEX_TAG
	}, {
		RankCell = reactModule.createElement(leaderboardTextCellModule, {
			layoutOrder = 1,
			text = reactModule.useMemo(function()
				-- upvalues: var3 (ref), rankHeaderText (ref), var5 (ref), formatRankCell (copy)
				return if var3 then rankHeaderText or "Rank" else var5:map(formatRankCell)
			end, { var3, var5, rankHeaderText }),
			width = p1.rankWidth or constantsModule.PLATFORM_RANK_WIDTH,
			rowHeight = rowHeight,
			textTag = if var3 then "size-full text-caption-small text-align-x-left content-muted" else "size-full text-body-small text-align-x-left content-default"
		}),
		PeopleCell = reactModule.createElement(peopleCellModule, {
			layoutOrder = 2,
			displayName = if var3 then p1.peopleHeaderText or "People" else p1.displayName or "-",
			textTag = if var3 then "size-full text-caption-small text-align-x-left content-muted" else nil,
			truncate = not var3
		}),
		ScoreCell = reactModule.createElement(leaderboardTextCellModule, {
			layoutOrder = 3,
			text = var6,
			width = p1.scoreWidth or constantsModule.PLATFORM_SCORE_WIDTH,
			rowHeight = rowHeight,
			textTag = if var3 then "size-full text-caption-small text-align-x-right content-muted" else "size-full text-body-small text-align-x-right content-default"
		})
	})
end)