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
local textService = game:GetService("TextService")
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
local overlayDisplay = momentsCommonModule.Components.OverlayDisplay
local textOverlay = momentsCommonModule.Components.TextOverlay
local textOverlayDisplay = momentsCommonModule.Components.TextOverlayDisplay
local getScale = momentsCommonModule.Utils.getScale
local getFFlagMomentsStickerButton = momentsCommonModule.Flags.GetFFlagMomentsStickerButton
local getFFlagEnableMomentTextGeneration = momentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration
local creationFlowStateModule = require(momentsCreation.Enums.CreationFlowState)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local _ = require(parent.MomentsTypes)
local textOverlayTrashZoneModule = require(momentsCreation.Components.TextOverlay.TextOverlayTrashZone)
local useOnScreenKeyboardHeightModule = require(momentsCreation.Hooks.useOnScreenKeyboardHeight)
local useCreationFlowStringsModule = require(momentsCreation.Hooks.useCreationFlowStrings)
local getFFlagMomentsGenerateTextInTextOverlayModule = require(momentsCreation.Flags.GetFFlagMomentsGenerateTextInTextOverlay)
local makeDefaultTextOverlayEditModule = require(momentsCreation.Utils.makeDefaultTextOverlayEdit)
local makeTextOverlayEditsForEditorModule = require(momentsCreation.Utils.makeTextOverlayEditsForEditor)
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
	-- upvalues: useSignalState (ref), getFFlagMomentsCreationTextOverlayResolutionScaleModule (ref), getScale (ref), useMemo (ref), signalsModule (ref), creationFlowStateModule (ref), useRef (ref), useBinding (ref), useOnScreenKeyboardHeightModule (ref), useCallback (ref), getFFlagMomentsStickerButton (ref), dashModule (ref), getFFlagEnableMomentTextGeneration (ref), useAnimatedBinding (ref), getFFlagMomentsTextDragToDeleteModule (ref), reactOtterModule (ref), t (ref), useEffect (ref), makeTextOverlayEditsForEditorModule (ref), makeDefaultTextOverlayEditModule (ref), textService (ref), reactModule (ref), view (ref), foundationModule (ref), textOverlay (ref), getFFlagMomentsGenerateTextInTextOverlayModule (ref), GenerateTextButton (ref), getFFlagMomentsTextVerticalSizeSliderModule (ref), verticalFontSizeSliderModule (ref), overlayDisplay (ref), getFFlagMomentsTextOverlayClampToBoundsModule (ref), textOverlayDisplay (ref), textOverlayTrashZoneModule (ref)
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
	local var13 = useCallback(function()
		-- upvalues: var9 (ref)
		if var9.current then
			var9.current:CaptureFocus()
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
	local var17 = useRef(nil)
	local var18 = useRef(false)
	local var19, var20 = useBinding(false)
	local var21, var22 = useAnimatedBinding(1)
	local var23, var24 = useAnimatedBinding(1)
	local var25 = useCallback(function(p2)
		-- upvalues: var17 (ref)
		local current = var17.current
		
		if current == nil then
			return false
		end
		local absolutePosition = current.AbsolutePosition
		local absoluteSize = current.AbsoluteSize
		
		return absolutePosition.X <= p2.X and (p2.X <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= p2.Y and p2.Y <= absolutePosition.Y + absoluteSize.Y))
	end, {})
	local var26 = useCallback(function()
		-- upvalues: getFFlagMomentsTextDragToDeleteModule (copy), p1 (ref), var18 (ref), var22 (ref), reactOtterModule (copy), var24 (ref), var20 (ref)
		if not getFFlagMomentsTextDragToDeleteModule() then return end
		if p1.ctx.setIsOverlayDragging then
			p1.ctx.setIsOverlayDragging(true)
		end
		var18.current = false
		var22(reactOtterModule.instant(1))
		var24(reactOtterModule.instant(1))
		var20(true)
	end, { p1.ctx, var22, var24, var20 })
	local var27 = useCallback(function(p2)
		-- upvalues: getFFlagMomentsTextDragToDeleteModule (copy), var25 (ref), var18 (ref), var22 (ref), reactOtterModule (copy), t (copy), var24 (ref)
		if not getFFlagMomentsTextDragToDeleteModule() then return end
		local var28 = var25(p2)
		
		if var28 == var18.current then
			return
		end
		var18.current = var28
		var22(reactOtterModule.spring(if var28 then 1.15 else 1, t))
		var24(reactOtterModule.spring(if var28 then 0.45 else 1, t))
	end, { var25, var22, var24 })
	local var28 = useCallback(function(p2)
		-- upvalues: getFFlagMomentsTextDragToDeleteModule (copy), var16 (ref), p1 (ref), var18 (ref), var20 (ref), var22 (ref), reactOtterModule (copy), controller (ref), var24 (ref)
		if not getFFlagMomentsTextDragToDeleteModule() then
			var16(p2)
			
			return
		elseif p1.ctx.setIsOverlayDragging then
			p1.ctx.setIsOverlayDragging(false)
		end
		local current = var18.current
		var18.current = false
		var20(false)
		var22(reactOtterModule.instant(1))
		
		if current then
			controller.updateCommittedEdit("text", nil)
			
			return
		end
		var24(reactOtterModule.instant(1))
		var16(p2)
	end, {
		p1.ctx, controller, var16, var20, var22, var24
	})
	useEffect(function()
		-- upvalues: getFFlagMomentsTextDragToDeleteModule (copy), textOverlays (ref), var24 (ref), reactOtterModule (copy)
		if not getFFlagMomentsTextDragToDeleteModule() then return end
		if textOverlays == nil or #textOverlays == 0 then
			var24(reactOtterModule.instant(1))
		end
	end, { textOverlays })
	useEffect(function()
		-- upvalues: var7 (ref), controller (ref), makeTextOverlayEditsForEditorModule (copy), textOverlays (ref), makeDefaultTextOverlayEditModule (copy), var5 (ref)
		if not var7 then return end
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil or activeSession.getDraft(false) ~= nil then
			return
		end
		activeSession.update(makeTextOverlayEditsForEditorModule(textOverlays, makeDefaultTextOverlayEditModule(), var5))
	end, { var7, textOverlays, controller, var5 })
	local var29 = useRef(false)
	useEffect(function()
		-- upvalues: var7 (ref), var29 (ref), var9 (ref), var8 (ref), var13 (ref)
		if var7 then
			if var29.current or var9.current == nil or var8 == nil then
				return
			end
			var13()
			var29.current = true
			
			return
		else
			var29.current = false
			
			if var9.current then
				var9.current:ReleaseFocus()
			end
		end
	end, { var7, var8, var13 })
	useEffect(function()
		-- upvalues: var7 (ref), var8 (ref), var12 (ref), var11 (ref), textService (copy), var2 (ref)
		if not var7 or var8 == nil then return end
		if var12 == 0 then
			var11(UDim2.fromOffset(0, 0))
			
			return
		end
		local textOverlayStyle = var8.textOverlayStyle
		local wTextSize = textService:GetTextSize("W", textOverlayStyle.fontSize, textOverlayStyle.font, Vector2.new(var2.X, var2.Y))
		var11(UDim2.fromOffset(math.min(wTextSize.X * 30, var2.X / 2), math.min(wTextSize.Y * 5, var2.Y / 2)))
	end, { var7, var8, var12, var2 })
	
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
				onActivated = var13,
				size = var10,
				textOverlayEdit = dashModule.joinDeep(var8, { rotation = 0, position = UDim2.fromScale(0.5, 0.5) }),
				onTextChanged = var14,
				textBoxRef = var9
			}),
			GenerateText = if getFFlagMomentsGenerateTextInTextOverlayModule() and controller.getCanGenerateText(false) then reactModule.createElement(GenerateTextButton, { controller = controller }) else nil,
			VerticalFontSizeSlider = if getFFlagMomentsTextVerticalSizeSliderModule() then reactModule.createElement(verticalFontSizeSliderModule, { controller = controller, mediaHeight = var2.Y }) else nil
		})
	elseif textOverlays == nil or #textOverlays == 0 then
		return nil
	end
	local var30 = var1 == creationFlowStateModule.Preview
	local var31 = getFFlagMomentsTextDragToDeleteModule() and var30
	local var32 = if getFFlagMomentsStickerButton() then reactModule.createElement(overlayDisplay, {
		editable = false,
		clampToBoundsEnabled = getFFlagMomentsTextOverlayClampToBoundsModule(),
		draggable = var30,
		itemResolution = if var4 then var3 else nil,
		itemSize = var2,
		scaleType = Enum.ScaleType.Crop,
		onOverlayActivated = if var30 then var15 else nil,
		onOverlayDragBegin = if var30 then var26 else nil,
		onOverlayDragContinue = if var31 then var27 else nil,
		onOverlayDragEnd = if var30 then var28 else nil,
		overlayEdits = textOverlays,
		overlayComponent = textOverlay,
		visualScale = if var31 then var23 else nil,
		zIndex = p1.zIndex
	}) else reactModule.createElement(textOverlayDisplay, {
		editable = false,
		clampToBoundsEnabled = getFFlagMomentsTextOverlayClampToBoundsModule(),
		draggable = var30,
		itemResolution = if var4 then var3 else nil,
		itemSize = var2,
		scaleType = Enum.ScaleType.Crop,
		onTextOverlayActivated = if var30 then var15 else nil,
		onTextOverlayDragBegin = if var30 then var26 else nil,
		onTextOverlayDragContinue = if var31 then var27 else nil,
		onTextOverlayDragEnd = if var30 then var28 else nil,
		textOverlayEdits = textOverlays,
		visualScale = if var31 then var23 else nil,
		zIndex = p1.zIndex
	})
	
	return if var31 then reactModule.createElement(view, { tag = "size-full", ZIndex = p1.zIndex or 1 }, {
		Overlay = var32,
		TrashZone = reactModule.createElement(textOverlayTrashZoneModule, {
			highlightScale = var21,
			ref = var17,
			visible = var19,
			ZIndex = (p1.zIndex or 1) + 10
		})
	}) else var32
end