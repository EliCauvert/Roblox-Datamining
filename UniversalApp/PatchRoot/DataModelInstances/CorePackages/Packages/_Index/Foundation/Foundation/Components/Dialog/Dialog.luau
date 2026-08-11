local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
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

local function Dialog(p0) --[[ line: 68 ]]
	-- upvalues: dashModule (ref), useDialogVariants (ref), useScaledValueModule (ref), reactModule (ref), useOverlayModule (ref), useElevationModule (ref), elevationLayerModule (ref), useDialogModule (ref), useDialogResponsiveSizeModule (ref), useTokensModule (ref), usePreferencesModule (ref), useAnimatedBinding (ref), otterModule (ref), viewModule (ref), imageModule (ref), SHADOW_IMAGE (ref), SHADOW_SIZE (ref), withCommonPropsModule (ref), stateLayerAffordanceModule (ref), typesModule (ref), closeAffordanceModule (ref), elevationOwnerScope (ref), onCloseCallbackReasonModule (ref), reactRobloxModule (ref)
	local createElement_2
	local var26 = dashModule.assign({}, p0, { LayoutOrder = 1 })
	local var27 = useDialogVariants()
	local var28 = useScaledValueModule(var27.inner.maxWidth)
	local var29, var30 = reactModule.useBinding(Vector2.new(0, 0))
	local var31 = useOverlayModule()
	local var32 = useElevationModule(elevationLayerModule.Dialog, { stackAboveOwner = false })
	local var33 = useDialogModule()
	useDialogResponsiveSizeModule(var26.size)
	local var34 = useTokensModule()
	local reducedMotion = usePreferencesModule().reducedMotion
	local size800 = var34.Size.Size_800
	local var35, var36 = reactModule.useState(true)
	local var37 = reactModule.useRef(false)
	local var38 = reactModule.useRef(nil)
	local var39, var40 = useAnimatedBinding(1)
	local var41, var42 = useAnimatedBinding(size800, function() --[[ line: 93 ]]
		-- upvalues: var37 (ref), var26 (ref), var38 (ref), var36 (ref)
		if var37.current then
			if var26.onClose then
				var26.onClose(var38.current)
				
				return
			end
		else
			var36(false)
		end
	end)
	reactModule.useEffect(function() --[[ line: 105 ]]
		-- upvalues: reducedMotion (ref), var42 (ref), otterModule (copy), var40 (ref), var34 (ref)
		if reducedMotion then
			var42(otterModule.instant(0))
			var40(otterModule.instant(0))
			
			return
		end
		var42(otterModule.ease(0, {
			easingStyle = var34.Ease.StandardOut,
			duration = var34.Time.Time_300
		}))
		var40(otterModule.ease(0, { duration = var34.Time.Time_100 }))
	end, {})
	local var43 = reactModule.useCallback(function(p1) --[[ line: 120 ]]
		-- upvalues: var37 (ref), var38 (ref), reducedMotion (ref), var42 (ref), otterModule (copy), size800 (ref), var40 (ref), var34 (ref), var36 (ref)
		if var37.current then return end
		var38.current = p1
		
		if reducedMotion then
			var37.current = true
			var42(otterModule.instant(size800))
			var40(otterModule.instant(1))
			
			return
		end
		var42(otterModule.ease(size800, {
			easingStyle = var34.Ease.StandardIn,
			duration = var34.Time.Time_200
		}))
		var40(otterModule.ease(1, { duration = var34.Time.Time_100 }))
		var36(true)
		var37.current = true
	end, { size800, reducedMotion })
	local var44 = reactModule.useMemo(function() --[[ line: 142 ]]
		return Instance.new("Folder")
	end, {})
	reactModule.useEffect(function() --[[ line: 146 ]]
		-- upvalues: var44 (ref)
		return function() --[[ line: 147 ]]
			-- upvalues: var44 (copy)
			var44:Destroy()
		end
	end, { var44 })
	local var45, var46 = reactModule.useState(false)
	local var47 = reactModule.useCallback(function(p2) --[[ line: 155 ]]
		-- upvalues: var44 (ref), var46 (ref)
		if p2 then
			var44.Parent = p2
			var46(true)
			
			return
		end
		var44.Parent = nil
		var46(false)
	end, { var44 })
	local var48 = reactModule.createElement(viewModule, { ZIndex = 2, tag = var27.container.tag }, {
		Shadow = reactModule.createElement(imageModule, {
			Image = SHADOW_IMAGE,
			Size = var29:map(function(p3) --[[ line: 171 ]]
				-- upvalues: SHADOW_SIZE (copy)
				return UDim2.fromOffset(p3.X + SHADOW_SIZE * 2, p3.Y + SHADOW_SIZE * 2)
			end),
			slice = {
				scale = 2,
				center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE)
			},
			imageStyle = var27.shadow.imageStyle,
			testId = `{var26.testId}--shadow`
		})
	})
	local createElement = reactModule.createElement
	local t = { ZIndex = 3, tag = var27.container.tag }
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local var51 = withCommonPropsModule(var26, {
		tag = var27.inner.tag,
		ref = var26.forwardRef,
		sizeConstraint = { MaxSize = Vector2.new(var28, 1e999) },
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		selection = typesModule.nonSelectable,
		selectionGroup = typesModule.isolatedSelectionGroup,
		onActivated = dashModule.noop
	})
	local t_2 = {}
	
	if var26.onClose then
		createElement_2 = reactModule.createElement
		createElement_2 = createElement_2(closeAffordanceModule, {
			ZIndex = 2,
			onActivated = if var43 and not reducedMotion then var43 else var26.onClose,
			ref = var33.closeAffordanceRef,
			NextSelectionDown = var33.contentStartRef,
			Position = UDim2.new(1, -var27.closeAffordance.offset, 0, var27.closeAffordance.offset),
			AnchorPoint = Vector2.new(1, 0),
			testId = `{var26.testId}--close-affordance`
		})
	else
		createElement_2 = nil
	end
	local createElement_4
	t_2.CloseAffordance = createElement_2
	t_2.DialogBody = reactModule.createElement(viewModule, {
		tag = var27.body.tag,
		onAbsoluteSizeChanged = function(value) --[[ line: 217 ]]
			-- upvalues: var30 (ref)
			local absoluteSize = value.AbsoluteSize
			
			if absoluteSize.X > 0 and absoluteSize.Y > 0 then
				var30(absoluteSize)
			end
		end,
		testId = `{var26.testId}--body`
	}, reactModule.createElement(elevationOwnerScope, { owner = var32 }, var26.children))
	t_1.DialogInner = createElement_1(viewModule, var51, t_2)
	createElement = createElement(viewModule, t, t_1)
	local createElement_3 = reactModule.createElement
	local var53 = viewModule
	local t_3 = {
		tag = "size-full",
		ZIndex = var32.zIndex,
		testId = `{var26.testId}--container`
	}
	local t_4 = {}
	
	if var26.hasBackdrop then
		createElement_4 = reactModule.createElement
		createElement_4 = createElement_4(viewModule, {
			tag = "position-center-center anchor-center-center",
			ZIndex = 2,
			Size = UDim2.fromScale(2, 2),
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			onActivated = function() --[[ line: 241 ]]
				-- upvalues: var26 (ref), var43 (ref), reducedMotion (ref), onCloseCallbackReasonModule (copy)
				if var26.onClose then
					if var43 and not reducedMotion then
						var43(onCloseCallbackReasonModule.BackdropClick)
						
						return
					end
					var26.onClose(onCloseCallbackReasonModule.BackdropClick)
				end
			end,
			backgroundStyle = if reducedMotion or not var39 then var27.backdrop.backgroundStyle else var39:map(function(p4) --[[ line: 251 ]]
				-- upvalues: var27 (ref)
				return {
					Color3 = var27.backdrop.backgroundStyle.Color3,
					Transparency = math.lerp(var27.backdrop.backgroundStyle.Transparency, 1, p4)
				}
			end),
			testId = `{var26.testId}--backdrop`
		})
	else
		createElement_4 = nil
	end
	t_4.Backdrop = createElement_4
	t_4.DialogContentWrapper = reactModule.createElement(viewModule, {
		ZIndex = 2,
		ref = if not reducedMotion then var47 else nil,
		Position = if reducedMotion or not var41 then nil else var41:map(function(p5) --[[ line: 271 ]]
			return UDim2.new(0.5, 0, 0.5, p5)
		end),
		sizeConstraint = if not reducedMotion then { MaxSize = Vector2.new(var28 + SHADOW_SIZE * 2, 1e999) } else nil,
		tag = {
			["anchor-center-center size-full"] = not reducedMotion,
			["size-full"] = reducedMotion
		},
		GroupTransparency = if reducedMotion or not var35 or not var41 then nil else var41:map(function(p6) --[[ line: 286 ]]
			-- upvalues: size800 (ref)
			return p6 / size800
		end)
	}, if reducedMotion then { DialogShadowWrapper = var48, Dialog = createElement } else nil)
	createElement_3 = createElement_3(var53, t_3, t_4)
	
	return if reducedMotion then if var26.disablePortal or var31 == nil then createElement_3 else reactRobloxModule.createPortal(createElement_3, var31) else reactModule.createElement(reactModule.Fragment, nil, {
		Main = if var26.disablePortal or var31 == nil then createElement_3 else reactRobloxModule.createPortal(createElement_3, var31),
		StableContent = if var45 then reactRobloxModule.createPortal(reactModule.createElement(reactModule.Fragment, nil, { DialogShadowWrapper = var48, Dialog = createElement }), var44) else nil
	})
end

return reactModule.memo(reactModule.forwardRef(function(p7, p8) --[[ line: 326 | named "DialogContainer" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), dialogProviderModule (ref), Dialog (ref), dashModule (ref)
	local var56 = withDefaultsModule(p7, t)
	
	return reactModule.createElement(dialogProviderModule, {
		size = var56.size,
		responsiveSize = var56.size,
		testId = var56.testId
	}, {
		Dialog = reactModule.createElement(Dialog, dashModule.assign({}, var56, { forwardRef = p8 }))
	})
end))