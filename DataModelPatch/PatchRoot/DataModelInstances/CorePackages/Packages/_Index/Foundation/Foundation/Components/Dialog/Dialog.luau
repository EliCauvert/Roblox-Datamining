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
local FlagsModule = require(Foundation.Utility.Flags)
local UsePreferencesModule = require(Foundation.Providers.Preferences.usePreferences)
local TypesModule = require(script.Parent.Types)
local _ = require(Foundation.Components.Types)
local UseDialogVariantsFunction = require(script.Parent.useDialogVariants).useDialogVariants
local DialogProviderModule = require(script.Parent.DialogProvider)
local UseDialogModule = require(script.Parent.useDialog)
local UseDialogResponsiveSizeModule = require(script.Parent.useDialogResponsiveSize)
local UseDialogSizeModule = require(script.Parent.useDialogSize)
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

local function Dialog(p1)
	-- upvalues: DashModule (copy), UseDialogVariantsFunction (copy), UseScaledValueModule (copy), FlagsModule (copy), ReactModule (copy), UseDialogSizeModule (copy), UseOverlayModule (copy), UseElevationModule (copy), ElevationLayerModule (copy), UseDialogModule (copy), UseDialogResponsiveSizeModule (copy), UseTokensModule (copy), UsePreferencesModule (copy), UseAnimatedBindingFunction (copy), OtterModule (copy), ViewModule (copy), ImageModule (copy), SHADOWIMAGE (copy), SHADOWSIZE (copy), WithCommonPropsModule (copy), StateLayerAffordanceModule (copy), TypesModule (copy), CloseAffordanceModule (copy), ElevationOwnerScope (copy), OnCloseCallbackReasonModule (copy), ReactRobloxModule (copy)
	local AssignResult = DashModule.assign({}, p1, { LayoutOrder = 1 })
	local UseDialogVariantsResult = UseDialogVariantsFunction()
	local UseScaledValueModuleResult = UseScaledValueModule(UseDialogVariantsResult.inner.maxWidth)
	local UseRefResult = if FlagsModule.FoundationDialogAnimation then nil else ReactModule.useRef(nil)
	local Callback4 = nil
	local UseBindingResult = nil
	
	if FlagsModule.FoundationDialogAnimation then
		UseBindingResult, Callback4 = ReactModule.useBinding(Vector2.new(0, 0))
	else
		UseBindingResult = UseDialogSizeModule(UseRefResult)
	end
	local UseOverlayModuleResult = UseOverlayModule()
	local UseElevationModuleResult = UseElevationModule(ElevationLayerModule.Dialog, { stackAboveOwner = false })
	local UseDialogModuleResult = UseDialogModule()
	UseDialogResponsiveSizeModule(AssignResult.size)
	local UseTokensModuleResult = if FlagsModule.FoundationDialogAnimation then UseTokensModule() else nil
	local ReducedMotion = if FlagsModule.FoundationDialogAnimation then UsePreferencesModule().reducedMotion else false
	local Size800 = if FlagsModule.FoundationDialogAnimation then UseTokensModuleResult.Size.Size_800 else 0
	local v1 = nil
	local Callback2 = nil
	
	if FlagsModule.FoundationDialogAnimation then
		v1, Callback2 = ReactModule.useState(true)
	end
	local UseRefResult1 = if FlagsModule.FoundationDialogAnimation then ReactModule.useRef(false) else nil
	local UseRefResult2 = if FlagsModule.FoundationDialogAnimation then ReactModule.useRef(nil) else nil
	local v2 = nil
	local Callback = nil
	
	if FlagsModule.FoundationDialogAnimation then
		v2, Callback = UseAnimatedBindingFunction(1)
	end
	local v3 = nil
	local Callback1 = nil
	
	if FlagsModule.FoundationDialogAnimation then
		v3, Callback1 = UseAnimatedBindingFunction(Size800, function()
			-- upvalues: UseRefResult1 (copy), AssignResult (copy), UseRefResult2 (copy), Callback2 (ref)
			if not UseRefResult1.current then
				Callback2(false)
			elseif AssignResult.onClose then
				AssignResult.onClose(UseRefResult2.current)
				
				return
			end
		end)
	end
	if FlagsModule.FoundationDialogAnimation then
		ReactModule.useEffect(function()
			-- upvalues: ReducedMotion (ref), Callback1 (ref), OtterModule (upval), Callback (ref), UseTokensModuleResult (copy)
			if ReducedMotion then
				Callback1((OtterModule.instant(0)))
				Callback((OtterModule.instant(0)))
				
				return
			else
				Callback1(OtterModule.ease(0, {
					easingStyle = UseTokensModuleResult.Ease.StandardOut,
					duration = UseTokensModuleResult.Time.Time_300
				}))
				Callback(OtterModule.ease(0, { duration = UseTokensModuleResult.Time.Time_100 }))
			end
		end, {})
	end
	local UseResult = if FlagsModule.FoundationDialogAnimation then ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy), ReducedMotion (ref), Callback1 (ref), OtterModule (upval), Size800 (copy), Callback (ref), UseTokensModuleResult (copy), Callback2 (ref)
		if UseRefResult1.current then return end
		UseRefResult2.current = Current
		
		if ReducedMotion then
			UseRefResult1.current = true
			Callback1(OtterModule.instant(Size800))
			Callback(OtterModule.instant(1))
			
			return
		else
			Callback1(OtterModule.ease(Size800, {
				easingStyle = UseTokensModuleResult.Ease.StandardIn,
				duration = UseTokensModuleResult.Time.Time_200
			}))
			Callback(OtterModule.ease(1, { duration = UseTokensModuleResult.Time.Time_100 }))
			Callback2(true)
			UseRefResult1.current = true
		end
	end, { Size800, ReducedMotion }) else nil
	local UseMemoResult = if FlagsModule.FoundationDialogAnimation then ReactModule.useMemo(function()
		return Instance.new("Folder")
	end, {}) else nil
	
	if FlagsModule.FoundationDialogAnimation then
		ReactModule.useEffect(function()
			-- upvalues: UseMemoResult (copy)
			return function()
				-- upvalues: UseMemoResult (upval)
				UseMemoResult:Destroy()
			end
		end, { UseMemoResult })
	end
	local v4 = nil
	local Callback3 = nil
	
	if FlagsModule.FoundationDialogAnimation then
		v4, Callback3 = ReactModule.useState(false)
	end
	local UseResult1 = if FlagsModule.FoundationDialogAnimation then ReactModule.useCallback(function(Parent)
		-- upvalues: UseMemoResult (copy), Callback3 (ref)
		if Parent then
			UseMemoResult.Parent = Parent
			Callback3(true)
			
			return
		else
			UseMemoResult.Parent = nil
			Callback3(false)
		end
	end, { UseMemoResult }) else nil
	local Element = ReactModule.createElement(ViewModule, { ZIndex = 2, tag = UseDialogVariantsResult.container.tag }, {
		Shadow = ReactModule.createElement(ImageModule, {
			Image = SHADOWIMAGE,
			Size = UseBindingResult:map(function(Vector): UDim2
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
		DialogFlexStart = if FlagsModule.FoundationDialogAnimation then nil else ReactModule.createElement(ViewModule, { tag = "fill", LayoutOrder = 0 }),
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
				onActivated = if FlagsModule.FoundationDialogAnimation and UseResult and not ReducedMotion then UseResult else AssignResult.onClose,
				ref = UseDialogModuleResult.closeAffordanceRef,
				NextSelectionDown = UseDialogModuleResult.contentStartRef,
				Position = UDim2.new(1, -UseDialogVariantsResult.closeAffordance.offset, 0, UseDialogVariantsResult.closeAffordance.offset),
				AnchorPoint = Vector2.new(1, 0),
				testId = `{AssignResult.testId}--close-affordance`
			}) else nil,
			DialogBody = ReactModule.createElement(ViewModule, {
				tag = UseDialogVariantsResult.body.tag,
				ref = if FlagsModule.FoundationDialogAnimation then nil else UseRefResult,
				onAbsoluteSizeChanged = if FlagsModule.FoundationDialogAnimation then function(Frame)
					-- upvalues: Callback4 (ref)
					local AbsoluteSize = Frame.AbsoluteSize
					
					if AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 then
						Callback4(AbsoluteSize)
					end
				end else nil,
				testId = `{AssignResult.testId}--body`
			}, ReactModule.createElement(ElevationOwnerScope, { owner = UseElevationModuleResult }, AssignResult.children))
		}),
		DialogFlexEnd = if FlagsModule.FoundationDialogAnimation then nil else ReactModule.createElement(ViewModule, { tag = "fill", LayoutOrder = 2 })
	})
	local Element2 = ReactModule.createElement(ViewModule, {
		tag = "size-full",
		ZIndex = UseElevationModuleResult.zIndex,
		testId = `{AssignResult.testId}--container`
	}, {
		Backdrop = if AssignResult.hasBackdrop then ReactModule.createElement(ViewModule, {
			tag = "position-center-center anchor-center-center",
			ZIndex = 2,
			Size = UDim2.fromScale(2, 2),
			stateLayer = { affordance = StateLayerAffordanceModule.None },
			onActivated = function()
				-- upvalues: AssignResult (copy), FlagsModule (upval), UseResult (ref), ReducedMotion (ref), OnCloseCallbackReasonModule (upval)
				if AssignResult.onClose then
					if FlagsModule.FoundationDialogAnimation and UseResult and not ReducedMotion then
						UseResult(OnCloseCallbackReasonModule.BackdropClick)
						
						return
					end
					AssignResult.onClose(OnCloseCallbackReasonModule.BackdropClick)
				end
			end,
			backgroundStyle = if FlagsModule.FoundationDialogAnimation and (not ReducedMotion and v2) then v2:map(function(Alpha: number)
				-- upvalues: UseDialogVariantsResult (copy)
				return {
					Color3 = UseDialogVariantsResult.backdrop.backgroundStyle.Color3,
					Transparency = math.lerp(UseDialogVariantsResult.backdrop.backgroundStyle.Transparency, 1, Alpha)
				}
			end) else UseDialogVariantsResult.backdrop.backgroundStyle,
			testId = `{AssignResult.testId}--backdrop`
		}) else nil,
		DialogContentWrapper = ReactModule.createElement(ViewModule, {
			ZIndex = 2,
			ref = if FlagsModule.FoundationDialogAnimation and not ReducedMotion then UseResult1 else nil,
			Position = if FlagsModule.FoundationDialogAnimation and not ReducedMotion and v3 then v3:map(function(YOffset): UDim2
				return UDim2.new(0.5, 0, 0.5, YOffset)
			end) else nil,
			sizeConstraint = if FlagsModule.FoundationDialogAnimation and not ReducedMotion then {
				MaxSize = Vector2.new(UseScaledValueModuleResult + SHADOWSIZE * 2, 1e999)
			} else nil,
			tag = {
				["anchor-center-center size-full"] = FlagsModule.FoundationDialogAnimation and not ReducedMotion,
				["size-full"] = not FlagsModule.FoundationDialogAnimation or ReducedMotion
			},
			GroupTransparency = if FlagsModule.FoundationDialogAnimation and not ReducedMotion and v1 and v3 then v3:map(function(p2)
				-- upvalues: Size800 (copy)
				return p2 / Size800
			end) else nil
		}, if FlagsModule.FoundationDialogAnimation and not ReducedMotion then nil else { DialogShadowWrapper = Element, Dialog = Element1 })
	})
	
	return if FlagsModule.FoundationDialogAnimation and not ReducedMotion then ReactModule.createElement(ReactModule.Fragment, nil, {
		Main = if AssignResult.disablePortal or UseOverlayModuleResult == nil then Element2 else ReactRobloxModule.createPortal(Element2, UseOverlayModuleResult),
		StableContent = if v4 then ReactRobloxModule.createPortal(ReactModule.createElement(ReactModule.Fragment, nil, { DialogShadowWrapper = Element, Dialog = Element1 }), UseMemoResult) else nil
	}) elseif AssignResult.disablePortal or UseOverlayModuleResult == nil then Element2 else ReactRobloxModule.createPortal(Element2, UseOverlayModuleResult)
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, ForwardRef)
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