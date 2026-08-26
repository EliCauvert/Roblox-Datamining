local parent = script:FindFirstAncestor("PeekView").Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local reactOtterModule = require(parent.ReactOtter)
local removePeekViewScrimBorder = game:DefineFastFlag("RemovePeekViewScrimBorder", false)

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useDesignTokens (ref), reactModule (ref), reactOtterModule (ref), removePeekViewScrimBorder (ref)
	local var1 = useDesignTokens()
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var2, var3 = reactModule.useState(true)
	local var4 = var2
	local var5 = var3
	local var6, var7 = reactOtterModule.useAnimatedBinding(1)
	local var8 = var7
	reactModule.useEffect(function()
		-- upvalues: var8 (write), reactOtterModule (copy), var4 (write)
		var8(reactOtterModule.spring(if var4 then 0.35 else 1))
	end, { var4 })
	
	return reactModule.createElement("TextButton", {
		ref = p2,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = var6,
		BackgroundColor3 = var1.Color.Common.Scrim.Color3,
		ClipsDescendants = false,
		Text = "",
		AutoButtonColor = false,
		[reactModule.Event.Activated] = function()
			-- upvalues: p1 (ref), var5 (write), var4 (write)
			if p1.onActivated then
				p1.onActivated()
			end
			var5(not var4)
		end,
		[reactModule.Change.AbsoluteSize] = p1.onSizeChanged,
		BorderSizePixel = if removePeekViewScrimBorder then 0 else nil
	}, p1.children)
end)