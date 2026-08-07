local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local sine = Enum.EasingStyle.Sine
local t = {
	isPlaceholder = true,
	real = true,
	placeholder = true,
	transitionDurationSeconds = true,
	mountRealDuringPlaceholder = true,
	layoutOrder = true,
	zIndex = true,
	componentConfig = true,
	sduiContext = true,
	debugName = true,
	analyticsContext = true
}

local function PlaceholderHost(p0) --[[ line: 36 ]]
	-- upvalues: reactModule (ref), reactOtterModule (ref), sine (ref)
	local fadeOut = p0.fadeOut
	local durationSeconds = p0.durationSeconds
	local onFadeComplete = p0.onFadeComplete
	local var4, var5 = reactOtterModule.useAnimatedBinding(if fadeOut then 1 else 0, reactModule.useCallback(function(p1) --[[ line: 43 ]]
		-- upvalues: onFadeComplete (ref)
		if p1 >= 1 then
			onFadeComplete()
		end
	end, { onFadeComplete }))
	local var6 = reactModule.useRef(fadeOut)
	reactModule.useEffect(function() --[[ line: 53 ]]
		-- upvalues: var6 (ref), fadeOut (ref), var5 (ref), reactOtterModule (copy), durationSeconds (ref), sine (copy)
		local current = var6.current
		var6.current = fadeOut
		
		if current == fadeOut then
			return
		end
		var5(reactOtterModule.ease(if fadeOut then 1 else 0, { duration = durationSeconds, easingStyle = sine }))
	end, { fadeOut, durationSeconds, var5 })
	
	return reactModule.cloneElement(p0.placeholder, { transparencyBinding = var4, zIndex = p0.zIndex })
end

return reactModule.memo(function(p2) --[[ line: 83 | named "SduiPlaceholderWrapper" ]]
	-- upvalues: reactModule (ref), t (ref), PlaceholderHost (ref)
	local var7 = p2.isPlaceholder == true
	local transitionDurationSeconds = p2.transitionDurationSeconds or 0.15
	local var9, var10 = reactModule.useState(var7)
	reactModule.useEffect(function() --[[ line: 89 ]]
		-- upvalues: var7 (ref), var9 (ref), var10 (ref)
		if var7 and not var9 then
			var10(true)
		end
	end, { var7, var9 })
	local var11 = reactModule.useCallback(function() --[[ line: 95 ]]
		-- upvalues: var10 (ref)
		var10(false)
	end, {})
	local var12 = nil
	
	if (not var9 or (not var7 or p2.mountRealDuringPlaceholder == true)) and p2.real then
		local t_1 = nil
		
		for i, v in p2 do
			if not t[i] then
				if t_1 == nil then
					t_1 = {}
				end
				t_1[i] = v
			end
		end
		var12 = if t_1 then reactModule.cloneElement(p2.real, t_1) else p2.real
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p2.layoutOrder,
		Size = UDim2.fromScale(1, 0),
		ZIndex = p2.zIndex
	}, {
		Real = var12,
		Placeholder = if var9 and p2.placeholder then reactModule.createElement(PlaceholderHost, {
			zIndex = 1e999,
			placeholder = p2.placeholder,
			fadeOut = not var7,
			durationSeconds = transitionDurationSeconds,
			onFadeComplete = var11
		}) else nil
	})
end)