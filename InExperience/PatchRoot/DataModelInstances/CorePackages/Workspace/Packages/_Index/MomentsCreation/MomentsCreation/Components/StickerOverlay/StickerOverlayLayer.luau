local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local view = foundationModule.View
local useCallback = reactModule.useCallback
local useMemo = reactModule.useMemo
local useSignalState = signalsReactModule.useSignalState
local overlayDisplay = momentsCommonModule.Components.OverlayDisplay
local stickerOverlay = momentsCommonModule.Components.StickerOverlay
local creationFlowStateModule = require(momentsCreation.Enums.CreationFlowState)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local _ = require(parent.MomentsTypes)

return function(p0) --[[ line: 43 | named "StickerOverlayLayer" ]]
	-- upvalues: useSignalState (ref), useMemo (ref), signalsModule (ref), creationFlowStateModule (ref), useCallback (ref), reactModule (ref), view (ref), foundationModule (ref), stickerOverlay (ref), dashModule (ref), overlayDisplay (ref)
	local controller = p0.controller
	local var8 = useSignalState(controller.getStep)
	local var9 = useSignalState(p0.ctx.getItemSize)
	local stickerOverlays = useSignalState(controller.getComposedEdits).stickerOverlays
	local var10 = useSignalState(useMemo(function() --[[ line: 52 ]]
		-- upvalues: signalsModule (copy), controller (ref)
		return signalsModule.createComputed(function(p1) --[[ line: 53 ]]
			-- upvalues: controller (copy)
			local activeSession = controller.getActiveSession(p1)
			
			return if activeSession == nil then nil else activeSession.getDraft(p1)
		end)
	end, { controller }))
	local var11 = var8 == creationFlowStateModule.StickerOverlay
	local var12 = var10 and var10[1]
	local var13 = useCallback(function() --[[ line: 63 ]]
		-- upvalues: controller (ref)
		controller.beginTool("sticker")
	end, { controller })
	local var14 = useCallback(function(p2) --[[ line: 67 ]]
		-- upvalues: controller (ref)
		controller.updateCommittedEdit("sticker", p2)
	end, { controller })
	
	if var11 then
		return reactModule.createElement(view, {
			tag = "size-full bg-over-media-0",
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			ZIndex = p0.zIndex or 1
		}, {
			ImageOverlay = if var12 == nil or var12.stickerURI == nil then nil else reactModule.createElement(stickerOverlay, {
				overlayEdit = dashModule.joinDeep(var12, { rotation = 0, position = UDim2.fromScale(0.5, 0.5) })
			})
		})
	elseif stickerOverlays == nil or #stickerOverlays == 0 then
		return nil
	end
	local var15 = var8 == creationFlowStateModule.Preview
	
	return reactModule.createElement(overlayDisplay, {
		editable = false,
		itemResolution = nil,
		draggable = var15,
		itemSize = var9,
		scaleType = Enum.ScaleType.Crop,
		onOverlayActivated = if var15 then var13 else nil,
		onOverlayDragEnd = if var15 then var14 else nil,
		overlayEdits = stickerOverlays,
		overlayComponent = stickerOverlay,
		zIndex = p0.zIndex
	})
end