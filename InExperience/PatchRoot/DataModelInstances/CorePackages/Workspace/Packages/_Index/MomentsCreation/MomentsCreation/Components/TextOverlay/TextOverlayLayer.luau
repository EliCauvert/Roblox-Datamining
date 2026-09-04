local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local guiService = game:GetService("GuiService")
local textService = game:GetService("TextService")
local UIDragDetectorFixEventPositionEnabledEngineFeature = game:GetEngineFeature("UIDragDetectorFixEventPositionEnabled")
local button = foundationModule.Button
local view = foundationModule.View
local useAnimatedBinding = reactOtterModule.useAnimatedBinding
local useBinding = reactModule.useBinding
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useMemo = reactModule.useMemo
local useRef = reactModule.useRef
local useSignalState = signalsReactModule.useSignalState
local useTokens = foundationModule.Hooks.useTokens
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useIsMultiTouchActive = momentsCommonModule.Hooks.useIsMultiTouchActive
local overlayDisplay = momentsCommonModule.Components.OverlayDisplay
local textOverlay = momentsCommonModule.Components.TextOverlay
local textOverlayDisplay = momentsCommonModule.Components.TextOverlayDisplay
local getScale = momentsCommonModule.Utils.getScale
local getFFlagMomentsStickerButton = momentsCommonModule.Flags.GetFFlagMomentsStickerButton
local getFFlagEnableMomentTextGeneration = momentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration
local fFlagMomentsTextOverlayPreviewTransform = momentsCommonModule.Flags.FFlagMomentsTextOverlayPreviewTransform
local creationFlowStateModule = require(momentsCreation.Enums.CreationFlowState)
local constantsModule = require(momentsCreation.Constants)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local _ = require(parent.MomentsTypes)
local textOverlayTrashZoneModule = require(momentsCreation.Components.TextOverlay.TextOverlayTrashZone)
local useOnScreenKeyboardHeightModule = require(momentsCreation.Hooks.useOnScreenKeyboardHeight)
local useCreationFlowStringsModule = require(momentsCreation.Hooks.useCreationFlowStrings)
local getFFlagMomentsGenerateTextInTextOverlayModule = require(momentsCreation.Flags.GetFFlagMomentsGenerateTextInTextOverlay)
local makeDefaultTextOverlayEditModule = require(momentsCreation.Utils.makeDefaultTextOverlayEdit)
local makeTextOverlayEditsForEditorModule = require(momentsCreation.Utils.makeTextOverlayEditsForEditor)
local fitTextOverlayFontSizeModule = require(momentsCreation.Utils.fitTextOverlayFontSize)
local isPointOverTrashTargetModule = require(momentsCreation.Utils.isPointOverTrashTarget)
local getFFlagMomentsTextOverlayClampToBoundsModule = require(momentsCreation.Flags.GetFFlagMomentsTextOverlayClampToBounds)
local getFFlagMomentsCreationTextOverlayResolutionScaleModule = require(momentsCreation.Flags.GetFFlagMomentsCreationTextOverlayResolutionScale)
local getFFlagMomentsTextVerticalSizeSliderModule = require(momentsCreation.Flags.GetFFlagMomentsTextVerticalSizeSlider)
local verticalFontSizeSliderModule = require(momentsCreation.Components.TextOverlay.VerticalFontSizeSlider)
local getFFlagMomentsTextDragToDeleteModule = require(momentsCreation.Flags.GetFFlagMomentsTextDragToDelete)
local t = { dampingRatio = 0.85, frequency = 12 }

