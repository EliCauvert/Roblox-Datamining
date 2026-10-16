local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.AppCommonLib)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local CryoModule = require(Parent.Cryo)
local View = FoundationModule.View
local Chip = FoundationModule.Chip
local Divider = FoundationModule.Divider
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ChipSize = FoundationModule.Enums.ChipSize
local ChipVariant = FoundationModule.Enums.ChipVariant
local IconName = FoundationModule.Enums.IconName
local UseAiOverviewExpansionModule = require(script.Parent.useAiOverviewExpansion)

return ReactModule.memo(function(p1) --[[ Line: 48 | Named "SduiAiOverview" ]]
	-- upvalues: UseTokensFunction (copy), UsePreferencesFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), CryoModule (copy), UseAiOverviewExpansionModule (copy), View (copy), Divider (copy), Chip (copy), IconName (copy), ChipSize (copy), ChipVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local UsePreferencesResult = UsePreferencesFunction()
	local UseLocalizationResult = UseLocalizationFunction({ expandButtonText = "CommonUI.Controls.Action.ShowMore" })
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 56 ]]
		-- upvalues: p1 (copy)
		return {
			index = p1.index,
			scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
			verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
			startRow = p1.startRow or p1.index
		}
	end, {
		p1.index,
		p1.scrollViewPositionChangedSignal,
		p1.verticalScrollingFrameRef,
		p1.startRow
	})
	local UseResult = ReactModule.useCallback(function(List) --[[ Line: 67 ]]
		-- upvalues: ReactModule (upval), CryoModule (upval), UseMemoResult (copy)
		if not List or typeof(List) ~= "table" then
			return List
		end
		local CloneElementResults = {}
		
		for i, value in List do
			CloneElementResults[i] = ReactModule.cloneElement(value, {
				extraLocalProps = CryoModule.Dictionary.join(value.props and value.props.extraLocalProps or {}, UseMemoResult)
			})
		end
		return CloneElementResults
	end, { UseMemoResult })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 82 ]]
		-- upvalues: UseResult (copy), p1 (copy)
		return UseResult(p1.content)
	end, { p1.content, UseResult })
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 86 ]]
		-- upvalues: UseResult (copy), p1 (copy)
		return UseResult(p1.footer)
	end, { p1.footer, UseResult })
	local HeaderGap = p1.headerGap or UseTokensResult.Gap.Small
	local SectionGap = p1.sectionGap or UseTokensResult.Gap.Large
	local HasTitleComponent: boolean = p1.titleComponent ~= nil or p1.descriptionComponent ~= nil
	local HasContent: boolean = p1.content ~= nil or p1.footer ~= nil
	local ExpandButtonText = p1.expandButtonText or UseLocalizationResult.expandButtonText
	local BackgroundStyle = p1.backgroundStyle or UseTokensResult.Color.Surface.Surface_0
	local UseAiOverviewExpansionModuleResult = UseAiOverviewExpansionModule({
		buttonHeight = UseTokensResult.Size.Size_1000,
		compactHeight = p1.compactHeight,
		hasHeader = HasTitleComponent,
		hasExpandableBody = HasContent,
		sectionGap = SectionGap,
		reducedMotion = UsePreferencesResult.reducedMotion
	})
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, SectionGap)
		},
		backgroundStyle = p1.backgroundStyle,
		LayoutOrder = p1.layoutOrder,
		sizeConstraint = if UseAiOverviewExpansionModuleResult.shouldReserveCompactHeight then { MinSize = Vector2.new(0, p1.compactHeight) } else nil,
		testId = p1.testId or "--sdui-ai-overview"
	}, {
		Header = if HasTitleComponent then ReactModule.createElement(View, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 1,
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, HeaderGap)
			},
			onAbsoluteSizeChanged = UseAiOverviewExpansionModuleResult.onHeaderAbsoluteSizeChanged
		}, {
			Title = if p1.titleComponent then ReactModule.createElement(View, {
				tag = "size-full-0 auto-y",
				LayoutOrder = 1,
				testId = "--sdui-ai-overview-title"
			}, { Slot = p1.titleComponent }) else nil,
			Description = if p1.descriptionComponent then ReactModule.createElement(View, {
				tag = "size-full-0 auto-y",
				LayoutOrder = 2,
				testId = "--sdui-ai-overview-description"
			}, { Slot = p1.descriptionComponent }) else nil
		}) else nil,
		Body = if HasContent then ReactModule.createElement(View, { tag = "col size-full-0 auto-y", LayoutOrder = 2 }, {
			Inner = ReactModule.createElement(View, {
				tag = {
					clip = UseAiOverviewExpansionModuleResult.useCompactViewport,
					["no-clip"] = not UseAiOverviewExpansionModuleResult.useCompactViewport,
					["auto-none"] = UseAiOverviewExpansionModuleResult.useCompactViewport,
					["auto-y"] = not UseAiOverviewExpansionModuleResult.useCompactViewport
				},
				Size = if UseAiOverviewExpansionModuleResult.useCompactViewport then UseAiOverviewExpansionModuleResult.animatedViewportHeight:map(function(Value: number): UDim2 --[[ Line: 169 ]]
					return UDim2.new(1, 0, 0, (math.ceil(Value)))
				end) else UDim2.fromScale(1, 0)
			}, {
				Content = ReactModule.createElement(View, {
					tag = "size-full-0 auto-y",
					layout = {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, SectionGap)
					},
					onAbsoluteSizeChanged = UseAiOverviewExpansionModuleResult.onContentAbsoluteSizeChanged
				}, {
					Content = if UseMemoResult1 then ReactModule.createElement(View, {
						tag = "size-full-0 auto-y",
						LayoutOrder = 3,
						testId = "--sdui-ai-overview-content",
						layout = {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, SectionGap)
						}
					}, UseMemoResult1) else nil,
					Footer = if UseMemoResult2 then ReactModule.createElement(View, {
						tag = "size-full-0 auto-y",
						LayoutOrder = 4,
						testId = "--sdui-ai-overview-footer",
						layout = {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, SectionGap)
						}
					}, UseMemoResult2) else nil
				}),
				FadeOverlay = if UseAiOverviewExpansionModuleResult.isCompact then ReactModule.createElement(View, {
					tag = "position-bottom-left anchor-bottom-left",
					ZIndex = 2,
					backgroundStyle = BackgroundStyle,
					Size = UseAiOverviewExpansionModuleResult.animatedViewportHeight:map(function(p2: number): UDim2 --[[ Line: 213 ]]
						return UDim2.new(1, 0, 0, (math.ceil(p2 * 0.25)))
					end)
				}, {
					Gradient = ReactModule.createElement("UIGradient", {
						Rotation = 90,
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0, 1),
							NumberSequenceKeypoint.new(1, 0)
						})
					})
				}) else nil
			})
		}) else nil,
		ToggleButton = if UseAiOverviewExpansionModuleResult.isCompact then ReactModule.createElement(View, {
			tag = "row align-y-center gap-xsmall size-full-0 auto-y",
			LayoutOrder = 3
		}, {
			LeadingLine = ReactModule.createElement(View, { tag = "grow", LayoutOrder = 1 }, { Divider = ReactModule.createElement(Divider) }),
			ChipOutline = ReactModule.createElement(View, {
				tag = "auto-xy stroke-default radius-circle",
				LayoutOrder = 2
			}, {
				Chip = ReactModule.createElement(Chip, {
					testId = "--sdui-ai-overview-toggle",
					text = ExpandButtonText,
					trailing = IconName.ChevronLargeDown,
					size = ChipSize.Large,
					variant = ChipVariant.Utility,
					onActivated = UseAiOverviewExpansionModuleResult.onExpand
				})
			}),
			TrailingLine = ReactModule.createElement(View, { tag = "grow", LayoutOrder = 3 }, { Divider = ReactModule.createElement(Divider) })
		}) else nil
	})
end)