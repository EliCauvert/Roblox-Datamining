local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local TextService = game:GetService("TextService")
local View = FoundationModule.View
local UseBindingFunction = ReactModule.useBinding
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseMemoFunction = ReactModule.useMemo
local UseRefFunction = ReactModule.useRef
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local OverlayDisplay = MomentsCommonModule.Components.OverlayDisplay
local TextOverlay = MomentsCommonModule.Components.TextOverlay
local TextOverlayDisplay = MomentsCommonModule.Components.TextOverlayDisplay
local GetFFlagMomentsStickerButtonFunction = MomentsCommonModule.Flags.GetFFlagMomentsStickerButton
local CreationFlowStateModule = require(MomentsCreation.Enums.CreationFlowState)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local _ = require(Parent.MomentsTypes)
local UseOnScreenKeyboardHeightModule = require(MomentsCreation.Hooks.useOnScreenKeyboardHeight)
local MakeDefaultTextOverlayEditModule = require(MomentsCreation.Utils.makeDefaultTextOverlayEdit)
local MakeTextOverlayEditsForEditorModule = require(MomentsCreation.Utils.makeTextOverlayEditsForEditor)
local GetFFlagMomentsTextOverlayClampToBoundsModule = require(MomentsCreation.Flags.GetFFlagMomentsTextOverlayClampToBounds)