local function GenerateTextButton(p1)
	-- upvalues: useTokens (ref), useCreationFlowStringsModule (ref), useSignalState (ref), useCallback (ref), reactModule (ref), view (ref), button (ref), foundationModule (ref), builderIconsModule (ref)
	local controller = p1.controller
	local var1 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "position-bottom-right anchor-bottom-right auto-xy",
		ZIndex = 10,
		padding = {
			bottom = UDim.new(0, var1.Padding.Large),
			right = UDim.new(0, var1.Padding.Large)
		}
	}, {
		Button = reactModule.createElement(button, {
			fillBehavior = foundationModule.Enums.FillBehavior.Fit,
			icon = builderIconsModule.Icon.TagSparkle,
			text = useCreationFlowStringsModule().GenerateTextCta,
			variant = foundationModule.Enums.ButtonVariant.Emphasis,
			onActivated = useCallback(function()
				-- upvalues: controller (ref)
				controller.beginTool("generateText")
			end, { controller }),
			isLoading = useSignalState(controller.getIsGenerating),
			size = foundationModule.Enums.InputSize.Medium
		})
	})
end

return function(p1)
	-- upvalues: useSignalState (ref), getFFlagMomentsCreationTextOverlayResolutionScaleModule (ref), getScale (ref), useMemo (ref), signalsModule (ref), creationFlowStateModule (ref), useRef (ref), useBinding (ref), useOnScreenKeyboardHeightModule (ref), fFlagMomentsTextOverlayPreviewTransform (ref), constantsModule (ref), fitTextOverlayFontSizeModule (ref), useCallback (ref), getFFlagMomentsStickerButton (ref), dashModule (ref), getFFlagEnableMomentTextGeneration (ref), useDeviceInsets (ref), useAnimatedBinding (ref), useIsMultiTouchActive (ref), UIDragDetectorFixEventPositionEnabledEngineFeature (ref), guiService (ref), isPointOverTrashTargetModule (ref), getFFlagMomentsTextDragToDeleteModule (ref), reactOtterModule (ref), t (ref), useEffect (ref), makeTextOverlayEditsForEditorModule (ref), makeDefaultTextOverlayEditModule (ref), textService (ref), reactModule (ref), view (ref), foundationModule (ref), textOverlay (ref), getFFlagMomentsGenerateTextInTextOverlayModule (ref), GenerateTextButton (ref), getFFlagMomentsTextVerticalSizeSliderModule (ref), verticalFontSizeSliderModule (ref), overlayDisplay (ref), getFFlagMomentsTextOverlayClampToBoundsModule (ref), textOverlayDisplay (ref), textOverlayTrashZoneModule (ref)
	local controller = p1.controller
	local var1 = useSignalState(controller.getStep)
	local var2 = useSignalState(p1.ctx.getItemSize)
	local var3 = useSignalState(p1.ctx.getItemResolution)
	local textOverlays = useSignalState(controller.getComposedEdits).textOverlays
	local var4 = getFFlagMomentsCreationTextOverlayResolutionScaleModule()
	local var5 = if var4 then getScale(var2, var3, Enum.ScaleType.Crop) else 1
	local var6 = useSignalState(useMemo(function()
		-- upvalues: signalsModule (copy), controller (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: controller (copy)
			local activeSession = controller.getActiveSession(p2)
			
			return if activeSession == nil then nil else activeSession.getDraft(p2)
		end)
	end, { controller }))
	local var7 = var1 == creationFlowStateModule.TextOverlay
	local var8 = var6 and var6[1]
	local var9 = useRef(nil)
	local var10, var11 = useBinding(UDim2.fromOffset(0, 0))
	local var12 = useOnScreenKeyboardHeightModule()
	local var13 = if fFlagMomentsTextOverlayPreviewTransform then useMemo(function()
		-- upvalues: var8 (ref), constantsModule (copy), var12 (ref), var2 (ref), fitTextOverlayFontSizeModule (copy)
		return if var8 == nil then constantsModule.TextOverlay.DefaultFontSize elseif var12 > 0 then constantsModule.TextOverlay.DefaultFontSize else fitTextOverlayFontSizeModule(var8.text, var8.textOverlayStyle.font, var8.textOverlayStyle.fontSize, math.min(300, var2.X * 0.9), var2.Y * 0.8, constantsModule.TextOverlay.MinFontSize)
	end, { var8, var12, var2 }) elseif var8 ~= nil then constantsModule.TextOverlay.DefaultFontSize else var8.textOverlayStyle.fontSize
	local var14 = useCallback(function()
		-- upvalues: var9 (ref)
		if var9.current then
			var9.current:CaptureFocus()
		end
	end, {})
	local var15 = useCallback(function(p2)
		-- upvalues: controller (ref), getFFlagMomentsStickerButton (copy), dashModule (copy)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil then return end
		local draft = activeSession.getDraft(false)
		local var16 = draft and draft[1]
		
		if var16 == nil then return end
		local charCount = utf8.len(p2.Text)
		
		if charCount ~= nil and charCount >= 100 then
			local byteOffset = utf8.offset(p2.Text, 101)
			
			if not getFFlagMomentsStickerButton() then
				p2.Text = string.sub(p2.Text, 1, byteOffset - 1)
			elseif byteOffset then
				p2.Text = string.sub(p2.Text, 1, byteOffset - 1)
			end
		end
		activeSession.update({ dashModule.joinDeep(var16, { text = p2.Text }) })
	end, { controller })
	local var16 = useCallback(function()
		-- upvalues: getFFlagEnableMomentTextGeneration (copy), controller (ref)
		if getFFlagEnableMomentTextGeneration() and controller.getIsGenerating(false) then
			controller.onDisabledToolActivated("text")
			
			return
		end
		controller.beginTool("text")
	end, { controller })
	local var17 = useCallback(function(p2)
		-- upvalues: controller (ref)
		controller.updateCommittedEdit("text", p2)
	end, { controller })
	local var18 = nil
	local var19 = nil
	
	if fFlagMomentsTextOverlayPreviewTransform then
		var18 = useCallback(function(p2)
			-- upvalues: controller (ref), dashModule (copy)
			local textOverlays = controller.getComposedEdits(false).textOverlays
			local var20 = textOverlays and textOverlays[1]
			
			if var20 == nil then
				return
			end
			controller.updateCommittedEdit("text", { dashModule.joinDeep(var20, { scale = p2 }) })
		end, { controller })
		var19 = useCallback(function(p2)
			-- upvalues: controller (ref), dashModule (copy)
			local textOverlays = controller.getComposedEdits(false).textOverlays
			local var20 = textOverlays and textOverlays[1]
			
			if var20 == nil then
				return
			end
			controller.updateCommittedEdit("text", { dashModule.joinDeep(var20, { rotation = p2 }) })
		end, { controller })
	end
	local var20 = if fFlagMomentsTextOverlayPreviewTransform then useDeviceInsets() else nil
	local var21 = useRef(nil)
	local var22 = useRef(false)
	local var23, var24 = useBinding(false)
	local var25, var26 = useAnimatedBinding(1)
	local var27, var28 = useAnimatedBinding(1)
	local var29 = if fFlagMomentsTextOverlayPreviewTransform then useIsMultiTouchActive(var1 == creationFlowStateModule.Preview) else false
	local var30 = useCallback(function(p2)
		-- upvalues: var21 (ref), fFlagMomentsTextOverlayPreviewTransform (copy), UIDragDetectorFixEventPositionEnabledEngineFeature (copy), var20 (write), guiService (copy), isPointOverTrashTargetModule (copy)
		local current = var21.current
		
		if current == nil then
			return false
		end
		local zero = Vector2.zero
		local var31 = 0
		
		if fFlagMomentsTextOverlayPreviewTransform and not UIDragDetectorFixEventPositionEnabledEngineFeature and var20 ~= nil then
			zero = guiService:GetGuiInset() + Vector2.new(var20.left, var20.top)
		end
		if fFlagMomentsTextOverlayPreviewTransform then
			var31 = 24
		end
		return isPointOverTrashTargetModule(p2, zero, current.AbsolutePosition, current.AbsoluteSize, var31)
	end, { var20 })
	local var31 = useCallback(function()
		-- upvalues: getFFlagMomentsTextDragToDeleteModule (copy), p1 (ref), var22 (ref), var26 (ref), reactOtterModule (copy), var28 (ref), var24 (ref)
		if not getFFlagMomentsTextDragToDeleteModule() then return end
		if p1.ctx.setIsOverlayDragging then
			p1.ctx.setIsOverlayDragging(true)
		end
		var22.current = false
		var26(reactOtterModule.instant(1))
		var28(reactOtterModule.instant(1))
		var24(true)
	end, { p1.ctx, var26, var28, var24 })
	local var32 = useCallback(function(p2)
		-- upvalues: getFFlagMomentsTextDragToDeleteModule (copy), var30 (ref), var22 (ref), var26 (ref), reactOtterModule (copy), t (copy), var28 (ref)
		if not getFFlagMomentsTextDragToDeleteModule() then return end
		local var33 = var30(p2)
		
		if var33 == var22.current then
			return
		end
		var22.current = var33
		var26(reactOtterModule.spring(if var33 then 1.15 else 1, t))
		var28(reactOtterModule.spring(if var33 then 0.45 else 1, t))
	end, { var30, var26, var28 })
	local var33 = useCallback(function(p2)
		-- upvalues: getFFlagMomentsTextDragToDeleteModule (copy), var17 (ref), p1 (ref), var22 (ref), var24 (ref), var26 (ref), reactOtterModule (copy), controller (ref), var28 (ref)
		if not getFFlagMomentsTextDragToDeleteModule() then
			var17(p2)
			
			return
		elseif p1.ctx.setIsOverlayDragging then
			p1.ctx.setIsOverlayDragging(false)
		end
		local current = var22.current
		var22.current = false
		var24(false)
		var26(reactOtterModule.instant(1))
		
		if current then
			controller.updateCommittedEdit("text", nil)
			
			return
		end
		var28(reactOtterModule.instant(1))
		var17(p2)
	end, {
		p1.ctx, controller, var17, var24, var26, var28
	})
	useEffect(function()
		-- upvalues: getFFlagMomentsTextDragToDeleteModule (copy), textOverlays (ref), var28 (ref), reactOtterModule (copy)
		if not getFFlagMomentsTextDragToDeleteModule() then return end
		if textOverlays == nil or #textOverlays == 0 then
			var28(reactOtterModule.instant(1))
		end
	end, { textOverlays })
	
	if fFlagMomentsTextOverlayPreviewTransform then
		useEffect(function()
			-- upvalues: getFFlagMomentsTextDragToDeleteModule (copy), var29 (write), var22 (ref), var24 (ref), var26 (ref), reactOtterModule (copy), var28 (ref), p1 (ref)
			if not getFFlagMomentsTextDragToDeleteModule() or not var29 then return end
			var22.current = false
			var24(false)
			var26(reactOtterModule.instant(1))
			var28(reactOtterModule.instant(1))
			
			if p1.ctx.setIsOverlayDragging then
				p1.ctx.setIsOverlayDragging(false)
			end
		end, {
			var29,
			p1.ctx,
			var24,
			var26,
			var28
		})
	end
	useEffect(function()
		-- upvalues: var7 (ref), controller (ref), makeTextOverlayEditsForEditorModule (copy), textOverlays (ref), makeDefaultTextOverlayEditModule (copy), var5 (ref)
		if not var7 then return end
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil or activeSession.getDraft(false) ~= nil then
			return
		end
		activeSession.update(makeTextOverlayEditsForEditorModule(textOverlays, makeDefaultTextOverlayEditModule(), var5))
	end, { var7, textOverlays, controller, var5 })
	local var34 = useRef(false)
	useEffect(function()
		-- upvalues: var7 (ref), var34 (ref), var9 (ref), var8 (ref), var14 (ref)
		if var7 then
			if var34.current or var9.current == nil or var8 == nil then
				return
			end
			var14()
			var34.current = true
			
			return
		else
			var34.current = false
			
			if var9.current then
				var9.current:ReleaseFocus()
			end
		end
	end, { var7, var8, var14 })
	useEffect(function()
		-- upvalues: var7 (ref), var8 (ref), var12 (ref), var11 (ref), textService (copy), var13 (write), var2 (ref)
		if not var7 or var8 == nil then return end
		if var12 == 0 then
			var11(UDim2.fromOffset(0, 0))
			
			return
		end
		local wTextSize = textService:GetTextSize("W", var13, var8.textOverlayStyle.font, Vector2.new(var2.X, var2.Y))
		var11(UDim2.fromOffset(math.min(wTextSize.X * 30, var2.X / 2), math.min(wTextSize.Y * 5, var2.Y / 2)))
	end, {
		var7,
		var8,
		var13,
		var12,
		var2
	})
	local var35 = not fFlagMomentsTextOverlayPreviewTransform or var12 == 0
	
	if var7 then
		return if var8 == nil then nil else reactModule.createElement(view, {
			tag = "size-full bg-over-media-0",
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			ZIndex = p1.zIndex or 1
		}, {
			TextOverlay = reactModule.createElement(textOverlay, {
				editable = true,
				additionalScale = if fFlagMomentsTextOverlayPreviewTransform then var5 else nil,
				onActivated = var14,
				size = var10,
				textOverlayEdit = dashModule.joinDeep(var8, {
					rotation = 0,
					position = UDim2.fromScale(0.5, 0.5),
					textOverlayStyle = { fontSize = var13 }
				}),
				onTextChanged = var15,
				textBoxRef = var9
			}),
			GenerateText = if getFFlagMomentsGenerateTextInTextOverlayModule() and controller.getCanGenerateText(false) then reactModule.createElement(GenerateTextButton, { controller = controller }) else nil,
			VerticalFontSizeSlider = if getFFlagMomentsTextVerticalSizeSliderModule() and var35 then reactModule.createElement(verticalFontSizeSliderModule, { controller = controller, mediaHeight = var2.Y }) else nil
		})
	elseif textOverlays == nil or #textOverlays == 0 then
		return nil
	end
	local var36 = var1 == creationFlowStateModule.Preview
	local var37 = var36 and not var29
	local var38 = getFFlagMomentsTextDragToDeleteModule() and var36
	local var39 = fFlagMomentsTextOverlayPreviewTransform and var36
	local var40 = if getFFlagMomentsStickerButton() then reactModule.createElement(overlayDisplay, {
		editable = false,
		clampToBoundsEnabled = getFFlagMomentsTextOverlayClampToBoundsModule(),
		draggable = var37,
		itemResolution = if var4 then var3 else nil,
		itemSize = var2,
		scaleType = Enum.ScaleType.Crop,
		onOverlayActivated = if var36 then var16 else nil,
		onOverlayDragBegin = if var36 then var31 else nil,
		onOverlayDragContinue = if var38 then var32 else nil,
		onOverlayDragEnd = if var36 then var33 else nil,
		onOverlayRotationChanged = if var39 then var19 else nil,
		onOverlayScaleChanged = if var39 then var18 else nil,
		overlayEdits = textOverlays,
		overlayComponent = textOverlay,
		selected = var39,
		visualScale = if var38 then var27 else nil,
		zIndex = p1.zIndex
	}) else reactModule.createElement(textOverlayDisplay, {
		editable = false,
		clampToBoundsEnabled = getFFlagMomentsTextOverlayClampToBoundsModule(),
		draggable = var37,
		itemResolution = if var4 then var3 else nil,
		itemSize = var2,
		scaleType = Enum.ScaleType.Crop,
		onTextOverlayActivated = if var36 then var16 else nil,
		onTextOverlayDragBegin = if var36 then var31 else nil,
		onTextOverlayDragContinue = if var38 then var32 else nil,
		onTextOverlayDragEnd = if var36 then var33 else nil,
		onTextOverlayRotationChanged = if var39 then var19 else nil,
		onTextOverlayScaleChanged = if var39 then var18 else nil,
		selected = var39,
		textOverlayEdits = textOverlays,
		visualScale = if var38 then var27 else nil,
		zIndex = p1.zIndex
	})
	
	return if var38 then reactModule.createElement(view, { tag = "size-full", ZIndex = p1.zIndex or 1 }, {
		Overlay = var40,
		TrashZone = reactModule.createElement(textOverlayTrashZoneModule, {
			highlightScale = var25,
			ref = var21,
			visible = var23,
			ZIndex = (p1.zIndex or 1) + 10
		})
	}) else var40
end