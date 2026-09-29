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
local isPointOverTrashTargetModule = require(momentsCreation.Utils.isPointOverTrashTarget)
local getFFlagMomentsCreationTextOverlayResolutionScaleModule = require(momentsCreation.Flags.GetFFlagMomentsCreationTextOverlayResolutionScale)
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
	-- upvalues: useSignalState (ref), getFFlagMomentsCreationTextOverlayResolutionScaleModule (ref), getScale (ref), useMemo (ref), signalsModule (ref), creationFlowStateModule (ref), useRef (ref), useBinding (ref), useOnScreenKeyboardHeightModule (ref), fFlagMomentsTextOverlayV2Redesign (ref), constantsModule (ref), fitTextOverlayFontSizeModule (ref), useCallback (ref), getFFlagMomentsStickerButton (ref), dashModule (ref), getFFlagEnableMomentTextGeneration (ref), fireAnalyticsEventModule (ref), eventNames (ref), makeCreationEventFieldsModule (ref), useDeviceInsets (ref), useAnimatedBinding (ref), useIsMultiTouchActive (ref), UIDragDetectorFixEventPositionEnabledEngineFeature (ref), guiService (ref), isPointOverTrashTargetModule (ref), reactOtterModule (ref), t (ref), useEffect (ref), makeTextOverlayEditsForEditorModule (ref), makeDefaultTextOverlayEditModule (ref), textService (ref), reactModule (ref), view (ref), foundationModule (ref), textOverlay (ref), getFFlagMomentsGenerateTextInTextOverlayModule (ref), GenerateTextButton (ref), verticalFontSizeSliderModule (ref), numberSequence (ref), textOverlayToolbarModule (ref), overlayDisplay (ref), textOverlayDisplay (ref), textOverlayTrashZoneModule (ref)
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
	local var13 = if fFlagMomentsTextOverlayV2Redesign then useMemo(function()
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
	local _ = nil
	local _ = nil
	local var20 = nil
	
	if fFlagMomentsTextOverlayV2Redesign then
		local var21 = useRef(false)
		local var22 = useRef(false)
		var20 = useRef(false)
		var18 = useCallback(function(p2)
			-- upvalues: controller (ref), dashModule (copy), var21 (write), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy)
			local textOverlays = controller.getComposedEdits(false).textOverlays
			local var23 = textOverlays and textOverlays[1]
			
			if var23 == nil then return end
			controller.updateCommittedEdit("text", { dashModule.joinDeep(var23, { scale = p2 }) })
			
			if not var21.current then
				var21.current = true
				fireAnalyticsEventModule(eventNames.EditingFlowTextOverlayRescaleUsed, makeCreationEventFieldsModule.makeTextOverlayEventFields())
			end
		end, { controller })
		var19 = useCallback(function(p2)
			-- upvalues: controller (ref), dashModule (copy), var22 (write), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy)
			local textOverlays = controller.getComposedEdits(false).textOverlays
			local var23 = textOverlays and textOverlays[1]
			
			if var23 == nil then return end
			controller.updateCommittedEdit("text", { dashModule.joinDeep(var23, { rotation = p2 }) })
			
			if not var22.current then
				var22.current = true
				fireAnalyticsEventModule(eventNames.EditingFlowTextOverlayRotateUsed, makeCreationEventFieldsModule.makeTextOverlayEventFields())
			end
		end, { controller })
	end
	local var23 = if fFlagMomentsTextOverlayV2Redesign then useDeviceInsets() else nil
	local var24 = useRef(nil)
	local var25 = useRef(false)
	local var26, var27 = useBinding(false)
	local var28, var29 = useAnimatedBinding(1)
	local var30, var31 = useAnimatedBinding(1)
	local var32 = if fFlagMomentsTextOverlayV2Redesign then useIsMultiTouchActive(var1 == creationFlowStateModule.Preview) else false
	local var33 = useCallback(function(p2)
		-- upvalues: var24 (ref), fFlagMomentsTextOverlayV2Redesign (copy), UIDragDetectorFixEventPositionEnabledEngineFeature (copy), var23 (write), guiService (copy), isPointOverTrashTargetModule (copy)
		local current = var24.current
		
		if current == nil then
			return false
		end
		local zero = Vector2.zero
		local var34 = 0
		
		if fFlagMomentsTextOverlayV2Redesign and not UIDragDetectorFixEventPositionEnabledEngineFeature and var23 ~= nil then
			zero = guiService:GetGuiInset() + Vector2.new(var23.left, var23.top)
		end
		if fFlagMomentsTextOverlayV2Redesign then
			var34 = 24
		end
		return isPointOverTrashTargetModule(p2, zero, current.AbsolutePosition, current.AbsoluteSize, var34)
	end, { var23 })
	local var34 = useCallback(function()
		-- upvalues: fFlagMomentsTextOverlayV2Redesign (copy), p1 (ref), var25 (ref), var29 (ref), reactOtterModule (copy), var31 (ref), var27 (ref), var20 (write), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy)
		if not fFlagMomentsTextOverlayV2Redesign then return end
		if p1.ctx.setIsOverlayDragging then
			p1.ctx.setIsOverlayDragging(true)
		end
		var25.current = false
		var29(reactOtterModule.instant(1))
		var31(reactOtterModule.instant(1))
		var27(true)
		
		if not var20.current then
			var20.current = true
			fireAnalyticsEventModule(eventNames.EditingFlowTextOverlayRepositionUsed, makeCreationEventFieldsModule.makeTextOverlayEventFields())
		end
	end, { p1.ctx, var29, var31, var27 })
	local var35 = useCallback(function(p2)
		-- upvalues: fFlagMomentsTextOverlayV2Redesign (copy), var33 (ref), var25 (ref), var29 (ref), reactOtterModule (copy), t (copy), var31 (ref)
		if not fFlagMomentsTextOverlayV2Redesign then return end
		local var36 = var33(p2)
		
		if var36 == var25.current then
			return
		end
		var25.current = var36
		var29(reactOtterModule.spring(if var36 then 1.15 else 1, t))
		var31(reactOtterModule.spring(if var36 then 0.45 else 1, t))
	end, { var33, var29, var31 })
	local var36 = useCallback(function(p2)
		-- upvalues: fFlagMomentsTextOverlayV2Redesign (copy), var17 (ref), p1 (ref), var25 (ref), var27 (ref), var29 (ref), reactOtterModule (copy), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), controller (ref), var31 (ref)
		if not fFlagMomentsTextOverlayV2Redesign then
			var17(p2)
			
			return
		elseif p1.ctx.setIsOverlayDragging then
			p1.ctx.setIsOverlayDragging(false)
		end
		local current = var25.current
		var25.current = false
		var27(false)
		var29(reactOtterModule.instant(1))
		
		if current then
			fireAnalyticsEventModule(eventNames.EditingFlowTextOverlayDeletedViaTrash, makeCreationEventFieldsModule.makeTextOverlayEventFields())
			controller.updateCommittedEdit("text", nil)
			
			return
		end
		var31(reactOtterModule.instant(1))
		var17(p2)
	end, {
		p1.ctx, controller, var17, var27, var29, var31
	})
	useEffect(function()
		-- upvalues: fFlagMomentsTextOverlayV2Redesign (copy), textOverlays (ref), var31 (ref), reactOtterModule (copy)
		if not fFlagMomentsTextOverlayV2Redesign then return end
		if textOverlays == nil or #textOverlays == 0 then
			var31(reactOtterModule.instant(1))
		end
	end, { textOverlays })
	
	if fFlagMomentsTextOverlayV2Redesign then
		useEffect(function()
			-- upvalues: fFlagMomentsTextOverlayV2Redesign (copy), var32 (write), var25 (ref), var27 (ref), var29 (ref), reactOtterModule (copy), var31 (ref), p1 (ref)
			if not fFlagMomentsTextOverlayV2Redesign or not var32 then return end
			var25.current = false
			var27(false)
			var29(reactOtterModule.instant(1))
			var31(reactOtterModule.instant(1))
			
			if p1.ctx.setIsOverlayDragging then
				p1.ctx.setIsOverlayDragging(false)
			end
		end, {
			var32,
			p1.ctx,
			var27,
			var29,
			var31
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
	local var37 = useRef(false)
	useEffect(function()
		-- upvalues: var7 (ref), var37 (ref), var9 (ref), var8 (ref), var14 (ref)
		if var7 then
			if var37.current or var9.current == nil or var8 == nil then
				return
			end
			var14()
			var37.current = true
			
			return
		else
			var37.current = false
			
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
	local var38 = not fFlagMomentsTextOverlayV2Redesign or var12 == 0
	
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
				additionalScale = if fFlagMomentsTextOverlayV2Redesign then var5 else nil,
				fitToContent = var12 == 0,
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
			VerticalFontSizeSlider = if fFlagMomentsTextOverlayV2Redesign and var38 then reactModule.createElement(verticalFontSizeSliderModule, { controller = controller, mediaHeight = var2.Y }) else nil,
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
	local var39 = var1 == creationFlowStateModule.Preview
	local var40 = var39 and not var32
	local var41 = fFlagMomentsTextOverlayV2Redesign and var39
	local var42 = fFlagMomentsTextOverlayV2Redesign and var39
	local var43 = if getFFlagMomentsStickerButton() then reactModule.createElement(overlayDisplay, {
		clampToBoundsEnabled = true,
		editable = false,
		draggable = var40,
		itemResolution = if var4 then var3 else nil,
		itemSize = var2,
		scaleType = Enum.ScaleType.Crop,
		onOverlayActivated = if var39 then var16 else nil,
		onOverlayDragBegin = if var39 then var34 else nil,
		onOverlayDragContinue = if var41 then var35 else nil,
		onOverlayDragEnd = if var39 then var36 else nil,
		onOverlayRotationChanged = if var42 then var19 else nil,
		onOverlayScaleChanged = if var42 then var18 else nil,
		overlayEdits = textOverlays,
		overlayComponent = textOverlay,
		selected = var42,
		visualScale = if var41 then var30 else nil,
		zIndex = p1.zIndex
	}) else reactModule.createElement(textOverlayDisplay, {
		clampToBoundsEnabled = true,
		editable = false,
		draggable = var40,
		itemResolution = if var4 then var3 else nil,
		itemSize = var2,
		scaleType = Enum.ScaleType.Crop,
		onTextOverlayActivated = if var39 then var16 else nil,
		onTextOverlayDragBegin = if var39 then var34 else nil,
		onTextOverlayDragContinue = if var41 then var35 else nil,
		onTextOverlayDragEnd = if var39 then var36 else nil,
		onTextOverlayRotationChanged = if var42 then var19 else nil,
		onTextOverlayScaleChanged = if var42 then var18 else nil,
		selected = var42,
		textOverlayEdits = textOverlays,
		visualScale = if var41 then var30 else nil,
		zIndex = p1.zIndex
	})
	
	return if var41 then reactModule.createElement(view, { tag = "size-full", ZIndex = p1.zIndex or 1 }, {
		Overlay = var43,
		TrashZone = reactModule.createElement(textOverlayTrashZoneModule, {
			highlightScale = var28,
			ref = var24,
			visible = var26,
			ZIndex = (p1.zIndex or 1) + 10
		})
	}) else var43
end