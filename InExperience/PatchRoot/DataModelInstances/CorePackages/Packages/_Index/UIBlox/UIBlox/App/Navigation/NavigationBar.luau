local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local CryoModule = require(Parent2.Cryo)
local ReactModule = require(Parent2.React)
local ReactOtterModule = require(Parent2.ReactOtter)
local _ = require(Parent.Style.StyleTypes)
local UseStyleModule = require(Parent1.Core.Style.useStyle)
local NavigationBarAlignmentModule = require(Parent.Navigation.Enum.NavigationBarAlignment)
local config = {
	visible = true,
	zIndex = 1,
	animated = false,
	maxWidth = 600,
	animationConfig = { dampingRatio = 1, frequency = 3 }
}

return function(p1) --[[ Line: 68 | Named "NavigationBar" ]]
	-- upvalues: CryoModule (copy), config (copy), UseStyleModule (copy), ReactModule (copy), NavigationBarAlignmentModule (copy), ReactOtterModule (copy)
	assert(#p1.items > 0, "At least one item should be present!")
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStyleModuleResult = UseStyleModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(if JoinResult.size then JoinResult.size.Y.Offset else 0)
	local Top = if JoinResult.paddings and JoinResult.paddings.Top then JoinResult.paddings.Top else UseStyleModuleResult.Tokens.Size.Size_150
	local Bottom = if JoinResult.paddings and JoinResult.paddings.Bottom then JoinResult.paddings.Bottom else UseStyleModuleResult.Tokens.Size.Size_150
	local Left = if JoinResult.paddings and JoinResult.paddings.Left then JoinResult.paddings.Left else UseStyleModuleResult.Tokens.Size.Size_150
	local Right = if JoinResult.paddings and JoinResult.paddings.Right then JoinResult.paddings.Right else UseStyleModuleResult.Tokens.Size.Size_150
	local Center = nil
	local SpaceAround = nil
	
	if JoinResult.alignment == NavigationBarAlignmentModule.Left then
		Center = Enum.HorizontalAlignment.Left
	elseif JoinResult.alignment == NavigationBarAlignmentModule.EvenlyDistributed then
		SpaceAround = Enum.UIFlexAlignment.SpaceAround
		Center = Enum.HorizontalAlignment.Center
	else
		error("NavigationBar Alignment type is incorrect!")
	end
	local UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 94 ]]
		-- upvalues: JoinResult (copy), UseStateResult2 (copy)
		if JoinResult.visibility or JoinResult.animated then
			UseStateResult2(Frame.AbsoluteSize.Y)
		end
	end, { JoinResult.visibility, JoinResult.animated })
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	ReactModule.useEffect(function() --[[ Line: 100 ]]
		-- upvalues: JoinResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseStateResult (copy)
		if not JoinResult.visibility and JoinResult.animated then
			if JoinResult.isVisible then
				UseAnimatedBindingResult2(ReactOtterModule.spring(0, JoinResult.animationConfig))
			else
				UseAnimatedBindingResult2(ReactOtterModule.spring(UseStateResult, JoinResult.animationConfig))
			end
		end
		return nil
	end, {
		JoinResult.visibility,
		JoinResult.animated,
		JoinResult.isVisible,
		UseStateResult,
		JoinResult.animationConfig
	})
	local config1 = {
		Constraint = if JoinResult.maxWidth == nil then nil else ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(JoinResult.maxWidth, 1e999) }),
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, Top),
			PaddingBottom = UDim.new(0, Bottom),
			PaddingLeft = UDim.new(0, Left),
			PaddingRight = UDim.new(0, Right)
		}),
		Layout = ReactModule.createElement("UIListLayout", {
			Padding = JoinResult.spacing,
			SortOrder = Enum.SortOrder.Name,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalFlex = SpaceAround,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Left
		})
	}
	
	for i, item in ipairs(JoinResult.items) do
		config1[tostring(i)] = JoinResult.renderItem(item, i == JoinResult.selection)
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = JoinResult.clipsDescendants,
		Size = JoinResult.size,
		AutomaticSize = JoinResult.automaticSize,
		Position = JoinResult.position,
		Visible = JoinResult.visible,
		[ReactModule.Change.AbsoluteSize] = UseResult
	}, {
		AnimatedFrame = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Selectable = false,
			Active = JoinResult.active,
			Position = if JoinResult.visibility then JoinResult.visibility:map(function(p2: number): UDim2 --[[ Line: 138 ]]
				-- upvalues: UseStateResult (copy)
				return UDim2.new(0, 0, 0, (math.floor((1 - p2) * UseStateResult + 0.5)))
			end) else UseAnimatedBindingResult:map(function(p2: number): UDim2 --[[ Line: 142 ]]
				return UDim2.new(0, 0, 0, (math.floor(p2 + 0.5)))
			end),
			Size = UDim2.fromScale(1, 1),
			AutomaticSize = JoinResult.automaticSize,
			BackgroundColor3 = if JoinResult.backgroundColor then JoinResult.backgroundColor.Color else UseStyleModuleResult.Theme.NavigationBar.Color,
			BackgroundTransparency = if JoinResult.backgroundColor then JoinResult.backgroundColor.Transparency else UseStyleModuleResult.Theme.NavigationBar.Transparency,
			Visible = JoinResult.visible,
			ZIndex = JoinResult.zIndex
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				HorizontalAlignment = Center
			}),
			InnerFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				AutomaticSize = JoinResult.automaticSize
			}, config1)
		})
	})
end