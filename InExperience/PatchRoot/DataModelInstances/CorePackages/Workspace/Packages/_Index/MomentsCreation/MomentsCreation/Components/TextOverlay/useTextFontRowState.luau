local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local DashModule = require(Parent.Dash)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local SignalsModule = require(Parent.Signals)
local UseCallbackFunction = ReactModule.useCallback
local UseMemoFunction = ReactModule.useMemo
local UseRefFunction = ReactModule.useRef
local UseStateFunction = ReactModule.useState
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseFormFactorFunction = MomentsCommonModule.Hooks.useFormFactor
local FormFactor = MomentsCommonModule.Enums.FormFactor
local EventNames = MomentsCommonModule.Analytics.EventNames
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local FFlagMomentsTextOverlayV2Redesign = MomentsCommonModule.Flags.FFlagMomentsTextOverlayV2Redesign
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local _ = require(Parent.MomentsTypes)

return function(p1) --[[ Line: 53 | Named "useTextFontRowState" ]]
	-- upvalues: UseTokensFunction (copy), UseFormFactorFunction (copy), FormFactor (copy), UseMemoFunction (copy), SignalsModule (copy), UseSignalStateFunction (copy), UseCallbackFunction (copy), DashModule (copy), FFlagMomentsTextOverlayV2Redesign (copy), FireAnalyticsEventModule (copy), EventNames (copy), MakeCreationEventFieldsModule (copy), UseRefFunction (copy), UseStateFunction (copy), ReactOtterModule (copy)
	local UseTokensResult = UseTokensFunction()
	local IsUseFormFactorResultMatch = UseFormFactorFunction() == FormFactor.Wide
	local UseSignalStateResult = UseSignalStateFunction((UseMemoFunction(function() --[[ Line: 57 ]]
		-- upvalues: SignalsModule (upval), p1 (copy)
		return SignalsModule.createComputed(function(p2) --[[ Line: 58 ]]
			-- upvalues: p1 (upval)
			local ActiveSession = p1.getActiveSession(p2)
			local Draft = if ActiveSession == nil then nil else ActiveSession.getDraft(p2)
			local DraftEntry = Draft and Draft[1]
			
			return if DraftEntry == nil then Enum.Font.BuilderSansMedium else DraftEntry.textOverlayStyle.font
		end)
	end, { p1 })))
	local UseCallbackResult = UseCallbackFunction(function(p2, p3) --[[ Line: 67 ]]
		-- upvalues: p1 (copy), DashModule (upval), FFlagMomentsTextOverlayV2Redesign (upval), FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval)
		local ActiveSession = p1.getActiveSession(false)
		
		if ActiveSession == nil then return end
		local Draft = ActiveSession.getDraft(false)
		local DraftEntry = Draft and Draft[1]
		
		if DraftEntry == nil then return end
		ActiveSession.update({
			DashModule.joinDeep(DraftEntry, { textOverlayStyle = { font = p2 } })
		})
		
		if FFlagMomentsTextOverlayV2Redesign then
			FireAnalyticsEventModule(EventNames.EditingFlowTextOverlayFontSelected, MakeCreationEventFieldsModule.makeTextOverlayEventFields({ buttonIndex = tostring(p3), font = p2.Name }))
		end
	end, { p1 })
	local UseRefResult = UseRefFunction(nil)
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(false)
	local UseCallbackResult1 = UseCallbackFunction(function(ScrollFrame) --[[ Line: 94 ]]
		-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy)
		if ScrollFrame.AbsoluteWindowSize.X ~= 0 then
			UseStateResult2(ScrollFrame.CanvasPosition.X > 0)
			UseStateResult2_1(ScrollFrame.AbsoluteWindowSize.X + ScrollFrame.CanvasPosition.X < ScrollFrame.AbsoluteCanvasSize.X - 1)
			
			return
		end
	end, {})
	local UseMotorResult = ReactOtterModule.useMotor(0, function(X) --[[ Line: 105 ]]
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			Current.CanvasPosition = Vector2.new(X, 0)
			
			return
		end
	end)
	local UseCallbackResult2 = UseCallbackFunction(function(p2) --[[ Line: 113 ]]
		-- upvalues: UseRefResult (copy), UseMotorResult (copy), ReactOtterModule (upval), UseTokensResult (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			UseMotorResult(ReactOtterModule.ease(math.clamp(Current.CanvasPosition.X + p2 * (Current.AbsoluteWindowSize.X * 0.8), 0, (math.max(Current.AbsoluteCanvasSize.X - Current.AbsoluteWindowSize.X, 0))), {
				duration = UseTokensResult.Time.Time_200,
				easingStyle = Enum.EasingStyle.Quad,
				startingValue = Current.CanvasPosition.X
			}))
			
			return
		end
	end, { UseTokensResult, UseMotorResult })
	
	return {
		font = UseSignalStateResult,
		onChipActivated = UseCallbackResult,
		scrollingFrameRef = UseRefResult,
		onScrollViewportChanged = UseCallbackResult1,
		showLeftChevron = IsUseFormFactorResultMatch and UseStateResult,
		showRightChevron = IsUseFormFactorResultMatch and UseStateResult1,
		onLeftChevronActivated = UseCallbackFunction(function() --[[ Line: 129 ]]
			-- upvalues: UseCallbackResult2 (copy)
			UseCallbackResult2(-1)
		end, { UseCallbackResult2 }),
		onRightChevronActivated = UseCallbackFunction(function() --[[ Line: 133 ]]
			-- upvalues: UseCallbackResult2 (copy)
			UseCallbackResult2(1)
		end, { UseCallbackResult2 })
	}
end