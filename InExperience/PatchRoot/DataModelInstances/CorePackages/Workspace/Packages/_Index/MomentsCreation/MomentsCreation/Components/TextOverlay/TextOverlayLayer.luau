local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local textService = game:GetService("TextService")
local view = foundationModule.View
local useAnimatedBinding = reactOtterModule.useAnimatedBinding
local useBinding = reactModule.useBinding
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useMemo = reactModule.useMemo
local useRef = reactModule.useRef
local useSignalState = signalsReactModule.useSignalState
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
local makeDefaultTextOverlayEditModule = require(momentsCreation.Utils.makeDefaultTextOverlayEdit)
local makeTextOverlayEditsForEditorModule = require(momentsCreation.Utils.makeTextOverlayEditsForEditor)
local getFFlagMomentsTextOverlayClampToBoundsModule = require(momentsCreation.Flags.GetFFlagMomentsTextOverlayClampToBounds)
local getFFlagMomentsCreationTextOverlayResolutionScaleModule = require(momentsCreation.Flags.GetFFlagMomentsCreationTextOverlayResolutionScale)
local getFFlagMomentsTextDragToDeleteModule = require(momentsCreation.Flags.GetFFlagMomentsTextDragToDelete)
local t = { dampingRatio = 0.85, frequency = 12 }

