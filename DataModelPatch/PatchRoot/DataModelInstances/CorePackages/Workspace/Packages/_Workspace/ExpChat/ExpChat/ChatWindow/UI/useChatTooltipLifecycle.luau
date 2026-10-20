local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local ConfigModule = require(ExpChat.Config)
local GetTransparencyStoreModule = require(ExpChat.Stores.GetTransparencyStore)
local GetChatTooltipStoreModule = require(ExpChat.Stores.GetChatTooltipStore)
local _ = require(ExpChat.Stores.GetChatTooltipStore.createChatTooltipStore)

return function(p1)
	-- upvalues: GetChatTooltipStoreModule (copy), GetTransparencyStoreModule (copy), SignalsReactModule (copy), ReactModule (copy), ConfigModule (copy)
	local TooltipKey = p1.tooltipKey
	local TargetTextChannel = p1.targetTextChannel
	local ChatTooltipStoreModule = GetChatTooltipStoreModule(false)
	local TransparencyStoreModule = GetTransparencyStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(ChatTooltipStoreModule.getShouldShow(TooltipKey))
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(ChatTooltipStoreModule.getIsScreenWideEnough)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(TransparencyStoreModule.getLastActivity)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(TransparencyStoreModule.getIsFocused or TransparencyStoreModule.getIsTextBoxFocused)
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(0)
	local UseRefResult2 = ReactModule.useRef(TargetTextChannel)
	local SetIsDismissedFunction = ChatTooltipStoreModule.setIsDismissed
	local ReportImpressionFunction = ChatTooltipStoreModule.reportImpression
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), ReportImpressionFunction (copy), TooltipKey (copy), SetIsDismissedFunction (copy)
		if not UseRefResult.current then
			UseRefResult.current = true
			ReportImpressionFunction(TooltipKey)
		end
		SetIsDismissedFunction(TooltipKey, true)
	end, {
		TooltipKey,
		SetIsDismissedFunction,
		ReportImpressionFunction
	})
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult3 (copy), UseStateResult2 (copy), ConfigModule (upval), UseSignalStateResult2 (copy)
		if UseSignalStateResult3 then
			UseStateResult2(true)
			
			return nil
		end
		local ChatWindowBackgroundFadeOutTimeDelta = ConfigModule.ChatWindowBackgroundFadeOutTime - (os.clock() - UseSignalStateResult2)
		
		if ChatWindowBackgroundFadeOutTimeDelta <= 0 then
			UseStateResult2(false)
			
			return nil
		else
			UseStateResult2(true)
			local DelayedThread = task.delay(ChatWindowBackgroundFadeOutTimeDelta, function()
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(false)
			end)
			
			return function()
				-- upvalues: DelayedThread (copy)
				task.cancel(DelayedThread)
			end
		end
	end, { UseSignalStateResult2, UseSignalStateResult3 })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseSignalStateResult1 (copy), UseStateResult1 (copy), UseSignalStateResult (copy), UseRefResult1 (copy), UseStateResult2_1 (copy)
		if UseStateResult and UseSignalStateResult1 and not UseStateResult1 and UseSignalStateResult then
			local ClockTime = os.clock()
			local DelayedThread = task.delay(math.max(0, 10 - UseRefResult1.current), function()
				-- upvalues: UseStateResult2_1 (upval)
				UseStateResult2_1(true)
			end)
			
			return function()
				-- upvalues: UseRefResult1 (upval), ClockTime (copy), DelayedThread (copy)
				UseRefResult1.current += os.clock() - ClockTime
				task.cancel(DelayedThread)
			end
		else
			return nil
		end
	end, {
		UseStateResult,
		UseSignalStateResult1,
		UseStateResult1,
		UseSignalStateResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult1 (copy), UseResult (copy)
		if UseStateResult1 then
			local DelayedThread = task.delay(1, function()
				-- upvalues: UseResult (upval)
				UseResult()
			end)
			
			return function()
				-- upvalues: DelayedThread (copy)
				task.cancel(DelayedThread)
			end
		else
			return nil
		end
	end, { UseStateResult1, UseResult })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), TargetTextChannel (copy), UseSignalStateResult (copy), UseStateResult1 (copy), UseStateResult2_1 (copy)
		local Current = UseRefResult2.current
		UseRefResult2.current = TargetTextChannel
		
		if Current and Current ~= TargetTextChannel and UseSignalStateResult and not UseStateResult1 then
			UseStateResult2_1(true)
		end
	end, { TargetTextChannel, UseSignalStateResult, UseStateResult1 })
	
	return {
		isActive = UseSignalStateResult and (UseStateResult and (UseSignalStateResult1 and not UseStateResult1)),
		onDismiss = UseResult
	}
end