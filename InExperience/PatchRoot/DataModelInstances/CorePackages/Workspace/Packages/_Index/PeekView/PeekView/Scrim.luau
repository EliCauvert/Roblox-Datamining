local Parent = script:FindFirstAncestor("PeekView").Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local ReactOtterModule = require(Parent.ReactOtter)
local RemovePeekViewScrimBorder = game:DefineFastFlag("RemovePeekViewScrimBorder", false)

return (ReactModule.forwardRef(function(p1, Ref) --[[ Line: 16 ]]
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), ReactOtterModule (copy), RemovePeekViewScrimBorder (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseStateResult = nil
	local UseStateResult2 = nil
	local UseAnimatedBindingResult2 = nil
	UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseAnimatedBindingResult
	UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(1)
	ReactModule.useEffect(function() --[[ Line: 22 ]]
		-- upvalues: UseAnimatedBindingResult2 (ref), ReactOtterModule (upval), UseStateResult (ref)
		UseAnimatedBindingResult2(ReactOtterModule.spring(if UseStateResult then 0.35 else 1))
	end, { UseStateResult })
	
	return ReactModule.createElement("TextButton", {
		ref = Ref,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = UseAnimatedBindingResult,
		BackgroundColor3 = UseDesignTokensResult.Color.Common.Scrim.Color3,
		ClipsDescendants = false,
		Text = "",
		AutoButtonColor = false,
		[ReactModule.Event.Activated] = function() --[[ Line: 34 ]]
			-- upvalues: p1 (copy), UseStateResult2 (ref), UseStateResult (ref)
			if p1.onActivated then
				p1.onActivated()
			end
			UseStateResult2(not UseStateResult)
		end,
		[ReactModule.Change.AbsoluteSize] = p1.onSizeChanged,
		BorderSizePixel = if RemovePeekViewScrimBorder then 0 else nil
	}, p1.children)
end))