return function(p0) --[[ line: 91 | named "TextOverlayLayer" ]]
	-- upvalues: useSignalState (ref), getFFlagMomentsCreationTextOverlayResolutionScaleModule (ref), getScale (ref), useMemo (ref), signalsModule (ref), creationFlowStateModule (ref), useRef (ref), useBinding (ref), useOnScreenKeyboardHeightModule (ref), useCallback (ref), getFFlagMomentsStickerButton (ref), dashModule (ref), getFFlagEnableMomentTextGeneration (ref), useAnimatedBinding (ref), getFFlagMomentsTextDragToDeleteModule (ref), reactOtterModule (ref), t (ref), useEffect (ref), makeTextOverlayEditsForEditorModule (ref), makeDefaultTextOverlayEditModule (ref), textService (ref), reactModule (ref), view (ref), foundationModule (ref), textOverlay (ref), overlayDisplay (ref), getFFlagMomentsTextOverlayClampToBoundsModule (ref), textOverlayDisplay (ref), textOverlayTrashZoneModule (ref)
	local controller = p0.controller
	local var18 = useSignalState(controller.getStep)
	local var19 = useSignalState(p0.ctx.getItemSize)
	local var20 = useSignalState(p0.ctx.getItemResolution)
	local textOverlays = useSignalState(controller.getComposedEdits).textOverlays
	local var21 = getFFlagMomentsCreationTextOverlayResolutionScaleModule()
	local var22 = if var21 then getScale(var19, var20, Enum.ScaleType.Crop) else 1
	local var23 = useSignalState(useMemo(function() --[[ line: 108 ]]
		-- upvalues: signalsModule (copy), controller (ref)
		return signalsModule.createComputed(function(p1) --[[ line: 109 ]]
			-- upvalues: controller (copy)
			local activeSession = controller.getActiveSession(p1)
			
			return if activeSession == nil then nil else activeSession.getDraft(p1)
		end)
	end, { controller }))
	local var24 = var18 == creationFlowStateModule.TextOverlay
	local var25 = var23 and var23[1]
	local var26 = useRef(nil)
	local var27, var28 = useBinding(UDim2.fromOffset(0, 0))
	local var29 = useOnScreenKeyboardHeightModule()
	local var30 = useCallback(function() --[[ line: 123 ]]
		-- upvalues: var26 (ref)
		if var26.current then
			var26.current:CaptureFocus()
		end
	end, {})
	local var31 = useCallback(function(p2) --[[ line: 129 ]]
		-- upvalues: controller (ref), getFFlagMomentsStickerButton (copy), dashModule (copy)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil then return end
		local draft = activeSession.getDraft(false)
		local var53 = draft and draft[1]
		
		if var53 == nil then return end
		local charCount = utf8.len(p2.Text)
		
		if charCount ~= nil and charCount >= 100 then
			local byteOffset = utf8.offset(p2.Text, 101)
			
			if not getFFlagMomentsStickerButton() then
				p2.Text = string.sub(p2.Text, 1, byteOffset - 1)
			elseif byteOffset then
				p2.Text = string.sub(p2.Text, 1, byteOffset - 1)
			end
		end
		activeSession.update({ dashModule.joinDeep(var53, { text = p2.Text }) })
	end, { controller })
	local var32 = useCallback(function() --[[ line: 156 ]]
		-- upvalues: getFFlagEnableMomentTextGeneration (copy), controller (ref)
		if getFFlagEnableMomentTextGeneration() and controller.getIsGenerating(false) then
			controller.onDisabledToolActivated("text")
			
			return
		end
		controller.beginTool("text")
	end, { controller })
	local var33 = useCallback(function(p3) --[[ line: 169 ]]
		-- upvalues: controller (ref)
		controller.updateCommittedEdit("text", p3)
	end, { controller })
	local var34 = useRef(nil)
	local var35 = useRef(false)
	local var36, var37 = useBinding(false)
	local var38, var39 = useAnimatedBinding(1)
	local var40, var41 = useAnimatedBinding(1)
	local var42 = useCallback(function(p4) --[[ line: 181 ]]
		-- upvalues: var34 (ref)
		local current = var34.current
		
		if current == nil then
			return false
		end
		local absolutePosition = current.AbsolutePosition
		local absoluteSize = current.AbsoluteSize
		
		return absolutePosition.X <= p4.X and (p4.X <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= p4.Y and p4.Y <= absolutePosition.Y + absoluteSize.Y))
	end, {})
	local var43 = useCallback(function() --[[ line: 194 ]]
		-- upvalues: getFFlagMomentsTextDragToDeleteModule (copy), p0 (ref), var35 (ref), var39 (ref), reactOtterModule (copy), var41 (ref), var37 (ref)
		if not getFFlagMomentsTextDragToDeleteModule() then return end
		if p0.ctx.setIsOverlayDragging then
			p0.ctx.setIsOverlayDragging(true)
		end
		var35.current = false
		var39(reactOtterModule.instant(1))
		var41(reactOtterModule.instant(1))
		var37(true)
	end, { p0.ctx, var39, var41, var37 })
	local var44 = useCallback(function(p5) --[[ line: 207 ]]
		-- upvalues: getFFlagMomentsTextDragToDeleteModule (copy), var42 (ref), var35 (ref), var39 (ref), reactOtterModule (copy), t (copy), var41 (ref)
		if not getFFlagMomentsTextDragToDeleteModule() then return end
		local var56 = var42(p5)
		
		if var56 == var35.current then
			return
		end
		var35.current = var56
		var39(reactOtterModule.spring(if var56 then 1.15 else 1, t))
		var41(reactOtterModule.spring(if var56 then 0.45 else 1, t))
	end, { var42, var39, var41 })
	local var45 = useCallback(function(p6) --[[ line: 227 ]]
		-- upvalues: getFFlagMomentsTextDragToDeleteModule (copy), var33 (ref), p0 (ref), var35 (ref), var37 (ref), var39 (ref), reactOtterModule (copy), controller (ref), var41 (ref)
		if not getFFlagMomentsTextDragToDeleteModule() then
			var33(p6)
			
			return
		elseif p0.ctx.setIsOverlayDragging then
			p0.ctx.setIsOverlayDragging(false)
		end
		local current = var35.current
		var35.current = false
		var37(false)
		var39(reactOtterModule.instant(1))
		
		if current then
			controller.updateCommittedEdit("text", nil)
			
			return
		end
		var41(reactOtterModule.instant(1))
		var33(p6)
	end, {
		p0.ctx, controller, var33, var37, var39, var41
	})
	useEffect(function() --[[ line: 265 ]]
		-- upvalues: getFFlagMomentsTextDragToDeleteModule (copy), textOverlays (ref), var41 (ref), reactOtterModule (copy)
		if not getFFlagMomentsTextDragToDeleteModule() then return end
		if textOverlays == nil or #textOverlays == 0 then
			var41(reactOtterModule.instant(1))
		end
	end, { textOverlays })
	useEffect(function() --[[ line: 276 ]]
		-- upvalues: var24 (ref), controller (ref), makeTextOverlayEditsForEditorModule (copy), textOverlays (ref), makeDefaultTextOverlayEditModule (copy), var22 (ref)
		if not var24 then return end
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil or activeSession.getDraft(false) ~= nil then
			return
		end
		activeSession.update(makeTextOverlayEditsForEditorModule(textOverlays, makeDefaultTextOverlayEditModule(), var22))
	end, { var24, textOverlays, controller, var22 })
	local var46 = useRef(false)
	useEffect(function() --[[ line: 292 ]]
		-- upvalues: var24 (ref), var46 (ref), var26 (ref), var25 (ref), var30 (ref)
		if var24 then
			if var46.current or var26.current == nil or var25 == nil then
				return
			end
			var30()
			var46.current = true
			
			return
		else
			var46.current = false
			
			if var26.current then
				var26.current:ReleaseFocus()
			end
		end
	end, { var24, var25, var30 })
	useEffect(function() --[[ line: 307 ]]
		-- upvalues: var24 (ref), var25 (ref), var29 (ref), var28 (ref), textService (copy), var19 (ref)
		if not var24 or var25 == nil then return end
		if var29 == 0 then
			var28(UDim2.fromOffset(0, 0))
			
			return
		end
		local textOverlayStyle = var25.textOverlayStyle
		local wTextSize = textService:GetTextSize("W", textOverlayStyle.fontSize, textOverlayStyle.font, Vector2.new(var19.X, var19.Y))
		var28(UDim2.fromOffset(math.min(wTextSize.X * 30, var19.X / 2), math.min(wTextSize.Y * 5, var19.Y / 2)))
	end, { var24, var25, var29, var19 })
	
	if var24 then
		return if var25 == nil then nil else reactModule.createElement(view, {
			tag = "size-full bg-over-media-0",
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			ZIndex = p0.zIndex or 1
		}, {
			TextOverlay = reactModule.createElement(textOverlay, {
				editable = true,
				onActivated = var30,
				size = var27,
				textOverlayEdit = dashModule.joinDeep(var25, { rotation = 0, position = UDim2.fromScale(0.5, 0.5) }),
				onTextChanged = var31,
				textBoxRef = var26
			})
		})
	elseif textOverlays == nil or #textOverlays == 0 then
		return nil
	end
	local var47 = var18 == creationFlowStateModule.Preview
	local var47_1 = getFFlagMomentsTextDragToDeleteModule() and var47
	local var49 = if getFFlagMomentsStickerButton() then reactModule.createElement(overlayDisplay, {
		editable = false,
		clampToBoundsEnabled = getFFlagMomentsTextOverlayClampToBoundsModule(),
		draggable = var47,
		itemResolution = if var21 then var20 else nil,
		itemSize = var19,
		scaleType = Enum.ScaleType.Crop,
		onOverlayActivated = if var47 then var32 else nil,
		onOverlayDragBegin = if var47 then var43 else nil,
		onOverlayDragContinue = if var47_1 then var44 else nil,
		onOverlayDragEnd = if var47 then var45 else nil,
		overlayEdits = textOverlays,
		overlayComponent = textOverlay,
		visualScale = if var47_1 then var40 else nil,
		zIndex = p0.zIndex
	}) else reactModule.createElement(textOverlayDisplay, {
		editable = false,
		clampToBoundsEnabled = getFFlagMomentsTextOverlayClampToBoundsModule(),
		draggable = var47,
		itemResolution = if var21 then var20 else nil,
		itemSize = var19,
		scaleType = Enum.ScaleType.Crop,
		onTextOverlayActivated = if var47 then var32 else nil,
		onTextOverlayDragBegin = if var47 then var43 else nil,
		onTextOverlayDragContinue = if var47_1 then var44 else nil,
		onTextOverlayDragEnd = if var47 then var45 else nil,
		textOverlayEdits = textOverlays,
		visualScale = if var47_1 then var40 else nil,
		zIndex = p0.zIndex
	})
	
	return if var47_1 then reactModule.createElement(view, { tag = "size-full", ZIndex = p0.zIndex or 1 }, {
		Overlay = var49,
		TrashZone = reactModule.createElement(textOverlayTrashZoneModule, {
			highlightScale = var38,
			ref = var34,
			visible = var36,
			ZIndex = (p0.zIndex or 1) + 10
		})
	}) else var49
end