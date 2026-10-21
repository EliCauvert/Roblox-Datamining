local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local SignalsModule = require(Parent.Signals)
local GuiService = game:GetService("GuiService")
local TextService = game:GetService("TextService")
local UIDragDetectorFixEventPositionEnabledEngineFeature = game:GetEngineFeature("UIDragDetectorFixEventPositionEnabled")
local Button = FoundationModule.Button
local View = FoundationModule.View
local UseAnimatedBindingFunction = ReactOtterModule.useAnimatedBinding
local UseBindingFunction = ReactModule.useBinding
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseMemoFunction = ReactModule.useMemo
local UseRefFunction = ReactModule.useRef
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseIsMultiTouchActiveFunction = MomentsCommonModule.Hooks.useIsMultiTouchActive
local OverlayDisplay = MomentsCommonModule.Components.OverlayDisplay
local TextOverlay = MomentsCommonModule.Components.TextOverlay
local TextOverlayDisplay = MomentsCommonModule.Components.TextOverlayDisplay
local GetScaleFunction = MomentsCommonModule.Utils.getScale
local GetFFlagMomentsStickerButtonFunction = MomentsCommonModule.Flags.GetFFlagMomentsStickerButton
local GetFFlagEnableMomentTextGenerationFunction = MomentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration
local FFlagMomentsTextOverlayV2Redesign = MomentsCommonModule.Flags.FFlagMomentsTextOverlayV2Redesign
local EventNames = MomentsCommonModule.Analytics.EventNames
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local CreationFlowStateModule = require(MomentsCreation.Enums.CreationFlowState)
local ConstantsModule = require(MomentsCreation.Constants)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local _ = require(Parent.MomentsTypes)
local TextOverlayTrashZoneModule = require(MomentsCreation.Components.TextOverlay.TextOverlayTrashZone)
local UseOnScreenKeyboardHeightModule = require(MomentsCreation.Hooks.useOnScreenKeyboardHeight)
local UseCreationFlowStringsModule = require(MomentsCreation.Hooks.useCreationFlowStrings)
local GetFFlagMomentsGenerateTextInTextOverlayModule = require(MomentsCreation.Flags.GetFFlagMomentsGenerateTextInTextOverlay)
local MakeDefaultTextOverlayEditModule = require(MomentsCreation.Utils.makeDefaultTextOverlayEdit)
local MakeTextOverlayEditsForEditorModule = require(MomentsCreation.Utils.makeTextOverlayEditsForEditor)
local FitTextOverlayFontSizeModule = require(MomentsCreation.Utils.fitTextOverlayFontSize)
local ComputeEditorChipLayoutModule = require(MomentsCreation.Utils.computeEditorChipLayout)
local IsPointOverTrashTargetModule = require(MomentsCreation.Utils.isPointOverTrashTarget)
local PlayDragToDeleteHapticModule = require(MomentsCreation.Utils.playDragToDeleteHaptic)
local FFlagMomentsTextOverlayChipGrowAboveKeyboard = MomentsCommonModule.Flags.FFlagMomentsTextOverlayChipGrowAboveKeyboard
local FFlagMomentsTextOverlayEdgeClipFix = MomentsCommonModule.Flags.FFlagMomentsTextOverlayEdgeClipFix
local FFlagMomentsTextOverlayChipGrowWidthModule = require(MomentsCreation.Flags.FFlagMomentsTextOverlayChipGrowWidth)
local FFlagMomentsTextOverlayModalTextFixModule = require(MomentsCreation.Flags.FFlagMomentsTextOverlayModalTextFix)
local FFlagMomentsTextOverlayDragToDeleteRefinementModule = require(MomentsCreation.Flags.FFlagMomentsTextOverlayDragToDeleteRefinement)
local FFlagMomentsTextOverlayTopNavModule = require(MomentsCreation.Flags.FFlagMomentsTextOverlayTopNav)
local VerticalFontSizeSliderModule = require(MomentsCreation.Components.TextOverlay.VerticalFontSizeSlider)
local TextOverlayToolbarModule = require(MomentsCreation.Components.TextOverlay.TextOverlayToolbar)
local EditorTopNavModule = require(MomentsCreation.Components.EditorTopNav)
local config = { dampingRatio = 0.85, frequency = 12 }
local NumberSequence1 = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(1, 0.2)
})

