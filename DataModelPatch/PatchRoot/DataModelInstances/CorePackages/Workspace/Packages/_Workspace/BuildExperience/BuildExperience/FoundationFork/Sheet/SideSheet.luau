local Foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local OtterModule = require(Parent.Otter)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local UseAnimatedBindingFunction = require(Parent.ReactOtter).useAnimatedBinding
local CloseAffordanceVariantModule = require(Foundation.Enums.CloseAffordanceVariant)
local ConstantsModule = require(Foundation.Constants)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local UseOverlayModule = require(Foundation.Providers.Overlay.useOverlay)
local UseScaledValueModule = require(Foundation.Utility.useScaledValue)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local SheetContextModule = require(script.Parent.SheetContext)
local TypesModule = require(script.Parent.Types)
local SheetTypeModule = require(script.Parent.SheetType)
local UseElevationModule = require(Foundation.Providers.Elevation.useElevation)
local ElevationOwnerScope = require(Foundation.Providers.Elevation.ElevationProvider).ElevationOwnerScope
local ElevationLayerModule = require(Foundation.Enums.ElevationLayer)
local DialogSizeModule = require(Foundation.Enums.DialogSize)
local ChildrenHasFullBleedModule = require(script.Parent.childrenHasFullBleed)
local UseHardwareInsetsModule = require(script.Parent.useHardwareInsets)
local UseScreenSizeModule = require(script.Parent.useScreenSize)
local CloseAffordanceModule = require(Foundation.Components.CloseAffordance)
local FlagsModule = require(Foundation.Utility.Flags)
local ImageModule = require(Foundation.Components.Image)
local ViewModule = require(Foundation.Components.View)
local UsePreferencesModule = require(Foundation.Providers.Preferences.usePreferences)
local config = {
	[DialogSizeModule.Medium] = { TARGET_WIDTH = 0.4, MIN = 360, MAX = 440 },
	[DialogSizeModule.Large] = { TARGET_WIDTH = 0.5, MIN = 440, MAX = 640 }
}
local config1 = {
	testId = "--foundation-sheet",
	size = if FlagsModule.FoundationSideSheetNewWidthCalculation then DialogSizeModule.Medium else nil
}
local SHADOWIMAGE = ConstantsModule.SHADOW_IMAGE
local SHADOWSIZE = ConstantsModule.SHADOW_SIZE

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config1 (copy), UseOverlayModule (copy), UseTokensModule (copy), UseElevationModule (copy), ElevationLayerModule (copy), UsePreferencesModule (copy), UseHardwareInsetsModule (copy), FlagsModule (copy), UseScreenSizeModule (copy), config (copy), UseScaledValueModule (copy), ReactModule (copy), UseAnimatedBindingFunction (copy), ChildrenHasFullBleedModule (copy), OtterModule (copy), DashModule (copy), SheetTypeModule (copy), ReactRobloxModule (copy), ViewModule (copy), StateLayerAffordanceModule (copy), TypesModule (copy), SheetContextModule (copy), ElevationOwnerScope (copy), CloseAffordanceModule (copy), CloseAffordanceVariantModule (copy), ImageModule (copy), SHADOWIMAGE (copy), SHADOWSIZE (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config1)
	local UseOverlayModuleResult = UseOverlayModule()
	local UseTokensModuleResult = UseTokensModule()
	local UseElevationModuleResult = UseElevationModule(ElevationLayerModule.Sheet, { stackAboveOwner = false })
	local ReducedMotion = UsePreferencesModule().reducedMotion
	local UseScreenSizeModuleResult = if FlagsModule.FoundationSideSheetNewWidthCalculation then UseScreenSizeModule() else nil
	local Right: number = UseHardwareInsetsModule(UseOverlayModuleResult).right
	local IsDisplaySizeMatch = WithDefaultsModuleResult.displaySize == Enum.DisplaySize.Small
	local TARGETWIDTH = nil
	local MinValue: number? = nil
	local MaxValue: number? = nil
	
	if FlagsModule.FoundationSideSheetNewWidthCalculation then
		local Scale = UseTokensModuleResult.Config.UI.Scale
		TARGETWIDTH = config[WithDefaultsModuleResult.size].TARGET_WIDTH
		MinValue = config[WithDefaultsModuleResult.size].MIN * Scale
		MaxValue = config[WithDefaultsModuleResult.size].MAX * Scale
	end
	local ClampedValue = if FlagsModule.FoundationSideSheetNewWidthCalculation then math.clamp(UseScreenSizeModuleResult.X * TARGETWIDTH, MinValue, MaxValue) else UseScaledValueModule(if IsDisplaySizeMatch then 400 else 360)
	local Medium = UseTokensModuleResult.Padding.Medium
	local UseRefResult = ReactModule.useRef(false)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = UseAnimatedBindingFunction(1, function()
		-- upvalues: UseRefResult (copy), WithDefaultsModuleResult (copy)
		if UseRefResult.current then
			WithDefaultsModuleResult.onClose()
		end
	end)
	local Negated = -(Right + (if IsDisplaySizeMatch then 0 else Medium))
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = UseAnimatedBindingFunction(Negated)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(false)
	local v1 = nil
	local v2 = nil
	local v3 = nil
	
	if FlagsModule.FoundationSheetFullBleed then
		v1 = ChildrenHasFullBleedModule(WithDefaultsModuleResult.children)
		v2, v56 = ReactModule.useBinding(0)
	end
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(0)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: ReducedMotion (copy), UseAnimatedBindingResult2_1 (copy), OtterModule (upval), ClampedValue (copy), UseAnimatedBindingResult2 (copy), UseTokensModuleResult (copy)
		if ReducedMotion then
			UseAnimatedBindingResult2_1((OtterModule.instant(ClampedValue)))
			UseAnimatedBindingResult2((OtterModule.instant(0)))
			
			return
		else
			UseAnimatedBindingResult2_1(OtterModule.ease(ClampedValue, {
				easingStyle = UseTokensModuleResult.Ease.StandardOut,
				duration = UseTokensModuleResult.Time.Time_300
			}))
			UseAnimatedBindingResult2(OtterModule.ease(0, { duration = UseTokensModuleResult.Time.Time_100 }))
		end
	end, { ClampedValue, ReducedMotion })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), ReducedMotion (copy), UseAnimatedBindingResult2_1 (copy), OtterModule (upval), Negated (copy), UseAnimatedBindingResult2 (copy), UseTokensModuleResult (copy)
		if UseRefResult.current then return end
		if ReducedMotion then
			UseRefResult.current = true
			UseAnimatedBindingResult2_1(OtterModule.instant(Negated))
			UseAnimatedBindingResult2(OtterModule.instant(1))
			
			return
		else
			UseAnimatedBindingResult2_1(OtterModule.ease(Negated, {
				easingStyle = UseTokensModuleResult.Ease.StandardIn,
				duration = UseTokensModuleResult.Time.Time_100
			}))
			UseAnimatedBindingResult2(OtterModule.ease(1, { duration = UseTokensModuleResult.Time.Time_100 }))
			UseRefResult.current = true
		end
	end, { Negated, ReducedMotion })
	ReactModule.useImperativeHandle(WithDefaultsModuleResult.sheetRef, function()
		-- upvalues: UseResult (copy)
		return { close = UseResult }
	end, {})
	local _UDim2 = UDim2.new(0, ClampedValue + (if IsDisplaySizeMatch then Right else 0), 1, if IsDisplaySizeMatch then 0 else -Medium * 2)
	local MapResult = UseAnimatedBindingResult1:map(function(p2): UDim2
		-- upvalues: IsDisplaySizeMatch (copy), Medium (copy)
		return UDim2.new(1, if IsDisplaySizeMatch then -p2 else -(p2 + Medium), 0, if IsDisplaySizeMatch then 0 else Medium)
	end)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), UseBindingResult (copy), UseBindingResult2 (copy), UseBindingResult3 (copy), UseBindingResult2_2 (copy), UseBindingResult1 (copy), UseBindingResult2_1 (copy), FlagsModule (upval), v1 (ref), v2 (ref), v3 (ref), UseResult (copy), IsDisplaySizeMatch (copy), SheetTypeModule (upval), WithDefaultsModuleResult (copy), UseRefResult1 (copy), UseStateResult (copy), UseStateResult2 (copy)
		return {
			actionsHeight = 0,
			sheetHeightAvailable = 0,
			safeAreaPadding = 0,
			bottomPadding = 0,
			innerScrollingEnabled = true,
			setActionsHeight = DashModule.noop,
			hasActionsDivider = UseBindingResult,
			setHasActionsDivider = UseBindingResult2,
			setSheetHeightAvailable = DashModule.noop,
			innerScrollY = UseBindingResult3,
			setInnerScrollY = UseBindingResult2_2,
			hasHeader = UseBindingResult1,
			setHasHeader = UseBindingResult2_1,
			hasFullBleed = if FlagsModule.FoundationSheetFullBleed then v1 else nil,
			fullBleedHeight = if FlagsModule.FoundationSheetFullBleed then v2 else nil,
			setFullBleedHeight = if FlagsModule.FoundationSheetFullBleed then v3 else nil,
			closeSheet = UseResult,
			hasRadius = if FlagsModule.FoundationSheetFullBleed then not IsDisplaySizeMatch else nil,
			sheetType = SheetTypeModule.Side,
			testId = WithDefaultsModuleResult.testId,
			closeAffordanceRef = UseRefResult1,
			contentStartRef = UseStateResult,
			setContentStartRef = UseStateResult2
		}
	end, {
		WithDefaultsModuleResult.testId, UseResult, UseStateResult, UseRefResult1, v1,
		if FlagsModule.FoundationSheetFullBleed then IsDisplaySizeMatch else nil
	})
	
	return UseOverlayModuleResult and ReactRobloxModule.createPortal(ReactModule.createElement(ViewModule, {
		tag = "size-full",
		ZIndex = UseElevationModuleResult.zIndex,
		testId = `{WithDefaultsModuleResult.testId}--surface`
	}, {
		Sheet = ReactModule.createElement(ViewModule, {
			ClipsDescendants = true,
			ZIndex = 3,
			Size = _UDim2,
			Position = MapResult,
			padding = if IsDisplaySizeMatch and Right > 0 then { right = UDim.new(0, Right) } else nil,
			stateLayer = { affordance = StateLayerAffordanceModule.None },
			onActivated = DashModule.noop,
			ref = Ref,
			selection = TypesModule.nonSelectable,
			selectionGroup = TypesModule.isolatedSelectionGroup,
			tag = {
				["stroke-standard stroke-default bg-surface-100"] = true,
				["radius-large"] = not IsDisplaySizeMatch
			},
			testId = WithDefaultsModuleResult.testId
		}, {
			Content = ReactModule.createElement(ViewModule, { tag = "col items-center size-full-full clip" }, ReactModule.createElement(SheetContextModule.Provider, { value = UseMemoResult }, ReactModule.createElement(ElevationOwnerScope, { owner = UseElevationModuleResult }, WithDefaultsModuleResult.children))),
			CloseAffordance = ReactModule.createElement(CloseAffordanceModule, {
				onActivated = UseResult,
				ref = UseRefResult1,
				NextSelectionDown = UseStateResult,
				variant = if FlagsModule.FoundationSheetFullBleed and v1 then CloseAffordanceVariantModule.OverMedia else CloseAffordanceVariantModule.Utility,
				Position = UDim2.new(1, -UseTokensModuleResult.Margin.Small, 0, UseTokensModuleResult.Margin.Small),
				AnchorPoint = Vector2.new(1, 0),
				Visible = UseBindingResult1:map(function(p2): boolean
					return not p2
				end),
				testId = `{WithDefaultsModuleResult.testId}--close-affordance`
			})
		}),
		Shadow = ReactModule.createElement(ImageModule, {
			ZIndex = 2,
			Image = SHADOWIMAGE,
			Size = _UDim2 + UDim2.fromOffset(SHADOWSIZE * 2, SHADOWSIZE * 2),
			Position = MapResult:map(function(p2): UDim2
				-- upvalues: SHADOWSIZE (upval)
				return p2 + UDim2.fromOffset(-SHADOWSIZE, -SHADOWSIZE)
			end),
			slice = {
				scale = 2,
				center = Rect.new(SHADOWSIZE, SHADOWSIZE, SHADOWSIZE + 1, SHADOWSIZE + 1)
			},
			imageStyle = UseTokensModuleResult.Color.Extended.Black.Black_10
		}),
		Backdrop = ReactModule.createElement(ViewModule, {
			ZIndex = 1,
			Size = UDim2.fromScale(2, 2),
			Position = UDim2.fromScale(-0.5, -0.5),
			stateLayer = { affordance = StateLayerAffordanceModule.None },
			backgroundStyle = UseAnimatedBindingResult:map(function(Alpha: number)
				-- upvalues: UseTokensModuleResult (copy)
				return {
					Color3 = UseTokensModuleResult.Color.Common.Backdrop.Color3,
					Transparency = math.lerp(UseTokensModuleResult.Color.Common.Backdrop.Transparency, 1, Alpha)
				}
			end),
			onActivated = UseResult,
			testId = `{WithDefaultsModuleResult.testId}--backdrop`
		})
	}), UseOverlayModuleResult)
end))