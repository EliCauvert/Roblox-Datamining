local Foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local OtterModule = require(Parent.Otter)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local UseAnimatedBindingFunction = require(Parent.ReactOtter).useAnimatedBinding
local CloseAffordanceVariantModule = require(Foundation.Enums.CloseAffordanceVariant)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local UseOverlayModule = require(Foundation.Providers.Overlay.useOverlay)
local UseScaledValueModule = require(Foundation.Utility.useScaledValue)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local DIALOGSIZES = require(Foundation.Components.Dialog.useDialogVariants).DIALOG_SIZES
local ConstantsModule = require(Foundation.Constants)
local ElevationLayerModule = require(Foundation.Enums.ElevationLayer)
local UseElevationModule = require(Foundation.Providers.Elevation.useElevation)
local ElevationOwnerScope = require(Foundation.Providers.Elevation.ElevationProvider).ElevationOwnerScope
local UsePreferencesModule = require(Foundation.Providers.Preferences.usePreferences)
local SheetContextModule = require(script.Parent.SheetContext)
local TypesModule = require(script.Parent.Types)
local SheetTypeModule = require(script.Parent.SheetType)
local ChildrenHasFullBleedModule = require(script.Parent.childrenHasFullBleed)
local CloseAffordanceModule = require(Foundation.Components.CloseAffordance)
local ImageModule = require(Foundation.Components.Image)
local ViewModule = require(Foundation.Components.View)
local config = {
	testId = "--foundation-sheet",
	size = require(Foundation.Enums.DialogSize).Medium
}
local SHADOWIMAGE = ConstantsModule.SHADOW_IMAGE
local SHADOWSIZE = ConstantsModule.SHADOW_SIZE

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseOverlayModule (copy), UseTokensModule (copy), UseElevationModule (copy), ElevationLayerModule (copy), UsePreferencesModule (copy), UseScaledValueModule (copy), DIALOGSIZES (copy), ReactModule (copy), UseAnimatedBindingFunction (copy), ChildrenHasFullBleedModule (copy), OtterModule (copy), DashModule (copy), SheetTypeModule (copy), ViewModule (copy), StateLayerAffordanceModule (copy), TypesModule (copy), SheetContextModule (copy), ElevationOwnerScope (copy), CloseAffordanceModule (copy), CloseAffordanceVariantModule (copy), ImageModule (copy), SHADOWIMAGE (copy), SHADOWSIZE (copy), ReactRobloxModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseOverlayModuleResult = UseOverlayModule()
	local UseTokensModuleResult = UseTokensModule()
	local UseElevationModuleResult = UseElevationModule(ElevationLayerModule.Sheet, { stackAboveOwner = false })
	local ReducedMotion = UsePreferencesModule().reducedMotion
	local UseScaledValueModuleResult = UseScaledValueModule(DIALOGSIZES[WithDefaultsModuleResult.size])
	local UseScaledValueModuleResult1 = UseScaledValueModule(600)
	local Size800 = UseTokensModuleResult.Size.Size_800
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UseScaledValueModuleResult1)
	local MapResult = if UseBindingResult then UseBindingResult:map(function(p2: number)
		-- upvalues: WithDefaultsModuleResult (copy)
		if WithDefaultsModuleResult.centerSheetHeight then
			if WithDefaultsModuleResult.centerSheetHeight > 0 and WithDefaultsModuleResult.centerSheetHeight <= 1 then
				return p2 * WithDefaultsModuleResult.centerSheetHeight
			elseif WithDefaultsModuleResult.centerSheetHeight > 1 then
				return (math.min(WithDefaultsModuleResult.centerSheetHeight, p2))
			end
		end
		return nil
	end) else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseRefResult = ReactModule.useRef(false)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = UseAnimatedBindingFunction(1, function()
		-- upvalues: UseRefResult (copy), WithDefaultsModuleResult (copy)
		if UseRefResult.current then
			WithDefaultsModuleResult.onClose()
		end
	end)
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = UseAnimatedBindingFunction(Size800, function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(false)
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(false)
	local ChildrenHasFullBleedModuleResult = ChildrenHasFullBleedModule(WithDefaultsModuleResult.children)
	local UseBindingResult4, UseBindingResult2_3 = ReactModule.useBinding(0)
	local UseBindingResult5, UseBindingResult2_4 = ReactModule.useBinding(0)
	local UseBindingResult6, UseBindingResult2_5 = ReactModule.useBinding(0)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseMemoResult = ReactModule.useMemo(function()
		local Frame = Instance.new("Frame")
		Frame.BackgroundTransparency = 1
		Frame.BorderSizePixel = 0
		Frame.AutomaticSize = Enum.AutomaticSize.XY
		
		return Frame
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult:Destroy()
		end
	end, { UseMemoResult })
	local UseResult = ReactModule.useCallback(function(Parent)
		-- upvalues: UseMemoResult (copy)
		if Parent then
			UseMemoResult.Parent = Parent
			
			return
		else
			UseMemoResult.Parent = nil
		end
	end, { UseMemoResult })
	ReactModule.useEffect(function()
		-- upvalues: ReducedMotion (copy), UseAnimatedBindingResult2_1 (copy), OtterModule (upval), UseAnimatedBindingResult2 (copy), UseTokensModuleResult (copy)
		if ReducedMotion then
			UseAnimatedBindingResult2_1((OtterModule.instant(0)))
			UseAnimatedBindingResult2((OtterModule.instant(0)))
			
			return
		else
			UseAnimatedBindingResult2_1(OtterModule.ease(0, {
				easingStyle = UseTokensModuleResult.Ease.StandardOut,
				duration = UseTokensModuleResult.Time.Time_300
			}))
			UseAnimatedBindingResult2(OtterModule.ease(0, { duration = UseTokensModuleResult.Time.Time_100 }))
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), ReducedMotion (copy), UseAnimatedBindingResult2_1 (copy), OtterModule (upval), Size800 (copy), UseAnimatedBindingResult2 (copy), UseTokensModuleResult (copy), UseStateResult2 (copy)
		if UseRefResult.current then return end
		if ReducedMotion then
			UseRefResult.current = true
			UseAnimatedBindingResult2_1(OtterModule.instant(Size800))
			UseAnimatedBindingResult2(OtterModule.instant(1))
			
			return
		else
			UseAnimatedBindingResult2_1(OtterModule.ease(Size800, {
				easingStyle = UseTokensModuleResult.Ease.StandardIn,
				duration = UseTokensModuleResult.Time.Time_100
			}))
			UseAnimatedBindingResult2(OtterModule.ease(1, { duration = UseTokensModuleResult.Time.Time_100 }))
			UseStateResult2(true)
			UseRefResult.current = true
		end
	end, { Size800, ReducedMotion })
	ReactModule.useImperativeHandle(WithDefaultsModuleResult.sheetRef, function()
		-- upvalues: UseResult1 (copy)
		return { close = UseResult1 }
	end, {})
	local Element = ReactModule.createElement(ViewModule, {
		ClipsDescendants = true,
		ZIndex = 2,
		Size = if WithDefaultsModuleResult.centerSheetHeight and MapResult then MapResult:map(function(YOffset)
			return if YOffset then UDim2.new(1, 0, 0, YOffset) else nil
		end) else nil,
		sizeConstraint = if WithDefaultsModuleResult.centerSheetHeight and UseBindingResult then {
			MaxSize = UseBindingResult:map(function(Y): Vector2
				return Vector2.new(1e999, Y)
			end)
		} else nil,
		stateLayer = { affordance = StateLayerAffordanceModule.None },
		onActivated = DashModule.noop,
		onAbsoluteSizeChanged = function(Frame)
			-- upvalues: UseBindingResult2_5 (copy)
			UseBindingResult2_5(Frame.AbsoluteSize.Y)
		end,
		ref = Ref,
		selection = TypesModule.nonSelectable,
		selectionGroup = TypesModule.isolatedSelectionGroup,
		tag = {
			["bg-surface-100 stroke-default stroke-standard radius-large"] = true,
			["size-full-0 auto-y"] = WithDefaultsModuleResult.centerSheetHeight == nil
		},
		testId = WithDefaultsModuleResult.testId
	}, {
		Content = ReactModule.createElement(ViewModule, {
			tag = "col items-center size-full-0 auto-y clip",
			Size = if WithDefaultsModuleResult.centerSheetHeight and MapResult then MapResult:map(function(YOffset)
				return if YOffset then UDim2.new(1, 0, 0, YOffset) else nil
			end) else nil
		}, ReactModule.createElement(SheetContextModule.Provider, {
			value = ReactModule.useMemo(function()
				-- upvalues: DashModule (upval), UseBindingResult1 (copy), UseBindingResult2_1 (copy), MapResult (copy), UseBindingResult5 (copy), UseBindingResult2_4 (copy), UseBindingResult3 (copy), UseBindingResult2_2 (copy), ChildrenHasFullBleedModuleResult (copy), UseBindingResult4 (copy), UseBindingResult2_3 (copy), UseResult1 (copy), SheetTypeModule (upval), WithDefaultsModuleResult (copy), UseRefResult1 (copy), UseStateResult1 (copy), UseStateResult2_1 (copy)
				return {
					actionsHeight = 0,
					sheetHeightAvailable = 0,
					safeAreaPadding = 0,
					bottomPadding = 0,
					innerScrollingEnabled = true,
					hasRadius = true,
					setActionsHeight = DashModule.noop,
					hasActionsDivider = UseBindingResult1,
					setHasActionsDivider = UseBindingResult2_1,
					sheetContentHeight = MapResult,
					setSheetContentHeight = DashModule.noop,
					setSheetHeightAvailable = DashModule.noop,
					innerScrollY = UseBindingResult5,
					setInnerScrollY = UseBindingResult2_4,
					hasHeader = UseBindingResult3,
					setHasHeader = UseBindingResult2_2,
					hasFullBleed = ChildrenHasFullBleedModuleResult,
					fullBleedHeight = UseBindingResult4,
					setFullBleedHeight = UseBindingResult2_3,
					closeSheet = UseResult1,
					sheetType = SheetTypeModule.Center,
					testId = WithDefaultsModuleResult.testId,
					closeAffordanceRef = UseRefResult1,
					contentStartRef = UseStateResult1,
					setContentStartRef = UseStateResult2_1
				}
			end, {
				WithDefaultsModuleResult.testId, UseResult1, UseStateResult1, UseRefResult1,
				MapResult, ChildrenHasFullBleedModuleResult
			})
		}, ReactModule.createElement(ElevationOwnerScope, { owner = UseElevationModuleResult }, WithDefaultsModuleResult.children))),
		CloseAffordance = ReactModule.createElement(CloseAffordanceModule, {
			onActivated = UseResult1,
			ref = UseRefResult1,
			NextSelectionDown = UseStateResult1,
			variant = if ChildrenHasFullBleedModuleResult then CloseAffordanceVariantModule.OverMedia else CloseAffordanceVariantModule.Utility,
			Position = UDim2.new(1, -UseTokensModuleResult.Margin.Small, 0, UseTokensModuleResult.Margin.Small),
			AnchorPoint = Vector2.new(1, 0),
			Visible = UseBindingResult3:map(function(p2): boolean
				return not p2
			end),
			testId = `{WithDefaultsModuleResult.testId}--close-affordance`
		})
	})
	local Element1 = ReactModule.createElement(ImageModule, {
		ZIndex = 1,
		tag = "anchor-center-left",
		Image = SHADOWIMAGE,
		Size = UseBindingResult6:map(function(p2): UDim2
			-- upvalues: SHADOWSIZE (upval)
			return UDim2.new(1, SHADOWSIZE * 2, 0, p2 + SHADOWSIZE * 2)
		end),
		Position = UDim2.new(0, -SHADOWSIZE, 0.5, 0),
		slice = {
			scale = 2,
			center = Rect.new(SHADOWSIZE, SHADOWSIZE, SHADOWSIZE + 1, SHADOWSIZE + 1)
		},
		imageStyle = UseTokensModuleResult.Color.Extended.Black.Black_10
	})
	
	return UseOverlayModuleResult and ReactModule.createElement(ReactModule.Fragment, nil, {
		OverlayPortal = ReactRobloxModule.createPortal(ReactModule.createElement(ViewModule, {
			tag = "size-full",
			ZIndex = UseElevationModuleResult.zIndex,
			testId = `{WithDefaultsModuleResult.testId}--surface`
		}, {
			SheetContainer = ReactModule.createElement(ViewModule, {
				ZIndex = 2,
				tag = "col align-y-center anchor-center-center size-full padding-medium",
				ref = UseResult,
				sizeConstraint = {
					MaxSize = Vector2.new(UseScaledValueModuleResult, UseScaledValueModuleResult1)
				},
				Position = UseAnimatedBindingResult1:map(function(YOffset): UDim2
					return UDim2.new(0.5, 0, 0.5, YOffset)
				end),
				testId = `{WithDefaultsModuleResult.testId}--center-sheet-container`,
				GroupTransparency = if UseStateResult then UseAnimatedBindingResult1:map(function(p2)
					-- upvalues: Size800 (copy)
					return p2 / Size800
				end) else nil,
				onAbsoluteSizeChanged = if WithDefaultsModuleResult.centerSheetHeight and UseBindingResult2 then function(Frame)
					-- upvalues: UseTokensModuleResult (copy), UseBindingResult2 (copy), UseScaledValueModuleResult1 (copy)
					UseBindingResult2((math.min(Frame.AbsoluteSize.Y - UseTokensModuleResult.Margin.Medium * 2, UseScaledValueModuleResult1)))
				end else nil
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
				onActivated = UseResult1,
				testId = `{WithDefaultsModuleResult.testId}--backdrop`
			})
		}), UseOverlayModuleResult),
		SheetContent = ReactRobloxModule.createPortal({ Sheet = Element, Shadow = Element1 }, UseMemoResult)
	})
end))