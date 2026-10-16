local BoxButtonModule = require(script.Parent.Parent.BoxButton)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local ImmutableModule = require(script.Parent.Parent.Parent.Immutable)
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local MicroProfilerPanel = RoactModule.Component:extend("MicroProfilerPanel")

function MicroProfilerPanel.createTabSelector(p1, Frame) --[[ Line: 10 ]]
	-- upvalues: RoactModule (copy), ConstantsModule (copy), BoxButtonModule (copy)
	local Size = Frame.Size
	local Position = Frame.Position or UDim2.new(0, 0, 0, 0)
	local ButtonSize = Frame.ButtonSize
	local LayoutOrder = Frame.LayoutOrder
	
	local function createHighlight(Name, p2: number) --[[ Line: 16 ]]
		-- upvalues: p1 (copy), RoactModule (upval), ConstantsModule (upval)
		return if p1.state.CurrentSection == Name then RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 10,
			Size = UDim2.new(0, ConstantsModule.MicroProfilerFormatting.TabButtonWidth, 0, ConstantsModule.MicroProfilerFormatting.TabButtonPad),
			Position = UDim2.new(0, ConstantsModule.MicroProfilerFormatting.TabButtonWidth * (p2 - 1), 0, ConstantsModule.MicroProfilerFormatting.TabsHeight - ConstantsModule.MicroProfilerFormatting.TabButtonPad),
			BackgroundColor3 = ConstantsModule.Color.HighlightBlue
		}) else nil
	end
	
	local Elements = {}
	
	for i, section in p1.props.Sections do
		Elements[`Button_{string.format("%02d", i)}`] = RoactModule.createElement(BoxButtonModule, {
			text = section.Name,
			size = ButtonSize,
			pos = UDim2.new(0, (i - 1) * ButtonSize.X.Offset, 0, 0),
			onClicked = function() --[[ Line: 44 ]]
				-- upvalues: p1 (copy), section (copy)
				p1:setState({ CurrentSection = section.Name })
			end
		})
		Elements[`ButtonHighlight_{string.format("%02d", i)}`] = createHighlight(section.Name, i)
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Size,
		Position = Position,
		LayoutOrder = LayoutOrder
	}, Elements)
end

function MicroProfilerPanel.init(p2) --[[ Line: 59 ]]
	assert(p2.props.Sections[1] ~= nil, "MicroProfilerPanel requires at least one section.")
	p2.state = { CurrentSection = p2.props.Sections[1].Name }
end

function MicroProfilerPanel.render(p2) --[[ Line: 67 ]]
	-- upvalues: RoactModule (copy), ConstantsModule (copy), ImmutableModule (copy)
	assert(p2.props.Sections[1] ~= nil, "MicroProfilerPanel requires at least one section.")
	local Sections = p2.props.Sections
	local t = {}
	
	for _, section in Sections do
		t[section.Name] = {}
		
		for i, row in section.Rows do
			t[section.Name][`Row_{string.format("%02d", i)}`] = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, ConstantsModule.MicroProfilerFormatting.OptionRowHeight),
				LayoutOrder = i * 2
			}, row)
			
			if i < #section.Rows then
				t[section.Name][`HorizontalLine_{string.format("%02d", i)}`] = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 1),
					BackgroundColor3 = Color3.new(1, 1, 1),
					LayoutOrder = i * 2 + 1
				})
			end
		end
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = p2.props.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		Title = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, ConstantsModule.MicroProfilerFormatting.PanelTitleHeight),
			Text = p2.props.Title,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = ConstantsModule.Font.MainWindowBold,
			TextSize = ConstantsModule.MicroProfilerFormatting.TextSizePanelTitle,
			TextColor3 = Color3.new(1, 1, 1)
		}),
		Tabs = if #Sections > 1 then p2:createTabSelector({
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, ConstantsModule.MicroProfilerFormatting.TabsHeight),
			Position = UDim2.new(0, 0, 0, 0),
			ButtonSize = UDim2.new(0, ConstantsModule.MicroProfilerFormatting.TabButtonWidth, 1, 0)
		}) else nil,
		[`Table_{p2.state.CurrentSection}`] = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, ImmutableModule.JoinDictionaries({
			UIListLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Top
			}),
			UIStroke = RoactModule.createElement("UIStroke", {
				Thickness = 1,
				Color = Color3.new(1, 1, 1),
				BorderStrokePosition = Enum.BorderStrokePosition.Inner
			})
		}, t[p2.state.CurrentSection]))
	})
end

return MicroProfilerPanel