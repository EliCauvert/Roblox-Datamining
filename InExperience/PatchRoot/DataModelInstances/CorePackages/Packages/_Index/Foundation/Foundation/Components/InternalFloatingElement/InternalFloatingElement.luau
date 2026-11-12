local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local UsePreviousFunction = require(Parent.ReactUtils).usePrevious
local ConstantsModule = require(Foundation.Constants)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local _ = require(Foundation.Enums.ElevationLayer)
local ElevationOwnerScope = require(Foundation.Providers.Elevation.ElevationProvider).ElevationOwnerScope
local UseElevationModule = require(Foundation.Providers.Elevation.useElevation)
local UseOverlayModule = require(Foundation.Providers.Overlay.useOverlay)
local UseOverlayTransitionModule = require(Foundation.Utility.useOverlayTransition)
local UseScaledValueModule = require(Foundation.Utility.useScaledValue)
local UseStableContainerModule = require(Foundation.Utility.useStableContainer)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local _ = require(Foundation.Providers.ScreenRegion.ScreenRegion)
local ScreenRegionKindModule = require(Foundation.Providers.ScreenRegion.ScreenRegionKind)
local UseRegionEntryModule = require(Foundation.Providers.ScreenRegion.useRegionEntry)
local config = { testId = "--foundation-floating-element" }

local function FloatingContent(p1)
	-- upvalues: DashModule (copy), UseTokensModule (copy), UseOverlayModule (copy), UseElevationModule (copy), UseScaledValueModule (copy), ConstantsModule (copy), UseStableContainerModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), ElevationOwnerScope (copy), ReactRobloxModule (copy)
	local AssignResult = DashModule.assign({ LayoutOrder = 1 }, p1)
	local UseTokensModuleResult = UseTokensModule()
	local UseOverlayModuleResult = UseOverlayModule()
	local UseElevationModuleResult = UseElevationModule(AssignResult.layer, { stackAboveOwner = false })
	local UseScaledValueModuleResult = UseScaledValueModule(ConstantsModule.FLOATING_MAX_WIDTH)
	local UseStableContainerModuleResult, UseStableContainerModuleResult2 = UseStableContainerModule()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local Size800: number = UseTokensModuleResult.Size.Size_800
	local SizeDelta = Size800 - UseTokensModuleResult.Padding.Large
	local Element = ReactModule.createElement(ViewModule, {
		tag = "size-full",
		ZIndex = UseElevationModuleResult.zIndex,
		testId = `{AssignResult.testId}--container`
	}, {
		Transition = ReactModule.createElement(ViewModule, {
			ZIndex = UseElevationModuleResult.zIndex,
			AnchorPoint = Vector2.new(0.5, 1),
			Position = AssignResult.progress:map(function(p2: number): UDim2
				-- upvalues: SizeDelta (copy), UseTokensModuleResult (copy)
				return UDim2.new(0.5, 0, 1, SizeDelta + (1 - p2) * UseTokensModuleResult.Size.Size_800)
			end),
			Size = UseBindingResult:map(function(p2): UDim2
				-- upvalues: SizeDelta (copy), Size800 (copy)
				return UDim2.new(1, SizeDelta * 2, 0, p2 + Size800 * 2)
			end),
			sizeConstraint = {
				MaxSize = Vector2.new(UseScaledValueModuleResult + Size800 * 2, 1e999)
			},
			GroupTransparency = if AssignResult.isAnimating then AssignResult.progress:map(function(p2: number): number
				return 1 - p2
			end) else nil,
			ref = UseStableContainerModuleResult2,
			testId = `{AssignResult.testId}--transition`
		})
	})
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Overlay = if UseOverlayModuleResult == nil then Element else ReactRobloxModule.createPortal(Element, UseOverlayModuleResult),
		StableContent = ReactRobloxModule.createPortal(ReactModule.createElement(ViewModule, {
			tag = "col align-x-center size-full",
			padding = UDim.new(0, Size800)
		}, {
			Content = ReactModule.createElement(ViewModule, DashModule.assign(WithCommonPropsModule(AssignResult, {
				tag = "col align-x-center size-full-0 auto-y",
				ref = AssignResult.forwardRef
			}), {
				onAbsoluteSizeChanged = function(Frame: Frame)
					-- upvalues: UseBindingResult2 (copy), AssignResult (copy)
					UseBindingResult2(Frame.AbsoluteSize.Y)
					
					if AssignResult.onAbsoluteSizeChanged then
						AssignResult.onAbsoluteSizeChanged(Frame)
					end
				end
			}), ReactModule.createElement(ElevationOwnerScope, { owner = UseElevationModuleResult }, AssignResult.children))
		}), UseStableContainerModuleResult)
	})
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), UseRegionEntryModule (copy), ScreenRegionKindModule (copy), UseOverlayTransitionModule (copy), UsePreviousFunction (copy), FloatingContent (copy), DashModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local Queue = WithDefaultsModuleResult.queue
	local UseRegionEntryModuleResult = UseRegionEntryModule(if Queue then Queue.region else nil, {
		kind = if Queue then Queue.kind else ScreenRegionKindModule.FloatingBanner,
		isOpen = WithDefaultsModuleResult.isOpen,
		isMounted = UseStateResult
	})
	local OnCloseCompleteFunction = WithDefaultsModuleResult.onCloseComplete
	local UseOverlayTransitionModuleResult = UseOverlayTransitionModule({
		isOpen = WithDefaultsModuleResult.isOpen and UseRegionEntryModuleResult.isVisible,
		onExited = function()
			-- upvalues: WithDefaultsModuleResult (copy), OnCloseCompleteFunction (copy)
			if not WithDefaultsModuleResult.isOpen and OnCloseCompleteFunction then
				OnCloseCompleteFunction()
			end
		end
	})
	local UsePreviousResult = UsePreviousFunction(WithDefaultsModuleResult.isOpen)
	ReactModule.useEffect(function()
		-- upvalues: UsePreviousResult (copy), WithDefaultsModuleResult (copy), UseOverlayTransitionModuleResult (copy), OnCloseCompleteFunction (copy)
		if UsePreviousResult and not WithDefaultsModuleResult.isOpen and not UseOverlayTransitionModuleResult.isMounted and OnCloseCompleteFunction then
			OnCloseCompleteFunction()
		end
	end, {
		UsePreviousResult,
		WithDefaultsModuleResult.isOpen,
		UseOverlayTransitionModuleResult.isMounted,
		OnCloseCompleteFunction
	})
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseStateResult2 (copy), UseOverlayTransitionModuleResult (copy)
		UseStateResult2(UseOverlayTransitionModuleResult.isMounted)
	end, { UseOverlayTransitionModuleResult.isMounted })
	
	return if UseOverlayTransitionModuleResult.isMounted then ReactModule.createElement(FloatingContent, DashModule.assign({}, WithDefaultsModuleResult, {
		progress = UseOverlayTransitionModuleResult.progress,
		isAnimating = UseOverlayTransitionModuleResult.isAnimating,
		forwardRef = ForwardRef
	})) else nil
end))