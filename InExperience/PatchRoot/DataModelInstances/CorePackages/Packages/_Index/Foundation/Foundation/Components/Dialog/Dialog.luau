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
local flagsModule = require(foundation.Utility.Flags)
local usePreferencesModule = require(foundation.Providers.Preferences.usePreferences)
local typesModule = require(script.Parent.Types)
local _ = require(foundation.Components.Types)
local useDialogVariants = require(script.Parent.useDialogVariants).useDialogVariants
local dialogProviderModule = require(script.Parent.DialogProvider)
local useDialogModule = require(script.Parent.useDialog)
local useDialogResponsiveSizeModule = require(script.Parent.useDialogResponsiveSize)
local useDialogSizeModule = require(script.Parent.useDialogSize)
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

local function Dialog(p0) --[[ line: 70 ]]
	-- upvalues: dashModule (ref), useDialogVariants (ref), useScaledValueModule (ref), flagsModule (ref), reactModule (ref), useDialogSizeModule (ref), useOverlayModule (ref), useElevationModule (ref), elevationLayerModule (ref), useDialogModule (ref), useDialogResponsiveSizeModule (ref), useTokensModule (ref), usePreferencesModule (ref), useAnimatedBinding (ref), otterModule (ref), viewModule (ref), imageModule (ref), SHADOW_IMAGE (ref), SHADOW_SIZE (ref), withCommonPropsModule (ref), stateLayerAffordanceModule (ref), typesModule (ref), closeAffordanceModule (ref), elevationOwnerScope (ref), onCloseCallbackReasonModule (ref), reactRobloxModule (ref)
	local var33
	local var28 = dashModule.assign({}, p0, { LayoutOrder = 1 })
	local var29 = useDialogVariants()
	local var30 = useScaledValueModule(var29.inner.maxWidth)
	local var31 = if not flagsModule.FoundationDialogAnimation then reactModule.useRef(nil) else nil
	local _ = nil
	local var32 = nil
	
	if flagsModule.FoundationDialogAnimation then
		local var34, var35 = reactModule.useBinding(Vector2.new(0, 0))
		var33 = var34
		var32 = var35
	else
		var33 = useDialogSizeModule(var31)
	end
	local var36 = useOverlayModule()
	local var37 = useElevationModule(elevationLayerModule.Dialog, { stackAboveOwner = false })
	local var38 = useDialogModule()
	useDialogResponsiveSizeModule(var28.size)
	local var39 = if flagsModule.FoundationDialogAnimation then useTokensModule() else nil
	local var40 = if flagsModule.FoundationDialogAnimation then usePreferencesModule().reducedMotion else false
	local var41 = if flagsModule.FoundationDialogAnimation then var39.Size.Size_800 else 0
	local var42 = nil
	local var43 = nil
	
	if flagsModule.FoundationDialogAnimation then
		local var44, var45 = reactModule.useState(true)
		var42 = var44
		var43 = var45
	end
	local var46 = if flagsModule.FoundationDialogAnimation then reactModule.useRef(false) else nil
	local var47 = if flagsModule.FoundationDialogAnimation then reactModule.useRef(nil) else nil
	local var48 = nil
	local var49 = nil
	
	if flagsModule.FoundationDialogAnimation then
		local var50, var51 = useAnimatedBinding(1)
		var48 = var50
		var49 = var51
	end
	local var52 = nil
	local var53 = nil
	
	if flagsModule.FoundationDialogAnimation then
		local var54, var55 = useAnimatedBinding(var41, function() --[[ line: 116 ]]
			-- upvalues: var46 (ref), var28 (ref), var47 (ref), var43 (write)
			if var46.current then
				if var28.onClose then
					var28.onClose(var47.current)
					
					return
				end
			else
				var43(false)
			end
		end)
		var52 = var54
		var53 = var55
	end
	if flagsModule.FoundationDialogAnimation then
		reactModule.useEffect(function() --[[ line: 131 ]]
			-- upvalues: var40 (write), var53 (write), otterModule (copy), var49 (write), var39 (ref)
			if var40 then
				var53(otterModule.instant(0))
				var49(otterModule.instant(0))
				
				return
			end
			var53(otterModule.ease(0, {
				easingStyle = var39.Ease.StandardOut,
				duration = var39.Time.Time_300
			}))
			var49(otterModule.ease(0, { duration = var39.Time.Time_100 }))
		end, {})
	end
	local var56 = if flagsModule.FoundationDialogAnimation then reactModule.useCallback(function(p1) --[[ line: 150 ]]
		-- upvalues: var46 (ref), var47 (ref), var40 (write), var53 (write), otterModule (copy), var41 (ref), var49 (write), var39 (ref), var43 (write)
		if var46.current then return end
		var47.current = p1
		
		if var40 then
			var46.current = true
			var53(otterModule.instant(var41))
			var49(otterModule.instant(1))
			
			return
		end
		var53(otterModule.ease(var41, {
			easingStyle = var39.Ease.StandardIn,
			duration = var39.Time.Time_200
		}))
		var49(otterModule.ease(1, { duration = var39.Time.Time_100 }))
		var43(true)
		var46.current = true
	end, { var41, var40 }) else nil
	local var57 = if flagsModule.FoundationDialogAnimation then reactModule.useMemo(function() --[[ line: 174 ]]
		return Instance.new("Folder")
	end, {}) else nil
	
	if flagsModule.FoundationDialogAnimation then
		reactModule.useEffect(function() --[[ line: 180 ]]
			-- upvalues: var57 (ref)
			return function() --[[ line: 181 ]]
				-- upvalues: var57 (copy)
				var57:Destroy()
			end
		end, { var57 })
	end
	local var58 = nil
	local var59 = nil
	
	if flagsModule.FoundationDialogAnimation then
		local var60, var61 = reactModule.useState(false)
		var58 = var60
		var59 = var61
	end
	local var68
	local var62 = if flagsModule.FoundationDialogAnimation then reactModule.useCallback(function(p2) --[[ line: 194 ]]
		-- upvalues: var57 (ref), var59 (write)
		if p2 then
			var57.Parent = p2
			var59(true)
			
			return
		end
		var57.Parent = nil
		var59(false)
	end, { var57 }) else nil
	local var63 = reactModule.createElement(viewModule, { ZIndex = 2, tag = var29.container.tag }, {
		Shadow = reactModule.createElement(imageModule, {
			Image = SHADOW_IMAGE,
			Size = var33:map(function(p3) --[[ line: 211 ]]
				-- upvalues: SHADOW_SIZE (copy)
				return UDim2.fromOffset(p3.X + SHADOW_SIZE * 2, p3.Y + SHADOW_SIZE * 2)
			end),
			slice = {
				scale = 2,
				center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE)
			},
			imageStyle = var29.shadow.imageStyle,
			testId = `{var28.testId}--shadow`
		})
	})
	local createElement = reactModule.createElement
	local t = { ZIndex = 3, tag = var29.container.tag }
	local t_1 = {
		DialogFlexStart = if flagsModule.FoundationDialogAnimation then nil else reactModule.createElement(viewModule, { tag = "fill", LayoutOrder = 0 })
	}
	local createElement_1 = reactModule.createElement
	local var66 = withCommonPropsModule(var28, {
		tag = var29.inner.tag,
		ref = var28.forwardRef,
		sizeConstraint = { MaxSize = Vector2.new(var30, 1e999) },
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		selection = typesModule.nonSelectable,
		selectionGroup = typesModule.isolatedSelectionGroup,
		onActivated = dashModule.noop
	})
	local t_2 = {}
	
	if var28.onClose then
		var68 = reactModule.createElement
		var68 = var68(closeAffordanceModule, {
			ZIndex = 2,
			onActivated = if flagsModule.FoundationDialogAnimation and var56 and not var40 then var56 else var28.onClose,
			ref = var38.closeAffordanceRef,
			NextSelectionDown = var38.contentStartRef,
			Position = UDim2.new(1, -var29.closeAffordance.offset, 0, var29.closeAffordance.offset),
			AnchorPoint = Vector2.new(1, 0),
			testId = `{var28.testId}--close-affordance`
		})
	else
		var68 = nil
	end
	local var71
	t_2.CloseAffordance = var68
	t_2.DialogBody = reactModule.createElement(viewModule, {
		tag = var29.body.tag,
		ref = if not flagsModule.FoundationDialogAnimation then var31 else nil,
		onAbsoluteSizeChanged = if flagsModule.FoundationDialogAnimation then function(p4) --[[ line: 269 ]]
			-- upvalues: var32 (write)
			local absoluteSize = p4.AbsoluteSize
			
			if absoluteSize.X > 0 and absoluteSize.Y > 0 then
				var32(absoluteSize)
			end
		end else nil,
		testId = `{var28.testId}--body`
	}, reactModule.createElement(elevationOwnerScope, { owner = var37 }, var28.children))
	t_1.DialogInner = createElement_1(viewModule, var66, t_2)
	t_1.DialogFlexEnd = if flagsModule.FoundationDialogAnimation then nil else reactModule.createElement(viewModule, { tag = "fill", LayoutOrder = 2 })
	createElement = createElement(viewModule, t, t_1)
	local createElement_2 = reactModule.createElement
	local t_3 = {
		tag = "size-full",
		ZIndex = var37.zIndex,
		testId = `{var28.testId}--container`
	}
	local t_4 = {}
	
	if var28.hasBackdrop then
		var71 = reactModule.createElement
		var71 = var71(viewModule, {
			tag = "position-center-center anchor-center-center",
			ZIndex = 2,
			Size = UDim2.fromScale(2, 2),
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			onActivated = function() --[[ line: 300 ]]
				-- upvalues: var28 (ref), flagsModule (copy), var56 (write), var40 (write), onCloseCallbackReasonModule (copy)
				if var28.onClose then
					if flagsModule.FoundationDialogAnimation and var56 and not var40 then
						var56(onCloseCallbackReasonModule.BackdropClick)
						
						return
					end
					var28.onClose(onCloseCallbackReasonModule.BackdropClick)
				end
			end,
			backgroundStyle = if flagsModule.FoundationDialogAnimation and not var40 and var48 then var48:map(function(p5) --[[ line: 312 ]]
				-- upvalues: var29 (ref)
				return {
					Color3 = var29.backdrop.backgroundStyle.Color3,
					Transparency = math.lerp(var29.backdrop.backgroundStyle.Transparency, 1, p5)
				}
			end) else var29.backdrop.backgroundStyle,
			testId = `{var28.testId}--backdrop`
		})
	else
		var71 = nil
	end
	t_4.Backdrop = var71
	t_4.DialogContentWrapper = reactModule.createElement(viewModule, {
		ZIndex = 2,
		ref = if flagsModule.FoundationDialogAnimation and not var40 then var62 else nil,
		Position = if flagsModule.FoundationDialogAnimation and not var40 and var52 then var52:map(function(p6) --[[ line: 334 ]]
			return UDim2.new(0.5, 0, 0.5, p6)
		end) else nil,
		sizeConstraint = if flagsModule.FoundationDialogAnimation and not var40 then { MaxSize = Vector2.new(var30 + SHADOW_SIZE * 2, 1e999) } else nil,
		tag = {
			["anchor-center-center size-full"] = flagsModule.FoundationDialogAnimation and not var40,
			["size-full"] = not flagsModule.FoundationDialogAnimation or var40
		},
		GroupTransparency = if flagsModule.FoundationDialogAnimation and not var40 and (var42 and var52) then var52:map(function(p7) --[[ line: 350 ]]
			-- upvalues: var41 (ref)
			return p7 / var41
		end) else nil
	}, if flagsModule.FoundationDialogAnimation and not var40 then nil else { DialogShadowWrapper = var63, Dialog = createElement })
	createElement_2 = createElement_2(viewModule, t_3, t_4)
	
	return if flagsModule.FoundationDialogAnimation and not var40 then reactModule.createElement(reactModule.Fragment, nil, {
		Main = if var28.disablePortal or var36 == nil then createElement_2 else reactRobloxModule.createPortal(createElement_2, var36),
		StableContent = if var58 then reactRobloxModule.createPortal(reactModule.createElement(reactModule.Fragment, nil, { DialogShadowWrapper = var63, Dialog = createElement }), var57) else nil
	}) elseif var28.disablePortal or var36 == nil then createElement_2 else reactRobloxModule.createPortal(createElement_2, var36)
end

return reactModule.memo(reactModule.forwardRef(function(p8, p9) --[[ line: 390 | named "DialogContainer" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), dialogProviderModule (ref), Dialog (ref), dashModule (ref)
	local var72 = withDefaultsModule(p8, t)
	
	return reactModule.createElement(dialogProviderModule, {
		size = var72.size,
		responsiveSize = var72.size,
		testId = var72.testId
	}, {
		Dialog = reactModule.createElement(Dialog, dashModule.assign({}, var72, { forwardRef = p9 }))
	})
end))