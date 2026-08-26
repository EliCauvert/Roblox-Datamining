local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local image = foundationModule.Image
local useTokens = foundationModule.Hooks.useTokens
local t = { center = Rect.new(35, 35, 37, 37) }

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), image (ref), t (ref)
	local var1 = useTokens()
	local hoverPadding = p1.hoverPadding or var1.Padding.Medium
	local containmentPadding = p1.containmentPadding or var1.Padding.Small
	local var2 = hoverPadding + 18
	local var3 = hoverPadding + 14
	local var4 = hoverPadding + containmentPadding + var1.Gap.XSmall
	local var5, var6 = reactModule.useBinding(0)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var6 (ref), var4 (ref)
		local current = p1.contentRef.current
		
		if current then
			local function update()
				-- upvalues: current (ref), var6 (copy), var4 (copy)
				var6(math.max(0, current.AbsoluteSize.Y - var4))
			end
			
			var6(math.max(0, current.AbsoluteSize.Y - var4))
			local var7 = current:GetPropertyChangedSignal("AbsoluteSize"):Connect(update)
			
			return function()
				-- upvalues: var7 (ref)
				var7:Disconnect()
			end
		end
	end, { p1.contentRef, var4 })
	
	return reactModule.createElement(image, {
		Image = "component_assets/dropshadow_56_8",
		ZIndex = -1,
		Position = var5:map(function(p2)
			return UDim2.new(0.5, 0, 0.5, p2 / 2 + 2)
		end),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = var5:map(function(p2)
			-- upvalues: var2 (ref), var3 (ref)
			return UDim2.new(1, var2, 1, var3 + p2)
		end),
		imageStyle = {
			Color3 = var1.Color.Common.Shadow.Color3,
			Transparency = math.min(1, var1.Color.Common.Shadow.Transparency + 0.25)
		},
		slice = t
	})
end)