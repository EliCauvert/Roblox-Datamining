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

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyleModule (ref), UIBloxConfigModule (ref), navigationRailAlignmentModule (ref), reactModule (ref), reactOtterModule (ref)
	assert(#p1.items > 0, "At least one item should be present!")
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = useStyleModule()
	local var3 = if var1.paddings and var1.paddings.Top then var1.paddings.Top elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var2.Tokens.Size.Size_150 else var2.Tokens.Global.Space_75
	local var4 = if var1.paddings and var1.paddings.Bottom then var1.paddings.Bottom elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var2.Tokens.Size.Size_150 else var2.Tokens.Global.Space_75
	local var5 = if var1.paddings and var1.paddings.Left then var1.paddings.Left elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var2.Tokens.Size.Size_150 else var2.Tokens.Global.Space_75
	local var6 = if var1.paddings and var1.paddings.Right then var1.paddings.Right elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var2.Tokens.Size.Size_150 else var2.Tokens.Global.Space_75
	local center = nil
	
	if var1.alignment == navigationRailAlignmentModule.Justified then
		center = Enum.VerticalAlignment.Top
	elseif var1.alignment == navigationRailAlignmentModule.Centered then
		center = Enum.VerticalAlignment.Center
	else
		error("NavigationRail alignment type is incorrect!")
	end
	local var7, var8 = reactModule.useState(if var1.size then var1.size.X.Offset else 0)
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), var8 (ref)
		if var1.animated then
			var8(p2.AbsoluteSize.X)
		end
	end, { var1.animated })
	local useAnimatedBinding = reactOtterModule.useAnimatedBinding
	local var10 = if var1.animated and not var1.isVisible then -var7 else 0
	useAnimatedBinding, var16 = useAnimatedBinding(var10)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var10 (ref), reactOtterModule (copy), var7 (ref)
		if var1.animated then
			if var1.isVisible then
				var10(reactOtterModule.spring(0, var1.animationConfig))
			else
				var10(reactOtterModule.spring(-var7, var1.animationConfig))
			end
		end
		return nil
	end, {
		var1.animated,
		var1.isVisible,
		var7,
		var1.animationConfig
	})
	local t_1 = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = var1.spacing,
			SortOrder = Enum.SortOrder.Name
		})
	}
	local t_2 = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			Padding = var1.spacing,
			SortOrder = Enum.SortOrder.Name
		})
	}
	local var11 = false
	
	for i, v in ipairs(var1.items) do
		local var12 = i == var1.selection
		
		if v.isSecondary then
			var11 = true
			t_2[tostring(i)] = var1.renderItem(v, var12)
		else
			t_1[tostring(i)] = var1.renderItem(v, var12)
		end
	end
	local var13 = useAnimatedBinding:map(function(p2)
		return UDim2.new(0, math.floor(p2 + 0.5), 0, 0)
	end)
	
	if var1.leadingComponent then
		t_1["0"] = var1.leadingComponent
	end
	if var1.trailingComponent then
		t_1[":"] = var1.trailingComponent
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = var1.clipsDescendants,
		Size = var1.size,
		Position = var1.position,
		Visible = var1.visible,
		ZIndex = var1.zIndex,
		[reactModule.Change.AbsoluteSize] = var9
	}, {
		AnimatedFrame = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = var13,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = if var1.backgroundColor then var1.backgroundColor.Color else var2.Theme.NavigationBar.Color,
			BackgroundTransparency = if var1.backgroundColor then var1.backgroundColor.Transparency else var2.Theme.NavigationBar.Transparency
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var3),
				PaddingBottom = UDim.new(0, var4),
				PaddingLeft = UDim.new(0, var5),
				PaddingRight = UDim.new(0, var6)
			}),
			MainFrame = reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = center,
					Padding = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var2.Tokens.Size.Size_400 else var2.Tokens.Global.Space_200)
				}),
				PrimaryItems = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, t_1),
				CenteredSecondaryItems = if var11 and var1.alignment == navigationRailAlignmentModule.Centered then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, t_2) else nil
			}),
			JustifiedSecondaryItems = if var11 and var1.alignment == navigationRailAlignmentModule.Justified then reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, t_2) else nil
		})
	})
end