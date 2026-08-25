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
		return signalsModule.createComputed(function(p1)
			-- upvalues: controller (copy)
			local activeSession = controller.getActiveSession(p1)
			
			return if activeSession == nil then nil else activeSession.getDraft(p1)
		end)
	end, { controller }))
	local var1 = var1 == creationFlowStateModule.TextOverlay
	local var2 = var6 and var6[1]
	local var3 = useRef(nil)
	local var4, var5 = useBinding(UDim2.fromOffset(0, 0))
	local var6 = useOnScreenKeyboardHeightModule()
	local var7 = useCallback(function()
		-- upvalues: var3 (ref)
		if var3.current then
			var3.current:CaptureFocus()
		end
	end, {})
	local var8 = useCallback(function(p1)
		-- upvalues: controller (ref), getFFlagMomentsStickerButton (copy), dashModule (copy)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil then return end
		local draft = activeSession.getDraft(false)
		local var1 = draft and draft[1]
		
		if var1 == nil then return end
		local charCount = utf8.len(p1.Text)
		
		if charCount ~= nil and charCount >= 100 then
			local byteOffset = utf8.offset(p1.Text, 101)
			
			if not getFFlagMomentsStickerButton() then
				p1.Text = string.sub(p1.Text, 1, byteOffset - 1)
			elseif byteOffset then
				p1.Text = string.sub(p1.Text, 1, byteOffset - 1)
			end
		end
		activeSession.update({ dashModule.joinDeep(var1, { text = p1.Text }) })
	end, { controller })
	local var9 = useCallback(function()
		-- upvalues: getFFlagEnableMomentTextGeneration (copy), controller (ref)
		if getFFlagEnableMomentTextGeneration() and controller.getIsGenerating(false) then
			controller.onDisabledToolActivated("text")
			
			return
		end
		controller.beginTool("text")
	end, { controller })
	local var10 = useCallback(function(p1)
		-- upvalues: controller (ref)
		controller.updateCommittedEdit("text", p1)
	end, { controller })
	local var11 = useRef(nil)
	local var12 = useRef(false)
	local var13, var14 = useBinding(false)
	local var15, var16 = useAnimatedBinding(1)
	local var17, var18 = useAnimatedBinding(1)
	local var19 = useCallback(function(p1)
		-- upvalues: var11 (ref)
		local current = var11.current
		
		if current == nil then
			return false
		end
		local absolutePosition = current.AbsolutePosition
		local absoluteSize = current.AbsoluteSize
		
		return absolutePosition.X <= p1.X and (p1.X <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= p1.Y and p1.Y <= absolutePosition.Y + absoluteSize.Y))
	end, {})
	local var20 = useCallback(function()
		-- upvalues: getFFlagMomentsTextDragToDeleteModule (copy), p1 (ref), var12 (ref), var16 (ref), reactOtterModule (copy), var18 (ref), var14 (ref)
		if not getFFlagMomentsTextDragToDeleteModule() then return end
		if p1.ctx.setIsOverlayDragging then
			p1.ctx.setIsOverlayDragging(true)
		end
		var12.current = false
		var16(reactOtterModule.instant(1))
		var18(reactOtterModule.instant(1))
		var14(true)
	end, { p1.ctx, var16, var18, var14 })
	local var21 = useCallback(function(p1)
		-- upvalues: getFFlagMomentsTextDragToDeleteModule (copy), var19 (ref), var12 (ref), var16 (ref), reactOtterModule (copy), t (copy), var18 (ref)
		if not getFFlagMomentsTextDragToDeleteModule() then return end
		local var1 = var19(p1)
		
		if var1 == var12.current then
			return
		end
		var12.current = var1
		var16(reactOtterModule.spring(if var1 then 1.15 else 1, t))
		var18(reactOtterModule.spring(if var1 then 0.45 else 1, t))
	end, { var19, var16, var18 })
	local var2 = useCallback(function(p1)
		-- upvalues: getFFlagMomentsTextDragToDeleteModule (copy), var10 (ref), p1 (ref), var12 (ref), var14 (ref), var16 (ref), reactOtterModule (copy), controller (ref), var18 (ref)
		if not getFFlagMomentsTextDragToDeleteModule() then
			var10(p1)
			
			return
		elseif p1.ctx.setIsOverlayDragging then
			p1.ctx.setIsOverlayDragging(false)
		end
		local current = var12.current
		var12.current = false
		var14(false)
		var16(reactOtterModule.instant(1))
		
		if current then
			controller.updateCommittedEdit("text", nil)
			
			return
		end
		var18(reactOtterModule.instant(1))
		var10(p1)
	end, {
		p1.ctx, controller, var10, var14, var16, var18
	})
	useEffect(function()
		-- upvalues: getFFlagMomentsTextDragToDeleteModule (copy), textOverlays (ref), var18 (ref), reactOtterModule (copy)
		if not getFFlagMomentsTextDragToDeleteModule() then return end
		if textOverlays == nil or #textOverlays == 0 then
			var18(reactOtterModule.instant(1))
		end
	end, { textOverlays })
	useEffect(function()
		-- upvalues: var1 (ref), controller (ref), makeTextOverlayEditsForEditorModule (copy), textOverlays (ref), makeDefaultTextOverlayEditModule (copy), var5 (ref)
		if not var1 then return end
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil or activeSession.getDraft(false) ~= nil then
			return
		end
		activeSession.update(makeTextOverlayEditsForEditorModule(textOverlays, makeDefaultTextOverlayEditModule(), var5))
	end, { var1, textOverlays, controller, var5 })
	local var3 = useRef(false)
	useEffect(function()
		-- upvalues: var1 (ref), var3 (ref), var3 (ref), var2 (ref), var7 (ref)
		if var1 then
			if var3.current or var3.current == nil or var2 == nil then
				return
			end
			var7()
			var3.current = true
			
			return
		else
			var3.current = false
			
			if var3.current then
				var3.current:ReleaseFocus()
			end
		end
	end, { var1, var2, var7 })
	useEffect(function()
		-- upvalues: var1 (ref), var2 (ref), var6 (ref), var5 (ref), textService (copy), var2 (ref)
		if not var1 or var2 == nil then return end
		if var6 == 0 then
			var5(UDim2.fromOffset(0, 0))
			
			return
		end
		local textOverlayStyle = var2.textOverlayStyle
		local wTextSize = textService:GetTextSize("W", textOverlayStyle.fontSize, textOverlayStyle.font, Vector2.new(var2.X, var2.Y))
		var5(UDim2.fromOffset(math.min(wTextSize.X * 30, var2.X / 2), math.min(wTextSize.Y * 5, var2.Y / 2)))
	end, { var1, var2, var6, var2 })
	
	if var1 then
		return if var2 == nil then nil else reactModule.createElement(view, {
			tag = "size-full bg-over-media-0",
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			ZIndex = p1.zIndex or 1
		}, {
			TextOverlay = reactModule.createElement(textOverlay, {
				editable = true,
				onActivated = var7,
				size = var4,
				textOverlayEdit = dashModule.joinDeep(var2, { rotation = 0, position = UDim2.fromScale(0.5, 0.5) }),
				onTextChanged = var8,
				textBoxRef = var3
			}),
			GenerateText = if getFFlagMomentsGenerateTextInTextOverlayModule() and controller.getCanGenerateText(false) then reactModule.createElement(GenerateTextButton, { controller = controller }) else nil,
			VerticalFontSizeSlider = if getFFlagMomentsTextVerticalSizeSliderModule() then reactModule.createElement(verticalFontSizeSliderModule, { controller = controller, mediaHeight = var2.Y }) else nil
		})
	elseif textOverlays == nil or #textOverlays == 0 then
		return nil
	end
	local var4 = var1 == creationFlowStateModule.Preview
	local var5 = getFFlagMomentsTextDragToDeleteModule() and var4
	local var6 = if getFFlagMomentsStickerButton() then reactModule.createElement(overlayDisplay, {
		editable = false,
		clampToBoundsEnabled = getFFlagMomentsTextOverlayClampToBoundsModule(),
		draggable = var4,
		itemResolution = if var4 then var3 else nil,
		itemSize = var2,
		scaleType = Enum.ScaleType.Crop,
		onOverlayActivated = if var4 then var9 else nil,
		onOverlayDragBegin = if var4 then var20 else nil,
		onOverlayDragContinue = if var5 then var21 else nil,
		onOverlayDragEnd = if var4 then var2 else nil,
		overlayEdits = textOverlays,
		overlayComponent = textOverlay,
		visualScale = if var5 then var17 else nil,
		zIndex = p1.zIndex
	}) else reactModule.createElement(textOverlayDisplay, {
		editable = false,
		clampToBoundsEnabled = getFFlagMomentsTextOverlayClampToBoundsModule(),
		draggable = var4,
		itemResolution = if var4 then var3 else nil,
		itemSize = var2,
		scaleType = Enum.ScaleType.Crop,
		onTextOverlayActivated = if var4 then var9 else nil,
		onTextOverlayDragBegin = if var4 then var20 else nil,
		onTextOverlayDragContinue = if var5 then var21 else nil,
		onTextOverlayDragEnd = if var4 then var2 else nil,
		textOverlayEdits = textOverlays,
		visualScale = if var5 then var17 else nil,
		zIndex = p1.zIndex
	})
	
	return if var5 then reactModule.createElement(view, { tag = "size-full", ZIndex = p1.zIndex or 1 }, {
		Overlay = var6,
		TrashZone = reactModule.createElement(textOverlayTrashZoneModule, {
			highlightScale = var15,
			ref = var11,
			visible = var13,
			ZIndex = (p1.zIndex or 1) + 10
		})
	}) else var6
end