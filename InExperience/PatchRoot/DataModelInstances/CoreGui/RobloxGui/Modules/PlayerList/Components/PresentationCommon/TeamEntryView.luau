local CorePackages = game:GetService("CorePackages")
local Parent = script.Parent.Parent
local ReactModule = require(CorePackages.Packages.React)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local _ = require(CorePackages.Workspace.Packages.LeaderboardStore)
local FoundationModule = require(CorePackages.Packages.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLayoutValuesFunction = PlayerListModule.Common.useLayoutValues
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local EntryFrameView = PlayerListModule.Presentation.EntryFrameView
local StatEntryContainerModule = require(Parent.Parent.Components.Container.StatEntryContainer)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagPlayerListFixLeaderstatsStacking = SharedFlagsModule.FFlagPlayerListFixLeaderstatsStacking
local FoundationFontFaceMigration = SharedFlagsModule.FFlagFontFacePlayerList and FoundationModule.Utility.Flags.FoundationFontFaceMigration
local FFlagEnableMobilePlayerListOnConsole = PlayerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local CellExtenderModule = require(Parent.Presentation.CellExtender)

return ReactModule.memo(function(p1) --[[ Line: 59 | Named "TeamEntryView" ]]
	-- upvalues: UseLayoutValuesFunction (copy), UseStyleFunction (copy), FoundationFontFaceMigration (copy), UseTokensFunction (copy), FFlagEnableMobilePlayerListOnConsole (copy), NormalizeFontFaceFunction (copy), ReactModule (copy), FFlagPlayerListFixLeaderstatsStacking (copy), SignalsReactModule (copy), StatEntryContainerModule (copy), EntryFrameView (copy), CellExtenderModule (copy)
	local UseLayoutValuesResult = UseLayoutValuesFunction()
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = if FoundationFontFaceMigration then UseTokensFunction() else nil
	local IsSmallTouchDevice = p1.isSmallTouchDevice or false
	local IsDirectionalPreferred = p1.isDirectionalPreferred or false
	local TextEmphasis = UseStyleResult.Theme.TextEmphasis
	local TeamNameTextSize = if FFlagEnableMobilePlayerListOnConsole then UseLayoutValuesResult.TeamNameTextSize else UseStyleResult.Font.CaptionHeader.RelativeSize * UseStyleResult.Font.BaseSize
	local NormalizeFontFaceResult = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.CaptionLarge.Font) else UseStyleResult.Font.CaptionHeader.Font
	
	if IsDirectionalPreferred then
		TextEmphasis = UseLayoutValuesResult.DefaultTextStyle
		TeamNameTextSize = UseLayoutValuesResult.PlayerNameTextSize
		NormalizeFontFaceResult = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseLayoutValuesResult.TeamEntryFont) else UseLayoutValuesResult.TeamEntryFont
	end
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 84 ]]
		-- upvalues: IsSmallTouchDevice (copy), UseStyleResult (copy), p1 (copy), IsDirectionalPreferred (copy), UseLayoutValuesResult (copy)
		return if IsSmallTouchDevice then {
			Color = p1.teamColor,
			Transparency = UseStyleResult.Settings.PreferredTransparency * 0.5
		} elseif IsDirectionalPreferred then {
			Color = p1.teamColor,
			Transparency = if UseLayoutValuesResult.BackgroundStyle then UseLayoutValuesResult.BackgroundStyle.Default.Transparency else 0
		} else {
			Color = p1.teamColor,
			Transparency = UseLayoutValuesResult.TeamEntryBackgroundTransparency * UseStyleResult.Settings.PreferredTransparency
		}
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
				Font = if FoundationFontFaceMigration then nil else NormalizeFontFaceResult,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceResult else nil,
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
			p1.gameStats.iterateData(function(StatName, p2) --[[ Line: 169 ]]
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
						Font = if FoundationFontFaceMigration then nil else NormalizeFontFaceResult,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceResult else nil,
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
			p1.gameStats.iterateData(function(StatName, p2) --[[ Line: 275 ]]
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