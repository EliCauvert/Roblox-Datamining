local parent = script.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local UIBloxConfigModule = require(parent_1.UIBloxConfig)
local cryoModule = require(parent_2.Cryo)
local reactModule = require(parent_2.React)
local reactOtterModule = require(parent_2.ReactOtter)
local _ = require(parent.Style.StyleTypes)
local useStyleModule = require(parent_1.Core.Style.useStyle)
local navigationBarAlignmentModule = require(parent.Navigation.Enum.NavigationBarAlignment)
local t = {
	visible = true,
	zIndex = 1,
	animated = false,
	maxWidth = 600,
	animationConfig = { dampingRatio = 1, frequency = 3 }
}

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyleModule (ref), reactModule (ref), UIBloxConfigModule (ref), navigationBarAlignmentModule (ref), reactOtterModule (ref)
	assert(#p1.items > 0, "At least one item should be present!")
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = useStyleModule()
	local var3, var4 = reactModule.useState(if var1.size then var1.size.Y.Offset else 0)
	local var5 = if var1.paddings and var1.paddings.Top then var1.paddings.Top elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var2.Tokens.Size.Size_150 else var2.Tokens.Global.Space_75
	local var6 = if var1.paddings and var1.paddings.Bottom then var1.paddings.Bottom elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var2.Tokens.Size.Size_150 else var2.Tokens.Global.Space_75
	local var7 = if var1.paddings and var1.paddings.Left then var1.paddings.Left elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var2.Tokens.Size.Size_150 else var2.Tokens.Global.Space_75
	local var8 = if var1.paddings and var1.paddings.Right then var1.paddings.Right elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var2.Tokens.Size.Size_150 else var2.Tokens.Global.Space_75
	local center = nil
	local spaceAround = nil
	
	if var1.alignment == navigationBarAlignmentModule.Left then
		center = Enum.HorizontalAlignment.Left
	elseif var1.alignment == navigationBarAlignmentModule.EvenlyDistributed then
		spaceAround = Enum.UIFlexAlignment.SpaceAround
		center = Enum.HorizontalAlignment.Center
	else
		error("NavigationBar Alignment type is incorrect!")
	end
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), var4 (ref)
		if var1.visibility or var1.animated then
			var4(p2.AbsoluteSize.Y)
		end
	end, { var1.visibility, var1.animated })
	local var10, var11 = reactOtterModule.useAnimatedBinding(0)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var11 (ref), reactOtterModule (copy), var3 (ref)
		if not var1.visibility and var1.animated then
			if var1.isVisible then
				var11(reactOtterModule.spring(0, var1.animationConfig))
			else
				var11(reactOtterModule.spring(var3, var1.animationConfig))
			end
		end
		return nil
	end, {
		var1.visibility,
		var1.animated,
		var1.isVisible,
		var3,
		var1.animationConfig
	})
	local t_1 = {
		Constraint = if var1.maxWidth ~= nil then nil else reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(var1.maxWidth, 1e999) }),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var5),
			PaddingBottom = UDim.new(0, var6),
			PaddingLeft = UDim.new(0, var7),
			PaddingRight = UDim.new(0, var8)
		}),
		Layout = reactModule.createElement("UIListLayout", {
			Padding = var1.spacing,
			SortOrder = Enum.SortOrder.Name,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalFlex = spaceAround,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Left
		})
	}
	
	for i, v in ipairs(var1.items) do
		t_1[tostring(i)] = var1.renderItem(v, i == var1.selection)
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = var1.clipsDescendants,
		Size = var1.size,
		AutomaticSize = var1.automaticSize,
		Position = var1.position,
		Visible = var1.visible,
		[reactModule.Change.AbsoluteSize] = var9
	}, {
		AnimatedFrame = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Selectable = false,
			Active = var1.active,
			Position = if var1.visibility then var1.visibility:map(function(p2)
				-- upvalues: var3 (ref)
				return UDim2.new(0, 0, 0, math.floor((1 - p2) * var3 + 0.5))
			end) else var10:map(function(p2)
				return UDim2.new(0, 0, 0, math.floor(p2 + 0.5))
			end),
			Size = UDim2.fromScale(1, 1),
			AutomaticSize = var1.automaticSize,
			BackgroundColor3 = if var1.backgroundColor then var1.backgroundColor.Color else var2.Theme.NavigationBar.Color,
			BackgroundTransparency = if var1.backgroundColor then var1.backgroundColor.Transparency else var2.Theme.NavigationBar.Transparency,
			Visible = var1.visible,
			ZIndex = var1.zIndex
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				HorizontalAlignment = center
			}),
			InnerFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				AutomaticSize = var1.automaticSize
			}, t_1)
		})
	})
end