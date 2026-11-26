local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local Components = script.Parent.Parent.Parent.Components
local CellLabelModule = require(Components.CellLabel)
local BannerButtonModule = require(Components.BannerButton)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local MainRowPadding = ConstantsModule.GeneralFormatting.MainRowPadding
local BorderGray = ConstantsModule.Color.BorderGray
local CollapsibleSection = RoactModule.PureComponent:extend("CollapsibleSection")

function CollapsibleSection.init(p1)
	p1.state = {
		expanded = p1.props.defaultExpanded == nil or p1.props.defaultExpanded
	}
	
	function p1.onButtonPress()
		-- upvalues: p1 (copy)
		p1:setState(function(p2)
			return { expanded = not p2.expanded }
		end)
	end
end

function CollapsibleSection.render(p1)
	-- upvalues: RoactModule (copy), MainRowPadding (copy), BannerButtonModule (copy), CellLabelModule (copy), ConstantsModule (copy), BorderGray (copy)
	local HeaderNote = p1.props.headerNote
	local Expanded = p1.state.expanded
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.props.layoutOrder
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, MainRowPadding)
		}),
		Header = RoactModule.createElement(BannerButtonModule, {
			isExpandable = true,
			layoutOrder = 1,
			size = UDim2.new(1, 0, 0, 20),
			isExpanded = Expanded,
			hideLines = p1.props.hideLines,
			onButtonPress = p1.onButtonPress
		}, {
			Label = RoactModule.createElement(CellLabelModule, {
				bold = true,
				text = p1.props.title,
				size = UDim2.new(1, -20, 1, 0),
				pos = UDim2.new(0, 20, 0, 0)
			}),
			Note = HeaderNote and RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Text = HeaderNote,
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -8, 0.5, 0),
				Size = UDim2.new(0, 0, 1, 0),
				AutomaticSize = Enum.AutomaticSize.X,
				Font = ConstantsModule.Font.MainWindow,
				TextSize = ConstantsModule.DefaultFontSize.MainWindow - 2,
				TextColor3 = BorderGray,
				TextXAlignment = Enum.TextXAlignment.Right
			}) or nil
		}),
		Content = Expanded and RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, MainRowPadding)
			}),
			Children = RoactModule.createFragment(p1.props[RoactModule.Children] or {})
		}) or nil
	})
end

return CollapsibleSection