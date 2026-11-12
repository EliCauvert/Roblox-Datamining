local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local Text = require(Parent1.Foundation).Text
local SignalsModule = require(Parent1.Signals)
local SignalsReactModule = require(Parent1.SignalsReact)
local LocalizationService = game:GetService("LocalizationService")
local NumberLocalization = require(Parent1.Localization).NumberLocalization
local ConstantsModule = require(Parent.Common.Constants)
local FormatStatStringModule = require(Parent.Common.FormatStatString)
local LeaderboardRowShellModule = require(Parent.Components.Presentation.LeaderboardRowShell)
local LeaderboardTextCellModule = require(Parent.Components.Presentation.LeaderboardTextCell)
local PeopleCellModule = require(Parent.Components.Presentation.PeopleCell)
local FFlagPlayerListPlatformLeaderboardAbbreviateScoresModule = require(Parent.Flags.FFlagPlayerListPlatformLeaderboardAbbreviateScores)
local FFlagPlayerListContrastingTeamTextModule = require(Parent.Flags.FFlagPlayerListContrastingTeamText)
local Signal = SignalsModule.createSignal(nil)
local PlatformLeaderboardUnrankedLabel = game:DefineFastString("PlatformLeaderboardUnrankedLabel", "100+")
local Signal1 = SignalsModule.createSignal(nil)

local function formatScoreCell(p1)
	-- upvalues: FFlagPlayerListPlatformLeaderboardAbbreviateScoresModule (copy), FormatStatStringModule (copy), NumberLocalization (copy), LocalizationService (copy)
	return if FFlagPlayerListPlatformLeaderboardAbbreviateScoresModule then FormatStatStringModule(p1) elseif p1 == nil then "-" else NumberLocalization.localize(p1, LocalizationService.RobloxLocaleId)
end

local function formatRankCell(p1)
	-- upvalues: PlatformLeaderboardUnrankedLabel (copy)
	return if p1 == nil then PlatformLeaderboardUnrankedLabel else tostring(p1)
end

local function rankToLayoutOrder(p1)
	return if p1 == nil then 1000000 else p1
end

return ReactModule.memo(function(p1)
	-- upvalues: SignalsReactModule (copy), Signal (copy), Signal1 (copy), ReactModule (copy), formatScoreCell (copy), formatRankCell (copy), rankToLayoutOrder (copy), ConstantsModule (copy), LeaderboardRowShellModule (copy), FFlagPlayerListContrastingTeamTextModule (copy), Text (copy), LeaderboardTextCellModule (copy), PeopleCellModule (copy)
	local IsIsHeader = p1.isHeader == true
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(p1.scoreGetter or Signal)
	local UseSignalBindingResult1 = SignalsReactModule.useSignalBinding(p1.rankGetter or Signal1)
	local ScoreLabel = p1.scoreLabel
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: IsIsHeader (copy), ScoreLabel (copy), UseSignalBindingResult (copy), formatScoreCell (upval)
		return if IsIsHeader then ScoreLabel or "-" else UseSignalBindingResult:map(formatScoreCell)
	end, { IsIsHeader, UseSignalBindingResult, ScoreLabel })
	local RankHeaderText = p1.rankHeaderText
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: IsIsHeader (copy), RankHeaderText (copy), UseSignalBindingResult1 (copy), formatRankCell (upval)
		return if IsIsHeader then RankHeaderText or "Rank" else UseSignalBindingResult1:map(formatRankCell)
	end, { IsIsHeader, UseSignalBindingResult1, RankHeaderText })
	local SizeFullTextCaptionSmallTextAlignXLeftContentMuted: string = if IsIsHeader then "size-full text-caption-small text-align-x-left content-muted" else "size-full text-body-small text-align-x-left content-default"
	local SizeFullTextCaptionSmallTextAlignXRightContentMuted: string = if IsIsHeader then "size-full text-caption-small text-align-x-right content-muted" else "size-full text-body-small text-align-x-right content-default"
	local RowHeight = p1.rowHeight or (if IsIsHeader then ConstantsModule.PLATFORM_HEADER_HEIGHT else ConstantsModule.PLATFORM_ROW_HEIGHT)
	local RankWidth = p1.rankWidth or ConstantsModule.PLATFORM_RANK_WIDTH
	local ScoreWidth = p1.scoreWidth or ConstantsModule.PLATFORM_SCORE_WIDTH
	
	return ReactModule.createElement(LeaderboardRowShellModule, {
		rowHeight = RowHeight,
		layoutOrder = ReactModule.useMemo(function()
			-- upvalues: p1 (copy), UseSignalBindingResult1 (copy), rankToLayoutOrder (upval)
			return if p1.layoutOrder == nil then UseSignalBindingResult1:map(rankToLayoutOrder) else p1.layoutOrder
		end, { p1.layoutOrder, UseSignalBindingResult1 }),
		isHighlighted = p1.isViewer == true and p1.highlightViewerRow ~= false,
		showDivider = p1.showDivider == true,
		flexTag = ConstantsModule.PLATFORM_ROW_FLEX_TAG
	}, {
		RankCell = if FFlagPlayerListContrastingTeamTextModule then ReactModule.createElement(Text, {
			LayoutOrder = 1,
			Text = UseMemoResult1,
			Size = UDim2.fromOffset(RankWidth, RowHeight),
			tag = {
				["text-align-x-left clip"] = true,
				["text-caption-small content-muted"] = IsIsHeader,
				["text-body-small content-default"] = not IsIsHeader
			}
		}) else ReactModule.createElement(LeaderboardTextCellModule, {
			layoutOrder = 1,
			text = UseMemoResult1,
			width = RankWidth,
			rowHeight = RowHeight,
			textTag = SizeFullTextCaptionSmallTextAlignXLeftContentMuted
		}),
		PeopleCell = ReactModule.createElement(PeopleCellModule, {
			layoutOrder = 2,
			displayName = if IsIsHeader then p1.peopleHeaderText or "People" else p1.displayName or "-",
			textTag = if IsIsHeader then "size-full text-caption-small text-align-x-left content-muted" else nil,
			truncate = not IsIsHeader
		}),
		ScoreCell = if FFlagPlayerListContrastingTeamTextModule then ReactModule.createElement(Text, {
			LayoutOrder = 3,
			Text = UseMemoResult,
			Size = UDim2.fromOffset(ScoreWidth, RowHeight),
			tag = {
				["text-align-x-right clip"] = true,
				["text-caption-small content-muted"] = IsIsHeader,
				["text-body-small content-default"] = not IsIsHeader
			}
		}) else ReactModule.createElement(LeaderboardTextCellModule, {
			layoutOrder = 3,
			text = UseMemoResult,
			width = ScoreWidth,
			rowHeight = RowHeight,
			textTag = SizeFullTextCaptionSmallTextAlignXRightContentMuted
		})
	})
end)