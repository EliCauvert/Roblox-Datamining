local parent = script.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local UIBloxConfigModule = require(parent_1.UIBloxConfig)
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

return function(p0)
	-- upvalues: cryoModule (ref), t (ref), useStyleModule (ref), UIBloxConfigModule (ref), navigationRailAlignmentModule (ref), reactModule (ref), reactOtterModule (ref)
	assert(#p0.items > 0, "At least one item should be present!")
	local var7 = cryoModule.Dictionary.join(t, p0)
	local var8 = useStyleModule()
	local var9 = if var7.paddings and var7.paddings.Top then var7.paddings.Top elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var8.Tokens.Size.Size_150 else var8.Tokens.Global.Space_75
	local var10 = if var7.paddings and var7.paddings.Bottom then var7.paddings.Bottom elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var8.Tokens.Size.Size_150 else var8.Tokens.Global.Space_75
	local var11 = if var7.paddings and var7.paddings.Left then var7.paddings.Left elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var8.Tokens.Size.Size_150 else var8.Tokens.Global.Space_75
	local var12 = if var7.paddings and var7.paddings.Right then var7.paddings.Right elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var8.Tokens.Size.Size_150 else var8.Tokens.Global.Space_75
	local center = nil
	
	if var7.alignment == navigationRailAlignmentModule.Justified then
		center = Enum.VerticalAlignment.Top
	elseif var7.alignment == navigationRailAlignmentModule.Centered then
		center = Enum.VerticalAlignment.Center
	else
		error("NavigationRail alignment type is incorrect!")
	end
	local var13, var14 = reactModule.useState(if var7.size then var7.size.X.Offset else 0)
	local var15 = reactModule.useCallback(function(p1)
		-- upvalues: var7 (ref), var14 (ref)
		if var7.animated then
			var14(p1.AbsoluteSize.X)
		end
	end, { var7.animated })
	local useAnimatedBinding = reactOtterModule.useAnimatedBinding
	local var16 = if var7.animated and not var7.isVisible then -var13 else 0
	useAnimatedBinding, var16 = useAnimatedBinding(var16)
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var16 (ref), reactOtterModule (copy), var13 (ref)
		if var7.animated then
			if var7.isVisible then
				var16(reactOtterModule.spring(0, var7.animationConfig))
			else
				var16(reactOtterModule.spring(-var13, var7.animationConfig))
			end
		end
		return nil
	end, {
		var7.animated,
		var7.isVisible,
		var13,
		var7.animationConfig
	})
	local t_1 = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = var7.spacing,
			SortOrder = Enum.SortOrder.Name
		})
	}
	local t_2 = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			Padding = var7.spacing,
			SortOrder = Enum.SortOrder.Name
		})
	}
	local var19 = false
	
	for i, v in ipairs(var7.items) do
		local var21 = i == var7.selection
		
		if v.isSecondary then
			var19 = true
			t_2[tostring(i)] = var7.renderItem(v, var21)
		else
			t_1[tostring(i)] = var7.renderItem(v, var21)
		end
	end
	local var20 = useAnimatedBinding:map(function(p2)
		return UDim2.new(0, math.floor(p2 + 0.5), 0, 0)
	end)
	
	if var7.leadingComponent then
		t_1["0"] = var7.leadingComponent
	end
	if var7.trailingComponent then
		t_1[":"] = var7.trailingComponent
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = var7.clipsDescendants,
		Size = var7.size,
		Position = var7.position,
		Visible = var7.visible,
		ZIndex = var7.zIndex,
		[reactModule.Change.AbsoluteSize] = var15
	}, {
		AnimatedFrame = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = var20,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = if var7.backgroundColor then var7.backgroundColor.Color else var8.Theme.NavigationBar.Color,
			BackgroundTransparency = if var7.backgroundColor then var7.backgroundColor.Transparency else var8.Theme.NavigationBar.Transparency
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var9),
				PaddingBottom = UDim.new(0, var10),
				PaddingLeft = UDim.new(0, var11),
				PaddingRight = UDim.new(0, var12)
			}),
			MainFrame = reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = center,
					Padding = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var8.Tokens.Size.Size_400 else var8.Tokens.Global.Space_200)
				}),
				PrimaryItems = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, t_1),
				CenteredSecondaryItems = if var19 and var7.alignment == navigationRailAlignmentModule.Centered then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, t_2) else nil
			}),
			JustifiedSecondaryItems = if var19 and var7.alignment == navigationRailAlignmentModule.Justified then reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, t_2) else nil
		})
	})
end