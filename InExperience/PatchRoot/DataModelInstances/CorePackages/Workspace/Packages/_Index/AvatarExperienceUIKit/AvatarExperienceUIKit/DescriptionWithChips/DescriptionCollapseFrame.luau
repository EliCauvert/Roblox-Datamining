local AvatarExperienceUIKit = script:FindFirstAncestor("AvatarExperienceUIKit")
local Parent = AvatarExperienceUIKit.Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local MakeOtterSpringValueModule = require(AvatarExperienceUIKit.Utils.makeOtterSpringValue)
local View = require(Parent.Foundation).View
local config = { dampingRatio = 1, frequency = 3.5 }

local function toFullWidthSize(YOffset): UDim2
	return UDim2.new(1, 0, 0, YOffset)
end

return function(Frame)
	-- upvalues: ReactOtterModule (copy), ReactModule (copy), MakeOtterSpringValueModule (copy), config (copy), toFullWidthSize (copy), View (copy)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(Frame.height)
	local UseRefResult = ReactModule.useRef(Frame.isExpanded)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), Frame (copy), UseAnimatedBindingResult2 (copy), MakeOtterSpringValueModule (upval), config (upval), ReactOtterModule (upval)
		if UseRefResult.current == Frame.isExpanded then
			UseAnimatedBindingResult2((ReactOtterModule.instant(Frame.height)))
			
			return
		else
			UseRefResult.current = Frame.isExpanded
			UseAnimatedBindingResult2(MakeOtterSpringValueModule(Frame.height, config))
		end
	end, { Frame.height, Frame.isExpanded })
	
	return ReactModule.createElement(View, {
		tag = "clip",
		Size = ReactModule.useMemo(function()
			-- upvalues: UseAnimatedBindingResult (copy), toFullWidthSize (upval)
			return UseAnimatedBindingResult:map(toFullWidthSize)
		end, { UseAnimatedBindingResult }),
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	}, Frame.children)
end