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
local fFlagMomentsTextOverlayV2Redesign = momentsCommonModule.Flags.FFlagMomentsTextOverlayV2Redesign
local eventNames = momentsCommonModule.Analytics.EventNames
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local makeCreationEventFieldsModule = require(momentsCreation.Analytics.makeCreationEventFields)
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
local computeEditorChipLayoutModule = require(momentsCreation.Utils.computeEditorChipLayout)
local isPointOverTrashTargetModule = require(momentsCreation.Utils.isPointOverTrashTarget)
local fFlagMomentsTextOverlayChipGrowAboveKeyboard = momentsCommonModule.Flags.FFlagMomentsTextOverlayChipGrowAboveKeyboard
local fFlagMomentsTextOverlayEdgeClipFix = momentsCommonModule.Flags.FFlagMomentsTextOverlayEdgeClipFix
local fFlagMomentsTextOverlayModalTextFixModule = require(momentsCreation.Flags.FFlagMomentsTextOverlayModalTextFix)
local verticalFontSizeSliderModule = require(momentsCreation.Components.TextOverlay.VerticalFontSizeSlider)
local textOverlayToolbarModule = require(momentsCreation.Components.TextOverlay.TextOverlayToolbar)
local t = { dampingRatio = 0.85, frequency = 12 }
local numberSequence = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(1, 0.2)
})

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
	-- upvalues: useSignalState (ref), getScale (ref), useMemo (ref), signalsModule (ref), creationFlowStateModule (ref), useRef (ref), useBinding (ref), useOnScreenKeyboardHeightModule (ref), fFlagMomentsTextOverlayModalTextFixModule (ref), fFlagMomentsTextOverlayV2Redesign (ref), constantsModule (ref), fFlagMomentsTextOverlayEdgeClipFix (ref), textService (ref), fitTextOverlayFontSizeModule (ref), useCallback (ref), getFFlagMomentsStickerButton (ref), dashModule (ref), getFFlagEnableMomentTextGeneration (ref), fireAnalyticsEventModule (ref), eventNames (ref), makeCreationEventFieldsModule (ref), useDeviceInsets (ref), useAnimatedBinding (ref), useIsMultiTouchActive (ref), UIDragDetectorFixEventPositionEnabledEngineFeature (ref), guiService (ref), isPointOverTrashTargetModule (ref), reactOtterModule (ref), t (ref), useEffect (ref), makeTextOverlayEditsForEditorModule (ref), makeDefaultTextOverlayEditModule (ref), fFlagMomentsTextOverlayChipGrowAboveKeyboard (ref), computeEditorChipLayoutModule (ref), reactModule (ref), view (ref), foundationModule (ref), textOverlay (ref), getFFlagMomentsGenerateTextInTextOverlayModule (ref), GenerateTextButton (ref), verticalFontSizeSliderModule (ref), numberSequence (ref), textOverlayToolbarModule (ref), overlayDisplay (ref), textOverlayDisplay (ref), textOverlayTrashZoneModule (ref)
	local controller = p1.controller
	local var1 = useSignalState(controller.getStep)
	local var2 = useSignalState(p1.ctx.getItemSize)
	local var3 = useSignalState(p1.ctx.getItemResolution)
	local textOverlays = useSignalState(controller.getComposedEdits).textOverlays
	local var4 = getScale(var2, var3, Enum.ScaleType.Crop)
	local var5 = useSignalState(useMemo(function()
		-- upvalues: signalsModule (copy), controller (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: controller (copy)
			local activeSession = controller.getActiveSession(p2)
			
			return if activeSession == nil then nil else activeSession.getDraft(p2)
		end)
	end, { controller }))
	local var6 = var1 == creationFlowStateModule.TextOverlay
	local var7 = var5 and var5[1]
	local var8 = useRef(nil)
	local var9 = useRef(nil)
	local var10, var11 = useBinding(UDim2.fromOffset(0, 0))
	local var12 = useOnScreenKeyboardHeightModule()
	local var13 = fFlagMomentsTextOverlayModalTextFixModule and (if fFlagMomentsTextOverlayModalTextFixModule then useSignalState(controller.getActiveModal) else nil) ~= nil
	local var14 = nil
	
	if fFlagMomentsTextOverlayModalTextFixModule then
		var14 = if fFlagMomentsTextOverlayV2Redesign and var4 > 0 then 1 / var4 else 1
	end
	local var15 = if fFlagMomentsTextOverlayV2Redesign then useMemo(function()
		-- upvalues: var7 (ref), constantsModule (copy), var12 (ref), var2 (ref), fFlagMomentsTextOverlayEdgeClipFix (copy), textService (copy), fitTextOverlayFontSizeModule (copy)
		if var7 == nil then
			return constantsModule.TextOverlay.DefaultFontSize
		end
		local fontSize = var7.textOverlayStyle.fontSize
		
		return if var12 > 0 then constantsModule.TextOverlay.DefaultFontSize else fitTextOverlayFontSizeModule(var7.text, var7.textOverlayStyle.font, fontSize, if fFlagMomentsTextOverlayEdgeClipFix then math.min(276 - (math.ceil(fontSize * 0.08) + math.ceil(textService:GetTextSize(" ", fontSize, var7.textOverlayStyle.font, Vector2.new(1000000, 1000000)).X) * 2), var2.X * 0.9) else math.min(300, var2.X * 0.9), var2.Y * 0.8, constantsModule.TextOverlay.MinFontSize)
	end, { var7, var12, var2 }) elseif var7 ~= nil then constantsModule.TextOverlay.DefaultFontSize else var7.textOverlayStyle.fontSize
	local var16 = useCallback(function()
		-- upvalues: var8 (ref)
		if var8.current then
			var8.current:CaptureFocus()
		end
	end, {})
	local var17 = useCallback(function()
		-- upvalues: var8 (ref)
		if var8.current then
			var8.current:ReleaseFocus()
		end
	end, {})
	local var18 = useCallback(function(p2)
		-- upvalues: controller (ref), getFFlagMomentsStickerButton (copy), dashModule (copy)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil then return end
		local draft = activeSession.getDraft(false)
		local var19 = draft and draft[1]
		
		if var19 == nil then return end
		local charCount = utf8.len(p2.Text)
		
		if charCount ~= nil and charCount >= 100 then
			local byteOffset = utf8.offset(p2.Text, 101)
			
			if not getFFlagMomentsStickerButton() then
				p2.Text = string.sub(p2.Text, 1, byteOffset - 1)
			elseif byteOffset then
				p2.Text = string.sub(p2.Text, 1, byteOffset - 1)
			end
		end
		activeSession.update({ dashModule.joinDeep(var19, { text = p2.Text }) })
	end, { controller })
	local var19 = useCallback(function()
		-- upvalues: getFFlagEnableMomentTextGeneration (copy), controller (ref)
		if getFFlagEnableMomentTextGeneration() and controller.getIsGenerating(false) then
			controller.onDisabledToolActivated("text")
			
			return
		end
		controller.beginTool("text")
	end, { controller })
	local var20 = useCallback(function(p2)
		-- upvalues: controller (ref)
		controller.updateCommittedEdit("text", p2)
	end, { controller })
	local var21 = nil
	local var22 = nil
	local _ = nil
	local _ = nil
	local var23 = nil
	
	if fFlagMomentsTextOverlayV2Redesign then
		local var24 = useRef(false)
		local var25 = useRef(false)
		var23 = useRef(false)
		var21 = useCallback(function(p2)
			-- upvalues: controller (ref), dashModule (copy), var24 (write), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy)
			local textOverlays = controller.getComposedEdits(false).textOverlays
			local var26 = textOverlays and textOverlays[1]
			
			if var26 == nil then return end
			controller.updateCommittedEdit("text", { dashModule.joinDeep(var26, { scale = p2 }) })
			
			if not var24.current then
				var24.current = true
				fireAnalyticsEventModule(eventNames.EditingFlowTextOverlayRescaleUsed, makeCreationEventFieldsModule.makeTextOverlayEventFields())
			end
		end, { controller })
		var22 = useCallback(function(p2)
			-- upvalues: controller (ref), dashModule (copy), var25 (write), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy)
			local textOverlays = controller.getComposedEdits(false).textOverlays
			local var26 = textOverlays and textOverlays[1]
			
			if var26 == nil then return end
			controller.updateCommittedEdit("text", { dashModule.joinDeep(var26, { rotation = p2 }) })
			
			if not var25.current then
				var25.current = true
				fireAnalyticsEventModule(eventNames.EditingFlowTextOverlayRotateUsed, makeCreationEventFieldsModule.makeTextOverlayEventFields())
			end
		end, { controller })
	end
	local var26 = if fFlagMomentsTextOverlayV2Redesign then useDeviceInsets() else nil
	local var27 = useRef(nil)
	local var28 = useRef(false)
	local var29, var30 = useBinding(false)
	local var31, var32 = useAnimatedBinding(1)
	local var33, var34 = useAnimatedBinding(1)
	local var35 = if fFlagMomentsTextOverlayV2Redesign then useIsMultiTouchActive(var1 == creationFlowStateModule.Preview) else false
	local var36 = useCallback(function(p2)
		-- upvalues: var27 (ref), fFlagMomentsTextOverlayV2Redesign (copy), UIDragDetectorFixEventPositionEnabledEngineFeature (copy), var26 (write), guiService (copy), isPointOverTrashTargetModule (copy)
		local current = var27.current
		
		if current == nil then
			return false
		end
		local zero = Vector2.zero
		local var37 = 0
		
		if fFlagMomentsTextOverlayV2Redesign and not UIDragDetectorFixEventPositionEnabledEngineFeature and var26 ~= nil then
			zero = guiService:GetGuiInset() + Vector2.new(var26.left, var26.top)
		end
		if fFlagMomentsTextOverlayV2Redesign then
			var37 = 24
		end
		return isPointOverTrashTargetModule(p2, zero, current.AbsolutePosition, current.AbsoluteSize, var37)
	end, { var26 })
	local var37 = useCallback(function()
		-- upvalues: fFlagMomentsTextOverlayV2Redesign (copy), p1 (ref), var28 (ref), var32 (ref), reactOtterModule (copy), var34 (ref), var30 (ref), var23 (write), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy)
		if not fFlagMomentsTextOverlayV2Redesign then return end
		if p1.ctx.setIsOverlayDragging then
			p1.ctx.setIsOverlayDragging(true)
		end
		var28.current = false
		var32(reactOtterModule.instant(1))
		var34(reactOtterModule.instant(1))
		var30(true)
		
		if not var23.current then
			var23.current = true
			fireAnalyticsEventModule(eventNames.EditingFlowTextOverlayRepositionUsed, makeCreationEventFieldsModule.makeTextOverlayEventFields())
		end
	end, { p1.ctx, var32, var34, var30 })
	local var38 = useCallback(function(p2)
		-- upvalues: fFlagMomentsTextOverlayV2Redesign (copy), var36 (ref), var28 (ref), var32 (ref), reactOtterModule (copy), t (copy), var34 (ref)
		if not fFlagMomentsTextOverlayV2Redesign then return end
		local var39 = var36(p2)
		
		if var39 == var28.current then
			return
		end
		var28.current = var39
		var32(reactOtterModule.spring(if var39 then 1.15 else 1, t))
		var34(reactOtterModule.spring(if var39 then 0.45 else 1, t))
	end, { var36, var32, var34 })
	local var39 = useCallback(function(p2)
		-- upvalues: fFlagMomentsTextOverlayV2Redesign (copy), var20 (ref), p1 (ref), var28 (ref), var30 (ref), var32 (ref), reactOtterModule (copy), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), controller (ref), var34 (ref)
		if not fFlagMomentsTextOverlayV2Redesign then
			var20(p2)
			
			return
		elseif p1.ctx.setIsOverlayDragging then
			p1.ctx.setIsOverlayDragging(false)
		end
		local current = var28.current
		var28.current = false
		var30(false)
		var32(reactOtterModule.instant(1))
		
		if current then
			fireAnalyticsEventModule(eventNames.EditingFlowTextOverlayDeletedViaTrash, makeCreationEventFieldsModule.makeTextOverlayEventFields())
			controller.updateCommittedEdit("text", nil)
			
			return
		end
		var34(reactOtterModule.instant(1))
		var20(p2)
	end, {
		p1.ctx, controller, var20, var30, var32, var34
	})
	useEffect(function()
		-- upvalues: fFlagMomentsTextOverlayV2Redesign (copy), textOverlays (ref), var34 (ref), reactOtterModule (copy)
		if not fFlagMomentsTextOverlayV2Redesign then return end
		if textOverlays == nil or #textOverlays == 0 then
			var34(reactOtterModule.instant(1))
		end
	end, { textOverlays })
	
	if fFlagMomentsTextOverlayV2Redesign then
		useEffect(function()
			-- upvalues: fFlagMomentsTextOverlayV2Redesign (copy), var35 (write), var28 (ref), var30 (ref), var32 (ref), reactOtterModule (copy), var34 (ref), p1 (ref)
			if not fFlagMomentsTextOverlayV2Redesign or not var35 then return end
			var28.current = false
			var30(false)
			var32(reactOtterModule.instant(1))
			var34(reactOtterModule.instant(1))
			
			if p1.ctx.setIsOverlayDragging then
				p1.ctx.setIsOverlayDragging(false)
			end
		end, {
			var35,
			p1.ctx,
			var30,
			var32,
			var34
		})
	end
	useEffect(function()
		-- upvalues: var6 (ref), controller (ref), makeTextOverlayEditsForEditorModule (copy), textOverlays (ref), makeDefaultTextOverlayEditModule (copy), var4 (ref)
		if not var6 then return end
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil or activeSession.getDraft(false) ~= nil then
			return
		end
		activeSession.update(makeTextOverlayEditsForEditorModule(textOverlays, makeDefaultTextOverlayEditModule(), var4))
	end, { var6, textOverlays, controller, var4 })
	local var40 = useRef(false)
	useEffect(function()
		-- upvalues: var6 (ref), var40 (ref), var8 (ref), var7 (ref), var16 (ref)
		if var6 then
			if var40.current or var8.current == nil or var7 == nil then
				return
			end
			var16()
			var40.current = true
			
			return
		else
			var40.current = false
			
			if var8.current then
				var8.current:ReleaseFocus()
			end
		end
	end, { var6, var7, var16 })
	
	if fFlagMomentsTextOverlayModalTextFixModule then
		local var41 = useRef(false)
		useEffect(function()
			-- upvalues: var8 (ref), var13 (ref), var41 (ref), var6 (ref), var16 (ref)
			local current = var8.current
			
			if var13 then
				if current == nil or not current:IsFocused() then
					return
				else
					var41.current = true
					current:ReleaseFocus()
					
					return
				end
			elseif var41.current then
				var41.current = false
				
				if var6 then
					var16()
				end
			end
		end, { var13, var6, var16 })
	end
	useEffect(function()
		-- upvalues: var6 (ref), var7 (ref), fFlagMomentsTextOverlayV2Redesign (copy), fFlagMomentsTextOverlayChipGrowAboveKeyboard (copy), var12 (ref), var11 (ref), textService (copy), var15 (write), var2 (ref)
		if not var6 or var7 == nil then return end
		if fFlagMomentsTextOverlayV2Redesign and fFlagMomentsTextOverlayChipGrowAboveKeyboard then return end
		if var12 == 0 then
			var11(UDim2.fromOffset(0, 0))
			
			return
		end
		local wTextSize = textService:GetTextSize("W", var15, var7.textOverlayStyle.font, Vector2.new(var2.X, var2.Y))
		var11(UDim2.fromOffset(math.min(wTextSize.X * 30, var2.X / 2), math.min(wTextSize.Y * 5, var2.Y / 2)))
	end, {
		var6,
		var7,
		var15,
		var12,
		var2
	})
	local var42 = not fFlagMomentsTextOverlayV2Redesign or var12 == 0
	
	if var6 then
		if var7 == nil then
			return nil
		end
		local size = nil
		local uDim2 = UDim2.fromScale(0.5, 0.5)
		local var43 = var15
		local var44 = fFlagMomentsTextOverlayV2Redesign and (fFlagMomentsTextOverlayChipGrowAboveKeyboard and var12 > 0)
		
		if var44 then
			local currentCamera = workspace.CurrentCamera
			local var45 = computeEditorChipLayoutModule({
				maxChipWidth = 300,
				keyboardGap = 48,
				topMargin = 48,
				chipPadding = 12,
				text = var7.text,
				font = var7.textOverlayStyle.font,
				itemWidth = var2.X,
				viewportHeight = if currentCamera then currentCamera.ViewportSize.Y else var2.Y,
				keyboardHeight = var12,
				layerTopY = if var9.current then var9.current.AbsolutePosition.Y else 0
			})
			var43 = var45.fontSize
			size = var45.size
			uDim2 = var45.position
		end
		return reactModule.createElement(view, {
			tag = "size-full bg-over-media-0",
			onActivated = if fFlagMomentsTextOverlayV2Redesign and fFlagMomentsTextOverlayChipGrowAboveKeyboard then var17 else nil,
			ref = var9,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			ZIndex = p1.zIndex or 1
		}, {
			TextOverlay = reactModule.createElement(textOverlay, {
				editable = true,
				additionalScale = if fFlagMomentsTextOverlayV2Redesign then var4 else nil,
				fitToContent = var12 == 0,
				onActivated = var16,
				size = if var44 then size else var10,
				textOverlayEdit = dashModule.joinDeep(var7, {
					rotation = 0,
					position = uDim2,
					scale = var14,
					textOverlayStyle = { fontSize = var43 }
				}),
				onTextChanged = var18,
				textBoxRef = var8,
				textVisible = if var13 then false else nil
			}),
			GenerateText = if getFFlagMomentsGenerateTextInTextOverlayModule() and controller.getCanGenerateText(false) then reactModule.createElement(GenerateTextButton, { controller = controller }) else nil,
			VerticalFontSizeSlider = if fFlagMomentsTextOverlayV2Redesign and var42 then reactModule.createElement(verticalFontSizeSliderModule, { controller = controller, mediaHeight = var2.Y }) else nil,
			BottomScrim = if fFlagMomentsTextOverlayV2Redesign then reactModule.createElement(view, {
				ZIndex = 5,
				tag = "position-bottom-center anchor-bottom-center",
				Size = UDim2.new(1, 0, 0, 200),
				backgroundStyle = { Color3 = Color3.new(0, 0, 0) }
			}, {
				UIGradient = reactModule.createElement("UIGradient", { Rotation = 90, Transparency = numberSequence })
			}) else nil,
			TextOverlayToolbar = if fFlagMomentsTextOverlayV2Redesign then reactModule.createElement(textOverlayToolbarModule, { controller = controller, isKeyboardVisible = var12 > 0 }) else nil
		})
	elseif textOverlays == nil or #textOverlays == 0 then
		return nil
	end
	local var46 = var1 == creationFlowStateModule.Preview
	local var47 = var46 and not var35
	local var48 = fFlagMomentsTextOverlayV2Redesign and var46
	local var49 = fFlagMomentsTextOverlayV2Redesign and var46
	local var50 = if getFFlagMomentsStickerButton() then reactModule.createElement(overlayDisplay, {
		clampToBoundsEnabled = true,
		editable = false,
		draggable = var47,
		itemResolution = var3,
		itemSize = var2,
		scaleType = Enum.ScaleType.Crop,
		onOverlayActivated = if var46 then var19 else nil,
		onOverlayDragBegin = if var46 then var37 else nil,
		onOverlayDragContinue = if var48 then var38 else nil,
		onOverlayDragEnd = if var46 then var39 else nil,
		onOverlayRotationChanged = if var49 then var22 else nil,
		onOverlayScaleChanged = if var49 then var21 else nil,
		overlayEdits = textOverlays,
		overlayComponent = textOverlay,
		selected = var49,
		visualScale = if var48 then var33 else nil,
		zIndex = p1.zIndex
	}) else reactModule.createElement(textOverlayDisplay, {
		clampToBoundsEnabled = true,
		editable = false,
		draggable = var47,
		itemResolution = var3,
		itemSize = var2,
		scaleType = Enum.ScaleType.Crop,
		onTextOverlayActivated = if var46 then var19 else nil,
		onTextOverlayDragBegin = if var46 then var37 else nil,
		onTextOverlayDragContinue = if var48 then var38 else nil,
		onTextOverlayDragEnd = if var46 then var39 else nil,
		onTextOverlayRotationChanged = if var49 then var22 else nil,
		onTextOverlayScaleChanged = if var49 then var21 else nil,
		selected = var49,
		textOverlayEdits = textOverlays,
		visualScale = if var48 then var33 else nil,
		zIndex = p1.zIndex
	})
	
	return if var48 then reactModule.createElement(view, { tag = "size-full", ZIndex = p1.zIndex or 1 }, {
		Overlay = var50,
		TrashZone = reactModule.createElement(textOverlayTrashZoneModule, {
			highlightScale = var31,
			ref = var27,
			visible = var29,
			ZIndex = (p1.zIndex or 1) + 10
		})
	}) else var50
end