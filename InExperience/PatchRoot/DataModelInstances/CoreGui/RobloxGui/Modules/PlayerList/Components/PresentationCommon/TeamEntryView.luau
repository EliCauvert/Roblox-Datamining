local CorePackages = game:GetService("CorePackages")
local Parent = script.Parent.Parent
local ReactModule = require(CorePackages.Packages.React)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local _ = require(CorePackages.Workspace.Packages.LeaderboardStore)
local EnabledFunction = require(CorePackages.Workspace.Packages.Chrome).Enabled
local FoundationModule = require(CorePackages.Packages.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLayoutValuesFunction = PlayerListModule.Common.useLayoutValues
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local EntryFrameView = PlayerListModule.Presentation.EntryFrameView
local StatEntryContainerModule = require(Parent.Parent.Components.Container.StatEntryContainer)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagPlayerListFixLeaderstatsStacking = SharedFlagsModule.FFlagPlayerListFixLeaderstatsStacking
local FFlagFontFacePlayerList = SharedFlagsModule.FFlagFontFacePlayerList
local FFlagEnableMobilePlayerListOnConsole = PlayerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local FFlagPlayerListContrastingTeamText = PlayerListModule.Flags.FFlagPlayerListContrastingTeamText
local GetContrastingContentStyleFunction = PlayerListModule.Common.getContrastingContentStyle
local CellExtenderModule = require(Parent.Presentation.CellExtender)

return ReactModule.memo(function(p1)
	-- upvalues: UseLayoutValuesFunction (copy), UseStyleFunction (copy), FFlagFontFacePlayerList (copy), FFlagPlayerListContrastingTeamText (copy), UseTokensFunction (copy), FFlagEnableMobilePlayerListOnConsole (copy), NormalizeFontFaceFunction (copy), EnabledFunction (copy), GetContrastingContentStyleFunction (copy), ReactModule (copy), FFlagPlayerListFixLeaderstatsStacking (copy), SignalsReactModule (copy), StatEntryContainerModule (copy), EntryFrameView (copy), CellExtenderModule (copy)
	local UseLayoutValuesResult = UseLayoutValuesFunction()
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = if FFlagFontFacePlayerList or FFlagPlayerListContrastingTeamText then UseTokensFunction() else nil
	local IsSmallTouchDevice = p1.isSmallTouchDevice or false
	local IsDirectionalPreferred = p1.isDirectionalPreferred or false
	local TextEmphasis = UseStyleResult.Theme.TextEmphasis
	local TeamNameTextSize = if FFlagEnableMobilePlayerListOnConsole then UseLayoutValuesResult.TeamNameTextSize else UseStyleResult.Font.CaptionHeader.RelativeSize * UseStyleResult.Font.BaseSize
	local NormalizeFontFaceResult = if FFlagFontFacePlayerList then NormalizeFontFaceFunction(UseTokensResult.Typography.CaptionLarge.Font) else UseStyleResult.Font.CaptionHeader.Font
	
	if IsDirectionalPreferred then
		TextEmphasis = UseLayoutValuesResult.DefaultTextStyle
		TeamNameTextSize = UseLayoutValuesResult.PlayerNameTextSize
		NormalizeFontFaceResult = if FFlagFontFacePlayerList then NormalizeFontFaceFunction(UseLayoutValuesResult.TeamEntryFont) else UseLayoutValuesResult.TeamEntryFont
	end
	if FFlagPlayerListContrastingTeamText then
		local ContrastingContentStyle = GetContrastingContentStyleFunction(p1.teamColor, if IsSmallTouchDevice then 0.5 elseif IsDirectionalPreferred then if UseLayoutValuesResult.BackgroundStyle then UseLayoutValuesResult.BackgroundStyle.Default.Transparency else 0 else UseLayoutValuesResult.TeamEntryBackgroundTransparency, {
			Color3 = if EnabledFunction() then UseStyleResult.Theme.BackgroundUIContrast.Color else UseStyleResult.Theme.BackgroundContrast.Color,
			Transparency = (UseLayoutValuesResult.OverrideBackgroundTransparency or 0) * UseStyleResult.Settings.PreferredTransparency
		}, UseTokensResult.DarkMode.Content.Emphasis, UseTokensResult.LightMode.Content.Emphasis)
		TextEmphasis = {
			Color = ContrastingContentStyle.Color3,
			Transparency = ContrastingContentStyle.Transparency,
			StrokeColor = TextEmphasis.StrokeColor,
			StrokeTransparency = TextEmphasis.StrokeTransparency
		}
	end
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: IsSmallTouchDevice (copy), UseStyleResult (copy), p1 (copy), FFlagPlayerListContrastingTeamText (upval), IsDirectionalPreferred (copy), UseLayoutValuesResult (copy)
		if IsSmallTouchDevice then
			local Settings = UseStyleResult.Settings
			
			return {
				Color = p1.teamColor,
				Transparency = if FFlagPlayerListContrastingTeamText then 0.5 else Settings.PreferredTransparency * 0.5
			}
		else
			return if IsDirectionalPreferred then {
				Color = p1.teamColor,
				Transparency = if UseLayoutValuesResult.BackgroundStyle then UseLayoutValuesResult.BackgroundStyle.Default.Transparency else 0
			} else {
				Color = p1.teamColor,
				Transparency = if FFlagPlayerListContrastingTeamText then UseLayoutValuesResult.TeamEntryBackgroundTransparency else UseLayoutValuesResult.TeamEntryBackgroundTransparency * UseStyleResult.Settings.PreferredTransparency
			}
		end
	end, {
		IsSmallTouchDevice,
		IsDirectionalPreferred,
		p1.teamColor,
		UseStyleResult,
		UseLayoutValuesResult
	})
	local OverlayStyle = { Transparency = 1, Color = Color3.new(1, 1, 1) }
	local MaxLeaderstats = UseLayoutValuesResult.MaxLeaderstats
	local UseSignalStateResult = if FFlagPlayerListFixLeaderstatsStacking then SignalsReactModule.useSignalState(p1.gameStats.getAllData) else nil
	
	if IsSmallTouchDevice then
		local Elements = {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			NameFrame = ReactModule.createElement("TextLabel", {
				LayoutOrder = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, UseLayoutValuesResult.PlayerNameSizeXMobile, 1, 0),
				TextXAlignment = Enum.TextXAlignment.Left,
				Font = if FFlagFontFacePlayerList then nil else NormalizeFontFaceResult,
				FontFace = if FFlagFontFacePlayerList then NormalizeFontFaceResult else nil,
				TextSize = TeamNameTextSize,
				TextColor3 = TextEmphasis.Color,
				TextStrokeTransparency = TextEmphasis.StrokeTransparency,
				TextStrokeColor3 = TextEmphasis.StrokeColor,
				Text = p1.teamName,
				TextTruncate = Enum.TextTruncate.AtEnd
			}, {
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, UseLayoutValuesResult.TeamEntryTextPaddingMobile)
				})
			})
		}
		
		if FFlagPlayerListFixLeaderstatsStacking then
			for StatName, value in UseSignalStateResult do
				if MaxLeaderstats >= value.order(false) then
					Elements["GameStat_" .. StatName] = ReactModule.createElement(StatEntryContainerModule, {
						isTeamEntry = true,
						showStatTitle = false,
						statName = StatName,
						stat = p1.teamStats.getData(StatName, false),
						textStyle = TextEmphasis
					})
				end
			end
		elseif p1.gameStatsCount and p1.teamStatsCount and p1.gameStatsCount > 0 and p1.teamStatsCount >= 0 then
			p1.gameStats.iterateData(function(StatName, p2)
				-- upvalues: MaxLeaderstats (copy), p1 (copy), Elements (copy), ReactModule (upval), StatEntryContainerModule (upval), TextEmphasis (ref)
				if MaxLeaderstats >= p2.order(false) then
					Elements["GameStat_" .. StatName] = ReactModule.createElement(StatEntryContainerModule, {
						isTeamEntry = true,
						showStatTitle = false,
						statName = StatName,
						stat = p1.teamStats.getData(StatName, false),
						textStyle = TextEmphasis
					})
					
					return
				end
			end, false)
		end
		return ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			GroupTransparency = nil,
			LayoutOrder = p1.layoutOrder,
			Size = p1.size,
			BackgroundColor3 = UseMemoResult.Color,
			BackgroundTransparency = UseMemoResult.Transparency
		}, Elements)
	else
		local Elements1 = {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = if IsDirectionalPreferred then UDim.new(0, UseLayoutValuesResult.PlayerEntryPadding) else nil
			}),
			NameFrame = ReactModule.createElement("Frame", {
				LayoutOrder = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, p1.entrySizeX, 0, UseLayoutValuesResult.TeamEntrySizeY)
			}, {
				Shadow = ReactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					Image = UseLayoutValuesResult.ShadowImage,
					Position = UDim2.new(0, -UseLayoutValuesResult.ShadowSize, 0, 0),
					Size = UDim2.new(1, UseLayoutValuesResult.ShadowSize * 2, 1, UseLayoutValuesResult.ShadowSize),
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = UseLayoutValuesResult.ShadowSliceRect,
					Visible = IsDirectionalPreferred
				}),
				BGFrame = ReactModule.createElement(EntryFrameView, {
					isTeamFrame = true,
					doubleOverlay = false,
					size = UDim2.new(0, p1.entrySizeX, 0, UseLayoutValuesResult.TeamEntrySizeY),
					backgroundStyle = UseMemoResult,
					overlayStyle = OverlayStyle
				}, {
					TeamName = ReactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Position = UDim2.new(0, 0, 0, 0),
						Size = UDim2.new(1, 0, 1, 0),
						TextXAlignment = Enum.TextXAlignment.Left,
						Font = if FFlagFontFacePlayerList then nil else NormalizeFontFaceResult,
						FontFace = if FFlagFontFacePlayerList then NormalizeFontFaceResult else nil,
						TextSize = TeamNameTextSize,
						TextColor3 = TextEmphasis.Color,
						TextStrokeTransparency = TextEmphasis.StrokeTransparency,
						TextStrokeColor3 = TextEmphasis.StrokeColor,
						Text = p1.teamName,
						TextTruncate = Enum.TextTruncate.AtEnd
					}, {
						ReactModule.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, UseLayoutValuesResult.TeamEntryTextPadding)
						})
					})
				})
			})
		}
		
		if FFlagPlayerListFixLeaderstatsStacking then
			for StatName1, value1 in UseSignalStateResult do
				if MaxLeaderstats >= value1.order(false) then
					Elements1["GameStat_" .. StatName1] = ReactModule.createElement(StatEntryContainerModule, {
						isTeamEntry = true,
						showStatTitle = false,
						doubleOverlay = false,
						statName = StatName1,
						stat = p1.teamStats.getData(StatName1, false),
						backgroundStyle = UseMemoResult,
						overlayStyle = OverlayStyle,
						textStyle = TextEmphasis
					})
				end
			end
		elseif p1.gameStatsCount and p1.teamStatsCount and p1.gameStatsCount > 0 and p1.teamStatsCount >= 0 then
			p1.gameStats.iterateData(function(StatName, p2)
				-- upvalues: MaxLeaderstats (copy), p1 (copy), Elements1 (copy), ReactModule (upval), StatEntryContainerModule (upval), UseMemoResult (copy), OverlayStyle (copy), TextEmphasis (ref)
				if MaxLeaderstats >= p2.order(false) then
					Elements1["GameStat_" .. StatName] = ReactModule.createElement(StatEntryContainerModule, {
						isTeamEntry = true,
						showStatTitle = false,
						doubleOverlay = false,
						statName = StatName,
						stat = p1.teamStats.getData(StatName, false),
						backgroundStyle = UseMemoResult,
						overlayStyle = OverlayStyle,
						textStyle = TextEmphasis
					})
					
					return
				end
			end, false)
		end
		if not IsDirectionalPreferred then
			Elements1.BackgroundExtender = ReactModule.createElement(CellExtenderModule, {
				layoutOrder = 100,
				doubleOverlay = false,
				size = UDim2.new(0, UseLayoutValuesResult.ExtraContainerPadding, 1, 0),
				backgroundStyle = UseMemoResult,
				overlayStyle = OverlayStyle
			})
		end
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			GroupTransparency = nil,
			Size = p1.size,
			BackgroundColor3 = Color3.new(1, 1, 1),
			LayoutOrder = p1.layoutOrder
		}, Elements1)
	end
end)