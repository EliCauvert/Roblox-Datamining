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
local getFFlagMomentsTextDragToDeleteModule = require(momentsCreation.Flags.GetFFlagMomentsTextDragToDelete)
local t = { dampingRatio = 0.85, frequency = 12 }

local function GenerateTextButton(p0) --[[ line: 99 ]]
	-- upvalues: useTokens (ref), useCreationFlowStringsModule (ref), useSignalState (ref), useCallback (ref), reactModule (ref), view (ref), button (ref), foundationModule (ref), builderIconsModule (ref)
	local controller = p0.controller
	local var22 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "position-bottom-right anchor-bottom-right auto-xy",
		ZIndex = 10,
		padding = {
			bottom = UDim.new(0, var22.Padding.Large),
			right = UDim.new(0, var22.Padding.Large)
		}
	}, {
		Button = reactModule.createElement(button, {
			fillBehavior = foundationModule.Enums.FillBehavior.Fit,
			icon = builderIconsModule.Icon.TagSparkle,
			text = useCreationFlowStringsModule().GenerateTextCta,
			variant = foundationModule.Enums.ButtonVariant.Emphasis,
			onActivated = useCallback(function() --[[ line: 105 ]]
				-- upvalues: controller (ref)
				controller.beginTool("generateText")
			end, { controller }),
			isLoading = useSignalState(controller.getIsGenerating),
			size = foundationModule.Enums.InputSize.Medium
		})
	})
end

