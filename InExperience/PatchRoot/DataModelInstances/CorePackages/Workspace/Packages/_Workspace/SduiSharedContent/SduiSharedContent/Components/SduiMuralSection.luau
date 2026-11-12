local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.AppCommonLib)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local CollectionViewsModule = require(Parent.CollectionViews)
local UseCollectionLayoutFunction = CollectionViewsModule.useCollectionLayout
local MaybeForceDarkThemeFunction = CollectionViewsModule.maybeForceDarkTheme
local _ = require(Parent.SduiCoreSystem)
local FFlagLuaAppCompositionAlways = require(Parent.SharedFlags).FFlagLuaAppCompositionAlways

local function MuralArtImage(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement("ImageLabel", {
		ZIndex = -1,
		Size = UDim2.fromScale(1, 1),
		Image = p1.image,
		ScaleType = Enum.ScaleType.Crop,
		BackgroundColor3 = UseTokensResult.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = UseTokensResult.Color.Surface.Surface_0.Transparency
	}, {
		UICorner = if p1.cornerRadius > 0 then ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadius) }) else nil
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: FFlagLuaAppCompositionAlways (copy), UseCollectionLayoutFunction (copy), ReactModule (copy), View (copy), MuralArtImage (copy), MaybeForceDarkThemeFunction (copy)
	local FFlagLuaAppCompositionAlways1 = FFlagLuaAppCompositionAlways or (p1.appCompositionEnabled or p1.sduiContext.appCompositionEnabled)
	local UseCollectionLayoutResult = UseCollectionLayoutFunction()
	local HasFoundAt: boolean = p1.contentTag ~= nil and string.find(p1.contentTag, "padding", 1, true) ~= nil
	local Margin = if p1.fullBleed and FFlagLuaAppCompositionAlways1 then UseCollectionLayoutResult.margin else 0
	local CornerRadius = p1.cornerRadius or 0
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId or "--sdui-mural-section"
	}, {
		Section = MaybeForceDarkThemeFunction(ReactModule.createElement(ReactModule.Fragment, nil, {
			Art = if p1.backgroundMuralUrl then ReactModule.createElement(View, {
				ZIndex = -1,
				testId = "--sdui-mural-section-art",
				Position = UDim2.new(0, -Margin, 0, 0),
				Size = UseBindingResult:map(function(Value: number): UDim2
					-- upvalues: Margin (copy)
					return UDim2.new(1, 2 * Margin, 0, (math.ceil(Value)))
				end)
			}, {
				Image = ReactModule.createElement(MuralArtImage, {
					image = p1.backgroundMuralUrl,
					cornerRadius = CornerRadius
				})
			}) else nil,
			Content = ReactModule.createElement(View, {
				testId = "--sdui-mural-section-content",
				tag = {
					["col size-full-0 auto-y"] = true,
					["padding-y-xxlarge"] = p1.backgroundMuralUrl ~= nil and not HasFoundAt,
					[p1.contentTag or ""] = p1.contentTag ~= nil
				},
				onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
					-- upvalues: UseBindingResult2 (copy)
					UseBindingResult2(Frame.AbsoluteSize.Y)
				end, {})
			}, {
				Content = ReactModule.useMemo(function()
					-- upvalues: p1 (copy), ReactModule (upval), FFlagLuaAppCompositionAlways1 (copy)
					return if p1.content then ReactModule.cloneElement(p1.content, {
						extraLocalProps = {
							appCompositionEnabled = FFlagLuaAppCompositionAlways1,
							scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
							verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
							startRow = p1.startRow,
							numUpdatesToDelayImpressions = p1.numUpdatesToDelayImpressions,
							index = p1.index,
							selectionOrderBase = p1.selectionOrderBase,
							pageSideMargin = p1.pageSideMargin
						}
					}) else nil
				end, {
					p1.content, FFlagLuaAppCompositionAlways1, p1.scrollViewPositionChangedSignal,
					p1.verticalScrollingFrameRef, p1.startRow, p1.numUpdatesToDelayImpressions,
					p1.index, p1.selectionOrderBase, p1.pageSideMargin
				})
			})
		}), p1.colorMode == "Dark")
	})
end)