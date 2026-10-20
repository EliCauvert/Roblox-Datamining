local AppBlox = script:FindFirstAncestor("AppBlox")
local Parent = AppBlox.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ReactUtilsModule = require(Parent.ReactUtils)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppMediaGalleryGamepadSupport = SharedFlagsModule.FFlagLuaAppMediaGalleryGamepadSupport
local FFlagLuaAppEdpDirectionalGradientMidTransparency = SharedFlagsModule.FFlagLuaAppEdpDirectionalGradientMidTransparency
local ScrollView = FoundationModule.ScrollView
local View = FoundationModule.View
local DetailsPageLayoutContextModule = require(script.Parent.DetailsPageLayoutContext)
local DetailsPageLayoutUtilsModule = require(script.Parent.DetailsPageLayoutUtils)
local FFlagDetailsPageLayoutUseMeasuredSizeForInitialScrollModule = require(AppBlox.Flags.FFlagDetailsPageLayoutUseMeasuredSizeForInitialScroll)
local Selection = { Selectable = false }
local Binding = ReactModule.createBinding(0)

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: ReactModule (copy), DetailsPageLayoutContextModule (copy), FFlagDetailsPageLayoutUseMeasuredSizeForInitialScrollModule (copy), ReactUtilsModule (copy), Binding (copy), DetailsPageLayoutUtilsModule (copy), View (copy), FFlagLuaAppEdpDirectionalGradientMidTransparency (copy), ScrollView (copy), Selection (copy), FFlagLuaAppMediaGalleryGamepadSupport (copy)
	local UseContextResult = ReactModule.useContext(DetailsPageLayoutContextModule)
	local ContentTopOffset = UseContextResult.contentTopOffset
	local HasFullBleed = UseContextResult.hasFullBleed
	local IsFullscreen = UseContextResult.isFullscreen
	local IsFullscreenOverlay = UseContextResult.isFullscreenOverlay
	local HeaderBarHeight = UseContextResult.headerBarHeight
	local HasHeader = UseContextResult.hasHeader
	local OnCanvasPositionChangedFunction = UseContextResult.onCanvasPositionChanged
	local FullBleedOverlapOffset = UseContextResult.fullBleedOverlapOffset
	local InitialScrollY = UseContextResult.initialScrollY
	local HasValidContainerSize = UseContextResult.hasValidContainerSize
	local ContainerHeight = UseContextResult.containerHeight
	local OnCanvasSizeChangedFunction = UseContextResult.onCanvasSizeChanged
	local HasActions = UseContextResult.hasActions
	local ActionBarHeight = UseContextResult.actionBarHeight
	local TestId = UseContextResult.testId
	local GradientTopBleedOffset = UseContextResult.gradientTopBleedOffset
	local GradientMidTransparency = UseContextResult.gradientMidTransparency
	assert(TestId, "DetailsPageLayout.Content must be used within DetailsPageLayout.Root")
	local UseComposedRefResult = ReactUtilsModule.useComposedRef(p1.scrollingFrameRef, (ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: FFlagDetailsPageLayoutUseMeasuredSizeForInitialScrollModule (upval), HasFullBleed (copy), InitialScrollY (copy)
		if ScrollFrame and (FFlagDetailsPageLayoutUseMeasuredSizeForInitialScrollModule and HasFullBleed or InitialScrollY > 0) then
			ScrollFrame.CanvasPosition = Vector2.new(0, InitialScrollY)
		end
	end, {
		InitialScrollY,
		if FFlagDetailsPageLayoutUseMeasuredSizeForInitialScrollModule then HasFullBleed else nil
	})))
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(InitialScrollY)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	local UseResult = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: UseBindingResult2 (copy), OnCanvasPositionChangedFunction (copy)
		UseBindingResult2(ScrollFrame.CanvasPosition.Y)
		
		if OnCanvasPositionChangedFunction then
			OnCanvasPositionChangedFunction(ScrollFrame)
		end
	end, { OnCanvasPositionChangedFunction })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: HasHeader (copy), HasActions (copy), ActionBarHeight (copy), ReactModule (upval), HeaderBarHeight (copy)
		return if HasHeader and HasActions and ActionBarHeight then ReactModule.joinBindings({ HasHeader, HasActions, ActionBarHeight }):map(function(Entry): UDim2
			-- upvalues: HeaderBarHeight (upval)
			local Entry1 = Entry[2]
			local Entry2 = Entry[3]
			
			return UDim2.new(1, 0, 1, -((if Entry[1] then HeaderBarHeight else 0) + (if Entry1 then Entry2 else 0)))
		end) else nil
	end, { HasHeader, HasActions, ActionBarHeight, HeaderBarHeight })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: HasHeader (copy), HeaderBarHeight (copy)
		return if HasHeader then HasHeader:map(function(p2): UDim2
			-- upvalues: HeaderBarHeight (upval)
			return UDim2.new(0, 0, 0, if p2 then HeaderBarHeight else 0)
		end) else nil
	end, { HasHeader, HeaderBarHeight })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: ContentTopOffset (copy), ReactModule (upval), ContainerHeight (copy), Binding (upval), DetailsPageLayoutUtilsModule (upval), HasFullBleed (copy), FullBleedOverlapOffset (copy), HeaderBarHeight (copy)
		return if ContentTopOffset then ReactModule.joinBindings({ ContentTopOffset, ContainerHeight or Binding }):map(function(Entry): UDim
			-- upvalues: DetailsPageLayoutUtilsModule (upval), HasFullBleed (upval), FullBleedOverlapOffset (upval), HeaderBarHeight (upval)
			local Entry1: number = Entry[2]
			local CanvasPaddingTop = DetailsPageLayoutUtilsModule.computeCanvasPaddingTop(Entry[1], HasFullBleed, FullBleedOverlapOffset, HeaderBarHeight)
			
			if Entry1 > 0 then
				CanvasPaddingTop = math.min(CanvasPaddingTop, Entry1 * 0.75)
			end
			return UDim.new(0, CanvasPaddingTop)
		end) else nil
	end, {
		ContentTopOffset,
		ContainerHeight,
		HasFullBleed,
		FullBleedOverlapOffset,
		HeaderBarHeight
	})
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: HasActions (copy), ActionBarHeight (copy), ReactModule (upval)
		return if HasActions and ActionBarHeight then ReactModule.joinBindings({ HasActions, ActionBarHeight }):map(function(Entry): UDim
			local Entry1 = Entry[2]
			
			return if Entry[1] then UDim.new(0, Entry1) else UDim.new(0, 0)
		end) else nil
	end, { HasActions, ActionBarHeight })
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult2 (copy), ReactModule (upval), UseBindingResult (copy), GradientTopBleedOffset (copy)
		return if UseMemoResult2 then ReactModule.joinBindings({ UseMemoResult2, UseBindingResult }):map(function(Entry): UDim2
			-- upvalues: GradientTopBleedOffset (upval)
			return UDim2.new(0, 0, 0, Entry[1].Offset - Entry[2] - GradientTopBleedOffset)
		end) else nil
	end, { UseMemoResult2, UseBindingResult, GradientTopBleedOffset })
	local UseMemoResult5 = ReactModule.useMemo(function()
		-- upvalues: ContainerHeight (copy), ReactModule (upval), UseBindingResult1 (copy), GradientTopBleedOffset (copy)
		return if ContainerHeight then ReactModule.joinBindings({ UseBindingResult1, ContainerHeight }):map(function(Entry): UDim2
			-- upvalues: GradientTopBleedOffset (upval)
			local Entry1: number = Entry[1]
			local Entry2: number = Entry[2]
			
			return UDim2.new(1, 0, 0, (if Entry1 > 0 then Entry1 else math.max(Entry2, 1)) + GradientTopBleedOffset)
		end) else nil
	end, {
		UseBindingResult1,
		ContainerHeight,
		GradientTopBleedOffset
	})
	
	if IsFullscreen then
		assert(UseMemoResult and UseMemoResult1, "bindings required in fullscreen mode")
		
		return ReactModule.createElement(View, {
			ZIndex = 1,
			tag = "col bg-surface-0",
			Size = UseMemoResult,
			Position = UseMemoResult1,
			testId = `{TestId}--content`,
			ref = Ref
		}, {
			Children = ReactModule.createElement(ReactModule.Fragment, nil, p1.children)
		})
	else
		assert(UseMemoResult2 and (OnCanvasPositionChangedFunction and (ContainerHeight and (HasActions and ActionBarHeight))), "DetailsPageLayout.Content requires bindings in scroll mode")
		
		return if HasFullBleed and not HasValidContainerSize then ReactModule.createElement(View, {
			tag = "size-full clip bg-surface-0",
			ZIndex = 1,
			testId = `{TestId}--content`,
			ref = Ref
		}) else ReactModule.createElement(View, {
			tag = "size-full clip",
			ZIndex = 1,
			ref = Ref,
			testId = `{TestId}--content`
		}, {
			BackgroundLayers = ReactModule.createElement(View, {
				tag = "col",
				ZIndex = 0,
				Position = UseMemoResult4,
				Size = UseMemoResult5
			}, {
				GradientBar = if HasFullBleed and ContentTopOffset then ReactModule.createElement(View, {
					tag = "bg-surface-0",
					LayoutOrder = 0,
					Size = ContentTopOffset:map(function(p2: number): UDim2
						-- upvalues: FullBleedOverlapOffset (copy), GradientTopBleedOffset (copy)
						return UDim2.new(1, 0, 0, math.min(p2, FullBleedOverlapOffset) + GradientTopBleedOffset)
					end)
				}, {
					Gradient = ReactModule.createElement("UIGradient", {
						Rotation = 270,
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0, 0),
							NumberSequenceKeypoint.new(0.5, FFlagLuaAppEdpDirectionalGradientMidTransparency and GradientMidTransparency or 0.25),
							NumberSequenceKeypoint.new(1, 1)
						})
					})
				}) else nil,
				SolidFill = ReactModule.createElement(View, { tag = "fill size-full-0 bg-surface-0", LayoutOrder = 1 })
			}),
			ScrollContent = ReactModule.createElement(ScrollView, {
				tag = "size-full clip",
				ZIndex = 1,
				scrollingFrameRef = UseComposedRefResult,
				selection = Selection,
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.new(1, 0, 0, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y,
					ScrollingEnabled = if FFlagLuaAppMediaGalleryGamepadSupport then not IsFullscreenOverlay and not (UseContextResult.disableFocusNavEngineScroll == true) else not IsFullscreenOverlay
				},
				onAbsoluteCanvasSizeChanged = function(ScrollFrame)
					-- upvalues: UseBindingResult2_1 (copy), OnCanvasSizeChangedFunction (copy)
					UseBindingResult2_1(ScrollFrame.AbsoluteCanvasSize.Y)
					
					if OnCanvasSizeChangedFunction then
						OnCanvasSizeChangedFunction(ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteSize.Y)
					end
				end,
				onCanvasPositionChanged = UseResult
			}, ReactModule.createElement(View, { tag = "col size-full-0 auto-y" }, {
				CanvasPadding = ReactModule.createElement("UIPadding", {
					PaddingTop = UseMemoResult2,
					PaddingBottom = UseMemoResult3
				}),
				ContentSection = ReactModule.createElement(View, {
					tag = "auto-y",
					LayoutOrder = 1,
					Size = ContainerHeight:map(function(YOffset): UDim2
						return UDim2.new(1, 0, 0, YOffset)
					end)
				}, {
					ContentBackground = ReactModule.createElement(View, { tag = "col align-x-center size-full-0 auto-y" }, {
						Children = ReactModule.createElement(ReactModule.Fragment, nil, p1.children)
					})
				})
			}))
		})
	end
end))