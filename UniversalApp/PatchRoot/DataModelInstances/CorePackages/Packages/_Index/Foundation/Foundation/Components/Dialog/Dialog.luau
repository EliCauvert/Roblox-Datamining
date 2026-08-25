local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local flagsModule = require(foundation.Utility.Flags)
local dashModule = require(parent.Dash)
local otterModule = require(parent.Otter)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local useAnimatedBinding = require(parent.ReactOtter).useAnimatedBinding
local closeAffordanceModule = require(foundation.Components.CloseAffordance)
local constantsModule = require(foundation.Constants)
local imageModule = require(foundation.Components.Image)
local viewModule = require(foundation.Components.View)
local useOverlayModule = require(foundation.Providers.Overlay.useOverlay)
local dialogSizeModule = require(foundation.Enums.DialogSize)
local onCloseCallbackReasonModule = require(foundation.Enums.OnCloseCallbackReason)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local useScaledValueModule = require(foundation.Utility.useScaledValue)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local usePreferencesModule = require(foundation.Providers.Preferences.usePreferences)
local typesModule = require(script.Parent.Types)
local _ = require(foundation.Components.Types)
local useDialogVariants = require(script.Parent.useDialogVariants).useDialogVariants
local dialogProviderModule = require(script.Parent.DialogProvider)
local useDialogModule = require(script.Parent.useDialog)
local useDialogResponsiveSizeModule = require(script.Parent.useDialogResponsiveSize)
local useElevationModule = require(foundation.Providers.Elevation.useElevation)
local elevationOwnerScope = require(foundation.Providers.Elevation.ElevationProvider).ElevationOwnerScope
local elevationLayerModule = require(foundation.Enums.ElevationLayer)
local t = {
	disablePortal = true,
	hasBackdrop = false,
	testId = "--foundation-dialog",
	size = dialogSizeModule.Medium
}
local SHADOW_IMAGE = constantsModule.SHADOW_IMAGE
local SHADOW_SIZE = constantsModule.SHADOW_SIZE

