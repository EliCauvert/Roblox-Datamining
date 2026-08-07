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
local navigationBarAlignmentModule = require(parent.Navigation.Enum.NavigationBarAlignment)
local t = {
	visible = true,
	zIndex = 1,
	animated = false,
	maxWidth = 600,
	animationConfig = { dampingRatio = 1, frequency = 3 }
}

return function(p0) --[[ line: 68 | named "NavigationBar" ]]
	-- upvalues: cryoModule (ref), t (ref), useStyleModule (ref), reactModule (ref), navigationBarAlignmentModule (ref), reactOtterModule (ref)
	assert(#p0.items > 0, "At least one item should be present!")
	local var6 = cryoModule.Dictionary.join(t, p0)
	local var7 = useStyleModule()
	local var8, var9 = reactModule.useState(if var6.size then var6.size.Y.Offset else 0)
	local var10 = if var6.paddings and var6.paddings.Top then var6.paddings.Top else var7.Tokens.Global.Space_75
	local var11 = if var6.paddings and var6.paddings.Bottom then var6.paddings.Bottom else var7.Tokens.Global.Space_75
	local var12 = if var6.paddings and var6.paddings.Left then var6.paddings.Left else var7.Tokens.Global.Space_75
	local var13 = if var6.paddings and var6.paddings.Right then var6.paddings.Right else var7.Tokens.Global.Space_75
	local center = nil
	local spaceAround = nil
	
	if var6.alignment == navigationBarAlignmentModule.Left then
		center = Enum.HorizontalAlignment.Left
	elseif var6.alignment == navigationBarAlignmentModule.EvenlyDistributed then
		spaceAround = Enum.UIFlexAlignment.SpaceAround
		center = Enum.HorizontalAlignment.Center
	else
		error("NavigationBar Alignment type is incorrect!")
	end
	local var14 = reactModule.useCallback(function(p1) --[[ line: 96 ]]
		-- upvalues: var6 (ref), var9 (ref)
		if var6.visibility or var6.animated then
			var9(p1.AbsoluteSize.Y)
		end
	end, { var6.visibility, var6.animated })
	local var15, var16 = reactOtterModule.useAnimatedBinding(0)
	reactModule.useEffect(function() --[[ line: 102 ]]
		-- upvalues: var6 (ref), var16 (ref), reactOtterModule (copy), var8 (ref)
		if not var6.visibility and var6.animated then
			if var6.isVisible then
				var16(reactOtterModule.spring(0, var6.animationConfig))
			else
				var16(reactOtterModule.spring(var8, var6.animationConfig))
			end
		end
		return nil
	end, {
		var6.visibility,
		var6.animated,
		var6.isVisible,
		var8,
		var6.animationConfig
	})
	local t_1 = {
		Constraint = if var6.maxWidth ~= nil then nil else reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(var6.maxWidth, 1e999) }),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var10),
			PaddingBottom = UDim.new(0, var11),
			PaddingLeft = UDim.new(0, var12),
			PaddingRight = UDim.new(0, var13)
		}),
		Layout = reactModule.createElement("UIListLayout", {
			Padding = var6.spacing,
			SortOrder = Enum.SortOrder.Name,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalFlex = spaceAround,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Left
		})
	}
	
	for i, v in ipairs(var6.items) do
		t_1[tostring(i)] = var6.renderItem(v, i == var6.selection)
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = var6.clipsDescendants,
		Size = var6.size,
		AutomaticSize = var6.automaticSize,
		Position = var6.position,
		Visible = var6.visible,
		[reactModule.Change.AbsoluteSize] = var14
	}, {
		AnimatedFrame = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Selectable = false,
			Active = var6.active,
			Position = if var6.visibility then var6.visibility:map(function(p3) --[[ line: 140 ]]
				-- upvalues: var8 (ref)
				return UDim2.new(0, 0, 0, math.floor((1 - p3) * var8 + 0.5))
			end) else var15:map(function(p2) --[[ line: 144 ]]
				return UDim2.new(0, 0, 0, math.floor(p2 + 0.5))
			end),
			Size = UDim2.fromScale(1, 1),
			AutomaticSize = var6.automaticSize,
			BackgroundColor3 = if var6.backgroundColor then var6.backgroundColor.Color else var7.Theme.NavigationBar.Color,
			BackgroundTransparency = if var6.backgroundColor then var6.backgroundColor.Transparency else var7.Theme.NavigationBar.Transparency,
			Visible = var6.visible,
			ZIndex = var6.zIndex
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				HorizontalAlignment = center
			}),
			InnerFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				AutomaticSize = var6.automaticSize
			}, t_1)
		})
	})
end