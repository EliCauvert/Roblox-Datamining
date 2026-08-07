local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconVariant = foundationModule.Enums.IconVariant
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View

local function useDelayedFalse(p0, p1) --[[ line: 22 ]]
	-- upvalues: reactModule (ref)
	local var5, var6 = reactModule.useState(p0)
	reactModule.useEffect(function() --[[ line: 25 ]]
		-- upvalues: p0 (ref), var6 (ref), p1 (ref)
		if p0 then
			var6(true)
			
			return
		end
		local delayedThread = task.delay(p1, function() --[[ line: 31 ]]
			-- upvalues: var6 (copy)
			var6(false)
		end)
		
		return function() --[[ line: 35 ]]
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { p0, p1 })
	
	return var5
end

local function useOscillatingWidth(p2, p3, p4) --[[ line: 46 ]]
	-- upvalues: reactModule (ref)
	local var8, var9 = reactModule.useState(p4)
	reactModule.useEffect(function() --[[ line: 49 ]]
		-- upvalues: p2 (ref), var9 (ref), p4 (ref), p3 (ref)
		if p2 then
			local delayedThread = nil
			
			local function scheduleNext() --[[ line: 56 ]]
				-- upvalues: delayedThread (write), p3 (copy), p4 (copy), var9 (copy), scheduleNext (ref)
				delayedThread = task.delay(0.15, function() --[[ line: 57 ]]
					-- upvalues: p3 (copy), p4 (copy), var9 (copy), scheduleNext (copy)
					var9(p3 + math.random() * (p4 - p3))
					scheduleNext()
				end)
			end
			
			delayedThread = task.delay(0.15, function() --[[ line: 57 ]]
				-- upvalues: p3 (copy), p4 (copy), var9 (copy), scheduleNext (ref)
				var9(p3 + math.random() * (p4 - p3))
				scheduleNext()
			end)
			
			return function() --[[ line: 65 ]]
				-- upvalues: delayedThread (write)
				if delayedThread then
					task.cancel(delayedThread)
				end
			end
		end
		var9(p4)
	end, { p2, p3, p4 })
	
	return if p2 then var8 else p4
end

return reactModule.memo(function(p5) --[[ line: 80 | named "VoiceSpeakingIcon" ]]
	-- upvalues: useTokens (ref), signalsReactModule (ref), useDelayedFalse (ref), useOscillatingWidth (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), iconVariant (ref)
	local var12 = useTokens()
	local var13 = useDelayedFalse(signalsReactModule.useSignalState(p5.isSpeakingSignal), var12.Time.Time_1000)
	
	return reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = p5.layoutOrder }, {
		GreenFilledIconContainer = if var13 then reactModule.createElement("Frame", {
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.fromScale(useOscillatingWidth(var13, 0.2, 1), 1)
		}, {
			GreenFilledIcon = reactModule.createElement(icon, {
				name = iconName.Speaker,
				variant = iconVariant.Filled,
				style = var12.Color.System.Success
			})
		}) else nil,
		Icon = reactModule.createElement(icon, {
			name = iconName.Speaker,
			style = var12.Color.Content.Default
		})
	})
end)