local function Dialog(p1)
	-- upvalues: dashModule (ref), useDialogVariants (ref), useScaledValueModule (ref), reactModule (ref), useOverlayModule (ref), useElevationModule (ref), elevationLayerModule (ref), useDialogModule (ref), useDialogResponsiveSizeModule (ref), useTokensModule (ref), usePreferencesModule (ref), useAnimatedBinding (ref), otterModule (ref), viewModule (ref), imageModule (ref), SHADOW_IMAGE (ref), SHADOW_SIZE (ref), withCommonPropsModule (ref), stateLayerAffordanceModule (ref), typesModule (ref), closeAffordanceModule (ref), elevationOwnerScope (ref), flagsModule (ref), onCloseCallbackReasonModule (ref), reactRobloxModule (ref)
	local createElement_2
	local var1 = dashModule.assign({}, p1, { LayoutOrder = 1 })
	local var2 = useDialogVariants()
	local var3 = useScaledValueModule(var2.inner.maxWidth)
	local var4, var5 = reactModule.useBinding(Vector2.new(0, 0))
	local var6 = useOverlayModule()
	local var7 = useElevationModule(elevationLayerModule.Dialog, { stackAboveOwner = false })
	local var8 = useDialogModule()
	useDialogResponsiveSizeModule(var1.size)
	local var9 = useTokensModule()
	local reducedMotion = usePreferencesModule().reducedMotion
	local size800 = var9.Size.Size_800
	local var10, var11 = reactModule.useState(true)
	local var12 = reactModule.useRef(false)
	local var13 = reactModule.useRef(nil)
	local var14, var15 = useAnimatedBinding(1)
	local var16, var17 = useAnimatedBinding(size800, function()
		-- upvalues: var12 (ref), var1 (ref), var13 (ref), var11 (ref)
		if var12.current then
			if var1.onClose then
				var1.onClose(var13.current)
				
				return
			end
		else
			var11(false)
		end
	end)
	reactModule.useEffect(function()
		-- upvalues: reducedMotion (ref), var17 (ref), otterModule (copy), var15 (ref), var9 (ref)
		if reducedMotion then
			var17(otterModule.instant(0))
			var15(otterModule.instant(0))
			
			return
		end
		var17(otterModule.ease(0, {
			easingStyle = var9.Ease.StandardOut,
			duration = var9.Time.Time_300
		}))
		var15(otterModule.ease(0, { duration = var9.Time.Time_100 }))
	end, {})
	local var18 = reactModule.useCallback(function(p1)
		-- upvalues: var12 (ref), var13 (ref), reducedMotion (ref), var17 (ref), otterModule (copy), size800 (ref), var15 (ref), var9 (ref), var11 (ref)
		if var12.current then return end
		var13.current = p1
		
		if reducedMotion then
			var12.current = true
			var17(otterModule.instant(size800))
			var15(otterModule.instant(1))
			
			return
		end
		var17(otterModule.ease(size800, {
			easingStyle = var9.Ease.StandardIn,
			duration = var9.Time.Time_200
		}))
		var15(otterModule.ease(1, { duration = var9.Time.Time_100 }))
		var11(true)
		var12.current = true
	end, { size800, reducedMotion })
	local var19 = reactModule.useMemo(function()
		return Instance.new("Folder")
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var19 (ref)
		return function()
			-- upvalues: var19 (copy)
			var19:Destroy()
		end
	end, { var19 })
	local var20, var21 = reactModule.useState(false)
	local var22 = reactModule.useCallback(function(p1)
		-- upvalues: var19 (ref), var21 (ref)
		if p1 then
			var19.Parent = p1
			var21(true)
			
			return
		end
		var19.Parent = nil
		var21(false)
	end, { var19 })
	local var23 = reactModule.createElement(viewModule, { ZIndex = 2, tag = var2.container.tag }, {
		Shadow = reactModule.createElement(imageModule, {
			Image = SHADOW_IMAGE,
			Size = var4:map(function(p1)
				-- upvalues: SHADOW_SIZE (copy)
				return UDim2.fromOffset(p1.X + SHADOW_SIZE * 2, p1.Y + SHADOW_SIZE * 2)
			end),
			slice = {
				scale = 2,
				center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE)
			},
			imageStyle = var2.shadow.imageStyle,
			testId = `{var1.testId}--shadow`
		})
	})
	local createElement = reactModule.createElement
	local t = { ZIndex = 3, tag = var2.container.tag }
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local var24 = withCommonPropsModule(var1, {
		tag = var2.inner.tag,
		ref = var1.forwardRef,
		sizeConstraint = { MaxSize = Vector2.new(var3, 1e999) },
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		selection = typesModule.nonSelectable,
		selectionGroup = typesModule.isolatedSelectionGroup,
		onActivated = dashModule.noop
	})
	local t_2 = {}
	
	if var1.onClose then
		createElement_2 = reactModule.createElement
		createElement_2 = createElement_2(closeAffordanceModule, {
			ZIndex = 2,
			onActivated = if var18 and not reducedMotion then var18 else var1.onClose,
			ref = var8.closeAffordanceRef,
			NextSelectionDown = var8.contentStartRef,
			Position = UDim2.new(1, -var2.closeAffordance.offset, 0, var2.closeAffordance.offset),
			AnchorPoint = Vector2.new(1, 0),
			testId = `{var1.testId}--close-affordance`
		})
	else
		createElement_2 = nil
	end
	local var25
	t_2.CloseAffordance = createElement_2
	t_2.DialogBody = reactModule.createElement(viewModule, {
		tag = var2.body.tag,
		onAbsoluteSizeChanged = function(value)
			-- upvalues: var5 (ref)
			local absoluteSize = value.AbsoluteSize
			
			if absoluteSize.X > 0 and absoluteSize.Y > 0 then
				var5(absoluteSize)
			end
		end,
		testId = `{var1.testId}--body`
	}, reactModule.createElement(elevationOwnerScope, { owner = var7 }, var1.children))
	t_1.DialogInner = createElement_1(viewModule, var24, t_2)
	createElement = createElement(viewModule, t, t_1)
	local createElement_3 = reactModule.createElement
	local var26 = viewModule
	local t_3 = {
		ZIndex = var7.zIndex,
		tag = if flagsModule.FoundationDialogBetaUpdate then "size-full padding-y-xlarge" else "size-full",
		testId = `{var1.testId}--container`
	}
	local t_4 = {}
	
	if var1.hasBackdrop then
		var25 = reactModule.createElement
		var25 = var25(viewModule, {
			tag = "position-center-center anchor-center-center",
			ZIndex = 2,
			Size = UDim2.fromScale(2, 2),
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			onActivated = function()
				-- upvalues: var1 (ref), var18 (ref), reducedMotion (ref), onCloseCallbackReasonModule (copy)
				if var1.onClose then
					if var18 and not reducedMotion then
						var18(onCloseCallbackReasonModule.BackdropClick)
						
						return
					end
					var1.onClose(onCloseCallbackReasonModule.BackdropClick)
				end
			end,
			backgroundStyle = if reducedMotion or not var14 then var2.backdrop.backgroundStyle else var14:map(function(p1)
				-- upvalues: var2 (ref)
				return {
					Color3 = var2.backdrop.backgroundStyle.Color3,
					Transparency = math.lerp(var2.backdrop.backgroundStyle.Transparency, 1, p1)
				}
			end),
			testId = `{var1.testId}--backdrop`
		})
	else
		var25 = nil
	end
	t_4.Backdrop = var25
	t_4.DialogContentWrapper = reactModule.createElement(viewModule, {
		ZIndex = 2,
		ref = if not reducedMotion then var22 else nil,
		Position = if reducedMotion or not var16 then nil else var16:map(function(p1)
			return UDim2.new(0.5, 0, 0.5, p1)
		end),
		sizeConstraint = if not reducedMotion then { MaxSize = Vector2.new(var3 + SHADOW_SIZE * 2, 1e999) } else nil,
		tag = {
			["anchor-center-center size-full"] = not reducedMotion,
			["size-full"] = reducedMotion
		},
		GroupTransparency = if reducedMotion or not var10 or not var16 then nil else var16:map(function(p1)
			-- upvalues: size800 (ref)
			return p1 / size800
		end)
	}, if reducedMotion then { DialogShadowWrapper = var23, Dialog = createElement } else nil)
	createElement_3 = createElement_3(var26, t_3, t_4)
	
	return if reducedMotion then if var1.disablePortal or var6 == nil then createElement_3 else reactRobloxModule.createPortal(createElement_3, var6) else reactModule.createElement(reactModule.Fragment, nil, {
		Main = if var1.disablePortal or var6 == nil then createElement_3 else reactRobloxModule.createPortal(createElement_3, var6),
		StableContent = if var20 then reactRobloxModule.createPortal(reactModule.createElement(reactModule.Fragment, nil, { DialogShadowWrapper = var23, Dialog = createElement }), var19) else nil
	})
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), dialogProviderModule (ref), Dialog (ref), dashModule (ref)
	local var1 = withDefaultsModule(p1, t)
	
	return reactModule.createElement(dialogProviderModule, {
		size = var1.size,
		responsiveSize = var1.size,
		testId = var1.testId
	}, {
		Dialog = reactModule.createElement(Dialog, dashModule.assign({}, var1, { forwardRef = p2 }))
	})
end))