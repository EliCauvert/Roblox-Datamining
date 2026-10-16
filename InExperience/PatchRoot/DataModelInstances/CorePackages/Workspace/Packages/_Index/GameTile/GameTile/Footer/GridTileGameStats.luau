local TextService = game:GetService("TextService")
local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local ReactModule = require(Parent.React)
local StyleModule = require(Parent.Style)
local UseDesignTokensFunction = StyleModule.useDesignTokens
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UIBloxModule = require(Parent.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local GetGameTileMetadataFontModule = require(GameTile.Footer.getGameTileMetadataFont)
local UseTextSizeOffsetFunction = UIBloxModule.Core.Style.useTextSizeOffset
local ResponsiveModule = require(Parent.Responsive)
local UseBreakpointXOrSmallerFunction = ResponsiveModule.useBreakpointXOrSmaller
local GameTileTypesModule = require(GameTile.GameTileTypes)
local FFlagLuaAppMigrateGameTileFooterValueFixes = require(Parent.SharedFlags).FFlagLuaAppMigrateGameTileFooterValueFixes
local FFlagLuaAppFixSmallScreenFooterStatsOverlap = require(Parent.SharedFlags).FFlagLuaAppFixSmallScreenFooterStatsOverlap
local FFlagLuaAppNarrowTileHideRating = require(Parent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local FFlagLuaAppNarrowTileHidePlayerCount = require(Parent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount
local IconsStatusGamesRatingSmall = Images["icons/status/games/rating_small"]
local IconsStatusGamesPeoplePlayingSmall = Images["icons/status/games/people-playing_small"]
local _Vector2 = Vector2.new(1e999, 1e999)

return function(Frame) --[[ Line: 64 | Named "GridTileGameStats" ]]
	-- upvalues: UseDesignTokensFunction (copy), UseTextSizeOffsetFunction (copy), UseTokensFunction (copy), FFlagLuaAppFixSmallScreenFooterStatsOverlap (copy), UseBreakpointXOrSmallerFunction (copy), ResponsiveModule (copy), GameTileTypesModule (copy), FFlagLuaAppMigrateGameTileFooterValueFixes (copy), GetGameTileMetadataFontModule (copy), ReactModule (copy), FFlagLuaAppNarrowTileHideRating (copy), FoundationFontFaceMigration (copy), StyleModule (copy), _Vector2 (copy), TextService (copy), ImageSetLabel (copy), IconsStatusGamesRatingSmall (copy), NormalizeFontFaceFunction (copy), FFlagLuaAppNarrowTileHidePlayerCount (copy), IconsStatusGamesPeoplePlayingSmall (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseTextSizeOffsetResult: number = UseTextSizeOffsetFunction()
	local UseTokensResult = UseTokensFunction()
	local IsGameTileLayoutTypeMatch: boolean = if FFlagLuaAppFixSmallScreenFooterStatsOverlap then UseBreakpointXOrSmallerFunction(ResponsiveModule.Keys.XSmall) and Frame.gameTileLayoutType == GameTileTypesModule.GameTileLayoutType.Narrow else false
	local IsGameTileLayoutTypeMatch1: boolean = UseBreakpointXOrSmallerFunction(ResponsiveModule.Keys.Small) and Frame.gameTileLayoutType == GameTileTypesModule.GameTileLayoutType.Narrow
	local IsGameTileLayoutTypeMatch2 = IsGameTileLayoutTypeMatch or Frame.compactMetadataFormat
	local Size500 = if Frame.isUnifiedGameTile then if FFlagLuaAppMigrateGameTileFooterValueFixes then UseTokensResult.Size.Size_500 else UseTokensResult.Size.Size_300 elseif FFlagLuaAppMigrateGameTileFooterValueFixes then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Size.Size_300
	local XXSmall = if Frame.isUnifiedGameTile then if IsGameTileLayoutTypeMatch2 then UseTokensResult.Gap.XXSmall else UseTokensResult.Gap.XSmall else UseDesignTokensResult.Size.Size_100
	local XXSmall1 = if Frame.isUnifiedGameTile then if FFlagLuaAppMigrateGameTileFooterValueFixes then if IsGameTileLayoutTypeMatch then UseTokensResult.Gap.XXSmall else UseTokensResult.Gap.Small else UseTokensResult.Gap.Medium else UseDesignTokensResult.Size.Size_200
	local Default = if Frame.isUnifiedGameTile then UseTokensResult.Color.Content.Default else UseDesignTokensResult.Color.Content.Default
	local GameTileMetadataFontModule = GetGameTileMetadataFontModule(Frame.useLargerFont, UseDesignTokensResult, UseTokensResult or nil, if Frame.isUnifiedGameTile then true else nil, Frame.compactMetadataFormat)
	local FontSize: number = GameTileMetadataFontModule.FontSize
	local GameTileMetadataFontModuleFont = GameTileMetadataFontModule.Font
	local IsGameTileLayoutTypeMatch1_1: boolean = UseTextSizeOffsetResult > 0 and IsGameTileLayoutTypeMatch1
	local XOffset = FontSize / 1.26
	local RatingText = Frame.ratingText
	local UseMemoResult: number = ReactModule.useMemo(function() --[[ Line: 112 ]]
		-- upvalues: FFlagLuaAppNarrowTileHideRating (upval), Frame (copy), RatingText (copy), FoundationFontFaceMigration (upval), StyleModule (upval), FontSize (copy), GameTileMetadataFontModuleFont (copy), _Vector2 (upval), TextService (upval)
		return if FFlagLuaAppNarrowTileHideRating and Frame.hideRating or RatingText == nil or RatingText == "" then 0 elseif FoundationFontFaceMigration then StyleModule.GetTextSize(RatingText, FontSize, GameTileMetadataFontModuleFont, _Vector2, { addTemporaryPadding = false }).X else TextService:GetTextSize(RatingText, FontSize, GameTileMetadataFontModuleFont, _Vector2).X
	end, {
		RatingText,
		FontSize,
		GameTileMetadataFontModuleFont,
		UseTextSizeOffsetResult,
		if FFlagLuaAppNarrowTileHideRating then Frame.hideRating else nil
	})
	local NewXOffset = XOffset + XXSmall + UseMemoResult + XXSmall1
	
	return ReactModule.createElement("Frame", {
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, if IsGameTileLayoutTypeMatch1_1 then 1 else 0, if IsGameTileLayoutTypeMatch1_1 then 0 else Size500 + UseTextSizeOffsetResult),
		Position = Frame.Position,
		LayoutOrder = Frame.LayoutOrder
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = if IsGameTileLayoutTypeMatch1_1 then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = if IsGameTileLayoutTypeMatch1_1 then nil else UDim.new(0, XXSmall1)
		}),
		RatingsFrame = if FFlagLuaAppNarrowTileHideRating and Frame.hideRating then nil else ReactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, UseMemoResult + XOffset + XXSmall, 0, Size500 + UseTextSizeOffsetResult)
		}, {
			RatingIconSlot = ReactModule.createElement("Frame", {
				LayoutOrder = 1,
				ClipsDescendants = false,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(XOffset, XOffset),
				Position = UDim2.fromScale(0, 0.5),
				AnchorPoint = Vector2.new(0, 0.5)
			}, {
				Icon = ReactModule.createElement(ImageSetLabel, {
					ImageTransparency = 0,
					BackgroundTransparency = 1,
					Image = IconsStatusGamesRatingSmall,
					ImageColor3 = Default.Color3,
					Position = UDim2.fromScale(0.5, 0.5),
					Size = UDim2.fromOffset(XOffset, XOffset),
					AnchorPoint = Vector2.new(0.5, 0.5)
				})
			}),
			RatingText = ReactModule.createElement("TextLabel", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				TextWrapped = false,
				Text = RatingText,
				Size = UDim2.new(0, UseMemoResult + XXSmall, 0, FontSize + UseTextSizeOffsetResult),
				Position = UDim2.new(0, XOffset + XXSmall, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				TextSize = FontSize,
				Font = if FoundationFontFaceMigration then nil else GameTileMetadataFontModule.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(GameTileMetadataFontModule.Font) else nil,
				TextTransparency = Default.Transparency,
				TextColor3 = Default.Color3,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center
			})
		}),
		PlayerCountFrame = if FFlagLuaAppNarrowTileHidePlayerCount and Frame.hidePlayerCount then nil else ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = if IsGameTileLayoutTypeMatch1_1 then UDim2.new(1, 0, 0, Size500 + UseTextSizeOffsetResult) elseif FFlagLuaAppNarrowTileHideRating and Frame.hideRating then UDim2.new(1, 0, 0, Size500 + UseTextSizeOffsetResult) else UDim2.new(1, -NewXOffset, 0, Size500 + UseTextSizeOffsetResult)
		}, {
			PlayerCountIconSlot = ReactModule.createElement("Frame", {
				LayoutOrder = 1,
				ClipsDescendants = false,
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 0, 0.5, 0),
				Size = UDim2.fromOffset(XOffset, XOffset),
				AnchorPoint = Vector2.new(0, 0.5)
			}, {
				Icon = ReactModule.createElement(ImageSetLabel, {
					ImageTransparency = 0,
					BackgroundTransparency = 1,
					Image = IconsStatusGamesPeoplePlayingSmall,
					ImageColor3 = Default.Color3,
					Position = UDim2.fromScale(0.5, 0.5),
					Size = UDim2.fromOffset(XOffset, XOffset),
					AnchorPoint = Vector2.new(0.5, 0.5)
				})
			}),
			PlayerCountText = ReactModule.createElement("TextLabel", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				TextWrapped = false,
				Text = Frame.playerCountText,
				Size = UDim2.new(1, -XOffset - XXSmall, 0, FontSize + UseTextSizeOffsetResult),
				Position = UDim2.new(0, XOffset + XXSmall, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				TextSize = GameTileMetadataFontModule.FontSize,
				Font = if FoundationFontFaceMigration then nil else GameTileMetadataFontModule.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(GameTileMetadataFontModule.Font) else nil,
				TextTransparency = Default.Transparency,
				TextColor3 = Default.Color3,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center
			})
		})
	})
end