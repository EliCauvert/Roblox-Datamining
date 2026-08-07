local corePackagesService = game:GetService("CorePackages")
local boxButtonModule = require(script.Parent.Parent.BoxButton)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local immutableModule = require(script.Parent.Parent.Parent.Immutable)
local roactModule = require(corePackagesService.Packages.Roact)
local microProfilerPanel = roactModule.Component:extend("MicroProfilerPanel")

function microProfilerPanel.createTabSelector(value, p0) --[[ line: 10 ]]
	-- upvalues: roactModule (ref), constantsModule (ref), boxButtonModule (ref)
	local size = p0.Size
	local position = p0.Position or UDim2.new(0, 0, 0, 0)
	local buttonSize = p0.ButtonSize
	local layoutOrder = p0.LayoutOrder
	
	local function createHighlight(p1, p2) --[[ line: 16 ]]
		-- upvalues: value (ref), roactModule (copy), constantsModule (copy)
		return if value.state.CurrentSection == p1 then roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 10,
			Size = UDim2.new(0, constantsModule.MicroProfilerFormatting.TabButtonWidth, 0, constantsModule.MicroProfilerFormatting.TabButtonPad),
			Position = UDim2.new(0, constantsModule.MicroProfilerFormatting.TabButtonWidth * (p2 - 1), 0, constantsModule.MicroProfilerFormatting.TabsHeight - constantsModule.MicroProfilerFormatting.TabButtonPad),
			BackgroundColor3 = constantsModule.Color.HighlightBlue
		}) else nil
	end
	
	local t = {}
	
	for i, v in value.props.Sections do
		t[`Button_{string.format("%02d", i)}`] = roactModule.createElement(boxButtonModule, {
			text = v.Name,
			size = buttonSize,
			pos = UDim2.new(0, (i - 1) * buttonSize.X.Offset, 0, 0),
			onClicked = function() --[[ line: 44 ]]
				-- upvalues: value (ref), v (ref)
				value:setState({ CurrentSection = v.Name })
			end
		})
		t[`ButtonHighlight_{string.format("%02d", i)}`] = createHighlight(v.Name, i)
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = size,
		Position = position,
		LayoutOrder = layoutOrder
	}, t)
end

function microProfilerPanel.init(p3) --[[ line: 59 ]]
	assert(p3.props.Sections[1] ~= nil, "MicroProfilerPanel requires at least one section.")
	p3.state = { CurrentSection = p3.props.Sections[1].Name }
end

function microProfilerPanel.render(p4) --[[ line: 67 ]]
	-- upvalues: roactModule (ref), constantsModule (ref), immutableModule (ref)
	assert(p4.props.Sections[1] ~= nil, "MicroProfilerPanel requires at least one section.")
	local sections = p4.props.Sections
	local t = {}
	
	for i, v in sections do
		t[v.Name] = {}
		
		for i_1, v_1 in v.Rows do
			t[v.Name][`Row_{string.format("%02d", i_1)}`] = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, constantsModule.MicroProfilerFormatting.OptionRowHeight),
				LayoutOrder = i_1 * 2
			}, v_1)
			
			if i_1 < #v.Rows then
				t[v.Name][`HorizontalLine_{string.format("%02d", i_1)}`] = roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 1),
					BackgroundColor3 = Color3.new(1, 1, 1),
					LayoutOrder = i_1 * 2 + 1
				})
			end
		end
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = p4.props.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		Title = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, constantsModule.MicroProfilerFormatting.PanelTitleHeight),
			Text = p4.props.Title,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = constantsModule.Font.MainWindowBold,
			TextSize = constantsModule.MicroProfilerFormatting.TextSizePanelTitle,
			TextColor3 = Color3.new(1, 1, 1)
		}),
		Tabs = if #sections > 1 then p4:createTabSelector({
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, constantsModule.MicroProfilerFormatting.TabsHeight),
			Position = UDim2.new(0, 0, 0, 0),
			ButtonSize = UDim2.new(0, constantsModule.MicroProfilerFormatting.TabButtonWidth, 1, 0)
		}) else nil,
		[`Table_{p4.state.CurrentSection}`] = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, immutableModule.JoinDictionaries({
			UIListLayout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Top
			}),
			UIStroke = roactModule.createElement("UIStroke", {
				Thickness = 1,
				Color = Color3.new(1, 1, 1),
				BorderStrokePosition = Enum.BorderStrokePosition.Inner
			})
		}, t[p4.state.CurrentSection]))
	})
end

return microProfilerPanel