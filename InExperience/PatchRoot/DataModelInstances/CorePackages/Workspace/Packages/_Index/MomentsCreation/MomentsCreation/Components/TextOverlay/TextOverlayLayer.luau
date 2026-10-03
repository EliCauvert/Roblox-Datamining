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
	-- upvalues: useSignalState (ref), getScale (ref), useMemo (ref), signalsModule (ref), creationFlowStateModule (ref), useRef (ref), useBinding (ref), useOnScreenKeyboardHeightModule (ref), fFlagMomentsTextOverlayV2Redesign (ref), constantsModule (ref), fitTextOverlayFontSizeModule (ref), useCallback (ref), getFFlagMomentsStickerButton (ref), dashModule (ref), getFFlagEnableMomentTextGeneration (ref), fireAnalyticsEventModule (ref), eventNames (ref), makeCreationEventFieldsModule (ref), useDeviceInsets (ref), useAnimatedBinding (ref), useIsMultiTouchActive (ref), UIDragDetectorFixEventPositionEnabledEngineFeature (ref), guiService (ref), isPointOverTrashTargetModule (ref), reactOtterModule (ref), t (ref), useEffect (ref), makeTextOverlayEditsForEditorModule (ref), makeDefaultTextOverlayEditModule (ref), textService (ref), reactModule (ref), view (ref), foundationModule (ref), textOverlay (ref), getFFlagMomentsGenerateTextInTextOverlayModule (ref), GenerateTextButton (ref), verticalFontSizeSliderModule (ref), numberSequence (ref), textOverlayToolbarModule (ref), overlayDisplay (ref), textOverlayDisplay (ref), textOverlayTrashZoneModule (ref)
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
	local var9, var10 = useBinding(UDim2.fromOffset(0, 0))
	local var11 = useOnScreenKeyboardHeightModule()
	local var12 = if fFlagMomentsTextOverlayV2Redesign then useMemo(function()
		-- upvalues: var7 (ref), constantsModule (copy), var11 (ref), var2 (ref), fitTextOverlayFontSizeModule (copy)
		return if var7 == nil then constantsModule.TextOverlay.DefaultFontSize elseif var11 > 0 then constantsModule.TextOverlay.DefaultFontSize else fitTextOverlayFontSizeModule(var7.text, var7.textOverlayStyle.font, var7.textOverlayStyle.fontSize, math.min(300, var2.X * 0.9), var2.Y * 0.8, constantsModule.TextOverlay.MinFontSize)
	end, { var7, var11, var2 }) elseif var7 ~= nil then constantsModule.TextOverlay.DefaultFontSize else var7.textOverlayStyle.fontSize
	local var13 = useCallback(function()
		-- upvalues: var8 (ref)
		if var8.current then
			var8.current:CaptureFocus()
		end
	end, {})
	local var14 = useCallback(function(p2)
		-- upvalues: controller (ref), getFFlagMomentsStickerButton (copy), dashModule (copy)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil then return end
		local draft = activeSession.getDraft(false)
		local var15 = draft and draft[1]
		
		if var15 == nil then return end
		local charCount = utf8.len(p2.Text)
		
		if charCount ~= nil and charCount >= 100 then
			local byteOffset = utf8.offset(p2.Text, 101)
			
			if not getFFlagMomentsStickerButton() then
				p2.Text = string.sub(p2.Text, 1, byteOffset - 1)
			elseif byteOffset then
				p2.Text = string.sub(p2.Text, 1, byteOffset - 1)
			end
		end
		activeSession.update({ dashModule.joinDeep(var15, { text = p2.Text }) })
	end, { controller })
	local var15 = useCallback(function()
		-- upvalues: getFFlagEnableMomentTextGeneration (copy), controller (ref)
		if getFFlagEnableMomentTextGeneration() and controller.getIsGenerating(false) then
			controller.onDisabledToolActivated("text")
			
			return
		end
		controller.beginTool("text")
	end, { controller })
	local var16 = useCallback(function(p2)
		-- upvalues: controller (ref)
		controller.updateCommittedEdit("text", p2)
	end, { controller })
	local var17 = nil
	local var18 = nil
	local _ = nil
	local _ = nil
	local var19 = nil
	
	if fFlagMomentsTextOverlayV2Redesign then
		local var20 = useRef(false)
		local var21 = useRef(false)
		var19 = useRef(false)
		var17 = useCallback(function(p2)
			-- upvalues: controller (ref), dashModule (copy), var20 (write), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy)
			local textOverlays = controller.getComposedEdits(false).textOverlays
			local var22 = textOverlays and textOverlays[1]
			
			if var22 == nil then return end
			controller.updateCommittedEdit("text", { dashModule.joinDeep(var22, { scale = p2 }) })
			
			if not var20.current then
				var20.current = true
				fireAnalyticsEventModule(eventNames.EditingFlowTextOverlayRescaleUsed, makeCreationEventFieldsModule.makeTextOverlayEventFields())
			end
		end, { controller })
		var18 = useCallback(function(p2)
			-- upvalues: controller (ref), dashModule (copy), var21 (write), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy)
			local textOverlays = controller.getComposedEdits(false).textOverlays
			local var22 = textOverlays and textOverlays[1]
			
			if var22 == nil then return end
			controller.updateCommittedEdit("text", { dashModule.joinDeep(var22, { rotation = p2 }) })
			
			if not var21.current then
				var21.current = true
				fireAnalyticsEventModule(eventNames.EditingFlowTextOverlayRotateUsed, makeCreationEventFieldsModule.makeTextOverlayEventFields())
			end
		end, { controller })
	end
	local var22 = if fFlagMomentsTextOverlayV2Redesign then useDeviceInsets() else nil
	local var23 = useRef(nil)
	local var24 = useRef(false)
	local var25, var26 = useBinding(false)
	local var27, var28 = useAnimatedBinding(1)
	local var29, var30 = useAnimatedBinding(1)
	local var31 = if fFlagMomentsTextOverlayV2Redesign then useIsMultiTouchActive(var1 == creationFlowStateModule.Preview) else false
	local var32 = useCallback(function(p2)
		-- upvalues: var23 (ref), fFlagMomentsTextOverlayV2Redesign (copy), UIDragDetectorFixEventPositionEnabledEngineFeature (copy), var22 (write), guiService (copy), isPointOverTrashTargetModule (copy)
		local current = var23.current
		
		if current == nil then
			return false
		end
		local zero = Vector2.zero
		local var33 = 0
		
		if fFlagMomentsTextOverlayV2Redesign and not UIDragDetectorFixEventPositionEnabledEngineFeature and var22 ~= nil then
			zero = guiService:GetGuiInset() + Vector2.new(var22.left, var22.top)
		end
		if fFlagMomentsTextOverlayV2Redesign then
			var33 = 24
		end
		return isPointOverTrashTargetModule(p2, zero, current.AbsolutePosition, current.AbsoluteSize, var33)
	end, { var22 })
	local var33 = useCallback(function()
		-- upvalues: fFlagMomentsTextOverlayV2Redesign (copy), p1 (ref), var24 (ref), var28 (ref), reactOtterModule (copy), var30 (ref), var26 (ref), var19 (write), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy)
		if not fFlagMomentsTextOverlayV2Redesign then return end
		if p1.ctx.setIsOverlayDragging then
			p1.ctx.setIsOverlayDragging(true)
		end
		var24.current = false
		var28(reactOtterModule.instant(1))
		var30(reactOtterModule.instant(1))
		var26(true)
		
		if not var19.current then
			var19.current = true
			fireAnalyticsEventModule(eventNames.EditingFlowTextOverlayRepositionUsed, makeCreationEventFieldsModule.makeTextOverlayEventFields())
		end
	end, { p1.ctx, var28, var30, var26 })
	local var34 = useCallback(function(p2)
		-- upvalues: fFlagMomentsTextOverlayV2Redesign (copy), var32 (ref), var24 (ref), var28 (ref), reactOtterModule (copy), t (copy), var30 (ref)
		if not fFlagMomentsTextOverlayV2Redesign then return end
		local var35 = var32(p2)
		
		if var35 == var24.current then
			return
		end
		var24.current = var35
		var28(reactOtterModule.spring(if var35 then 1.15 else 1, t))
		var30(reactOtterModule.spring(if var35 then 0.45 else 1, t))
	end, { var32, var28, var30 })
	local var35 = useCallback(function(p2)
		-- upvalues: fFlagMomentsTextOverlayV2Redesign (copy), var16 (ref), p1 (ref), var24 (ref), var26 (ref), var28 (ref), reactOtterModule (copy), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), controller (ref), var30 (ref)
		if not fFlagMomentsTextOverlayV2Redesign then
			var16(p2)
			
			return
		elseif p1.ctx.setIsOverlayDragging then
			p1.ctx.setIsOverlayDragging(false)
		end
		local current = var24.current
		var24.current = false
		var26(false)
		var28(reactOtterModule.instant(1))
		
		if current then
			fireAnalyticsEventModule(eventNames.EditingFlowTextOverlayDeletedViaTrash, makeCreationEventFieldsModule.makeTextOverlayEventFields())
			controller.updateCommittedEdit("text", nil)
			
			return
		end
		var30(reactOtterModule.instant(1))
		var16(p2)
	end, {
		p1.ctx, controller, var16, var26, var28, var30
	})
	useEffect(function()
		-- upvalues: fFlagMomentsTextOverlayV2Redesign (copy), textOverlays (ref), var30 (ref), reactOtterModule (copy)
		if not fFlagMomentsTextOverlayV2Redesign then return end
		if textOverlays == nil or #textOverlays == 0 then
			var30(reactOtterModule.instant(1))
		end
	end, { textOverlays })
	
	if fFlagMomentsTextOverlayV2Redesign then
		useEffect(function()
			-- upvalues: fFlagMomentsTextOverlayV2Redesign (copy), var31 (write), var24 (ref), var26 (ref), var28 (ref), reactOtterModule (copy), var30 (ref), p1 (ref)
			if not fFlagMomentsTextOverlayV2Redesign or not var31 then return end
			var24.current = false
			var26(false)
			var28(reactOtterModule.instant(1))
			var30(reactOtterModule.instant(1))
			
			if p1.ctx.setIsOverlayDragging then
				p1.ctx.setIsOverlayDragging(false)
			end
		end, {
			var31,
			p1.ctx,
			var26,
			var28,
			var30
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
	local var36 = useRef(false)
	useEffect(function()
		-- upvalues: var6 (ref), var36 (ref), var8 (ref), var7 (ref), var13 (ref)
		if var6 then
			if var36.current or var8.current == nil or var7 == nil then
				return
			end
			var13()
			var36.current = true
			
			return
		else
			var36.current = false
			
			if var8.current then
				var8.current:ReleaseFocus()
			end
		end
	end, { var6, var7, var13 })
	useEffect(function()
		-- upvalues: var6 (ref), var7 (ref), var11 (ref), var10 (ref), textService (copy), var12 (write), var2 (ref)
		if not var6 or var7 == nil then return end
		if var11 == 0 then
			var10(UDim2.fromOffset(0, 0))
			
			return
		end
		local wTextSize = textService:GetTextSize("W", var12, var7.textOverlayStyle.font, Vector2.new(var2.X, var2.Y))
		var10(UDim2.fromOffset(math.min(wTextSize.X * 30, var2.X / 2), math.min(wTextSize.Y * 5, var2.Y / 2)))
	end, {
		var6,
		var7,
		var12,
		var11,
		var2
	})
	local var37 = not fFlagMomentsTextOverlayV2Redesign or var11 == 0
	
	if var6 then
		return if var7 == nil then nil else reactModule.createElement(view, {
			tag = "size-full bg-over-media-0",
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			ZIndex = p1.zIndex or 1
		}, {
			TextOverlay = reactModule.createElement(textOverlay, {
				editable = true,
				additionalScale = if fFlagMomentsTextOverlayV2Redesign then var4 else nil,
				fitToContent = var11 == 0,
				onActivated = var13,
				size = var9,
				textOverlayEdit = dashModule.joinDeep(var7, {
					rotation = 0,
					position = UDim2.fromScale(0.5, 0.5),
					textOverlayStyle = { fontSize = var12 }
				}),
				onTextChanged = var14,
				textBoxRef = var8
			}),
			GenerateText = if getFFlagMomentsGenerateTextInTextOverlayModule() and controller.getCanGenerateText(false) then reactModule.createElement(GenerateTextButton, { controller = controller }) else nil,
			VerticalFontSizeSlider = if fFlagMomentsTextOverlayV2Redesign and var37 then reactModule.createElement(verticalFontSizeSliderModule, { controller = controller, mediaHeight = var2.Y }) else nil,
			BottomScrim = if fFlagMomentsTextOverlayV2Redesign then reactModule.createElement(view, {
				ZIndex = 5,
				tag = "position-bottom-center anchor-bottom-center",
				Size = UDim2.new(1, 0, 0, 200),
				backgroundStyle = { Color3 = Color3.new(0, 0, 0) }
			}, {
				UIGradient = reactModule.createElement("UIGradient", { Rotation = 90, Transparency = numberSequence })
			}) else nil,
			TextOverlayToolbar = if fFlagMomentsTextOverlayV2Redesign then reactModule.createElement(textOverlayToolbarModule, { controller = controller, isKeyboardVisible = var11 > 0 }) else nil
		})
	elseif textOverlays == nil or #textOverlays == 0 then
		return nil
	end
	local var38 = var1 == creationFlowStateModule.Preview
	local var39 = var38 and not var31
	local var40 = fFlagMomentsTextOverlayV2Redesign and var38
	local var41 = fFlagMomentsTextOverlayV2Redesign and var38
	local var42 = if getFFlagMomentsStickerButton() then reactModule.createElement(overlayDisplay, {
		clampToBoundsEnabled = true,
		editable = false,
		draggable = var39,
		itemResolution = var3,
		itemSize = var2,
		scaleType = Enum.ScaleType.Crop,
		onOverlayActivated = if var38 then var15 else nil,
		onOverlayDragBegin = if var38 then var33 else nil,
		onOverlayDragContinue = if var40 then var34 else nil,
		onOverlayDragEnd = if var38 then var35 else nil,
		onOverlayRotationChanged = if var41 then var18 else nil,
		onOverlayScaleChanged = if var41 then var17 else nil,
		overlayEdits = textOverlays,
		overlayComponent = textOverlay,
		selected = var41,
		visualScale = if var40 then var29 else nil,
		zIndex = p1.zIndex
	}) else reactModule.createElement(textOverlayDisplay, {
		clampToBoundsEnabled = true,
		editable = false,
		draggable = var39,
		itemResolution = var3,
		itemSize = var2,
		scaleType = Enum.ScaleType.Crop,
		onTextOverlayActivated = if var38 then var15 else nil,
		onTextOverlayDragBegin = if var38 then var33 else nil,
		onTextOverlayDragContinue = if var40 then var34 else nil,
		onTextOverlayDragEnd = if var38 then var35 else nil,
		onTextOverlayRotationChanged = if var41 then var18 else nil,
		onTextOverlayScaleChanged = if var41 then var17 else nil,
		selected = var41,
		textOverlayEdits = textOverlays,
		visualScale = if var40 then var29 else nil,
		zIndex = p1.zIndex
	})
	
	return if var40 then reactModule.createElement(view, { tag = "size-full", ZIndex = p1.zIndex or 1 }, {
		Overlay = var42,
		TrashZone = reactModule.createElement(textOverlayTrashZoneModule, {
			highlightScale = var27,
			ref = var23,
			visible = var25,
			ZIndex = (p1.zIndex or 1) + 10
		})
	}) else var42
end