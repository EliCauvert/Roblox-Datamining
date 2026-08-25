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

local function Dialog(p0)
	-- upvalues: dashModule (ref), useDialogVariants (ref), useScaledValueModule (ref), reactModule (ref), useOverlayModule (ref), useElevationModule (ref), elevationLayerModule (ref), useDialogModule (ref), useDialogResponsiveSizeModule (ref), useTokensModule (ref), usePreferencesModule (ref), useAnimatedBinding (ref), otterModule (ref), viewModule (ref), imageModule (ref), SHADOW_IMAGE (ref), SHADOW_SIZE (ref), withCommonPropsModule (ref), stateLayerAffordanceModule (ref), typesModule (ref), closeAffordanceModule (ref), elevationOwnerScope (ref), flagsModule (ref), onCloseCallbackReasonModule (ref), reactRobloxModule (ref)
	local createElement_2
	local var27 = dashModule.assign({}, p0, { LayoutOrder = 1 })
	local var28 = useDialogVariants()
	local var29 = useScaledValueModule(var28.inner.maxWidth)
	local var30, var31 = reactModule.useBinding(Vector2.new(0, 0))
	local var32 = useOverlayModule()
	local var33 = useElevationModule(elevationLayerModule.Dialog, { stackAboveOwner = false })
	local var34 = useDialogModule()
	useDialogResponsiveSizeModule(var27.size)
	local var35 = useTokensModule()
	local reducedMotion = usePreferencesModule().reducedMotion
	local size800 = var35.Size.Size_800
	local var36, var37 = reactModule.useState(true)
	local var38 = reactModule.useRef(false)
	local var39 = reactModule.useRef(nil)
	local var40, var41 = useAnimatedBinding(1)
	local var42, var43 = useAnimatedBinding(size800, function()
		-- upvalues: var38 (ref), var27 (ref), var39 (ref), var37 (ref)
		if var38.current then
			if var27.onClose then
				var27.onClose(var39.current)
				
				return
			end
		else
			var37(false)
		end
	end)
	reactModule.useEffect(function()
		-- upvalues: reducedMotion (ref), var43 (ref), otterModule (copy), var41 (ref), var35 (ref)
		if reducedMotion then
			var43(otterModule.instant(0))
			var41(otterModule.instant(0))
			
			return
		end
		var43(otterModule.ease(0, {
			easingStyle = var35.Ease.StandardOut,
			duration = var35.Time.Time_300
		}))
		var41(otterModule.ease(0, { duration = var35.Time.Time_100 }))
	end, {})
	local var44 = reactModule.useCallback(function(p1)
		-- upvalues: var38 (ref), var39 (ref), reducedMotion (ref), var43 (ref), otterModule (copy), size800 (ref), var41 (ref), var35 (ref), var37 (ref)
		if var38.current then return end
		var39.current = p1
		
		if reducedMotion then
			var38.current = true
			var43(otterModule.instant(size800))
			var41(otterModule.instant(1))
			
			return
		end
		var43(otterModule.ease(size800, {
			easingStyle = var35.Ease.StandardIn,
			duration = var35.Time.Time_200
		}))
		var41(otterModule.ease(1, { duration = var35.Time.Time_100 }))
		var37(true)
		var38.current = true
	end, { size800, reducedMotion })
	local var45 = reactModule.useMemo(function()
		return Instance.new("Folder")
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var45 (ref)
		return function()
			-- upvalues: var45 (copy)
			var45:Destroy()
		end
	end, { var45 })
	local var46, var47 = reactModule.useState(false)
	local var48 = reactModule.useCallback(function(p2)
		-- upvalues: var45 (ref), var47 (ref)
		if p2 then
			var45.Parent = p2
			var47(true)
			
			return
		end
		var45.Parent = nil
		var47(false)
	end, { var45 })
	local var49 = reactModule.createElement(viewModule, { ZIndex = 2, tag = var28.container.tag }, {
		Shadow = reactModule.createElement(imageModule, {
			Image = SHADOW_IMAGE,
			Size = var30:map(function(p3)
				-- upvalues: SHADOW_SIZE (copy)
				return UDim2.fromOffset(p3.X + SHADOW_SIZE * 2, p3.Y + SHADOW_SIZE * 2)
			end),
			slice = {
				scale = 2,
				center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE)
			},
			imageStyle = var28.shadow.imageStyle,
			testId = `{var27.testId}--shadow`
		})
	})
	local createElement = reactModule.createElement
	local t = { ZIndex = 3, tag = var28.container.tag }
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local var52 = withCommonPropsModule(var27, {
		tag = var28.inner.tag,
		ref = var27.forwardRef,
		sizeConstraint = { MaxSize = Vector2.new(var29, 1e999) },
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		selection = typesModule.nonSelectable,
		selectionGroup = typesModule.isolatedSelectionGroup,
		onActivated = dashModule.noop
	})
	local t_2 = {}
	
	if var27.onClose then
		createElement_2 = reactModule.createElement
		createElement_2 = createElement_2(closeAffordanceModule, {
			ZIndex = 2,
			onActivated = if var44 and not reducedMotion then var44 else var27.onClose,
			ref = var34.closeAffordanceRef,
			NextSelectionDown = var34.contentStartRef,
			Position = UDim2.new(1, -var28.closeAffordance.offset, 0, var28.closeAffordance.offset),
			AnchorPoint = Vector2.new(1, 0),
			testId = `{var27.testId}--close-affordance`
		})
	else
		createElement_2 = nil
	end
	local var57
	t_2.CloseAffordance = createElement_2
	t_2.DialogBody = reactModule.createElement(viewModule, {
		tag = var28.body.tag,
		onAbsoluteSizeChanged = function(value)
			-- upvalues: var31 (ref)
			local absoluteSize = value.AbsoluteSize
			
			if absoluteSize.X > 0 and absoluteSize.Y > 0 then
				var31(absoluteSize)
			end
		end,
		testId = `{var27.testId}--body`
	}, reactModule.createElement(elevationOwnerScope, { owner = var33 }, var27.children))
	t_1.DialogInner = createElement_1(viewModule, var52, t_2)
	createElement = createElement(viewModule, t, t_1)
	local createElement_3 = reactModule.createElement
	local var54 = viewModule
	local t_3 = {
		ZIndex = var33.zIndex,
		tag = if flagsModule.FoundationDialogBetaUpdate then "size-full padding-y-xlarge" else "size-full",
		testId = `{var27.testId}--container`
	}
	local t_4 = {}
	
	if var27.hasBackdrop then
		var57 = reactModule.createElement
		var57 = var57(viewModule, {
			tag = "position-center-center anchor-center-center",
			ZIndex = 2,
			Size = UDim2.fromScale(2, 2),
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			onActivated = function()
				-- upvalues: var27 (ref), var44 (ref), reducedMotion (ref), onCloseCallbackReasonModule (copy)
				if var27.onClose then
					if var44 and not reducedMotion then
						var44(onCloseCallbackReasonModule.BackdropClick)
						
						return
					end
					var27.onClose(onCloseCallbackReasonModule.BackdropClick)
				end
			end,
			backgroundStyle = if reducedMotion or not var40 then var28.backdrop.backgroundStyle else var40:map(function(p4)
				-- upvalues: var28 (ref)
				return {
					Color3 = var28.backdrop.backgroundStyle.Color3,
					Transparency = math.lerp(var28.backdrop.backgroundStyle.Transparency, 1, p4)
				}
			end),
			testId = `{var27.testId}--backdrop`
		})
	else
		var57 = nil
	end
	t_4.Backdrop = var57
	t_4.DialogContentWrapper = reactModule.createElement(viewModule, {
		ZIndex = 2,
		ref = if not reducedMotion then var48 else nil,
		Position = if reducedMotion or not var42 then nil else var42:map(function(p5)
			return UDim2.new(0.5, 0, 0.5, p5)
		end),
		sizeConstraint = if not reducedMotion then { MaxSize = Vector2.new(var29 + SHADOW_SIZE * 2, 1e999) } else nil,
		tag = {
			["anchor-center-center size-full"] = not reducedMotion,
			["size-full"] = reducedMotion
		},
		GroupTransparency = if reducedMotion or not var36 or not var42 then nil else var42:map(function(p6)
			-- upvalues: size800 (ref)
			return p6 / size800
		end)
	}, if reducedMotion then { DialogShadowWrapper = var49, Dialog = createElement } else nil)
	createElement_3 = createElement_3(var54, t_3, t_4)
	
	return if reducedMotion then if var27.disablePortal or var32 == nil then createElement_3 else reactRobloxModule.createPortal(createElement_3, var32) else reactModule.createElement(reactModule.Fragment, nil, {
		Main = if var27.disablePortal or var32 == nil then createElement_3 else reactRobloxModule.createPortal(createElement_3, var32),
		StableContent = if var46 then reactRobloxModule.createPortal(reactModule.createElement(reactModule.Fragment, nil, { DialogShadowWrapper = var49, Dialog = createElement }), var45) else nil
	})
end

return reactModule.memo(reactModule.forwardRef(function(p7, p8)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), dialogProviderModule (ref), Dialog (ref), dashModule (ref)
	local var58 = withDefaultsModule(p7, t)
	
	return reactModule.createElement(dialogProviderModule, {
		size = var58.size,
		responsiveSize = var58.size,
		testId = var58.testId
	}, {
		Dialog = reactModule.createElement(Dialog, dashModule.assign({}, var58, { forwardRef = p8 }))
	})
end))