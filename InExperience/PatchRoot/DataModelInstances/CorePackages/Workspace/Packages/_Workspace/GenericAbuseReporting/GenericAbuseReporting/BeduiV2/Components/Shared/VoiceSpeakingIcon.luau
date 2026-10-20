local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconVariant = FoundationModule.Enums.IconVariant
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View

local function useDelayedFalse(UseSignalStateResult, Delay)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseSignalStateResult)
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), UseStateResult2 (copy), Delay (copy)
		if UseSignalStateResult then
			UseStateResult2(true)
			
			return
		end
		local DelayedThread = task.delay(Delay, function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end)
		
		return function()
			-- upvalues: DelayedThread (copy)
			task.cancel(DelayedThread)
		end
	end, { UseSignalStateResult, Delay })
	
	return UseStateResult
end

local function useOscillatingWidth(p1, p2, p3)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p3)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy), p3 (copy), p2 (copy)
		if not p1 then
			UseStateResult2(p3)
			
			return
		end
		local DelayedThread = nil
		
		local function scheduleNext()
			-- upvalues: DelayedThread (ref), p2 (upval), p3 (upval), UseStateResult2 (upval), scheduleNext (copy)
			DelayedThread = task.delay(0.15, function()
				-- upvalues: p2 (upval), p3 (upval), UseStateResult2 (upval), scheduleNext (upval)
				UseStateResult2(p2 + math.random() * (p3 - p2))
				scheduleNext()
			end)
		end
		
		DelayedThread = task.delay(0.15, function()
			-- upvalues: p2 (upval), p3 (upval), UseStateResult2 (upval), scheduleNext (copy)
			UseStateResult2(p2 + math.random() * (p3 - p2))
			scheduleNext()
		end)
		
		return function()
			-- upvalues: DelayedThread (ref)
			if DelayedThread then
				task.cancel(DelayedThread)
			end
		end
	end, { p1, p2, p3 })
	
	return if p1 then UseStateResult else p3
end

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), SignalsReactModule (copy), useDelayedFalse (copy), useOscillatingWidth (copy), ReactModule (copy), View (copy), Icon (copy), IconName (copy), IconVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local UseDelayedFalseResult = useDelayedFalse(SignalsReactModule.useSignalState(p1.isSpeakingSignal), UseTokensResult.Time.Time_1000)
	local UseOscillatingWidthResult = useOscillatingWidth(UseDelayedFalseResult, 0.2, 1)
	
	return ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = p1.layoutOrder }, {
		GreenFilledIconContainer = if UseDelayedFalseResult then ReactModule.createElement("Frame", {
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.fromScale(UseOscillatingWidthResult, 1)
		}, {
			GreenFilledIcon = ReactModule.createElement(Icon, {
				name = IconName.Speaker,
				variant = IconVariant.Filled,
				style = UseTokensResult.Color.System.Success
			})
		}) else nil,
		Icon = ReactModule.createElement(Icon, {
			name = IconName.Speaker,
			style = UseTokensResult.Color.Content.Default
		})
	})
end)