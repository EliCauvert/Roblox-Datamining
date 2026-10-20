local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local View = FoundationModule.View
local UseCallbackFunction = ReactModule.useCallback
local UseMemoFunction = ReactModule.useMemo
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local OverlayDisplay = MomentsCommonModule.Components.OverlayDisplay
local StickerOverlay = MomentsCommonModule.Components.StickerOverlay
local CreationFlowStateModule = require(MomentsCreation.Enums.CreationFlowState)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local _ = require(Parent.MomentsTypes)

return function(p1)
	-- upvalues: UseSignalStateFunction (copy), UseMemoFunction (copy), SignalsModule (copy), CreationFlowStateModule (copy), UseCallbackFunction (copy), ReactModule (copy), View (copy), FoundationModule (copy), StickerOverlay (copy), DashModule (copy), OverlayDisplay (copy)
	local Controller = p1.controller
	local UseSignalStateResult = UseSignalStateFunction(Controller.getStep)
	local UseSignalStateResult1 = UseSignalStateFunction(p1.ctx.getItemSize)
	local StickerOverlays = UseSignalStateFunction(Controller.getComposedEdits).stickerOverlays
	local UseSignalStateResult2 = UseSignalStateFunction((UseMemoFunction(function()
		-- upvalues: SignalsModule (upval), Controller (copy)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: Controller (upval)
			local ActiveSession = Controller.getActiveSession(p2)
			
			return if ActiveSession == nil then nil else ActiveSession.getDraft(p2)
		end)
	end, { Controller })))
	local IsUseSignalStateResultMatch = UseSignalStateResult == CreationFlowStateModule.StickerOverlay
	local UseSignalStateResultEntry = UseSignalStateResult2 and UseSignalStateResult2[1]
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: Controller (copy)
		Controller.beginTool("sticker")
	end, { Controller })
	local UseCallbackResult1 = UseCallbackFunction(function(p2)
		-- upvalues: Controller (copy)
		Controller.updateCommittedEdit("sticker", p2)
	end, { Controller })
	
	if IsUseSignalStateResultMatch then
		return ReactModule.createElement(View, {
			tag = "size-full bg-over-media-0",
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			},
			ZIndex = p1.zIndex or 1
		}, {
			ImageOverlay = if UseSignalStateResultEntry == nil or UseSignalStateResultEntry.stickerURI == nil then nil else ReactModule.createElement(StickerOverlay, {
				overlayEdit = DashModule.joinDeep(UseSignalStateResultEntry, { rotation = 0, position = UDim2.fromScale(0.5, 0.5) })
			})
		})
	elseif StickerOverlays == nil or #StickerOverlays == 0 then
		return nil
	else
		local IsUseSignalStateResultMatch1 = UseSignalStateResult == CreationFlowStateModule.Preview
		
		return ReactModule.createElement(OverlayDisplay, {
			editable = false,
			itemResolution = nil,
			draggable = IsUseSignalStateResultMatch1,
			itemSize = UseSignalStateResult1,
			scaleType = Enum.ScaleType.Crop,
			onOverlayActivated = if IsUseSignalStateResultMatch1 then UseCallbackResult else nil,
			onOverlayDragEnd = if IsUseSignalStateResultMatch1 then UseCallbackResult1 else nil,
			overlayEdits = StickerOverlays,
			overlayComponent = StickerOverlay,
			zIndex = p1.zIndex
		})
	end
end