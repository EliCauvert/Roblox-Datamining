local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local Sine = Enum.EasingStyle.Sine
local config = {
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

local function PlaceholderHost(p1) --[[ Line: 36 ]]
	-- upvalues: ReactModule (copy), ReactOtterModule (copy), Sine (copy)
	local FadeOut = p1.fadeOut
	local DurationSeconds = p1.durationSeconds
	local OnFadeCompleteFunction = p1.onFadeComplete
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(if FadeOut then 1 else 0, (ReactModule.useCallback(function(p2: number) --[[ Line: 43 ]]
		-- upvalues: OnFadeCompleteFunction (copy)
		if p2 >= 1 then
			OnFadeCompleteFunction()
		end
	end, { OnFadeCompleteFunction })))
	local UseRefResult = ReactModule.useRef(FadeOut)
	ReactModule.useEffect(function() --[[ Line: 53 ]]
		-- upvalues: UseRefResult (copy), FadeOut (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), DurationSeconds (copy), Sine (upval)
		UseRefResult.current = FadeOut
		
		if UseRefResult.current ~= FadeOut then
			UseAnimatedBindingResult2((ReactOtterModule.ease(if FadeOut then 1 else 0, { duration = DurationSeconds, easingStyle = Sine })))
			
			return
		end
	end, { FadeOut, DurationSeconds, UseAnimatedBindingResult2 })
	
	return ReactModule.cloneElement(p1.placeholder, {
		transparencyBinding = UseAnimatedBindingResult,
		zIndex = p1.zIndex
	})
end

return ReactModule.memo(function(List) --[[ Line: 83 | Named "SduiPlaceholderWrapper" ]]
	-- upvalues: ReactModule (copy), config (copy), PlaceholderHost (copy)
	local IsIsPlaceholder = List.isPlaceholder == true
	local TransitionDurationSeconds = List.transitionDurationSeconds or 0.15
	local UseStateResult, UseStateResult2 = ReactModule.useState(IsIsPlaceholder)
	ReactModule.useEffect(function() --[[ Line: 89 ]]
		-- upvalues: IsIsPlaceholder (copy), UseStateResult (copy), UseStateResult2 (copy)
		if IsIsPlaceholder and not UseStateResult then
			UseStateResult2(true)
		end
	end, { IsIsPlaceholder, UseStateResult })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 95 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local IsMountRealDuringPlaceholder = List.mountRealDuringPlaceholder == true
	local CloneElementResult = nil
	
	if (not UseStateResult or (not IsIsPlaceholder or IsMountRealDuringPlaceholder)) and List.real then
		local v1 = nil
		
		for i, value in List do
			if not config[i] then
				if v1 == nil then
					v1 = {}
				end
				v1[i] = value
			end
		end
		CloneElementResult = if v1 then ReactModule.cloneElement(List.real, v1) else List.real
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = List.layoutOrder,
		Size = UDim2.fromScale(1, 0),
		ZIndex = List.zIndex
	}, {
		Real = CloneElementResult,
		Placeholder = if UseStateResult and List.placeholder then ReactModule.createElement(PlaceholderHost, {
			zIndex = 1e999,
			placeholder = List.placeholder,
			fadeOut = not IsIsPlaceholder,
			durationSeconds = TransitionDurationSeconds,
			onFadeComplete = UseResult
		}) else nil
	})
end)