local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Image = FoundationModule.Image
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Slice = { center = Rect.new(35, 35, 37, 37) }

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Image (copy), Slice (copy)
	local UseTokensResult = UseTokensFunction()
	local HoverPadding = p1.hoverPadding or UseTokensResult.Padding.Medium
	local XOffset = HoverPadding + 18
	local NewHoverPadding = HoverPadding + 14
	local NewHoverPadding1 = HoverPadding + (p1.containmentPadding or UseTokensResult.Padding.Small) + UseTokensResult.Gap.XSmall
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseBindingResult2 (copy), NewHoverPadding1 (copy)
		local Current = p1.contentRef.current
		
		if not Current then return end
		local function update()
			-- upvalues: Current (copy), UseBindingResult2 (upval), NewHoverPadding1 (upval)
			UseBindingResult2((math.max(0, Current.AbsoluteSize.Y - NewHoverPadding1)))
		end
		
		UseBindingResult2((math.max(0, Current.AbsoluteSize.Y - NewHoverPadding1)))
		local Connection = Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(update)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { p1.contentRef, NewHoverPadding1 })
	
	return ReactModule.createElement(Image, {
		Image = "component_assets/dropshadow_56_8",
		ZIndex = -1,
		Position = UseBindingResult:map(function(p2: number): UDim2
			return UDim2.new(0.5, 0, 0.5, p2 / 2 + 2)
		end),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UseBindingResult:map(function(p2): UDim2
			-- upvalues: XOffset (copy), NewHoverPadding (copy)
			return UDim2.new(1, XOffset, 1, NewHoverPadding + p2)
		end),
		imageStyle = {
			Color3 = UseTokensResult.Color.Common.Shadow.Color3,
			Transparency = math.min(1, UseTokensResult.Color.Common.Shadow.Transparency + 0.25)
		},
		slice = Slice
	})
end)