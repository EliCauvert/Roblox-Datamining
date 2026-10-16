local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local OtterModule = require(Parent.Otter)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local UseAnimatedBindingFunction = require(Parent.ReactOtter).useAnimatedBinding
local CloseAffordanceModule = require(Foundation.Components.CloseAffordance)
local ConstantsModule = require(Foundation.Constants)
local ImageModule = require(Foundation.Components.Image)
local ViewModule = require(Foundation.Components.View)
local UseOverlayModule = require(Foundation.Providers.Overlay.useOverlay)
local OnCloseCallbackReasonModule = require(Foundation.Enums.OnCloseCallbackReason)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local UseScaledValueModule = require(Foundation.Utility.useScaledValue)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local UsePreferencesModule = require(Foundation.Providers.Preferences.usePreferences)
local TypesModule = require(script.Parent.Types)
local _ = require(Foundation.Components.Types)
local UseDialogVariantsFunction = require(script.Parent.useDialogVariants).useDialogVariants
local DialogProviderModule = require(script.Parent.DialogProvider)
local UseDialogModule = require(script.Parent.useDialog)
local UseDialogResponsiveSizeModule = require(script.Parent.useDialogResponsiveSize)
local UseElevationModule = require(Foundation.Providers.Elevation.useElevation)
local ElevationOwnerScope = require(Foundation.Providers.Elevation.ElevationProvider).ElevationOwnerScope
local ElevationLayerModule = require(Foundation.Enums.ElevationLayer)
local config = {
	disablePortal = true,
	hasBackdrop = false,
	testId = "--foundation-dialog",
	size = require(Foundation.Enums.DialogSize).Medium
}
local SHADOWIMAGE = ConstantsModule.SHADOW_IMAGE
local SHADOWSIZE = ConstantsModule.SHADOW_SIZE

