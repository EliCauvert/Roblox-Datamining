local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local textService = game:GetService("TextService")
local view = foundationModule.View
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
local creationFlowStateModule = require(momentsCreation.Enums.CreationFlowState)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local _ = require(parent.MomentsTypes)
local useOnScreenKeyboardHeightModule = require(momentsCreation.Hooks.useOnScreenKeyboardHeight)
local makeDefaultTextOverlayEditModule = require(momentsCreation.Utils.makeDefaultTextOverlayEdit)
local makeTextOverlayEditsForEditorModule = require(momentsCreation.Utils.makeTextOverlayEditsForEditor)
local getFFlagMomentsTextOverlayClampToBoundsModule = require(momentsCreation.Flags.GetFFlagMomentsTextOverlayClampToBounds)
local getFFlagMomentsCreationTextOverlayResolutionScaleModule = require(momentsCreation.Flags.GetFFlagMomentsCreationTextOverlayResolutionScale)

return function(p0) --[[ line: 77 | named "TextOverlayLayer" ]]
	-- upvalues: useSignalState (ref), getFFlagMomentsCreationTextOverlayResolutionScaleModule (ref), getScale (ref), useMemo (ref), signalsModule (ref), creationFlowStateModule (ref), useRef (ref), useBinding (ref), useOnScreenKeyboardHeightModule (ref), useCallback (ref), getFFlagMomentsStickerButton (ref), dashModule (ref), useEffect (ref), makeTextOverlayEditsForEditorModule (ref), makeDefaultTextOverlayEditModule (ref), textService (ref), reactModule (ref), view (ref), foundationModule (ref), textOverlay (ref), overlayDisplay (ref), getFFlagMomentsTextOverlayClampToBoundsModule (ref), textOverlayDisplay (ref)
	local controller = p0.controller
	local var14 = useSignalState(controller.getStep)
	local var15 = useSignalState(p0.ctx.getItemSize)
	local var16 = useSignalState(p0.ctx.getItemResolution)
	local textOverlays = useSignalState(controller.getComposedEdits).textOverlays
	local var17 = getFFlagMomentsCreationTextOverlayResolutionScaleModule()
	local var18 = if var17 then getScale(var15, var16, Enum.ScaleType.Crop) else 1
	local var19 = useSignalState(useMemo(function() --[[ line: 94 ]]
		-- upvalues: signalsModule (copy), controller (ref)
		return signalsModule.createComputed(function(p1) --[[ line: 95 ]]
			-- upvalues: controller (copy)
			local activeSession = controller.getActiveSession(p1)
			
			return if activeSession == nil then nil else activeSession.getDraft(p1)
		end)
	end, { controller }))
	local var20 = var14 == creationFlowStateModule.TextOverlay
	local var21 = var19 and var19[1]
	local var22 = useRef(nil)
	local var23, var24 = useBinding(UDim2.fromOffset(0, 0))
	local var25 = useOnScreenKeyboardHeightModule()
	local var26 = useCallback(function() --[[ line: 109 ]]
		-- upvalues: var22 (ref)
		if var22.current then
			var22.current:CaptureFocus()
		end
	end, {})
	local var27 = useCallback(function(p2) --[[ line: 115 ]]
		-- upvalues: controller (ref), getFFlagMomentsStickerButton (copy), dashModule (copy)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil then return end
		local draft = activeSession.getDraft(false)
		local var35 = draft and draft[1]
		
		if var35 == nil then return end
		local charCount = utf8.len(p2.Text)
		
		if charCount ~= nil and charCount >= 100 then
			local byteOffset = utf8.offset(p2.Text, 101)
			
			if not getFFlagMomentsStickerButton() then
				p2.Text = string.sub(p2.Text, 1, byteOffset - 1)
			elseif byteOffset then
				p2.Text = string.sub(p2.Text, 1, byteOffset - 1)
			end
		end
		activeSession.update({ dashModule.joinDeep(var35, { text = p2.Text }) })
	end, { controller })
	local var28 = useCallback(function() --[[ line: 142 ]]
		-- upvalues: controller (ref)
		controller.beginTool("text")
	end, { controller })
	local var29 = useCallback(function(p3) --[[ line: 146 ]]
		-- upvalues: controller (ref)
		controller.updateCommittedEdit("text", p3)
	end, { controller })
	useEffect(function() --[[ line: 152 ]]
		-- upvalues: var20 (ref), controller (ref), makeTextOverlayEditsForEditorModule (copy), textOverlays (ref), makeDefaultTextOverlayEditModule (copy), var18 (ref)
		if not var20 then return end
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil or activeSession.getDraft(false) ~= nil then
			return
		end
		activeSession.update(makeTextOverlayEditsForEditorModule(textOverlays, makeDefaultTextOverlayEditModule(), var18))
	end, { var20, textOverlays, controller, var18 })
	local var30 = useRef(false)
	useEffect(function() --[[ line: 168 ]]
		-- upvalues: var20 (ref), var30 (ref), var22 (ref), var21 (ref), var26 (ref)
		if var20 then
			if var30.current or var22.current == nil or var21 == nil then
				return
			end
			var26()
			var30.current = true
			
			return
		else
			var30.current = false
			
			if var22.current then
				var22.current:ReleaseFocus()
			end
		end
	end, { var20, var21, var26 })
	useEffect(function() --[[ line: 183 ]]
		-- upvalues: var20 (ref), var21 (ref), var25 (ref), var24 (ref), textService (copy), var15 (ref)
		if not var20 or var21 == nil then return end
		if var25 == 0 then
			var24(UDim2.fromOffset(0, 0))
			
			return
		end
		local textOverlayStyle = var21.textOverlayStyle
		local wTextSize = textService:GetTextSize("W", textOverlayStyle.fontSize, textOverlayStyle.font, Vector2.new(var15.X, var15.Y))
		var24(UDim2.fromOffset(math.min(wTextSize.X * 30, var15.X / 2), math.min(wTextSize.Y * 5, var15.Y / 2)))
	end, { var20, var21, var25, var15 })
	
	if var20 then
		return if var21 == nil then nil else reactModule.createElement(view, {
			tag = "size-full bg-over-media-0",
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			ZIndex = p0.zIndex or 1
		}, {
			TextOverlay = reactModule.createElement(textOverlay, {
				editable = true,
				onActivated = var26,
				size = var23,
				textOverlayEdit = dashModule.joinDeep(var21, { rotation = 0, position = UDim2.fromScale(0.5, 0.5) }),
				onTextChanged = var27,
				textBoxRef = var22
			})
		})
	elseif textOverlays == nil or #textOverlays == 0 then
		return nil
	end
	local var31 = var14 == creationFlowStateModule.Preview
	
	return if getFFlagMomentsStickerButton() then reactModule.createElement(overlayDisplay, {
		editable = false,
		clampToBoundsEnabled = getFFlagMomentsTextOverlayClampToBoundsModule(),
		draggable = var31,
		itemResolution = if var17 then var16 else nil,
		itemSize = var15,
		scaleType = Enum.ScaleType.Crop,
		onOverlayActivated = if var31 then var28 else nil,
		onOverlayDragEnd = if var31 then var29 else nil,
		overlayEdits = textOverlays,
		overlayComponent = textOverlay,
		zIndex = p0.zIndex
	}) else reactModule.createElement(textOverlayDisplay, {
		editable = false,
		clampToBoundsEnabled = getFFlagMomentsTextOverlayClampToBoundsModule(),
		draggable = var31,
		itemResolution = if var17 then var16 else nil,
		itemSize = var15,
		scaleType = Enum.ScaleType.Crop,
		onTextOverlayActivated = if var31 then var28 else nil,
		onTextOverlayDragEnd = if var31 then var29 else nil,
		textOverlayEdits = textOverlays,
		zIndex = p0.zIndex
	})
end