return function(p1)
	-- upvalues: UseSignalStateFunction (copy), UseMemoFunction (copy), SignalsModule (copy), CreationFlowStateModule (copy), UseRefFunction (copy), UseBindingFunction (copy), UseOnScreenKeyboardHeightModule (copy), UseCallbackFunction (copy), GetFFlagMomentsStickerButtonFunction (copy), DashModule (copy), UseEffectFunction (copy), MakeTextOverlayEditsForEditorModule (copy), MakeDefaultTextOverlayEditModule (copy), TextService (copy), ReactModule (copy), View (copy), FoundationModule (copy), TextOverlay (copy), OverlayDisplay (copy), GetFFlagMomentsTextOverlayClampToBoundsModule (copy), TextOverlayDisplay (copy)
	local Controller = p1.controller
	local UseSignalStateResult = UseSignalStateFunction(Controller.getStep)
	local UseSignalStateResult1 = UseSignalStateFunction(p1.ctx.getItemSize)
	local TextOverlays = UseSignalStateFunction(Controller.getComposedEdits).textOverlays
	local UseSignalStateResult2 = UseSignalStateFunction((UseMemoFunction(function()
		-- upvalues: SignalsModule (upval), Controller (copy)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: Controller (upval)
			local ActiveSession = Controller.getActiveSession(p2)
			
			return if ActiveSession == nil then nil else ActiveSession.getDraft(p2)
		end)
	end, { Controller })))
	local IsUseSignalStateResultMatch = UseSignalStateResult == CreationFlowStateModule.TextOverlay
	local UseSignalStateResultEntry = UseSignalStateResult2 and UseSignalStateResult2[1]
	local UseRefResult = UseRefFunction(nil)
	local UseBindingResult, UseBindingResult2 = UseBindingFunction(UDim2.fromOffset(0, 0))
	local UseOnScreenKeyboardHeightModuleResult = UseOnScreenKeyboardHeightModule()
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			UseRefResult.current:CaptureFocus()
		end
	end, {})
	local UseCallbackResult1 = UseCallbackFunction(function(p2)
		-- upvalues: Controller (copy), GetFFlagMomentsStickerButtonFunction (upval), DashModule (upval)
		local ActiveSession = Controller.getActiveSession(false)
		
		if ActiveSession == nil then return end
		local Draft = ActiveSession.getDraft(false)
		local DraftEntry = Draft and Draft[1]
		
		if DraftEntry == nil then return end
		local Length = utf8.len(p2.Text)
		
		if Length ~= nil and Length >= 100 then
			local OffsetResult = utf8.offset(p2.Text, 101)
			
			if GetFFlagMomentsStickerButtonFunction() then
				if OffsetResult then
					p2.Text = string.sub(p2.Text, 1, OffsetResult - 1)
				end
			else
				p2.Text = string.sub(p2.Text, 1, OffsetResult - 1)
			end
		end
		ActiveSession.update({ DashModule.joinDeep(DraftEntry, { text = p2.Text }) })
	end, { Controller })
	local UseCallbackResult2 = UseCallbackFunction(function()
		-- upvalues: Controller (copy)
		Controller.beginTool("text")
	end, { Controller })
	local UseCallbackResult3 = UseCallbackFunction(function(p2)
		-- upvalues: Controller (copy)
		Controller.updateCommittedEdit("text", p2)
	end, { Controller })
	UseEffectFunction(function()
		-- upvalues: IsUseSignalStateResultMatch (copy), Controller (copy), MakeTextOverlayEditsForEditorModule (upval), TextOverlays (copy), MakeDefaultTextOverlayEditModule (upval)
		if not IsUseSignalStateResultMatch then return end
		local ActiveSession = Controller.getActiveSession(false)
		
		if ActiveSession ~= nil and ActiveSession.getDraft(false) == nil then
			ActiveSession.update(MakeTextOverlayEditsForEditorModule(TextOverlays, MakeDefaultTextOverlayEditModule(), 1))
			
			return
		end
	end, { IsUseSignalStateResultMatch, TextOverlays, Controller })
	local UseRefResult1 = UseRefFunction(false)
	UseEffectFunction(function()
		-- upvalues: IsUseSignalStateResultMatch (copy), UseRefResult1 (copy), UseRefResult (copy), UseSignalStateResultEntry (copy), UseCallbackResult (copy)
		if not IsUseSignalStateResultMatch then
			UseRefResult1.current = false
			
			if UseRefResult.current then
				UseRefResult.current:ReleaseFocus()
			end
			return
		elseif not UseRefResult1.current and UseRefResult.current ~= nil and UseSignalStateResultEntry ~= nil then
			UseCallbackResult()
			UseRefResult1.current = true
			
			return
		else
		end
	end, {
		IsUseSignalStateResultMatch,
		UseSignalStateResultEntry,
		UseCallbackResult
	})
	UseEffectFunction(function()
		-- upvalues: IsUseSignalStateResultMatch (copy), UseSignalStateResultEntry (copy), UseOnScreenKeyboardHeightModuleResult (copy), UseBindingResult2 (copy), TextService (upval), UseSignalStateResult1 (copy)
		if not IsUseSignalStateResultMatch or UseSignalStateResultEntry == nil then return end
		if UseOnScreenKeyboardHeightModuleResult == 0 then
			UseBindingResult2(UDim2.fromOffset(0, 0))
			
			return
		else
			local TextOverlayStyle = UseSignalStateResultEntry.textOverlayStyle
			local WTextSize = TextService:GetTextSize("W", TextOverlayStyle.fontSize, TextOverlayStyle.font, Vector2.new(UseSignalStateResult1.X, UseSignalStateResult1.Y))
			UseBindingResult2(UDim2.fromOffset(math.min(WTextSize.X * 30, UseSignalStateResult1.X / 2), (math.min(WTextSize.Y * 5, UseSignalStateResult1.Y / 2))))
		end
	end, {
		IsUseSignalStateResultMatch,
		UseSignalStateResultEntry,
		UseOnScreenKeyboardHeightModuleResult,
		UseSignalStateResult1
	})
	
	if IsUseSignalStateResultMatch then
		return if UseSignalStateResultEntry == nil then nil else ReactModule.createElement(View, {
			tag = "size-full bg-over-media-0",
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			},
			ZIndex = p1.zIndex or 1
		}, {
			TextOverlay = ReactModule.createElement(TextOverlay, {
				editable = true,
				onActivated = UseCallbackResult,
				size = UseBindingResult,
				textOverlayEdit = DashModule.joinDeep(UseSignalStateResultEntry, { rotation = 0, position = UDim2.fromScale(0.5, 0.5) }),
				onTextChanged = UseCallbackResult1,
				textBoxRef = UseRefResult
			})
		})
	elseif TextOverlays == nil or #TextOverlays == 0 then
		return nil
	else
		local IsUseSignalStateResultMatch1 = UseSignalStateResult == CreationFlowStateModule.Preview
		
		return if GetFFlagMomentsStickerButtonFunction() then ReactModule.createElement(OverlayDisplay, {
			editable = false,
			itemResolution = nil,
			clampToBoundsEnabled = GetFFlagMomentsTextOverlayClampToBoundsModule(),
			draggable = IsUseSignalStateResultMatch1,
			itemSize = UseSignalStateResult1,
			scaleType = Enum.ScaleType.Crop,
			onOverlayActivated = if IsUseSignalStateResultMatch1 then UseCallbackResult2 else nil,
			onOverlayDragEnd = if IsUseSignalStateResultMatch1 then UseCallbackResult3 else nil,
			overlayEdits = TextOverlays,
			overlayComponent = TextOverlay,
			zIndex = p1.zIndex
		}) else ReactModule.createElement(TextOverlayDisplay, {
			editable = false,
			itemResolution = nil,
			clampToBoundsEnabled = GetFFlagMomentsTextOverlayClampToBoundsModule(),
			draggable = IsUseSignalStateResultMatch1,
			itemSize = UseSignalStateResult1,
			scaleType = Enum.ScaleType.Crop,
			onTextOverlayActivated = if IsUseSignalStateResultMatch1 then UseCallbackResult2 else nil,
			onTextOverlayDragEnd = if IsUseSignalStateResultMatch1 then UseCallbackResult3 else nil,
			textOverlayEdits = TextOverlays,
			zIndex = p1.zIndex
		})
	end
end