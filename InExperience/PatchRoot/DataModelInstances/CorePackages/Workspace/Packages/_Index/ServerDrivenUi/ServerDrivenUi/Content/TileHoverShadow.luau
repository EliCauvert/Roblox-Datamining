local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local image = foundationModule.Image
local useTokens = foundationModule.Hooks.useTokens
local t = { center = Rect.new(35, 35, 37, 37) }

return reactModule.memo(function(p0) --[[ line: 23 | named "TileHoverShadow" ]]
	-- upvalues: useTokens (ref), reactModule (ref), image (ref), t (ref)
	local var3 = useTokens()
	local hoverPadding = p0.hoverPadding or var3.Padding.Medium
	local containmentPadding = p0.containmentPadding or var3.Padding.Small
	local var6 = hoverPadding + 18
	local var7 = hoverPadding + 14
	local var8 = hoverPadding + containmentPadding + var3.Gap.XSmall
	local var9, var10 = reactModule.useBinding(0)
	reactModule.useEffect(function() --[[ line: 33 ]]
		-- upvalues: p0 (ref), var10 (ref), var8 (ref)
		local current = p0.contentRef.current
		
		if current then
			local function update() --[[ line: 39 ]]
				-- upvalues: current (ref), var10 (copy), var8 (copy)
				var10(math.max(0, current.AbsoluteSize.Y - var8))
			end
			
			var10(math.max(0, current.AbsoluteSize.Y - var8))
			local var12 = current:GetPropertyChangedSignal("AbsoluteSize"):Connect(update)
			
			return function() --[[ line: 47 ]]
				-- upvalues: var12 (ref)
				var12:Disconnect()
			end
		end
	end, { p0.contentRef, var8 })
	
	return reactModule.createElement(image, {
		Image = "component_assets/dropshadow_56_8",
		ZIndex = -1,
		Position = var9:map(function(p1) --[[ line: 53 ]]
			return UDim2.new(0.5, 0, 0.5, p1 / 2 + 2)
		end),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = var9:map(function(p2) --[[ line: 57 ]]
			-- upvalues: var6 (ref), var7 (ref)
			return UDim2.new(1, var6, 1, var7 + p2)
		end),
		imageStyle = {
			Color3 = var3.Color.Common.Shadow.Color3,
			Transparency = math.min(1, var3.Color.Common.Shadow.Transparency + 0.25)
		},
		slice = t
	})
end)