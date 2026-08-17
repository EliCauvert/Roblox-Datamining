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

return function(p0) --[[ line: 69 | named "NavigationBar" ]]
	-- upvalues: cryoModule (ref), t (ref), useStyleModule (ref), reactModule (ref), UIBloxConfigModule (ref), navigationBarAlignmentModule (ref), reactOtterModule (ref)
	assert(#p0.items > 0, "At least one item should be present!")
	local var7 = cryoModule.Dictionary.join(t, p0)
	local var8 = useStyleModule()
	local var9, var10 = reactModule.useState(if var7.size then var7.size.Y.Offset else 0)
	local var11 = if var7.paddings and var7.paddings.Top then var7.paddings.Top elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var8.Tokens.Size.Size_150 else var8.Tokens.Global.Space_75
	local var12 = if var7.paddings and var7.paddings.Bottom then var7.paddings.Bottom elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var8.Tokens.Size.Size_150 else var8.Tokens.Global.Space_75
	local var13 = if var7.paddings and var7.paddings.Left then var7.paddings.Left elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var8.Tokens.Size.Size_150 else var8.Tokens.Global.Space_75
	local var14 = if var7.paddings and var7.paddings.Right then var7.paddings.Right elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var8.Tokens.Size.Size_150 else var8.Tokens.Global.Space_75
	local center = nil
	local spaceAround = nil
	
	if var7.alignment == navigationBarAlignmentModule.Left then
		center = Enum.HorizontalAlignment.Left
	elseif var7.alignment == navigationBarAlignmentModule.EvenlyDistributed then
		spaceAround = Enum.UIFlexAlignment.SpaceAround
		center = Enum.HorizontalAlignment.Center
	else
		error("NavigationBar Alignment type is incorrect!")
	end
	local var15 = reactModule.useCallback(function(p1) --[[ line: 105 ]]
		-- upvalues: var7 (ref), var10 (ref)
		if var7.visibility or var7.animated then
			var10(p1.AbsoluteSize.Y)
		end
	end, { var7.visibility, var7.animated })
	local var16, var17 = reactOtterModule.useAnimatedBinding(0)
	reactModule.useEffect(function() --[[ line: 111 ]]
		-- upvalues: var7 (ref), var17 (ref), reactOtterModule (copy), var9 (ref)
		if not var7.visibility and var7.animated then
			if var7.isVisible then
				var17(reactOtterModule.spring(0, var7.animationConfig))
			else
				var17(reactOtterModule.spring(var9, var7.animationConfig))
			end
		end
		return nil
	end, {
		var7.visibility,
		var7.animated,
		var7.isVisible,
		var9,
		var7.animationConfig
	})
	local t_1 = {
		Constraint = if var7.maxWidth ~= nil then nil else reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(var7.maxWidth, 1e999) }),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var11),
			PaddingBottom = UDim.new(0, var12),
			PaddingLeft = UDim.new(0, var13),
			PaddingRight = UDim.new(0, var14)
		}),
		Layout = reactModule.createElement("UIListLayout", {
			Padding = var7.spacing,
			SortOrder = Enum.SortOrder.Name,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalFlex = spaceAround,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Left
		})
	}
	
	for i, v in ipairs(var7.items) do
		t_1[tostring(i)] = var7.renderItem(v, i == var7.selection)
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = var7.clipsDescendants,
		Size = var7.size,
		AutomaticSize = var7.automaticSize,
		Position = var7.position,
		Visible = var7.visible,
		[reactModule.Change.AbsoluteSize] = var15
	}, {
		AnimatedFrame = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Selectable = false,
			Active = var7.active,
			Position = if var7.visibility then var7.visibility:map(function(p3) --[[ line: 149 ]]
				-- upvalues: var9 (ref)
				return UDim2.new(0, 0, 0, math.floor((1 - p3) * var9 + 0.5))
			end) else var16:map(function(p2) --[[ line: 153 ]]
				return UDim2.new(0, 0, 0, math.floor(p2 + 0.5))
			end),
			Size = UDim2.fromScale(1, 1),
			AutomaticSize = var7.automaticSize,
			BackgroundColor3 = if var7.backgroundColor then var7.backgroundColor.Color else var8.Theme.NavigationBar.Color,
			BackgroundTransparency = if var7.backgroundColor then var7.backgroundColor.Transparency else var8.Theme.NavigationBar.Transparency,
			Visible = var7.visible,
			ZIndex = var7.zIndex
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				HorizontalAlignment = center
			}),
			InnerFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				AutomaticSize = var7.automaticSize
			}, t_1)
		})
	})
end