local function Dialog(p1) --[[ Line: 70 ]]
	-- upvalues: DashModule (copy), UseDialogVariantsFunction (copy), UseScaledValueModule (copy), ReactModule (copy), UseOverlayModule (copy), UseElevationModule (copy), ElevationLayerModule (copy), UseDialogModule (copy), UseDialogResponsiveSizeModule (copy), UseTokensModule (copy), UsePreferencesModule (copy), UseAnimatedBindingFunction (copy), OtterModule (copy), ViewModule (copy), ImageModule (copy), SHADOWIMAGE (copy), SHADOWSIZE (copy), WithCommonPropsModule (copy), StateLayerAffordanceModule (copy), TypesModule (copy), CloseAffordanceModule (copy), ElevationOwnerScope (copy), OnCloseCallbackReasonModule (copy), ReactRobloxModule (copy)
	local AssignResult = DashModule.assign({}, p1, { LayoutOrder = 1 })
	local UseDialogVariantsResult = UseDialogVariantsFunction()
	local UseScaledValueModuleResult = UseScaledValueModule(UseDialogVariantsResult.inner.maxWidth)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.new(0, 0))
	local UseOverlayModuleResult = UseOverlayModule()
	local UseElevationModuleResult = UseElevationModule(ElevationLayerModule.Dialog, { stackAboveOwner = false })
	local UseDialogModuleResult = UseDialogModule()
	UseDialogResponsiveSizeModule(AssignResult.size)
	local UseTokensModuleResult = UseTokensModule()
	local ReducedMotion = UsePreferencesModule().reducedMotion
	local Size800 = UseTokensModuleResult.Size.Size_800
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = UseAnimatedBindingFunction(1)
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = UseAnimatedBindingFunction(Size800, function() --[[ Line: 95 ]]
		-- upvalues: UseRefResult (copy), AssignResult (copy), UseRefResult1 (copy), UseStateResult2 (copy)
		if not UseRefResult.current then
			UseStateResult2(false)
		elseif AssignResult.onClose then
			AssignResult.onClose(UseRefResult1.current)
			
			return
		end
	end)
	ReactModule.useEffect(function() --[[ Line: 107 ]]
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
	local UseResult = ReactModule.useCallback(function(Current) --[[ Line: 122 ]]
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), ReducedMotion (copy), UseAnimatedBindingResult2_1 (copy), OtterModule (upval), Size800 (copy), UseAnimatedBindingResult2 (copy), UseTokensModuleResult (copy), UseStateResult2 (copy)
		if UseRefResult.current then return end
		UseRefResult1.current = Current
		
		if ReducedMotion then
			UseRefResult.current = true
			UseAnimatedBindingResult2_1(OtterModule.instant(Size800))
			UseAnimatedBindingResult2(OtterModule.instant(1))
			
			return
		else
			UseAnimatedBindingResult2_1(OtterModule.ease(Size800, {
				easingStyle = UseTokensModuleResult.Ease.StandardIn,
				duration = UseTokensModuleResult.Time.Time_200
			}))
			UseAnimatedBindingResult2(OtterModule.ease(1, { duration = UseTokensModuleResult.Time.Time_100 }))
			UseStateResult2(true)
			UseRefResult.current = true
		end
	end, { Size800, ReducedMotion })
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 144 ]]
		return Instance.new("Folder")
	end, {})
	ReactModule.useEffect(function() --[[ Line: 148 ]]
		-- upvalues: UseMemoResult (copy)
		return function() --[[ Line: 149 ]]
			-- upvalues: UseMemoResult (upval)
			UseMemoResult:Destroy()
		end
	end, { UseMemoResult })
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseResult1 = ReactModule.useCallback(function(Parent) --[[ Line: 157 ]]
		-- upvalues: UseMemoResult (copy), UseStateResult2_1 (copy)
		if Parent then
			UseMemoResult.Parent = Parent
			UseStateResult2_1(true)
			
			return
		else
			UseMemoResult.Parent = nil
			UseStateResult2_1(false)
		end
	end, { UseMemoResult })
	local Element = ReactModule.createElement(ViewModule, { ZIndex = 2, tag = UseDialogVariantsResult.container.tag }, {
		Shadow = ReactModule.createElement(ImageModule, {
			Image = SHADOWIMAGE,
			Size = UseBindingResult:map(function(Vector): UDim2 --[[ Line: 173 ]]
				-- upvalues: SHADOWSIZE (upval)
				return UDim2.fromOffset(Vector.X + SHADOWSIZE * 2, Vector.Y + SHADOWSIZE * 2)
			end),
			slice = {
				scale = 2,
				center = Rect.new(SHADOWSIZE, SHADOWSIZE, SHADOWSIZE, SHADOWSIZE)
			},
			imageStyle = UseDialogVariantsResult.shadow.imageStyle,
			testId = `{AssignResult.testId}--shadow`
		})
	})
	local Element1 = ReactModule.createElement(ViewModule, { ZIndex = 3, tag = UseDialogVariantsResult.container.tag }, {
		DialogInner = ReactModule.createElement(ViewModule, WithCommonPropsModule(AssignResult, {
			tag = UseDialogVariantsResult.inner.tag,
			ref = AssignResult.forwardRef,
			sizeConstraint = { MaxSize = Vector2.new(UseScaledValueModuleResult, 1e999) },
			stateLayer = { affordance = StateLayerAffordanceModule.None },
			selection = TypesModule.nonSelectable,
			selectionGroup = TypesModule.isolatedSelectionGroup,
			onActivated = DashModule.noop
		}), {
			CloseAffordance = if AssignResult.onClose then ReactModule.createElement(CloseAffordanceModule, {
				ZIndex = 2,
				onActivated = if UseResult and not ReducedMotion then UseResult else AssignResult.onClose,
				ref = UseDialogModuleResult.closeAffordanceRef,
				NextSelectionDown = UseDialogModuleResult.contentStartRef,
				Position = UDim2.new(1, -UseDialogVariantsResult.closeAffordance.offset, 0, UseDialogVariantsResult.closeAffordance.offset),
				AnchorPoint = Vector2.new(1, 0),
				testId = `{AssignResult.testId}--close-affordance`
			}) else nil,
			DialogBody = ReactModule.createElement(ViewModule, {
				tag = UseDialogVariantsResult.body.tag,
				onAbsoluteSizeChanged = function(Frame) --[[ Line: 219 ]]
					-- upvalues: UseBindingResult2 (copy)
					local AbsoluteSize = Frame.AbsoluteSize
					
					if AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 then
						UseBindingResult2(AbsoluteSize)
					end
				end,
				testId = `{AssignResult.testId}--body`
			}, ReactModule.createElement(ElevationOwnerScope, { owner = UseElevationModuleResult }, AssignResult.children))
		})
	})
	local Element2 = ReactModule.createElement(ViewModule, {
		tag = "size-full padding-y-xlarge",
		ZIndex = UseElevationModuleResult.zIndex,
		testId = `{AssignResult.testId}--container`
	}, {
		Backdrop = if AssignResult.hasBackdrop then ReactModule.createElement(ViewModule, {
			tag = "position-center-center anchor-center-center",
			ZIndex = 2,
			Size = UDim2.fromScale(2, 2),
			stateLayer = { affordance = StateLayerAffordanceModule.None },
			onActivated = function() --[[ Line: 243 ]]
				-- upvalues: AssignResult (copy), UseResult (copy), ReducedMotion (copy), OnCloseCallbackReasonModule (upval)
				if AssignResult.onClose then
					if UseResult and not ReducedMotion then
						UseResult(OnCloseCallbackReasonModule.BackdropClick)
						
						return
					end
					AssignResult.onClose(OnCloseCallbackReasonModule.BackdropClick)
				end
			end,
			backgroundStyle = if ReducedMotion or not UseAnimatedBindingResult then UseDialogVariantsResult.backdrop.backgroundStyle else UseAnimatedBindingResult:map(function(Alpha: number) --[[ Line: 253 ]]
				-- upvalues: UseDialogVariantsResult (copy)
				return {
					Color3 = UseDialogVariantsResult.backdrop.backgroundStyle.Color3,
					Transparency = math.lerp(UseDialogVariantsResult.backdrop.backgroundStyle.Transparency, 1, Alpha)
				}
			end),
			testId = `{AssignResult.testId}--backdrop`
		}) else nil,
		DialogContentWrapper = ReactModule.createElement(ViewModule, {
			ZIndex = 2,
			ref = if ReducedMotion then nil else UseResult1,
			Position = if ReducedMotion or not UseAnimatedBindingResult1 then nil else UseAnimatedBindingResult1:map(function(YOffset): UDim2 --[[ Line: 273 ]]
				return UDim2.new(0.5, 0, 0.5, YOffset)
			end),
			sizeConstraint = if ReducedMotion then nil else {
				MaxSize = Vector2.new(UseScaledValueModuleResult + SHADOWSIZE * 2, 1e999)
			},
			tag = {
				["anchor-center-center size-full"] = not ReducedMotion,
				["size-full"] = ReducedMotion
			},
			GroupTransparency = if ReducedMotion or not UseStateResult or not UseAnimatedBindingResult1 then nil else UseAnimatedBindingResult1:map(function(p2) --[[ Line: 288 ]]
				-- upvalues: Size800 (copy)
				return p2 / Size800
			end)
		}, if ReducedMotion then { DialogShadowWrapper = Element, Dialog = Element1 } else nil)
	})
	
	return if ReducedMotion then if AssignResult.disablePortal or UseOverlayModuleResult == nil then Element2 else ReactRobloxModule.createPortal(Element2, UseOverlayModuleResult) else ReactModule.createElement(ReactModule.Fragment, nil, {
		Main = if AssignResult.disablePortal or UseOverlayModuleResult == nil then Element2 else ReactRobloxModule.createPortal(Element2, UseOverlayModuleResult),
		StableContent = if UseStateResult1 then ReactRobloxModule.createPortal(ReactModule.createElement(ReactModule.Fragment, nil, { DialogShadowWrapper = Element, Dialog = Element1 }), UseMemoResult) else nil
	})
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, ForwardRef) --[[ Line: 328 | Named "DialogContainer" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), DialogProviderModule (copy), Dialog (copy), DashModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	
	return ReactModule.createElement(DialogProviderModule, {
		size = WithDefaultsModuleResult.size,
		responsiveSize = WithDefaultsModuleResult.size,
		testId = WithDefaultsModuleResult.testId
	}, {
		Dialog = ReactModule.createElement(Dialog, DashModule.assign({}, WithDefaultsModuleResult, { forwardRef = ForwardRef }))
	})
end))