local function GenerateTextButton(p1)
	-- upvalues: UseTokensFunction (copy), UseCreationFlowStringsModule (copy), UseSignalStateFunction (copy), UseCallbackFunction (copy), ReactModule (copy), View (copy), Button (copy), FoundationModule (copy), BuilderIconsModule (copy)
	local Controller = p1.controller
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "position-bottom-right anchor-bottom-right auto-xy",
		ZIndex = 10,
		padding = {
			bottom = UDim.new(0, UseTokensResult.Padding.Large),
			right = UDim.new(0, UseTokensResult.Padding.Large)
		}
	}, {
		Button = ReactModule.createElement(Button, {
			fillBehavior = FoundationModule.Enums.FillBehavior.Fit,
			icon = BuilderIconsModule.Icon.TagSparkle,
			text = UseCreationFlowStringsModule().GenerateTextCta,
			variant = FoundationModule.Enums.ButtonVariant.Emphasis,
			onActivated = UseCallbackFunction(function()
				-- upvalues: Controller (copy)
				Controller.beginTool("generateText")
			end, { Controller }),
			isLoading = UseSignalStateFunction(Controller.getIsGenerating),
			size = FoundationModule.Enums.InputSize.Medium
		})
	})
end

return function(p1)
	-- upvalues: UseSignalStateFunction (copy), GetScaleFunction (copy), UseMemoFunction (copy), SignalsModule (copy), CreationFlowStateModule (copy), UseRefFunction (copy), UseBindingFunction (copy), UseOnScreenKeyboardHeightModule (copy), FFlagMomentsTextOverlayModalTextFixModule (copy), FFlagMomentsTextOverlayV2Redesign (copy), ConstantsModule (copy), FFlagMomentsTextOverlayEdgeClipFix (copy), TextService (copy), FitTextOverlayFontSizeModule (copy), UseCallbackFunction (copy), GetFFlagMomentsStickerButtonFunction (copy), DashModule (copy), GetFFlagEnableMomentTextGenerationFunction (copy), FireAnalyticsEventModule (copy), EventNames (copy), MakeCreationEventFieldsModule (copy), UseDeviceInsetsFunction (copy), FFlagMomentsTextOverlayTopNavModule (copy), UseTokensFunction (copy), FFlagMomentsTextOverlayDragToDeleteRefinementModule (copy), UseCreationFlowStringsModule (copy), UseAnimatedBindingFunction (copy), UseIsMultiTouchActiveFunction (copy), UIDragDetectorFixEventPositionEnabledEngineFeature (copy), GuiService (copy), IsPointOverTrashTargetModule (copy), ReactOtterModule (copy), PlayDragToDeleteHapticModule (copy), config (copy), UseEffectFunction (copy), MakeTextOverlayEditsForEditorModule (copy), MakeDefaultTextOverlayEditModule (copy), FFlagMomentsTextOverlayChipGrowAboveKeyboard (copy), ComputeEditorChipLayoutModule (copy), FFlagMomentsTextOverlayChipGrowWidthModule (copy), ReactModule (copy), View (copy), FoundationModule (copy), TextOverlay (copy), GetFFlagMomentsGenerateTextInTextOverlayModule (copy), GenerateTextButton (copy), VerticalFontSizeSliderModule (copy), NumberSequence1 (copy), EditorTopNavModule (copy), TextOverlayToolbarModule (copy), OverlayDisplay (copy), TextOverlayDisplay (copy), TextOverlayTrashZoneModule (copy)
	local Controller = p1.controller
	local UseSignalStateResult = UseSignalStateFunction(Controller.getStep)
	local UseSignalStateResult1 = UseSignalStateFunction(p1.ctx.getItemSize)
	local UseSignalStateResult2 = UseSignalStateFunction(p1.ctx.getItemResolution)
	local TextOverlays = UseSignalStateFunction(Controller.getComposedEdits).textOverlays
	local Scale: number = GetScaleFunction(UseSignalStateResult1, UseSignalStateResult2, Enum.ScaleType.Crop)
	local UseSignalStateResult3 = UseSignalStateFunction((UseMemoFunction(function()
		-- upvalues: SignalsModule (upval), Controller (copy)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: Controller (upval)
			local ActiveSession = Controller.getActiveSession(p2)
			
			return if ActiveSession == nil then nil else ActiveSession.getDraft(p2)
		end)
	end, { Controller })))
	local IsUseSignalStateResultMatch = UseSignalStateResult == CreationFlowStateModule.TextOverlay
	local UseSignalStateResultEntry = UseSignalStateResult3 and UseSignalStateResult3[1]
	local UseRefResult = UseRefFunction(nil)
	local UseRefResult1 = UseRefFunction(nil)
	local UseBindingResult, UseBindingResult2 = UseBindingFunction(UDim2.fromOffset(0, 0))
	local UseOnScreenKeyboardHeightModuleResult: number = UseOnScreenKeyboardHeightModule()
	local UseSignalStateResult4 = if FFlagMomentsTextOverlayModalTextFixModule then UseSignalStateFunction(Controller.getActiveModal) else nil
	local HasUseSignalStateResult: boolean = FFlagMomentsTextOverlayModalTextFixModule and UseSignalStateResult4 ~= nil
	local Scale1 = if FFlagMomentsTextOverlayModalTextFixModule then if FFlagMomentsTextOverlayV2Redesign and Scale > 0 then 1 / Scale else 1 else nil
	local UseMemoResult = nil
	UseMemoResult = if FFlagMomentsTextOverlayV2Redesign then UseMemoFunction(function()
		-- upvalues: UseSignalStateResultEntry (copy), ConstantsModule (upval), UseOnScreenKeyboardHeightModuleResult (copy), UseSignalStateResult1 (copy), FFlagMomentsTextOverlayEdgeClipFix (upval), TextService (upval), FitTextOverlayFontSizeModule (upval)
		if UseSignalStateResultEntry == nil then
			return ConstantsModule.TextOverlay.DefaultFontSize
		else
			local FontSize: number = UseSignalStateResultEntry.textOverlayStyle.fontSize
			
			return if UseOnScreenKeyboardHeightModuleResult > 0 then ConstantsModule.TextOverlay.DefaultFontSize else FitTextOverlayFontSizeModule(UseSignalStateResultEntry.text, UseSignalStateResultEntry.textOverlayStyle.font, FontSize, if FFlagMomentsTextOverlayEdgeClipFix then math.min(276 - (math.ceil(FontSize * 0.08) + math.ceil(TextService:GetTextSize(" ", FontSize, UseSignalStateResultEntry.textOverlayStyle.font, Vector2.new(1000000, 1000000)).X) * 2), UseSignalStateResult1.X * 0.9) else math.min(300, UseSignalStateResult1.X * 0.9), UseSignalStateResult1.Y * 0.8, ConstantsModule.TextOverlay.MinFontSize)
		end
	end, {
		UseSignalStateResultEntry,
		UseOnScreenKeyboardHeightModuleResult,
		UseSignalStateResult1
	}) elseif UseSignalStateResultEntry == nil then ConstantsModule.TextOverlay.DefaultFontSize else UseSignalStateResultEntry.textOverlayStyle.fontSize
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			UseRefResult.current:CaptureFocus()
		end
	end, {})
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			UseRefResult.current:ReleaseFocus()
		end
	end, {})
	local UseCallbackResult2 = UseCallbackFunction(function(p2)
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
	local UseCallbackResult3 = UseCallbackFunction(function()
		-- upvalues: GetFFlagEnableMomentTextGenerationFunction (upval), Controller (copy)
		if GetFFlagEnableMomentTextGenerationFunction() and Controller.getIsGenerating(false) then
			Controller.onDisabledToolActivated("text")
			
			return
		else
			Controller.beginTool("text")
		end
	end, { Controller })
	local UseCallbackResult4 = UseCallbackFunction(function(p2)
		-- upvalues: Controller (copy)
		Controller.updateCommittedEdit("text", p2)
	end, { Controller })
	local v1 = nil
	local v2 = nil
	local UseRefResult2 = nil
	local UseRefResult3 = nil
	local v3 = nil
	
	if FFlagMomentsTextOverlayV2Redesign then
		UseRefResult2 = UseRefFunction(false)
		UseRefResult3 = UseRefFunction(false)
		v3 = UseRefFunction(false)
		v1 = UseCallbackFunction(function(Scale)
			-- upvalues: Controller (copy), DashModule (upval), UseRefResult2 (ref), FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval)
			local TextOverlays = Controller.getComposedEdits(false).textOverlays
			local TextOverlay = TextOverlays and TextOverlays[1]
			
			if TextOverlay == nil then return end
			Controller.updateCommittedEdit("text", { DashModule.joinDeep(TextOverlay, { scale = Scale }) })
			
			if not UseRefResult2.current then
				UseRefResult2.current = true
				FireAnalyticsEventModule(EventNames.EditingFlowTextOverlayRescaleUsed, MakeCreationEventFieldsModule.makeTextOverlayEventFields())
			end
		end, { Controller })
		v2 = UseCallbackFunction(function(Rotation)
			-- upvalues: Controller (copy), DashModule (upval), UseRefResult3 (ref), FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval)
			local TextOverlays = Controller.getComposedEdits(false).textOverlays
			local TextOverlay = TextOverlays and TextOverlays[1]
			
			if TextOverlay == nil then return end
			Controller.updateCommittedEdit("text", {
				DashModule.joinDeep(TextOverlay, { rotation = Rotation })
			})
			
			if not UseRefResult3.current then
				UseRefResult3.current = true
				FireAnalyticsEventModule(EventNames.EditingFlowTextOverlayRotateUsed, MakeCreationEventFieldsModule.makeTextOverlayEventFields())
			end
		end, { Controller })
	end
	local UseDeviceInsetsResult = if FFlagMomentsTextOverlayV2Redesign then UseDeviceInsetsFunction() else nil
	local v4 = nil
	local OnBack = nil
	local OnSave = nil
	
	if FFlagMomentsTextOverlayTopNavModule then
		v4 = UseTokensFunction()
		OnBack = UseCallbackFunction(function()
			-- upvalues: Controller (copy)
			Controller.discardActiveTool()
		end, { Controller })
		OnSave = UseCallbackFunction(function()
			-- upvalues: Controller (copy)
			Controller.commitActiveTool()
		end, { Controller })
	end
	local UseRefResult4 = UseRefFunction(nil)
	local CircleRef = nil
	local v5 = nil
	local TextOverlayDragHereToDelete = nil
	
	if FFlagMomentsTextOverlayDragToDeleteRefinementModule then
		CircleRef = UseRefFunction(nil)
		v5 = UseRefFunction(nil)
		TextOverlayDragHereToDelete = UseCreationFlowStringsModule().TextOverlayDragHereToDelete
	end
	local UseRefResult5 = UseRefFunction(false)
	local UseBindingResult1, UseBindingResult2_1 = UseBindingFunction(false)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = UseAnimatedBindingFunction(1)
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = UseAnimatedBindingFunction(1)
	local UseIsMultiTouchActiveResult = if FFlagMomentsTextOverlayV2Redesign then UseIsMultiTouchActiveFunction(UseSignalStateResult == CreationFlowStateModule.Preview) else false
	local UseCallbackResult5 = UseCallbackFunction(function(p2)
		-- upvalues: UseRefResult4 (copy), FFlagMomentsTextOverlayV2Redesign (upval), UIDragDetectorFixEventPositionEnabledEngineFeature (upval), UseDeviceInsetsResult (ref), GuiService (upval), FFlagMomentsTextOverlayDragToDeleteRefinementModule (upval), CircleRef (ref), v5 (ref), UseRefResult5 (copy), UseAnimatedBindingResult (copy), IsPointOverTrashTargetModule (upval)
		local Current = UseRefResult4.current
		
		if Current == nil then
			return false
		end
		local ZeroVector = Vector2.zero
		local v6 = 0
		
		if FFlagMomentsTextOverlayV2Redesign and not UIDragDetectorFixEventPositionEnabledEngineFeature and UseDeviceInsetsResult ~= nil then
			ZeroVector = GuiService:GetGuiInset() + Vector2.new(UseDeviceInsetsResult.left, UseDeviceInsetsResult.top)
		end
		if FFlagMomentsTextOverlayV2Redesign then
			v6 = 24
		end
		if not FFlagMomentsTextOverlayV2Redesign or not FFlagMomentsTextOverlayDragToDeleteRefinementModule then
			return IsPointOverTrashTargetModule(p2, ZeroVector, Current.AbsolutePosition, Current.AbsoluteSize, v6)
		end
		local Current1 = if CircleRef then CircleRef.current else nil
		
		if Current1 == nil or v5 == nil then
			return false
		end
		local v7 = p2 - ZeroVector
		local XRatio = Current1.AbsoluteSize.X / 2
		local NewAbsolutePosition = Current1.AbsolutePosition + Current1.AbsoluteSize / 2
		
		if not UseRefResult5.current and math.abs(UseAnimatedBindingResult:getValue() - 1) < 0.01 then
			v5.current = { center = NewAbsolutePosition, radius = XRatio }
		end
		local Current2 = v5.current or {
			center = NewAbsolutePosition,
			radius = XRatio / math.max(UseAnimatedBindingResult:getValue(), 1)
		}
		
		return if UseRefResult5.current then (v7 - Current2.center).Magnitude <= Current2.radius * 1.15 + 8 or (v7 - NewAbsolutePosition).Magnitude <= XRatio + 8 else (v7 - Current2.center).Magnitude <= Current2.radius
	end, { UseDeviceInsetsResult, UseAnimatedBindingResult })
	local UseCallbackResult6 = UseCallbackFunction(function()
		-- upvalues: FFlagMomentsTextOverlayV2Redesign (upval), p1 (copy), UseRefResult5 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseAnimatedBindingResult2_1 (copy), UseBindingResult2_1 (copy), v3 (ref), FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval)
		if not FFlagMomentsTextOverlayV2Redesign then return end
		if p1.ctx.setIsOverlayDragging then
			p1.ctx.setIsOverlayDragging(true)
		end
		UseRefResult5.current = false
		UseAnimatedBindingResult2(ReactOtterModule.instant(1))
		UseAnimatedBindingResult2_1(ReactOtterModule.instant(1))
		UseBindingResult2_1(true)
		
		if not v3.current then
			v3.current = true
			FireAnalyticsEventModule(EventNames.EditingFlowTextOverlayRepositionUsed, MakeCreationEventFieldsModule.makeTextOverlayEventFields())
		end
	end, {
		p1.ctx,
		UseAnimatedBindingResult2,
		UseAnimatedBindingResult2_1,
		UseBindingResult2_1
	})
	local UseCallbackResult7 = UseCallbackFunction(function(p2)
		-- upvalues: FFlagMomentsTextOverlayV2Redesign (upval), UseCallbackResult5 (copy), UseRefResult5 (copy), FFlagMomentsTextOverlayDragToDeleteRefinementModule (upval), PlayDragToDeleteHapticModule (upval), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config (upval), UseAnimatedBindingResult2_1 (copy)
		if not FFlagMomentsTextOverlayV2Redesign then return end
		local UseCallbackResultResult = UseCallbackResult5(p2)
		
		if UseCallbackResultResult == UseRefResult5.current then return end
		UseRefResult5.current = UseCallbackResultResult
		
		if FFlagMomentsTextOverlayDragToDeleteRefinementModule and UseCallbackResultResult then
			PlayDragToDeleteHapticModule()
		end
		UseAnimatedBindingResult2((ReactOtterModule.spring(if UseCallbackResultResult then 1.15 else 1, config)))
		UseAnimatedBindingResult2_1((ReactOtterModule.spring(if UseCallbackResultResult then 0.45 else 1, config)))
	end, {
		UseCallbackResult5,
		UseAnimatedBindingResult2,
		UseAnimatedBindingResult2_1
	})
	local UseCallbackResult8 = UseCallbackFunction(function(p2)
		-- upvalues: FFlagMomentsTextOverlayV2Redesign (upval), UseCallbackResult4 (copy), p1 (copy), UseRefResult5 (copy), UseBindingResult2_1 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval), Controller (copy), UseAnimatedBindingResult2_1 (copy)
		if not FFlagMomentsTextOverlayV2Redesign then
			UseCallbackResult4(p2)
			
			return
		end
		if p1.ctx.setIsOverlayDragging then
			p1.ctx.setIsOverlayDragging(false)
		end
		local Current = UseRefResult5.current
		UseRefResult5.current = false
		UseBindingResult2_1(false)
		UseAnimatedBindingResult2(ReactOtterModule.instant(1))
		
		if Current then
			FireAnalyticsEventModule(EventNames.EditingFlowTextOverlayDeletedViaTrash, MakeCreationEventFieldsModule.makeTextOverlayEventFields())
			Controller.updateCommittedEdit("text", nil)
			
			return
		else
			UseAnimatedBindingResult2_1(ReactOtterModule.instant(1))
			UseCallbackResult4(p2)
		end
	end, {
		p1.ctx, Controller, UseCallbackResult4, UseBindingResult2_1,
		UseAnimatedBindingResult2, UseAnimatedBindingResult2_1
	})
	UseEffectFunction(function()
		-- upvalues: FFlagMomentsTextOverlayV2Redesign (upval), TextOverlays (copy), UseAnimatedBindingResult2_1 (copy), ReactOtterModule (upval)
		if not FFlagMomentsTextOverlayV2Redesign then return end
		if TextOverlays == nil or #TextOverlays == 0 then
			UseAnimatedBindingResult2_1(ReactOtterModule.instant(1))
		end
	end, { TextOverlays })
	
	if FFlagMomentsTextOverlayV2Redesign then
		UseEffectFunction(function()
			-- upvalues: FFlagMomentsTextOverlayV2Redesign (upval), UseIsMultiTouchActiveResult (ref), UseRefResult5 (copy), UseBindingResult2_1 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseAnimatedBindingResult2_1 (copy), p1 (copy)
			if not FFlagMomentsTextOverlayV2Redesign or not UseIsMultiTouchActiveResult then return end
			UseRefResult5.current = false
			UseBindingResult2_1(false)
			UseAnimatedBindingResult2(ReactOtterModule.instant(1))
			UseAnimatedBindingResult2_1(ReactOtterModule.instant(1))
			
			if p1.ctx.setIsOverlayDragging then
				p1.ctx.setIsOverlayDragging(false)
			end
		end, {
			UseIsMultiTouchActiveResult,
			p1.ctx,
			UseBindingResult2_1,
			UseAnimatedBindingResult2,
			UseAnimatedBindingResult2_1
		})
	end
	UseEffectFunction(function()
		-- upvalues: IsUseSignalStateResultMatch (copy), Controller (copy), MakeTextOverlayEditsForEditorModule (upval), TextOverlays (copy), MakeDefaultTextOverlayEditModule (upval), Scale (copy)
		if not IsUseSignalStateResultMatch then return end
		local ActiveSession = Controller.getActiveSession(false)
		
		if ActiveSession ~= nil and ActiveSession.getDraft(false) == nil then
			ActiveSession.update(MakeTextOverlayEditsForEditorModule(TextOverlays, MakeDefaultTextOverlayEditModule(), Scale))
			
			return
		end
	end, {
		IsUseSignalStateResultMatch,
		TextOverlays,
		Controller,
		Scale
	})
	local UseRefResult6 = UseRefFunction(false)
	UseEffectFunction(function()
		-- upvalues: IsUseSignalStateResultMatch (copy), UseRefResult6 (copy), UseRefResult (copy), UseSignalStateResultEntry (copy), UseCallbackResult (copy)
		if not IsUseSignalStateResultMatch then
			UseRefResult6.current = false
			
			if UseRefResult.current then
				UseRefResult.current:ReleaseFocus()
			end
			return
		elseif not UseRefResult6.current and UseRefResult.current ~= nil and UseSignalStateResultEntry ~= nil then
			UseCallbackResult()
			UseRefResult6.current = true
			
			return
		else
		end
	end, {
		IsUseSignalStateResultMatch,
		UseSignalStateResultEntry,
		UseCallbackResult
	})
	
	if FFlagMomentsTextOverlayModalTextFixModule then
		local UseRefResult7 = UseRefFunction(false)
		UseEffectFunction(function()
			-- upvalues: UseRefResult (copy), HasUseSignalStateResult (copy), UseRefResult7 (copy), IsUseSignalStateResultMatch (copy), UseCallbackResult (copy)
			local Current = UseRefResult.current
			
			if HasUseSignalStateResult then
				if Current ~= nil and Current:IsFocused() then
					UseRefResult7.current = true
					Current:ReleaseFocus()
					
					return
				end
			elseif UseRefResult7.current then
				UseRefResult7.current = false
				
				if IsUseSignalStateResultMatch then
					UseCallbackResult()
				end
			end
		end, {
			HasUseSignalStateResult,
			IsUseSignalStateResultMatch,
			UseCallbackResult
		})
	end
	UseEffectFunction(function()
		-- upvalues: IsUseSignalStateResultMatch (copy), UseSignalStateResultEntry (copy), FFlagMomentsTextOverlayV2Redesign (upval), FFlagMomentsTextOverlayChipGrowAboveKeyboard (upval), UseOnScreenKeyboardHeightModuleResult (copy), UseBindingResult2 (copy), TextService (upval), UseMemoResult (ref), UseSignalStateResult1 (copy)
		if not IsUseSignalStateResultMatch or UseSignalStateResultEntry == nil then return end
		if FFlagMomentsTextOverlayV2Redesign and FFlagMomentsTextOverlayChipGrowAboveKeyboard then return end
		if UseOnScreenKeyboardHeightModuleResult == 0 then
			UseBindingResult2(UDim2.fromOffset(0, 0))
			
			return
		else
			local WTextSize = TextService:GetTextSize("W", UseMemoResult, UseSignalStateResultEntry.textOverlayStyle.font, Vector2.new(UseSignalStateResult1.X, UseSignalStateResult1.Y))
			UseBindingResult2(UDim2.fromOffset(math.min(WTextSize.X * 30, UseSignalStateResult1.X / 2), (math.min(WTextSize.Y * 5, UseSignalStateResult1.Y / 2))))
		end
	end, {
		IsUseSignalStateResultMatch,
		UseSignalStateResultEntry,
		UseMemoResult,
		UseOnScreenKeyboardHeightModuleResult,
		UseSignalStateResult1
	})
	local NoFFlagMomentsTextOverlayV2Redesign: boolean = not FFlagMomentsTextOverlayV2Redesign or UseOnScreenKeyboardHeightModuleResult == 0
	
	if IsUseSignalStateResultMatch then
		if UseSignalStateResultEntry == nil then
			return nil
		end
		local Size = nil
		local _UDim2 = UDim2.fromScale(0.5, 0.5)
		local FontSize = UseMemoResult
		local IsUseOnScreenKeyboardHeightModuleResultAbove: boolean = FFlagMomentsTextOverlayV2Redesign and (FFlagMomentsTextOverlayChipGrowAboveKeyboard and UseOnScreenKeyboardHeightModuleResult > 0)
		
		if IsUseOnScreenKeyboardHeightModuleResultAbove then
			local CurrentCamera = workspace.CurrentCamera
			local Y = if UseRefResult1.current then UseRefResult1.current.AbsolutePosition.Y else 0
			local EditorChipLayoutModule = ComputeEditorChipLayoutModule({
				maxChipWidth = 300,
				keyboardGap = 48,
				chipPadding = 12,
				overhangFraction = 0.08,
				text = UseSignalStateResultEntry.text,
				font = UseSignalStateResultEntry.textOverlayStyle.font,
				itemWidth = UseSignalStateResult1.X,
				viewportHeight = if CurrentCamera then CurrentCamera.ViewportSize.Y else UseSignalStateResult1.Y,
				keyboardHeight = UseOnScreenKeyboardHeightModuleResult,
				layerTopY = Y,
				topMargin = if FFlagMomentsTextOverlayTopNavModule then Y + UseDeviceInsetsResult.top + v4.Padding.Medium + v4.Size.Size_1000 else 48,
				growWidthWithText = FFlagMomentsTextOverlayChipGrowWidthModule
			})
			FontSize = EditorChipLayoutModule.fontSize
			Size = EditorChipLayoutModule.size
			_UDim2 = EditorChipLayoutModule.position
		end
		return ReactModule.createElement(View, {
			tag = "size-full bg-over-media-0",
			onActivated = if FFlagMomentsTextOverlayV2Redesign and FFlagMomentsTextOverlayChipGrowAboveKeyboard then UseCallbackResult1 else nil,
			ref = UseRefResult1,
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			},
			ZIndex = p1.zIndex or 1
		}, {
			TextOverlay = ReactModule.createElement(TextOverlay, {
				editable = true,
				additionalScale = if FFlagMomentsTextOverlayV2Redesign then Scale else nil,
				fitToContent = UseOnScreenKeyboardHeightModuleResult == 0,
				onActivated = UseCallbackResult,
				size = if IsUseOnScreenKeyboardHeightModuleResultAbove then Size else UseBindingResult,
				textOverlayEdit = DashModule.joinDeep(UseSignalStateResultEntry, {
					rotation = 0,
					position = _UDim2,
					scale = Scale1,
					textOverlayStyle = { fontSize = FontSize }
				}),
				onTextChanged = UseCallbackResult2,
				textBoxRef = UseRefResult,
				textVisible = not HasUseSignalStateResult and nil
			}),
			GenerateText = if GetFFlagMomentsGenerateTextInTextOverlayModule() and Controller.getCanGenerateText(false) then ReactModule.createElement(GenerateTextButton, { controller = Controller }) else nil,
			VerticalFontSizeSlider = if FFlagMomentsTextOverlayV2Redesign and NoFFlagMomentsTextOverlayV2Redesign then ReactModule.createElement(VerticalFontSizeSliderModule, {
				controller = Controller,
				mediaHeight = UseSignalStateResult1.Y
			}) else nil,
			BottomScrim = if FFlagMomentsTextOverlayV2Redesign then ReactModule.createElement(View, {
				ZIndex = 5,
				tag = "position-bottom-center anchor-bottom-center",
				Size = UDim2.new(1, 0, 0, 200),
				backgroundStyle = { Color3 = Color3.new(0, 0, 0) }
			}, {
				UIGradient = ReactModule.createElement("UIGradient", { Rotation = 90, Transparency = NumberSequence1 })
			}) else nil,
			TopNav = if FFlagMomentsTextOverlayTopNavModule then ReactModule.createElement(EditorTopNavModule, {
				backTestId = "--moments-creation-view-textoverlay-back",
				saveTestId = "--moments-creation-button-textoverlay-save",
				zIndex = 5,
				onBack = OnBack,
				onSave = OnSave
			}) else nil,
			TextOverlayToolbar = if FFlagMomentsTextOverlayV2Redesign then ReactModule.createElement(TextOverlayToolbarModule, {
				controller = Controller,
				isKeyboardVisible = UseOnScreenKeyboardHeightModuleResult > 0
			}) else nil
		})
	elseif TextOverlays == nil or #TextOverlays == 0 then
		return nil
	else
		local IsUseSignalStateResultMatch1 = UseSignalStateResult == CreationFlowStateModule.Preview
		local NoUseIsMultiTouchActiveResult: boolean = IsUseSignalStateResultMatch1 and not UseIsMultiTouchActiveResult
		local IsUseSignalStateResultMatch1_1: boolean = FFlagMomentsTextOverlayV2Redesign and IsUseSignalStateResultMatch1
		local IsUseSignalStateResultMatch1_2: boolean = FFlagMomentsTextOverlayV2Redesign and IsUseSignalStateResultMatch1
		local FFlagMomentsTextOverlayDragToDeleteRefinementModule1 = FFlagMomentsTextOverlayV2Redesign and FFlagMomentsTextOverlayDragToDeleteRefinementModule
		local Element = if GetFFlagMomentsStickerButtonFunction() then ReactModule.createElement(OverlayDisplay, {
			editable = false,
			clampToBoundsEnabled = not FFlagMomentsTextOverlayDragToDeleteRefinementModule1,
			unboundedDragEnabled = if FFlagMomentsTextOverlayDragToDeleteRefinementModule1 then true else nil,
			draggable = NoUseIsMultiTouchActiveResult,
			itemResolution = UseSignalStateResult2,
			itemSize = UseSignalStateResult1,
			scaleType = Enum.ScaleType.Crop,
			onOverlayActivated = if IsUseSignalStateResultMatch1 then UseCallbackResult3 else nil,
			onOverlayDragBegin = if IsUseSignalStateResultMatch1 then UseCallbackResult6 else nil,
			onOverlayDragContinue = if IsUseSignalStateResultMatch1_1 then UseCallbackResult7 else nil,
			onOverlayDragEnd = if IsUseSignalStateResultMatch1 then UseCallbackResult8 else nil,
			onOverlayRotationChanged = if IsUseSignalStateResultMatch1_2 then v2 else nil,
			onOverlayScaleChanged = if IsUseSignalStateResultMatch1_2 then v1 else nil,
			overlayEdits = TextOverlays,
			overlayComponent = TextOverlay,
			selected = IsUseSignalStateResultMatch1_2,
			visualScale = if IsUseSignalStateResultMatch1_1 then UseAnimatedBindingResult1 else nil,
			zIndex = p1.zIndex
		}) else ReactModule.createElement(TextOverlayDisplay, {
			editable = false,
			clampToBoundsEnabled = not FFlagMomentsTextOverlayDragToDeleteRefinementModule1,
			unboundedDragEnabled = if FFlagMomentsTextOverlayDragToDeleteRefinementModule1 then true else nil,
			draggable = NoUseIsMultiTouchActiveResult,
			itemResolution = UseSignalStateResult2,
			itemSize = UseSignalStateResult1,
			scaleType = Enum.ScaleType.Crop,
			onTextOverlayActivated = if IsUseSignalStateResultMatch1 then UseCallbackResult3 else nil,
			onTextOverlayDragBegin = if IsUseSignalStateResultMatch1 then UseCallbackResult6 else nil,
			onTextOverlayDragContinue = if IsUseSignalStateResultMatch1_1 then UseCallbackResult7 else nil,
			onTextOverlayDragEnd = if IsUseSignalStateResultMatch1 then UseCallbackResult8 else nil,
			onTextOverlayRotationChanged = if IsUseSignalStateResultMatch1_2 then v2 else nil,
			onTextOverlayScaleChanged = if IsUseSignalStateResultMatch1_2 then v1 else nil,
			selected = IsUseSignalStateResultMatch1_2,
			textOverlayEdits = TextOverlays,
			visualScale = if IsUseSignalStateResultMatch1_1 then UseAnimatedBindingResult1 else nil,
			zIndex = p1.zIndex
		})
		
		return if IsUseSignalStateResultMatch1_1 then ReactModule.createElement(View, { tag = "size-full", ZIndex = p1.zIndex or 1 }, {
			Overlay = Element,
			TrashZone = ReactModule.createElement(TextOverlayTrashZoneModule, {
				circleRef = CircleRef,
				highlightScale = UseAnimatedBindingResult,
				label = TextOverlayDragHereToDelete,
				ref = UseRefResult4,
				visible = UseBindingResult1,
				ZIndex = (p1.zIndex or 1) + 10
			})
		}) else Element
	end
end