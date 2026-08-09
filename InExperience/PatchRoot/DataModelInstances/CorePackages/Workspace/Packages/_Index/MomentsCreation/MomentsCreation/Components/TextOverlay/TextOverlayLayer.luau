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
local textOverlay = momentsCommonModule.Components.TextOverlay
local textOverlayDisplay = momentsCommonModule.Components.TextOverlayDisplay
local creationFlowStateModule = require(momentsCreation.Enums.CreationFlowState)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local _ = require(parent.MomentsTypes)
local useOnScreenKeyboardHeightModule = require(momentsCreation.Hooks.useOnScreenKeyboardHeight)
local makeDefaultTextOverlayEditModule = require(momentsCreation.Utils.makeDefaultTextOverlayEdit)
local makeTextOverlayEditsForEditorModule = require(momentsCreation.Utils.makeTextOverlayEditsForEditor)

return function(p0) --[[ line: 70 | named "TextOverlayLayer" ]]
	-- upvalues: useSignalState (ref), useMemo (ref), signalsModule (ref), creationFlowStateModule (ref), useRef (ref), useBinding (ref), useOnScreenKeyboardHeightModule (ref), useCallback (ref), dashModule (ref), useEffect (ref), makeTextOverlayEditsForEditorModule (ref), makeDefaultTextOverlayEditModule (ref), textService (ref), reactModule (ref), view (ref), foundationModule (ref), textOverlay (ref), textOverlayDisplay (ref)
	local controller = p0.controller
	local var12 = useSignalState(controller.getStep)
	local var13 = useSignalState(p0.ctx.getItemSize)
	local textOverlays = useSignalState(controller.getComposedEdits).textOverlays
	local var14 = useSignalState(useMemo(function() --[[ line: 79 ]]
		-- upvalues: signalsModule (copy), controller (ref)
		return signalsModule.createComputed(function(p1) --[[ line: 80 ]]
			-- upvalues: controller (copy)
			local activeSession = controller.getActiveSession(p1)
			
			return if activeSession == nil then nil else activeSession.getDraft(p1)
		end)
	end, { controller }))
	local var15 = var12 == creationFlowStateModule.TextOverlay
	local var16 = var14 and var14[1]
	local var17 = useRef(nil)
	local var18, var19 = useBinding(UDim2.fromOffset(0, 0))
	local var20 = useOnScreenKeyboardHeightModule()
	local var21 = useCallback(function() --[[ line: 94 ]]
		-- upvalues: var17 (ref)
		if var17.current then
			var17.current:CaptureFocus()
		end
	end, {})
	local var22 = useCallback(function(p2) --[[ line: 100 ]]
		-- upvalues: controller (ref), dashModule (copy)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil then return end
		local draft = activeSession.getDraft(false)
		local var30 = draft and draft[1]
		
		if var30 == nil then return end
		local charCount = utf8.len(p2.Text)
		
		if charCount ~= nil and charCount >= 100 then
			p2.Text = string.sub(p2.Text, 1, utf8.offset(p2.Text, 101) - 1)
		end
		activeSession.update({ dashModule.joinDeep(var30, { text = p2.Text }) })
	end, { controller })
	local var23 = useCallback(function() --[[ line: 121 ]]
		-- upvalues: controller (ref)
		controller.beginTool("text")
	end, { controller })
	local var24 = useCallback(function(p3) --[[ line: 125 ]]
		-- upvalues: controller (ref)
		controller.updateCommittedEdit("text", p3)
	end, { controller })
	useEffect(function() --[[ line: 131 ]]
		-- upvalues: var15 (ref), controller (ref), makeTextOverlayEditsForEditorModule (copy), textOverlays (ref), makeDefaultTextOverlayEditModule (copy)
		if not var15 then return end
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil or activeSession.getDraft(false) ~= nil then
			return
		end
		activeSession.update(makeTextOverlayEditsForEditorModule(textOverlays, makeDefaultTextOverlayEditModule(), 1))
	end, { var15, textOverlays, controller })
	local var25 = useRef(false)
	useEffect(function() --[[ line: 147 ]]
		-- upvalues: var15 (ref), var25 (ref), var17 (ref), var16 (ref), var21 (ref)
		if var15 then
			if var25.current or var17.current == nil or var16 == nil then
				return
			end
			var21()
			var25.current = true
			
			return
		else
			var25.current = false
			
			if var17.current then
				var17.current:ReleaseFocus()
			end
		end
	end, { var15, var16, var21 })
	useEffect(function() --[[ line: 162 ]]
		-- upvalues: var15 (ref), var16 (ref), var20 (ref), var19 (ref), textService (copy), var13 (ref)
		if not var15 or var16 == nil then return end
		if var20 == 0 then
			var19(UDim2.fromOffset(0, 0))
			
			return
		end
		local textOverlayStyle = var16.textOverlayStyle
		local wTextSize = textService:GetTextSize("W", textOverlayStyle.fontSize, textOverlayStyle.font, Vector2.new(var13.X, var13.Y))
		var19(UDim2.fromOffset(math.min(wTextSize.X * 30, var13.X / 2), math.min(wTextSize.Y * 5, var13.Y / 2)))
	end, { var15, var16, var20, var13 })
	
	if var15 then
		return if var16 == nil then nil else reactModule.createElement(view, {
			tag = "size-full bg-over-media-0",
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			ZIndex = p0.zIndex or 1
		}, {
			TextOverlay = reactModule.createElement(textOverlay, {
				editable = true,
				onActivated = var21,
				size = var18,
				textOverlayEdit = dashModule.joinDeep(var16, { rotation = 0, position = UDim2.fromScale(0.5, 0.5) }),
				onTextChanged = var22,
				textBoxRef = var17
			})
		})
	elseif textOverlays == nil or #textOverlays == 0 then
		return nil
	end
	local var26 = var12 == creationFlowStateModule.Preview
	
	return reactModule.createElement(textOverlayDisplay, {
		editable = false,
		itemResolution = nil,
		draggable = var26,
		itemSize = var13,
		scaleType = Enum.ScaleType.Crop,
		onTextOverlayActivated = if var26 then var23 else nil,
		onTextOverlayDragEnd = if var26 then var24 else nil,
		textOverlayEdits = textOverlays,
		zIndex = p0.zIndex
	})
end