local CorePackages = game:GetService("CorePackages")
local DashModule = require(CorePackages.Packages.Dash)
local ReactModule = require(CorePackages.Packages.React)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local GetFFlagAXEnableInventorySortsAndFiltersModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Flags.GetFFlagAXEnableInventorySortsAndFilters)
local _UDim = UDim.new(0, 12)

return function(Frame: Frame)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), GetFFlagAXEnableInventorySortsAndFiltersModule (copy), _UDim (copy), DashModule (copy)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = Frame.Size,
		AutomaticSize = if GetFFlagAXEnableInventorySortsAndFiltersModule() then Frame.AutomaticSize else nil
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = _UDim
		}),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = _UDim,
			PaddingBottom = _UDim,
			PaddingLeft = _UDim,
			PaddingRight = _UDim
		}),
		Title = ReactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Font = UseStyleResultFont.Header1.Font,
			TextSize = UseStyleResultFont.Header1.RelativeSize * UseStyleResultFont.BaseSize,
			Text = Frame.title,
			TextColor3 = Theme.TextEmphasis.Color,
			TextTransparency = Theme.TextEmphasis.Transparency
		}),
		Content = ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BorderSizePixel = 0,
			Size = Frame.contentSize,
			AutomaticSize = if GetFFlagAXEnableInventorySortsAndFiltersModule() then Frame.AutomaticSize else nil,
			BackgroundTransparency = Theme.PlaceHolder.Transparency,
			BackgroundColor3 = Theme.PlaceHolder.Color
		}, DashModule.join({
			Layout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			}),
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
		}, Frame.children))
	})
end