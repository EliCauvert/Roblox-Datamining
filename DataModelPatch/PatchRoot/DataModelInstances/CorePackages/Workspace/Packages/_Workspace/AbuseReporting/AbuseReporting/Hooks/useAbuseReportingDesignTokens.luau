local AbuseReporting = script:FindFirstAncestor("AbuseReporting")
local Parent = AbuseReporting.Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local _ = require(AbuseReporting.Common.Types)

local function tokenSelector(p1)
	return p1.LuaApps.AbuseReporting or {
		ReportBackground = {},
		ReportHeader = {},
		ReportActionBar = {},
		ReportStep = {},
		ReportListSelection = {},
		ReportSubmission = {}
	}
end

return function()
	-- upvalues: UseDesignTokensFunction (copy), tokenSelector (copy), ReactModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction(tokenSelector)
	local BackgroundColor = UseDesignTokensResult.ReportBackground.backgroundColor
	local GradientRotation = UseDesignTokensResult.ReportBackground.gradientRotation
	local GradientTransparency = UseDesignTokensResult.ReportBackground.gradientTransparency
	local Size = UseDesignTokensResult.ReportHeader.size
	local VerticalPadding = UseDesignTokensResult.ReportHeader.verticalPadding
	local TitleFontStyle = UseDesignTokensResult.ReportHeader.titleFontStyle
	local SubtitleFontStyle = UseDesignTokensResult.ReportHeader.subtitleFontStyle
	local TitleTextColor = UseDesignTokensResult.ReportHeader.titleTextColor
	local SubtitleTextColor = UseDesignTokensResult.ReportHeader.subtitleTextColor
	local DividerColor = UseDesignTokensResult.ReportHeader.dividerColor
	local DividerHeight = UseDesignTokensResult.ReportHeader.dividerHeight
	local DividerVerticalPadding = UseDesignTokensResult.ReportHeader.dividerVerticalPadding
	local Size1 = UseDesignTokensResult.ReportActionBar.size
	local ButtonListHorizontalPadding = UseDesignTokensResult.ReportActionBar.buttonListHorizontalPadding
	local ButtonHeight = UseDesignTokensResult.ReportActionBar.buttonHeight
	local ButtonWidth = UseDesignTokensResult.ReportActionBar.buttonWidth
	local Size2 = UseDesignTokensResult.ReportStep.size
	local HeaderFontStyle = UseDesignTokensResult.ReportStep.headerFontStyle
	local HeaderTextColor = UseDesignTokensResult.ReportStep.headerTextColor
	local VerticalPadding1 = UseDesignTokensResult.ReportStep.verticalPadding
	local ListEntrySize = UseDesignTokensResult.ReportListSelection.listEntrySize
	local EntryTitleColor = UseDesignTokensResult.ReportSubmission.entryTitleColor
	local EntryTextColor = UseDesignTokensResult.ReportSubmission.entryTextColor
	local EntryFontStyle = UseDesignTokensResult.ReportSubmission.entryFontStyle
	local EntrySize = UseDesignTokensResult.ReportSubmission.entrySize
	local EntryInnerVerticalPadding = UseDesignTokensResult.ReportSubmission.entryInnerVerticalPadding
	local DividerHeight1 = UseDesignTokensResult.ReportSubmission.dividerHeight
	local DividerColor1 = UseDesignTokensResult.ReportSubmission.dividerColor
	local DividerVerticalPadding1 = UseDesignTokensResult.ReportSubmission.dividerVerticalPadding
	
	return ReactModule.useMemo(function()
		-- upvalues: BackgroundColor (copy), GradientRotation (copy), GradientTransparency (copy), Size (copy), VerticalPadding (copy), TitleFontStyle (copy), SubtitleFontStyle (copy), TitleTextColor (copy), SubtitleTextColor (copy), DividerColor (copy), DividerHeight (copy), DividerVerticalPadding (copy), Size1 (copy), ButtonListHorizontalPadding (copy), ButtonHeight (copy), ButtonWidth (copy), Size2 (copy), HeaderFontStyle (copy), HeaderTextColor (copy), VerticalPadding1 (copy), ListEntrySize (copy), EntrySize (copy), EntryTitleColor (copy), EntryTextColor (copy), EntryFontStyle (copy), EntryInnerVerticalPadding (copy), DividerHeight1 (copy), DividerColor1 (copy), DividerVerticalPadding1 (copy)
		return {
			ReportBackground = {
				backgroundColor = BackgroundColor,
				gradientRotation = GradientRotation,
				gradientTransparency = GradientTransparency
			},
			ReportHeader = {
				size = Size,
				verticalPadding = VerticalPadding,
				titleFontStyle = TitleFontStyle,
				subtitleFontStyle = SubtitleFontStyle,
				titleTextColor = TitleTextColor,
				subtitleTextColor = SubtitleTextColor,
				dividerColor = DividerColor,
				dividerHeight = DividerHeight,
				dividerVerticalPadding = DividerVerticalPadding
			},
			ReportActionBar = {
				size = Size1,
				buttonListHorizontalPadding = ButtonListHorizontalPadding,
				buttonHeight = ButtonHeight,
				buttonWidth = ButtonWidth
			},
			ReportStep = {
				size = Size2,
				headerFontStyle = HeaderFontStyle,
				headerTextColor = HeaderTextColor,
				verticalPadding = VerticalPadding1
			},
			ReportListSelection = { listEntrySize = ListEntrySize },
			ReportSubmission = {
				entrySize = EntrySize,
				entryTitleColor = EntryTitleColor,
				entryTextColor = EntryTextColor,
				entryFontStyle = EntryFontStyle,
				entryInnerVerticalPadding = EntryInnerVerticalPadding,
				dividerHeight = DividerHeight1,
				dividerColor = DividerColor1,
				dividerVerticalPadding = DividerVerticalPadding1
			}
		}
	end, {
		{
			backgroundColor = BackgroundColor,
			gradientRotation = GradientRotation,
			gradientTransparency = GradientTransparency
		},
		{
			size = Size,
			verticalPadding = VerticalPadding,
			titleFontStyle = TitleFontStyle,
			subtitleFontStyle = SubtitleFontStyle,
			titleTextColor = TitleTextColor,
			subtitleTextColor = SubtitleTextColor,
			dividerColor = DividerColor,
			dividerHeight = DividerHeight,
			dividerVerticalPadding = DividerVerticalPadding
		},
		{
			size = Size1,
			buttonListHorizontalPadding = ButtonListHorizontalPadding,
			buttonHeight = ButtonHeight,
			buttonWidth = ButtonWidth
		},
		{
			size = Size2,
			headerFontStyle = HeaderFontStyle,
			headerTextColor = HeaderTextColor,
			verticalPadding = VerticalPadding1
		},
		{ listEntrySize = ListEntrySize },
		{
			entrySize = EntrySize,
			entryTitleColor = EntryTitleColor,
			entryTextColor = EntryTextColor,
			entryFontStyle = EntryFontStyle,
			entryInnerVerticalPadding = EntryInnerVerticalPadding,
			dividerHeight = DividerHeight1,
			dividerColor = DividerColor1,
			dividerVerticalPadding = DividerVerticalPadding1
		}
	})
end