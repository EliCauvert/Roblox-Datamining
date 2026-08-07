-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:56 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local cryoModule = require(parent_2.Cryo)
local reactModule = require(parent_2.React)
local reactOtterModule = require(parent_2.ReactOtter)
local _ = require(parent.Style.StyleTypes)
local useStyleModule = require(parent_1.Core.Style.useStyle)
local navigationRailAlignmentModule = require(parent.Navigation.Enum.NavigationRailAlignment)
local t = {
	visible = true,
	isVisible = true,
	zIndex = 1,
	animated = false,
	animationConfig = { dampingRatio = 1, frequency = 3 }
}

return function(p0) --[[ line: 64 | named "NavigationRail" ]]
	-- upvalues: cryoModule (ref), t (ref), useStyleModule (ref), navigationRailAlignmentModule (ref), reactModule (ref), reactOtterModule (ref)
	assert(#p0.items > 0, "At least one item should be present!")
	local var6 = cryoModule.Dictionary.join(t, p0)
	local var7 = useStyleModule()
	local var8 = if var6.paddings and var6.paddings.Top then var6.paddings.Top else var7.Tokens.Global.Space_75
	local var9 = if var6.paddings and var6.paddings.Bottom then var6.paddings.Bottom else var7.Tokens.Global.Space_75
	local var10 = if var6.paddings and var6.paddings.Left then var6.paddings.Left else var7.Tokens.Global.Space_75
	local var11 = if var6.paddings and var6.paddings.Right then var6.paddings.Right else var7.Tokens.Global.Space_75
	local center = nil
	
	if var6.alignment == navigationRailAlignmentModule.Justified then
		center = Enum.VerticalAlignment.Top
	elseif var6.alignment == navigationRailAlignmentModule.Centered then
		center = Enum.VerticalAlignment.Center
	else
		error("NavigationRail alignment type is incorrect!")
	end
	local var12, var13 = reactModule.useState(if var6.size then var6.size.X.Offset else 0)
	local var14 = reactModule.useCallback(function(p1) --[[ line: 90 ]]
		-- upvalues: var6 (ref), var13 (ref)
		if var6.animated then
			var13(p1.AbsoluteSize.X)
		end
	end, { var6.animated })
	local useAnimatedBinding = reactOtterModule.useAnimatedBinding
	local var15 = if var6.animated and not var6.isVisible then -var12 else 0
	useAnimatedBinding, var15 = useAnimatedBinding(var15)
	reactModule.useEffect(function() --[[ line: 97 ]]
		-- upvalues: var6 (ref), var15 (ref), reactOtterModule (copy), var12 (ref)
		if var6.animated then
			if var6.isVisible then
				var15(reactOtterModule.spring(0, var6.animationConfig))
			else
				var15(reactOtterModule.spring(-var12, var6.animationConfig))
			end
		end
		return nil
	end, {
		var6.animated,
		var6.isVisible,
		var12,
		var6.animationConfig
	})
	local t_1 = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = var6.spacing,
			SortOrder = Enum.SortOrder.Name
		})
	}
	local t_2 = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			Padding = var6.spacing,
			SortOrder = Enum.SortOrder.Name
		})
	}
	local var18 = false
	
	for i, v in ipairs(var6.items) do
		local var20 = i == var6.selection
		
		if v.isSecondary then
			var18 = true
			t_2[tostring(i)] = var6.renderItem(v, var20)
		else
			t_1[tostring(i)] = var6.renderItem(v, var20)
		end
	end
	local var19 = useAnimatedBinding:map(function(p2) --[[ line: 136 ]]
		return UDim2.new(0, math.floor(p2 + 0.5), 0, 0)
	end)
	
	if var6.leadingComponent then
		t_1["0"] = var6.leadingComponent
	end
	if var6.trailingComponent then
		t_1[":"] = var6.trailingComponent
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = var6.clipsDescendants,
		Size = var6.size,
		Position = var6.position,
		Visible = var6.visible,
		ZIndex = var6.zIndex,
		[reactModule.Change.AbsoluteSize] = var14
	}, {
		AnimatedFrame = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = var19,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = if var6.backgroundColor then var6.backgroundColor.Color else var7.Theme.NavigationBar.Color,
			BackgroundTransparency = if var6.backgroundColor then var6.backgroundColor.Transparency else var7.Theme.NavigationBar.Transparency
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var8),
				PaddingBottom = UDim.new(0, var9),
				PaddingLeft = UDim.new(0, var10),
				PaddingRight = UDim.new(0, var11)
			}),
			MainFrame = reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = center,
					Padding = UDim.new(0, var7.Tokens.Global.Space_200)
				}),
				PrimaryItems = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, t_1),
				CenteredSecondaryItems = if var18 and var6.alignment == navigationRailAlignmentModule.Centered then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, t_2) else nil
			}),
			JustifiedSecondaryItems = if var18 and var6.alignment == navigationRailAlignmentModule.Justified then reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, t_2) else nil
		})
	})
end