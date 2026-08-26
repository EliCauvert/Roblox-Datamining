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

local function PlaceholderHost(p1)
	-- upvalues: reactModule (ref), reactOtterModule (ref), sine (ref)
	local fadeOut = p1.fadeOut
	local durationSeconds = p1.durationSeconds
	local onFadeComplete = p1.onFadeComplete
	local var1, var2 = reactOtterModule.useAnimatedBinding(if fadeOut then 1 else 0, reactModule.useCallback(function(p2)
		-- upvalues: onFadeComplete (ref)
		if p2 >= 1 then
			onFadeComplete()
		end
	end, { onFadeComplete }))
	local var3 = reactModule.useRef(fadeOut)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), fadeOut (ref), var2 (ref), reactOtterModule (copy), durationSeconds (ref), sine (copy)
		local current = var3.current
		var3.current = fadeOut
		
		if current == fadeOut then
			return
		end
		var2(reactOtterModule.ease(if fadeOut then 1 else 0, { duration = durationSeconds, easingStyle = sine }))
	end, { fadeOut, durationSeconds, var2 })
	
	return reactModule.cloneElement(p1.placeholder, { transparencyBinding = var1, zIndex = p1.zIndex })
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), t (ref), PlaceholderHost (ref)
	local var1 = p1.isPlaceholder == true
	local transitionDurationSeconds = p1.transitionDurationSeconds or 0.15
	local var2, var3 = reactModule.useState(var1)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var2 (ref), var3 (ref)
		if var1 and not var2 then
			var3(true)
		end
	end, { var1, var2 })
	local var4 = reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		var3(false)
	end, {})
	local var5 = nil
	
	if (not var2 or (not var1 or p1.mountRealDuringPlaceholder == true)) and p1.real then
		local t_1 = nil
		
		for i, v in p1 do
			if not t[i] then
				if t_1 == nil then
					t_1 = {}
				end
				t_1[i] = v
			end
		end
		var5 = if t_1 then reactModule.cloneElement(p1.real, t_1) else p1.real
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.fromScale(1, 0),
		ZIndex = p1.zIndex
	}, {
		Real = var5,
		Placeholder = if var2 and p1.placeholder then reactModule.createElement(PlaceholderHost, {
			zIndex = 1e999,
			placeholder = p1.placeholder,
			fadeOut = not var1,
			durationSeconds = transitionDurationSeconds,
			onFadeComplete = var4
		}) else nil
	})
end)