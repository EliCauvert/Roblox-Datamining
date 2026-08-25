local parent = script:FindFirstAncestor("PeekView").Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local reactOtterModule = require(parent.ReactOtter)
local removePeekViewScrimBorder = game:DefineFastFlag("RemovePeekViewScrimBorder", false)

return reactModule.forwardRef(function(p0, p1)
	-- upvalues: useDesignTokens (ref), reactModule (ref), reactOtterModule (ref), removePeekViewScrimBorder (ref)
	local var3 = useDesignTokens()
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var4, var5 = reactModule.useState(true)
	local var6 = var4
	local var7 = var5
	local var8, var9 = reactOtterModule.useAnimatedBinding(1)
	local var10 = var9
	reactModule.useEffect(function()
		-- upvalues: var10 (write), reactOtterModule (copy), var6 (write)
		var10(reactOtterModule.spring(if var6 then 0.35 else 1))
	end, { var6 })
	
	return reactModule.createElement("TextButton", {
		ref = p1,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = var8,
		BackgroundColor3 = var3.Color.Common.Scrim.Color3,
		ClipsDescendants = false,
		Text = "",
		AutoButtonColor = false,
		[reactModule.Event.Activated] = function()
			-- upvalues: p0 (ref), var7 (write), var6 (write)
			if p0.onActivated then
				p0.onActivated()
			end
			var7(not var6)
		end,
		[reactModule.Change.AbsoluteSize] = p0.onSizeChanged,
		BorderSizePixel = if removePeekViewScrimBorder then 0 else nil
	}, p0.children)
end)