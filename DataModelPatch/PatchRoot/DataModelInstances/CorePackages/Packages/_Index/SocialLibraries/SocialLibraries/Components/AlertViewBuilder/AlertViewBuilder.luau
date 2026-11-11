local SocialLibraries = script:FindFirstAncestor("SocialLibraries")
local DependenciesModule = require(SocialLibraries.dependencies)
local Roact = DependenciesModule.Roact
local Cryo = DependenciesModule.Cryo
local UIBlox = DependenciesModule.UIBlox
local Text = DependenciesModule.Text
local Components = SocialLibraries.Components
local AlertViewLabelModule = require(Components.AlertView.AlertViewLabel)
local AlertViewTextboxModule = require(Components.AlertView.AlertViewTextbox)
local AlertViewSoakAreaModule = require(Components.AlertView.AlertViewSoakArea)
local FitFrameVerticalModule = require(script.Parent.Parent.FitFrameVertical)
local InteractiveAlert = UIBlox.App.Dialog.Alert.InteractiveAlert
local AlertViewBuilder = Roact.Component:extend("AlertViewBuilder")
AlertViewBuilder.defaultProps = {
	bodyText = "",
	displayTextbox = false,
	title = "",
	childComponentWidth = 220,
	soakAreaTransparency = 0.5,
	inputLengthExceeded = nil,
	buttons = {},
	textboxes = {},
	onActivated = function() end,
	onModalClose = function() end,
	onModalStayOpen = function() end,
	onModalOpen = function() end,
	screenSize = Vector2.new(0, 0),
	soakAreaColor3 = Color3.fromRGB(255, 0, 255)
}

function AlertViewBuilder.init(p1)
	-- upvalues: Roact (copy), Text (copy)
	local NumTextboxes = 0
	p1.refs = {}
	
	for i, _ in pairs(p1.props.textboxes) do
		p1.refs[i] = Roact.createRef()
		NumTextboxes += 1
	end
	p1.state = { numTextboxes = NumTextboxes }
	
	function p1.calcTextboxTextHeight(p2, BelowText)
		-- upvalues: Text (upval), p1 (copy)
		local ScaledRelativeSize = p2.Font.Body.RelativeSize * p2.Font.BaseSize
		local BodyFont = p2.Font.Body.Font
		
		return if BelowText and BelowText ~= "" then Text.GetTextHeight(BelowText, BodyFont, ScaledRelativeSize, p1.props.childComponentWidth) else 0
	end
end

function AlertViewBuilder.didMount(p2)
	if type(p2.props.onModalOpen) == "function" then
		p2.props.onModalOpen()
	end
end

function AlertViewBuilder.reset(p2)
	for _, ref in pairs(p2.refs) do
		if ref.current then
			ref.current.Text = ""
		end
	end
end

function AlertViewBuilder.makeButtonTable(p3)
	-- upvalues: Cryo (copy)
	local config = { buttons = {} }
	
	for LayoutOrder, button in ipairs(p3.props.buttons) do
		table.insert(config.buttons, {})
		config.buttons[LayoutOrder] = Cryo.Dictionary.join(button, {
			props = Cryo.Dictionary.join(button.props, {
				layoutOrder = LayoutOrder,
				onActivated = function()
					-- upvalues: p3 (copy), button (copy)
					p3.props.onActivated()
					local t = {}
					
					for i, ref in pairs(p3.refs) do
						t[i] = ref.current and ref.current.Text or ""
					end
					if button.props.onActivated(t) then
						p3.props.onModalStayOpen()
						
						return
					else
						p3:reset()
						p3:setState({ displayingModal = false })
						p3.props.onModalClose()
					end
				end
			})
		})
	end
	return config
end

function AlertViewBuilder.makeTextboxList(p4, p5)
	-- upvalues: Roact (copy), FitFrameVerticalModule (copy), AlertViewTextboxModule (copy), AlertViewLabelModule (copy)
	local Elements = {}
	local Color = if p4.props.inputLengthExceeded then p5.Theme.Alert.Color else p5.Theme.TextDefault.Color
	for i, textbox in pairs(p4.props.textboxes) do
		local TextboxTextHeight = p4.calcTextboxTextHeight(p5, textbox.belowText)
		local TextboxTextHeight1 = p4.calcTextboxTextHeight(p5, textbox.warningText)
		Elements[i] = Roact.createElement(FitFrameVerticalModule, {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			width = UDim.new(1, 0),
			LayoutOrder = textbox.LayoutOrder
		}, {
			[i] = Roact.createElement(AlertViewTextboxModule, {
				onTextChanged = textbox.onTextChanged,
				PlaceholderText = textbox.PlaceholderText,
				Text = textbox.Text,
				LayoutOrder = 1,
				[Roact.Ref] = p4.refs[i]
			}),
			[i .. " Below Text"] = textbox.belowText and textbox.belowText ~= "" and Roact.createElement(AlertViewLabelModule, {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Text = textbox.belowText,
				TextXAlignment = textbox.belowTextAlignment or Enum.TextXAlignment.Left,
				Size = UDim2.new(1, 0, 0, TextboxTextHeight),
				TextColor3 = Color
			}) or nil,
			[i .. " Warning Text"] = textbox.warningText and textbox.warningText ~= "" and Roact.createElement(AlertViewLabelModule, {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Text = textbox.warningText,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(1, 0, 0, TextboxTextHeight1),
				TextColor3 = p5.Theme.Alert.Color
			}) or nil
		})
	end
	return Elements
end

function AlertViewBuilder.makeMiddleContent(p6, p7)
	-- upvalues: Roact (copy), FitFrameVerticalModule (copy)
	local TextboxList = p6:makeTextboxList(p7)
	
	return if p6.state.numTextboxes == 0 then nil else function()
		-- upvalues: Roact (upval), FitFrameVerticalModule (upval), TextboxList (copy)
		return Roact.createElement(FitFrameVerticalModule, {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			width = UDim.new(1, 0)
		}, {
			Textboxes = Roact.createElement(FitFrameVerticalModule, {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				width = UDim.new(1, 0)
			}, TextboxList)
		})
	end
end

function AlertViewBuilder.render(p6)
	-- upvalues: UIBlox (copy), Roact (copy), AlertViewSoakAreaModule (copy), InteractiveAlert (copy)
	assert(p6.props.displayTextbox or not p6.props.mandatoryInput)
	
	return UIBlox.Style.withStyle(function(p7)
		-- upvalues: p6 (copy), Roact (upval), AlertViewSoakAreaModule (upval), InteractiveAlert (upval)
		return Roact.createElement(AlertViewSoakAreaModule, {
			BackgroundColor3 = p6.props.soakAreaColor3,
			BackgroundTransparency = p6.props.soakAreaTransparency,
			Visible = p6.state.displayingModal
		}, {
			alertView = Roact.createElement(InteractiveAlert, {
				title = p6.props.title,
				bodyText = if p6.props.bodyText == "" then nil else p6.props.bodyText or nil,
				middleContent = p6:makeMiddleContent(p7),
				buttonStackInfo = p6:makeButtonTable(),
				screenSize = p6.props.screenSize
			})
		})
	end)
end

return AlertViewBuilder