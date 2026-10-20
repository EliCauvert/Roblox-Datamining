local DependenciesModule = require(script.Parent.Parent.dependencies)
local React = DependenciesModule.React
local UIBlox = DependenciesModule.UIBlox
local Cell = UIBlox.App.Table.Cell
local StyledTextLabel = UIBlox.App.Text.StyledTextLabel
local Images = UIBlox.App.ImageSet.Images
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBlox.Core.Style.useStyle
local UseDesignTokensFunction = DependenciesModule.Style.useDesignTokens

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseDesignTokensFunction (copy), React (copy), StyledTextLabel (copy), ImageSetLabel (copy), Images (copy), Cell (copy)
	local UseStyleResult = UseStyleFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	local function renderText()
		-- upvalues: React (upval), UseStyleResult (copy), p1 (copy), StyledTextLabel (upval)
		return React.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = UseStyleResult.Theme.BackgroundContrast.Color
		}, {
			VerticalLayout = React.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			TitleText = if p1.titleContent and p1.titleContent ~= "" then React.createElement(StyledTextLabel, {
				layoutOrder = 0,
				text = p1.titleContent,
				fontStyle = UseStyleResult.Font.Header2,
				colorStyle = UseStyleResult.Theme.TextEmphasis
			}) else nil,
			SubtitleText = if p1.subtitleContent and p1.subtitleContent ~= "" then React.createElement(StyledTextLabel, {
				layoutOrder = 1,
				text = p1.subtitleContent,
				fontStyle = UseStyleResult.Font.Body,
				colorStyle = UseStyleResult.Theme.TextEmphasis
			}) else nil
		})
	end
	
	return React.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_1600),
		BackgroundColor3 = UseStyleResult.Theme.BackgroundContrast.Color,
		BorderColor3 = UseStyleResult.Theme.BackgroundContrast.Color
	}, {
		Cell = React.createElement(Cell, {
			BorderColor3 = UseStyleResult.Theme.BackgroundContrast.Color,
			onActivated = function()
				-- upvalues: p1 (copy)
				if p1.userInteractionEnabled then
					p1.onAccountSelection()
				end
			end,
			head = (function()
				-- upvalues: React (upval), UseStyleResult (copy), UseDesignTokensResult (copy), p1 (copy), renderText (copy)
				return React.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					BorderColor3 = UseStyleResult.Theme.BackgroundContrast.Color
				}, {
					UIPadding = React.createElement("UIPadding", { PaddingLeft = UDim.new(0, 24) }),
					Layout = React.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						Padding = UDim.new(0, UseDesignTokensResult.Size.Size_300)
					}),
					AvatarThumbnail = p1.renderImage(),
					Names = renderText()
				})
			end)(),
			tail = (function()
				-- upvalues: p1 (copy), React (upval), ImageSetLabel (upval), Images (upval), UseStyleResult (copy)
				return if p1.iconKey and p1.iconKey ~= nil then React.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(28, 28),
					Image = Images[p1.iconKey],
					ImageColor3 = p1.iconColor or UseStyleResult.Theme.Success.Color
				}) else React.createElement("Frame", { BorderSizePixel = 0 })
			end)(),
			userInteractionEnabled = p1.userInteractionEnabled,
			size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_1600),
			background = React.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = UseStyleResult.Theme.BackgroundContrast.Color
			})
		})
	})
end