return function(p1) --[[ line: 131 | named "TextOverlayLayer" ]]
	-- upvalues: useSignalState (ref), getFFlagMomentsCreationTextOverlayResolutionScaleModule (ref), getScale (ref), useMemo (ref), signalsModule (ref), creationFlowStateModule (ref), useRef (ref), useBinding (ref), useOnScreenKeyboardHeightModule (ref), useCallback (ref), getFFlagMomentsStickerButton (ref), dashModule (ref), getFFlagEnableMomentTextGeneration (ref), useAnimatedBinding (ref), getFFlagMomentsTextDragToDeleteModule (ref), reactOtterModule (ref), t (ref), useEffect (ref), makeTextOverlayEditsForEditorModule (ref), makeDefaultTextOverlayEditModule (ref), textService (ref), reactModule (ref), view (ref), foundationModule (ref), textOverlay (ref), getFFlagMomentsGenerateTextInTextOverlayModule (ref), GenerateTextButton (ref), overlayDisplay (ref), getFFlagMomentsTextOverlayClampToBoundsModule (ref), textOverlayDisplay (ref), textOverlayTrashZoneModule (ref)
	local controller = p1.controller
	local var23 = useSignalState(controller.getStep)
	local var24 = useSignalState(p1.ctx.getItemSize)
	local var25 = useSignalState(p1.ctx.getItemResolution)
	local textOverlays = useSignalState(controller.getComposedEdits).textOverlays
	local var26 = getFFlagMomentsCreationTextOverlayResolutionScaleModule()
	local var27 = if var26 then getScale(var24, var25, Enum.ScaleType.Crop) else 1
	local var28 = useSignalState(useMemo(function() --[[ line: 148 ]]
		-- upvalues: signalsModule (copy), controller (ref)
		return signalsModule.createComputed(function(p2) --[[ line: 149 ]]
			-- upvalues: controller (copy)
			local activeSession = controller.getActiveSession(p2)
			
			return if activeSession == nil then nil else activeSession.getDraft(p2)
		end)
	end, { controller }))
	local var29 = var23 == creationFlowStateModule.TextOverlay
	local var30 = var28 and var28[1]
	local var31 = useRef(nil)
	local var32, var33 = useBinding(UDim2.fromOffset(0, 0))
	local var34 = useOnScreenKeyboardHeightModule()
	local var35 = useCallback(function() --[[ line: 163 ]]
		-- upvalues: var31 (ref)
		if var31.current then
			var31.current:CaptureFocus()
		end
	end, {})
	local var36 = useCallback(function(p3) --[[ line: 169 ]]
		-- upvalues: controller (ref), getFFlagMomentsStickerButton (copy), dashModule (copy)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil then return end
		local draft = activeSession.getDraft(false)
		local var58 = draft and draft[1]
		
		if var58 == nil then return end
		local charCount = utf8.len(p3.Text)
		
		if charCount ~= nil and charCount >= 100 then
			local byteOffset = utf8.offset(p3.Text, 101)
			
			if not getFFlagMomentsStickerButton() then
				p3.Text = string.sub(p3.Text, 1, byteOffset - 1)
			elseif byteOffset then
				p3.Text = string.sub(p3.Text, 1, byteOffset - 1)
			end
		end
		activeSession.update({ dashModule.joinDeep(var58, { text = p3.Text }) })
	end, { controller })
	local var37 = useCallback(function() --[[ line: 196 ]]
		-- upvalues: getFFlagEnableMomentTextGeneration (copy), controller (ref)
		if getFFlagEnableMomentTextGeneration() and controller.getIsGenerating(false) then
			controller.onDisabledToolActivated("text")
			
			return
		end
		controller.beginTool("text")
	end, { controller })
	local var38 = useCallback(function(p4) --[[ line: 209 ]]
		-- upvalues: controller (ref)
		controller.updateCommittedEdit("text", p4)
	end, { controller })
	local var39 = useRef(nil)
	local var40 = useRef(false)
	local var41, var42 = useBinding(false)
	local var43, var44 = useAnimatedBinding(1)
	local var45, var46 = useAnimatedBinding(1)
	local var47 = useCallback(function(p5) --[[ line: 221 ]]
		-- upvalues: var39 (ref)
		local current = var39.current
		
		if current == nil then
			return false
		end
		local absolutePosition = current.AbsolutePosition
		local absoluteSize = current.AbsoluteSize
		
		return absolutePosition.X <= p5.X and (p5.X <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= p5.Y and p5.Y <= absolutePosition.Y + absoluteSize.Y))
	end, {})
	local var48 = useCallback(function() --[[ line: 234 ]]
		-- upvalues: getFFlagMomentsTextDragToDeleteModule (copy), p1 (ref), var40 (ref), var44 (ref), reactOtterModule (copy), var46 (ref), var42 (ref)
		if not getFFlagMomentsTextDragToDeleteModule() then return end
		if p1.ctx.setIsOverlayDragging then
			p1.ctx.setIsOverlayDragging(true)
		end
		var40.current = false
		var44(reactOtterModule.instant(1))
		var46(reactOtterModule.instant(1))
		var42(true)
	end, { p1.ctx, var44, var46, var42 })
	local var49 = useCallback(function(p6) --[[ line: 247 ]]
		-- upvalues: getFFlagMomentsTextDragToDeleteModule (copy), var47 (ref), var40 (ref), var44 (ref), reactOtterModule (copy), t (copy), var46 (ref)
		if not getFFlagMomentsTextDragToDeleteModule() then return end
		local var61 = var47(p6)
		
		if var61 == var40.current then
			return
		end
		var40.current = var61
		var44(reactOtterModule.spring(if var61 then 1.15 else 1, t))
		var46(reactOtterModule.spring(if var61 then 0.45 else 1, t))
	end, { var47, var44, var46 })
	local var50 = useCallback(function(p7) --[[ line: 267 ]]
		-- upvalues: getFFlagMomentsTextDragToDeleteModule (copy), var38 (ref), p1 (ref), var40 (ref), var42 (ref), var44 (ref), reactOtterModule (copy), controller (ref), var46 (ref)
		if not getFFlagMomentsTextDragToDeleteModule() then
			var38(p7)
			
			return
		elseif p1.ctx.setIsOverlayDragging then
			p1.ctx.setIsOverlayDragging(false)
		end
		local current = var40.current
		var40.current = false
		var42(false)
		var44(reactOtterModule.instant(1))
		
		if current then
			controller.updateCommittedEdit("text", nil)
			
			return
		end
		var46(reactOtterModule.instant(1))
		var38(p7)
	end, {
		p1.ctx, controller, var38, var42, var44, var46
	})
	useEffect(function() --[[ line: 305 ]]
		-- upvalues: getFFlagMomentsTextDragToDeleteModule (copy), textOverlays (ref), var46 (ref), reactOtterModule (copy)
		if not getFFlagMomentsTextDragToDeleteModule() then return end
		if textOverlays == nil or #textOverlays == 0 then
			var46(reactOtterModule.instant(1))
		end
	end, { textOverlays })
	useEffect(function() --[[ line: 316 ]]
		-- upvalues: var29 (ref), controller (ref), makeTextOverlayEditsForEditorModule (copy), textOverlays (ref), makeDefaultTextOverlayEditModule (copy), var27 (ref)
		if not var29 then return end
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil or activeSession.getDraft(false) ~= nil then
			return
		end
		activeSession.update(makeTextOverlayEditsForEditorModule(textOverlays, makeDefaultTextOverlayEditModule(), var27))
	end, { var29, textOverlays, controller, var27 })
	local var51 = useRef(false)
	useEffect(function() --[[ line: 332 ]]
		-- upvalues: var29 (ref), var51 (ref), var31 (ref), var30 (ref), var35 (ref)
		if var29 then
			if var51.current or var31.current == nil or var30 == nil then
				return
			end
			var35()
			var51.current = true
			
			return
		else
			var51.current = false
			
			if var31.current then
				var31.current:ReleaseFocus()
			end
		end
	end, { var29, var30, var35 })
	useEffect(function() --[[ line: 347 ]]
		-- upvalues: var29 (ref), var30 (ref), var34 (ref), var33 (ref), textService (copy), var24 (ref)
		if not var29 or var30 == nil then return end
		if var34 == 0 then
			var33(UDim2.fromOffset(0, 0))
			
			return
		end
		local textOverlayStyle = var30.textOverlayStyle
		local wTextSize = textService:GetTextSize("W", textOverlayStyle.fontSize, textOverlayStyle.font, Vector2.new(var24.X, var24.Y))
		var33(UDim2.fromOffset(math.min(wTextSize.X * 30, var24.X / 2), math.min(wTextSize.Y * 5, var24.Y / 2)))
	end, { var29, var30, var34, var24 })
	
	if var29 then
		return if var30 == nil then nil else reactModule.createElement(view, {
			tag = "size-full bg-over-media-0",
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			ZIndex = p1.zIndex or 1
		}, {
			TextOverlay = reactModule.createElement(textOverlay, {
				editable = true,
				onActivated = var35,
				size = var32,
				textOverlayEdit = dashModule.joinDeep(var30, { rotation = 0, position = UDim2.fromScale(0.5, 0.5) }),
				onTextChanged = var36,
				textBoxRef = var31
			}),
			GenerateText = if getFFlagMomentsGenerateTextInTextOverlayModule() and controller.getCanGenerateText(false) then reactModule.createElement(GenerateTextButton, { controller = controller }) else nil
		})
	elseif textOverlays == nil or #textOverlays == 0 then
		return nil
	end
	local var52 = var23 == creationFlowStateModule.Preview
	local var52_1 = getFFlagMomentsTextDragToDeleteModule() and var52
	local var54 = if getFFlagMomentsStickerButton() then reactModule.createElement(overlayDisplay, {
		editable = false,
		clampToBoundsEnabled = getFFlagMomentsTextOverlayClampToBoundsModule(),
		draggable = var52,
		itemResolution = if var26 then var25 else nil,
		itemSize = var24,
		scaleType = Enum.ScaleType.Crop,
		onOverlayActivated = if var52 then var37 else nil,
		onOverlayDragBegin = if var52 then var48 else nil,
		onOverlayDragContinue = if var52_1 then var49 else nil,
		onOverlayDragEnd = if var52 then var50 else nil,
		overlayEdits = textOverlays,
		overlayComponent = textOverlay,
		visualScale = if var52_1 then var45 else nil,
		zIndex = p1.zIndex
	}) else reactModule.createElement(textOverlayDisplay, {
		editable = false,
		clampToBoundsEnabled = getFFlagMomentsTextOverlayClampToBoundsModule(),
		draggable = var52,
		itemResolution = if var26 then var25 else nil,
		itemSize = var24,
		scaleType = Enum.ScaleType.Crop,
		onTextOverlayActivated = if var52 then var37 else nil,
		onTextOverlayDragBegin = if var52 then var48 else nil,
		onTextOverlayDragContinue = if var52_1 then var49 else nil,
		onTextOverlayDragEnd = if var52 then var50 else nil,
		textOverlayEdits = textOverlays,
		visualScale = if var52_1 then var45 else nil,
		zIndex = p1.zIndex
	})
	
	return if var52_1 then reactModule.createElement(view, { tag = "size-full", ZIndex = p1.zIndex or 1 }, {
		Overlay = var54,
		TrashZone = reactModule.createElement(textOverlayTrashZoneModule, {
			highlightScale = var43,
			ref = var39,
			visible = var41,
			ZIndex = (p1.zIndex or 1) + 10
		})
	}) else var54
end