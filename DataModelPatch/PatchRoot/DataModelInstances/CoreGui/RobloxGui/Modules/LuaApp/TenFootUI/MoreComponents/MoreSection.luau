local CorePackages = game:GetService("CorePackages")
local DashModule = require(CorePackages.Packages.Dash)
local ReactModule = require(CorePackages.Packages.React)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local HeaderText = require(script.Parent.MoreText).HeaderText

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), DashModule (copy), HeaderText (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Emphasis = UseDesignTokensResult.Color.Stroke.Emphasis
	local IsNotBoolean = type(p1.withDivider) ~= "boolean" or p1.withDivider
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, DashModule.assign({
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, UseDesignTokensResult.Size.Size_400)
		}),
		Title = ReactModule.createElement(HeaderText, { layoutOrder = -1, text = p1.title }),
		Divider = if IsNotBoolean then ReactModule.createElement("Frame", {
			LayoutOrder = 10000000,
			BorderSizePixel = 0,
			BackgroundColor3 = Emphasis.Color3,
			BackgroundTransparency = Emphasis.Transparency,
			Size = UDim2.new(1, 0, 0, 1)
		}) else nil
	}, p1.children))
end