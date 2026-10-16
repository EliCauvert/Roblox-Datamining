local GameFilters = script:FindFirstAncestor("GameFilters")
local Parent = GameFilters.Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.DiscoveryTypes)
local ReactModule = require(Parent.React)
local ScreenSizeImpressionsTracker = require(Parent.Impressions).ScreenSizeImpressionsTracker
local FrameBoundsImpressionsTracker = require(Parent.Impressions).FrameBoundsImpressionsTracker
local VariableItemWidthCarousel = require(Parent.VariableItemWidthCarousel).VariableItemWidthCarousel
local UseCollectionImpressionsSignalFunction = require(Parent.CollectionViews).useCollectionImpressionsSignal
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FilterPillModule = require(GameFilters.Components.FilterPill)
local FFlagLuaAppUseFrameBoundsImpressions = require(Parent.SharedFlags).FFlagLuaAppUseFrameBoundsImpressions
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local _ = require(GameFilters.FilterCallbackTypes)

return function(p1) --[[ Line: 42 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), UseCollectionImpressionsSignalFunction (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), FilterPillModule (copy), CryoModule (copy), VariableItemWidthCarousel (copy), FFlagLuaAppUseFrameBoundsImpressions (copy), FrameBoundsImpressionsTracker (copy), ScreenSizeImpressionsTracker (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseRefResult = ReactModule.useRef(nil)
	local Text = "FilterPillCarousel_" .. p1.sortIndex
	local UseCollectionImpressionsSignalResult, UseCollectionImpressionsSignalResult2 = UseCollectionImpressionsSignalFunction(p1.scrollViewPositionChangedSignal)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 60 ]]
		-- upvalues: UseTokensResult (copy), ReactModule (upval), p1 (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
		local BodyMedium = UseTokensResult.Typography.BodyMedium
		local Muted = UseTokensResult.Color.Content.Muted
		
		return ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = false,
			LayoutOrder = 1,
			Text = p1.title,
			Size = UDim2.new(0, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			Font = if FoundationFontFaceMigration then nil else BodyMedium.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(BodyMedium.Font) else nil,
			TextSize = BodyMedium.FontSize,
			TextTransparency = Muted.Transparency,
			TextColor3 = Muted.Color3,
			TextTruncate = Enum.TextTruncate.SplitWord,
			TextXAlignment = Enum.TextXAlignment.Left
		})
	end, { p1.title, UseTokensResult })
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		FilterCarousel = ReactModule.createElement(VariableItemWidthCarousel, {
			scrollButtonEnabled = true,
			title = if p1.title and p1.title ~= "" then UseResult else "",
			items = p1.filters,
			renderItem = ReactModule.useCallback(function(Filter, Index) --[[ Line: 83 ]]
				-- upvalues: ReactModule (upval), FilterPillModule (upval), p1 (copy), Text (copy), UseStateResult2 (copy), CryoModule (upval), UseStateResult (copy)
				return ReactModule.createElement(FilterPillModule, {
					analyticsInfo = p1.analyticsInfo,
					filter = Filter,
					impressionsTag = Text,
					index = Index,
					onFilterApplied = p1.onFilterApplied,
					onAbsoluteSizeChanged = function(Frame) --[[ Line: 90 ]]
						-- upvalues: UseStateResult2 (upval), CryoModule (upval), UseStateResult (upval), Index (copy)
						if Frame then
							UseStateResult2(CryoModule.Dictionary.join(UseStateResult, { [Index] = Frame.AbsoluteSize.X }))
						end
					end,
					pageContext = p1.pageContext,
					sendFilterClick = p1.sendFilterClick
				})
			end, {
				p1.analyticsInfo, Text, p1.onFilterApplied, UseStateResult, p1.pageContext,
				p1.sendFilterClick
			}),
			onCanvasPositionChanged = UseCollectionImpressionsSignalResult2,
			calculateItemWidth = ReactModule.useCallback(function(p2) --[[ Line: 109 ]]
				-- upvalues: UseStateResult (copy)
				return UseStateResult[p2] or 0
			end, { UseStateResult }),
			itemHeight = UseTokensResult.Size.Size_800,
			headerContentPadding = UseTokensResult.Padding.XSmall,
			itemPadding = UseTokensResult.Padding.XSmall,
			sideMargin = p1.sideMargin,
			LayoutOrder = p1.sortIndex,
			scrollingFrameRef = UseRefResult,
			ref = p1.containerRef
		}),
		ImpressionsTracker = ReactModule.createElement(if FFlagLuaAppUseFrameBoundsImpressions then FrameBoundsImpressionsTracker else ScreenSizeImpressionsTracker, {
			impressionsTag = Text,
			pageContext = p1.pageContext,
			parentRef = UseRefResult,
			scrollViewPositionChangedSignal = UseCollectionImpressionsSignalResult,
			sendImpressions = p1.sendImpressions,
			dataUpdatedTimestamp = p1.dataUpdatedTimestamp
		})
	})
end