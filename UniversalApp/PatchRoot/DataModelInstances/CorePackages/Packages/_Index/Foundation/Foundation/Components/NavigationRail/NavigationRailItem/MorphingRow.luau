local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local MorphingRowIndicatorModule = require(script.Parent.MorphingRowIndicator)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local StatusIndicatorSizeModule = require(Foundation.Enums.StatusIndicatorSize)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local BlendTransparenciesModule = require(Foundation.Utility.blendTransparencies)
local JoinBindablesModule = require(Foundation.Utility.joinBindables)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

local function _(p1: number): number
	return (math.clamp(p1 / 0.25, 0, 1))
end

local _ = function(p1, p2, p3)
	return p1:map(function(p4): UDim2
		-- upvalues: p3 (copy), p2 (copy)
		return UDim2.fromOffset(p2(p4), if p3 == nil then 0 else p3(p4))
	end)
end

return function(p1)
	-- upvalues: UseTokensModule (copy), StatusIndicatorSizeModule (copy), ReactModule (copy), JoinBindablesModule (copy), ViewModule (copy), StateLayerAffordanceModule (copy), TextModule (copy), MorphingRowIndicatorModule (copy), BlendTransparenciesModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local Size1000 = UseTokensModuleResult.Size.Size_1000
	local Size600 = UseTokensModuleResult.Size.Size_600
	local Size200 = UseTokensModuleResult.Size.Size_200
	local Size1400 = UseTokensModuleResult.Size.Size_1400
	local Size = if p1.showCaption then Size1400 else Size1000
	local ScaledFontSize = UseTokensModuleResult.Typography.CaptionSmall.FontSize * UseTokensModuleResult.Typography.CaptionSmall.LineHeight
	local SizeRatio = (Size1000 - Size600) / 2
	local NewSizeRatio = SizeRatio + Size600 + UseTokensModuleResult.Size.Size_100
	local Value = p1.indicator and p1.indicator.value
	local HasValue = Value ~= nil
	local IsValueAbove: boolean = Value ~= nil and Value >= 10
	local Thicker: number = UseTokensModuleResult.Stroke.Thicker
	local Size50 = UseTokensModuleResult.Size.Size_50
	local Size400 = if HasValue then UseTokensModuleResult.Size.Size_400 else UseTokensModuleResult.Size.Size_200
	local Size500 = if HasValue then UseTokensModuleResult.Size.Size_500 else Size400
	local Large = if HasValue then StatusIndicatorSizeModule.Large else nil
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local YOffset = Size500 + Thicker * 2
	local UseResult = ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: YOffset (copy), UseBindingResult2 (copy)
		local X = Frame.AbsoluteSize.X
		local Y: number = Frame.AbsoluteSize.Y
		
		if YOffset > 0 and Y > 0 then
			X = X * YOffset / Y
		end
		UseBindingResult2(X)
	end, { UseBindingResult2, YOffset })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseBindingResult2 (copy)
		if p1.indicator == nil then
			UseBindingResult2(0)
		end
	end, { p1.indicator, UseBindingResult2 })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseTokensModuleResult (copy), Size1000 (copy), p1 (copy), NewSizeRatio (copy), ScaledFontSize (copy), Size200 (copy), ReactModule (upval), Size (copy), SizeRatio (copy), Size600 (copy)
		local Size300 = UseTokensModuleResult.Size.Size_300
		local Size100 = UseTokensModuleResult.Size.Size_100
		local NewSize = Size300 + Size100 + Size1000 / 2
		local NewNewSizeRatio = if p1.showCaption then NewSizeRatio + ScaledFontSize + Size200 else Size1000
		local NewSizeDelta = NewSize - Size1000 / 2
		
		return ReactModule.joinBindings({ railWidth = p1.railWidth, progress = p1.collapseProgress }):map(function(p2)
			-- upvalues: Size300 (copy), Size (upval), p1 (upval), NewSize (copy), Size100 (copy), NewSizeDelta (copy), SizeRatio (upval), Size600 (upval), Size200 (upval), Size1000 (copy), NewNewSizeRatio (copy)
			local RailWidth = p2.railWidth
			local Progress: number = p2.progress
			local RailWidthDelta = RailWidth - 2 * Size300
			local NewSize1 = Size + (1 - Progress) * (RailWidthDelta - Size)
			local NewNewSize = if p1.showCaption then (NewSize - Size / 2) * Progress + Size300 * (1 - Progress) else Size100 * Progress
			local NewSizeDeltaDelta = if p1.showCaption then NewSizeDelta - NewNewSize else Size100 * (1 - Progress)
			
			return {
				progress = Progress,
				flowWidth = if p1.showCaption then RailWidth else RailWidthDelta,
				boxWidth = NewSize1,
				boxLeft = NewNewSize,
				height = Size1000 + Progress * (NewNewSizeRatio - Size1000),
				slotLeft = NewSizeDeltaDelta,
				glyphRight = NewSizeDeltaDelta + SizeRatio + Size600,
				trailingRight = NewSize1 - Size200
			}
		end)
	end, {
		p1.railWidth, p1.collapseProgress, p1.showCaption, UseTokensModuleResult,
		Size1000, Size600, Size200, Size, ScaledFontSize, NewSizeRatio, SizeRatio
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), Size1000 (copy), JoinBindablesModule (upval), UseBindingResult (copy), Size200 (copy), Thicker (copy), NewSizeRatio (copy), HasValue (copy), p1 (copy), SizeRatio (copy), UseTokensModuleResult (copy), IsValueAbove (copy), Size50 (copy)
		local function v52(p2)
			return p2.flowWidth
		end
		
		local function v53(p2)
			return p2.height
		end
		
		local MapResult = UseMemoResult:map(function(p2): UDim2
			-- upvalues: v53 (copy), v52 (copy)
			return UDim2.fromOffset(v52(p2), if v53 == nil then 0 else v53(p2))
		end)
		
		local function v55(p2)
			return p2.boxWidth
		end
		
		local function v56(p2)
			return p2.height
		end
		
		local MapResult1 = UseMemoResult:map(function(p2): UDim2
			-- upvalues: v56 (copy), v55 (copy)
			return UDim2.fromOffset(v55(p2), if v56 == nil then 0 else v56(p2))
		end)
		
		local function v58(p2)
			return p2.boxLeft
		end
		
		local v1 = nil
		local MapResult2 = UseMemoResult:map(function(p2): UDim2
			-- upvalues: v1 (copy), v58 (copy)
			return UDim2.fromOffset(v58(p2), if v1 == nil then 0 else v1(p2))
		end)
		
		local function v61(p2)
			return p2.slotLeft
		end
		
		local v2 = nil
		local MapResult3 = UseMemoResult:map(function(p2): UDim2
			-- upvalues: v2 (copy), v61 (copy)
			return UDim2.fromOffset(v61(p2), if v2 == nil then 0 else v2(p2))
		end)
		
		local function v64(p2)
			-- upvalues: Size1000 (upval)
			return p2.slotLeft + Size1000
		end
		
		local v3 = nil
		local MapResult4 = UseMemoResult:map(function(p2): UDim2
			-- upvalues: v3 (copy), v64 (copy)
			return UDim2.fromOffset(v64(p2), if v3 == nil then 0 else v3(p2))
		end)
		
		local function v67(p2): number
			-- upvalues: Size1000 (upval)
			return p2.slotLeft + Size1000 / 2
		end
		
		local function v68(_)
			-- upvalues: NewSizeRatio (upval)
			return NewSizeRatio
		end
		
		return {
			containerSize = MapResult,
			boxSize = MapResult1,
			boxPosition = MapResult2,
			iconPosition = MapResult3,
			sidePosition = MapResult4,
			sideSize = JoinBindablesModule({ metrics = UseMemoResult, badgeWidth = UseBindingResult }, function(p2): UDim2
				-- upvalues: Size200 (upval), Thicker (upval), Size1000 (upval)
				local Metrics = p2.metrics
				
				return UDim2.fromOffset(math.max(0, Metrics.boxWidth - (Metrics.slotLeft + Size1000) - (if p2.badgeWidth > 0 then p2.badgeWidth + Size200 - Thicker else 0)), Size1000)
			end),
			sideTransparency = UseMemoResult:map(function(p2): number
				return (math.clamp(p2.progress / 0.25, 0, 1))
			end),
			captionTransparency = UseMemoResult:map(function(p2): number
				return (math.clamp((1 - p2.progress) / 0.25, 0, 1))
			end),
			captionPosition = UseMemoResult:map(function(p2): UDim2
				-- upvalues: v68 (copy), v67 (copy)
				return UDim2.fromOffset(v67(p2), if v68 == nil then 0 else v68(p2))
			end),
			expandedIndicatorPosition = UseMemoResult:map(function(p2): UDim2
				-- upvalues: Thicker (upval), Size1000 (upval)
				return UDim2.fromOffset(p2.boxLeft + p2.trailingRight + Thicker, Size1000 / 2)
			end),
			collapsedIndicatorPosition = UseMemoResult:map(function(p2): UDim2
				-- upvalues: HasValue (upval), p1 (upval), SizeRatio (upval), UseTokensModuleResult (upval), Thicker (upval), IsValueAbove (upval), Size50 (upval)
				local NewBoxLeft = p2.boxLeft + p2.glyphRight
				
				if HasValue then
					local YOffset = (if p1.showCaption then SizeRatio - (UseTokensModuleResult.Size.Size_200 - Thicker) else 0) - Thicker
					
					return if IsValueAbove then UDim2.fromOffset(NewBoxLeft + UseTokensModuleResult.Size.Size_250 + Thicker * 2, YOffset) else UDim2.fromOffset(NewBoxLeft + UseTokensModuleResult.Size.Size_50, YOffset)
				else
					return UDim2.fromOffset(NewBoxLeft - Size50, SizeRatio + Size50)
				end
			end)
		}
	end, {
		UseMemoResult, Size1000, NewSizeRatio, Thicker, Size200, UseBindingResult,
		HasValue, IsValueAbove, p1.showCaption, UseTokensModuleResult, SizeRatio,
		Size50
	})
	local IsIsResizing = p1.isResizing == true
	local HasIndicator = p1.indicator ~= nil
	local IsIsResizing1: boolean = HasIndicator and (IsIsResizing or UseMemoResult1.sideTransparency:getValue() < 1)
	local IsIsResizing2: boolean = HasIndicator and (IsIsResizing or UseMemoResult1.captionTransparency:getValue() < 1)
	
	return ReactModule.createElement(ViewModule, { LayoutOrder = 3, Size = UseMemoResult1.containerSize }, {
		Box = ReactModule.createElement(ViewModule, {
			ZIndex = 2,
			Position = UseMemoResult1.boxPosition,
			Size = UseMemoResult1.boxSize,
			tag = {
				["radius-medium clip"] = true,
				["bg-shift-200"] = p1.isActive
			},
			onActivated = p1.onActivated,
			onStateChanged = p1.onStateChanged,
			selection = { Selectable = p1.onActivated ~= nil },
			stateLayer = if p1.onActivated == nil then { affordance = StateLayerAffordanceModule.None } else nil,
			ref = p1.rowRef,
			testId = `{p1.testId}--row`
		}, {
			Caption = if p1.showCaption then ReactModule.createElement(ViewModule, {
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UseMemoResult1.captionPosition,
				Size = UDim2.fromOffset(Size1400, ScaledFontSize)
			}, {
				Text = ReactModule.createElement(TextModule, {
					Text = p1.text,
					textStyle = UseMemoResult1.captionTransparency:map(function(Transparency)
						return { Transparency = Transparency }
					end),
					tag = {
						["size-full-0 auto-y text-caption-small text-align-x-center text-truncate-end"] = true,
						["content-emphasis"] = p1.isActive,
						["content-default"] = not p1.isActive
					},
					testId = `{p1.testId}--caption`
				})
			}) else nil,
			Icon = ReactModule.createElement(ViewModule, {
				tag = "row align-x-center align-y-center size-1000-1000",
				Position = UseMemoResult1.iconPosition
			}, p1.icon),
			Label = if p1.showSideLabel then ReactModule.createElement(ViewModule, {
				tag = "row align-y-center padding-x-small",
				Position = UseMemoResult1.sidePosition,
				Size = UseMemoResult1.sideSize
			}, {
				Text = ReactModule.createElement(TextModule, {
					Text = p1.text,
					textStyle = UseMemoResult1.sideTransparency:map(function(Transparency)
						return { Transparency = Transparency }
					end),
					tag = {
						["size-full-0 auto-y text-label-medium text-align-x-left text-truncate-end"] = true,
						["content-emphasis"] = p1.isActive,
						["content-default"] = not p1.isActive
					},
					testId = `{p1.testId}--text`
				})
			}) else nil
		}),
		ExpandedIndicator = if IsIsResizing1 then ReactModule.createElement(ViewModule, {
			ZIndex = 3,
			tag = "auto-x",
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UseMemoResult1.expandedIndicatorPosition,
			onAbsoluteSizeChanged = UseResult,
			Size = UDim2.fromOffset(0, YOffset),
			padding = Thicker,
			testId = `{p1.testId}--indicator-expanded`
		}, {
			Badge = ReactModule.createElement(MorphingRowIndicatorModule, {
				indicator = p1.indicator,
				size = Large,
				transparency = UseMemoResult1.sideTransparency,
				testId = `{p1.testId}--expanded-badge`
			})
		}) else nil,
		CollapsedIndicator = if IsIsResizing2 then ReactModule.createElement(ViewModule, {
			ZIndex = 3,
			tag = "auto-x radius-circle",
			AnchorPoint = if HasValue then if IsValueAbove then Vector2.new(1, 0) else Vector2.new(0.5, 0) else Vector2.new(0.5, 0.5),
			Position = UseMemoResult1.collapsedIndicatorPosition,
			Size = UDim2.fromOffset(0, Size400 + Thicker * 2),
			backgroundStyle = if p1.indicatorPlate == nil then nil else JoinBindablesModule({
				style = p1.indicatorPlate,
				fade = UseMemoResult1.captionTransparency
			}, function(p2)
				-- upvalues: BlendTransparenciesModule (upval)
				return {
					Color3 = p2.style.Color3,
					Transparency = BlendTransparenciesModule(p2.style.Transparency, p2.fade)
				}
			end),
			testId = `{p1.testId}--indicator-collapsed`
		}, {
			Badge = ReactModule.createElement(MorphingRowIndicatorModule, {
				indicator = p1.indicator,
				mask = p1.indicatorMask,
				transparency = UseMemoResult1.captionTransparency,
				testId = `{p1.testId}--collapsed-badge`
			})
		}) else nil
	})
end