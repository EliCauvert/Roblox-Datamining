local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local CryoModule = require(Parent2.Cryo)
local ReactModule = require(Parent2.React)
local ReactOtterModule = require(Parent2.ReactOtter)
local _ = require(Parent.Style.StyleTypes)
local UseStyleModule = require(Parent1.Core.Style.useStyle)
local NavigationRailAlignmentModule = require(Parent.Navigation.Enum.NavigationRailAlignment)
local config = {
	visible = true,
	isVisible = true,
	zIndex = 1,
	animated = false,
	animationConfig = { dampingRatio = 1, frequency = 3 }
}

return function(p1) --[[ Line: 64 | Named "NavigationRail" ]]
	-- upvalues: CryoModule (copy), config (copy), UseStyleModule (copy), NavigationRailAlignmentModule (copy), ReactModule (copy), ReactOtterModule (copy)
	assert(#p1.items > 0, "At least one item should be present!")
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStyleModuleResult = UseStyleModule()
	local Top = if JoinResult.paddings and JoinResult.paddings.Top then JoinResult.paddings.Top else UseStyleModuleResult.Tokens.Size.Size_150
	local Bottom = if JoinResult.paddings and JoinResult.paddings.Bottom then JoinResult.paddings.Bottom else UseStyleModuleResult.Tokens.Size.Size_150
	local Left = if JoinResult.paddings and JoinResult.paddings.Left then JoinResult.paddings.Left else UseStyleModuleResult.Tokens.Size.Size_150
	local Right = if JoinResult.paddings and JoinResult.paddings.Right then JoinResult.paddings.Right else UseStyleModuleResult.Tokens.Size.Size_150
	local Center = nil
	
	if JoinResult.alignment == NavigationRailAlignmentModule.Justified then
		Center = Enum.VerticalAlignment.Top
	elseif JoinResult.alignment == NavigationRailAlignmentModule.Centered then
		Center = Enum.VerticalAlignment.Center
	else
		error("NavigationRail alignment type is incorrect!")
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(if JoinResult.size then JoinResult.size.X.Offset else 0)
	local UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 88 ]]
		-- upvalues: JoinResult (copy), UseStateResult2 (copy)
		if JoinResult.animated then
			UseStateResult2(Frame.AbsoluteSize.X)
		end
	end, { JoinResult.animated })
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(if JoinResult.animated and not JoinResult.isVisible then -UseStateResult else 0)
	ReactModule.useEffect(function() --[[ Line: 95 ]]
		-- upvalues: JoinResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseStateResult (copy)
		if JoinResult.animated then
			if JoinResult.isVisible then
				UseAnimatedBindingResult2(ReactOtterModule.spring(0, JoinResult.animationConfig))
			else
				UseAnimatedBindingResult2(ReactOtterModule.spring(-UseStateResult, JoinResult.animationConfig))
			end
		end
		return nil
	end, {
		JoinResult.animated,
		JoinResult.isVisible,
		UseStateResult,
		JoinResult.animationConfig
	})
	local config1 = {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = JoinResult.spacing,
			SortOrder = Enum.SortOrder.Name
		})
	}
	local config2 = {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			Padding = JoinResult.spacing,
			SortOrder = Enum.SortOrder.Name
		})
	}
	local Flag = false
	
	for i, item in ipairs(JoinResult.items) do
		local IsSelectionMatch = i == JoinResult.selection
		
		if item.isSecondary then
			Flag = true
			config2[tostring(i)] = JoinResult.renderItem(item, IsSelectionMatch)
		else
			config1[tostring(i)] = JoinResult.renderItem(item, IsSelectionMatch)
		end
	end
	local MapResult = UseAnimatedBindingResult:map(function(p2: number): UDim2 --[[ Line: 134 ]]
		return UDim2.new(0, math.floor(p2 + 0.5), 0, 0)
	end)
	
	if JoinResult.leadingComponent then
		config1["0"] = JoinResult.leadingComponent
	end
	if JoinResult.trailingComponent then
		config1[":"] = JoinResult.trailingComponent
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = JoinResult.clipsDescendants,
		Size = JoinResult.size,
		Position = JoinResult.position,
		Visible = JoinResult.visible,
		ZIndex = JoinResult.zIndex,
		[ReactModule.Change.AbsoluteSize] = UseResult
	}, {
		AnimatedFrame = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = MapResult,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = if JoinResult.backgroundColor then JoinResult.backgroundColor.Color else UseStyleModuleResult.Theme.NavigationBar.Color,
			BackgroundTransparency = if JoinResult.backgroundColor then JoinResult.backgroundColor.Transparency else UseStyleModuleResult.Theme.NavigationBar.Transparency
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, Top),
				PaddingBottom = UDim.new(0, Bottom),
				PaddingLeft = UDim.new(0, Left),
				PaddingRight = UDim.new(0, Right)
			}),
			MainFrame = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Center,
					Padding = UDim.new(0, UseStyleModuleResult.Tokens.Size.Size_400)
				}),
				PrimaryItems = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, config1),
				CenteredSecondaryItems = if Flag and JoinResult.alignment == NavigationRailAlignmentModule.Centered then ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, config2) else nil
			}),
			JustifiedSecondaryItems = if Flag and JoinResult.alignment == NavigationRailAlignmentModule.Justified then ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, config2) else nil
		})
	})
end