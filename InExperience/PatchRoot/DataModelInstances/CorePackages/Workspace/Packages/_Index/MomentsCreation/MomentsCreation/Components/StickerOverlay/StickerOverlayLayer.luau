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

return function(p1)
	-- upvalues: useSignalState (ref), useMemo (ref), signalsModule (ref), creationFlowStateModule (ref), useCallback (ref), reactModule (ref), view (ref), foundationModule (ref), stickerOverlay (ref), dashModule (ref), overlayDisplay (ref)
	local controller = p1.controller
	local var1 = useSignalState(controller.getStep)
	local var2 = useSignalState(p1.ctx.getItemSize)
	local stickerOverlays = useSignalState(controller.getComposedEdits).stickerOverlays
	local var3 = useSignalState(useMemo(function()
		-- upvalues: signalsModule (copy), controller (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: controller (copy)
			local activeSession = controller.getActiveSession(p2)
			
			return if activeSession == nil then nil else activeSession.getDraft(p2)
		end)
	end, { controller }))
	local var4 = var1 == creationFlowStateModule.StickerOverlay
	local var5 = var3 and var3[1]
	local var6 = useCallback(function()
		-- upvalues: controller (ref)
		controller.beginTool("sticker")
	end, { controller })
	local var7 = useCallback(function(p2)
		-- upvalues: controller (ref)
		controller.updateCommittedEdit("sticker", p2)
	end, { controller })
	
	if var4 then
		return reactModule.createElement(view, {
			tag = "size-full bg-over-media-0",
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			ZIndex = p1.zIndex or 1
		}, {
			ImageOverlay = if var5 == nil or var5.stickerURI == nil then nil else reactModule.createElement(stickerOverlay, {
				overlayEdit = dashModule.joinDeep(var5, { rotation = 0, position = UDim2.fromScale(0.5, 0.5) })
			})
		})
	elseif stickerOverlays == nil or #stickerOverlays == 0 then
		return nil
	end
	local var8 = var1 == creationFlowStateModule.Preview
	
	return reactModule.createElement(overlayDisplay, {
		editable = false,
		itemResolution = nil,
		draggable = var8,
		itemSize = var2,
		scaleType = Enum.ScaleType.Crop,
		onOverlayActivated = if var8 then var6 else nil,
		onOverlayDragEnd = if var8 then var7 else nil,
		overlayEdits = stickerOverlays,
		overlayComponent = stickerOverlay,
		zIndex = p1.zIndex
	})
end