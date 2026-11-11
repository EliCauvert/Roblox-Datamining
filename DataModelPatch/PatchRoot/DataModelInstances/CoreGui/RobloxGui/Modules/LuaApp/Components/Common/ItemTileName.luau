local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local LoadingSkeletonModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.LoadingSkeleton)
local ItemTileName = RoactModule.PureComponent:extend("ItemTileName")
ItemTileName.defaultProps = { textYAlignment = Enum.TextYAlignment.Top }
local Panels = {
	[1] = { Size = UDim2.new(0.8, 0, 0, 16) },
	[2] = { Size = UDim2.new(0.5, 0, 0, 16) }
}

function ItemTileName.init(p1)
	-- upvalues: RoactModule (copy)
	function p1.createLoadingSkeletonLayout()
		-- upvalues: RoactModule (upval)
		return RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 10)
		})
	end
end

function ItemTileName.render(p1)
	-- upvalues: RoactModule (copy), LoadingSkeletonModule (copy), Panels (copy), WithStyleFunction (copy)
	local Name = p1.props.name
	local TextYAlignment = p1.props.textYAlignment
	
	return WithStyleFunction(function(p2)
		-- upvalues: Name (copy), RoactModule (upval), LoadingSkeletonModule (upval), p1 (copy), Panels (upval), TextYAlignment (copy)
		local Theme = p2.Theme
		local _Font = p2.Font
		local ScaledBaseSize = _Font.BaseSize * _Font.Header2.RelativeSize
		
		return Name == nil and RoactModule.createElement(LoadingSkeletonModule, {
			Size = UDim2.new(1, 0, 1, 0),
			createLayout = p1.createLoadingSkeletonLayout,
			panels = Panels
		}) or RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			TextWrapped = true,
			Size = UDim2.new(1, 0, 1, 0),
			TextSize = ScaledBaseSize,
			TextColor3 = Theme.TextEmphasis.Color,
			TextTransparency = Theme.TextEmphasis.Transparency,
			Font = _Font.Header2.Font,
			Text = Name,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = TextYAlignment
		})
	end)
end

return ItemTileName