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

local function useDelayedFalse(p1, p2)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(p1)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), p2 (ref)
		if p1 then
			var2(true)
			
			return
		end
		local delayedThread = task.delay(p2, function()
			-- upvalues: var2 (copy)
			var2(false)
		end)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { p1, p2 })
	
	return var1
end

local function useOscillatingWidth(p1, p2, p3)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(p3)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), p3 (ref), p2 (ref)
		if p1 then
			local delayedThread = nil
			
			local function scheduleNext()
				-- upvalues: delayedThread (write), p2 (copy), p3 (copy), var2 (copy), scheduleNext (ref)
				delayedThread = task.delay(0.15, function()
					-- upvalues: p2 (copy), p3 (copy), var2 (copy), scheduleNext (copy)
					var2(p2 + math.random() * (p3 - p2))
					scheduleNext()
				end)
			end
			
			delayedThread = task.delay(0.15, function()
				-- upvalues: p2 (copy), p3 (copy), var2 (copy), scheduleNext (ref)
				var2(p2 + math.random() * (p3 - p2))
				scheduleNext()
			end)
			
			return function()
				-- upvalues: delayedThread (write)
				if delayedThread then
					task.cancel(delayedThread)
				end
			end
		end
		var2(p3)
	end, { p1, p2, p3 })
	
	return if p1 then var1 else p3
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), signalsReactModule (ref), useDelayedFalse (ref), useOscillatingWidth (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), iconVariant (ref)
	local var1 = useTokens()
	local var2 = useDelayedFalse(signalsReactModule.useSignalState(p1.isSpeakingSignal), var1.Time.Time_1000)
	
	return reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = p1.layoutOrder }, {
		GreenFilledIconContainer = if var2 then reactModule.createElement("Frame", {
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.fromScale(useOscillatingWidth(var2, 0.2, 1), 1)
		}, {
			GreenFilledIcon = reactModule.createElement(icon, {
				name = iconName.Speaker,
				variant = iconVariant.Filled,
				style = var1.Color.System.Success
			})
		}) else nil,
		Icon = reactModule.createElement(icon, {
			name = iconName.Speaker,
			style = var1.Color.Content.Default
		})
	})
end)