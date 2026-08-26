local socialLibraries = script:FindFirstAncestor("SocialLibraries")
local dependenciesModule = require(socialLibraries.dependencies)
local roact = dependenciesModule.Roact
local cryo = dependenciesModule.Cryo
local UIBlox = dependenciesModule.UIBlox
local text = dependenciesModule.Text
local components = socialLibraries.Components
local alertViewLabelModule = require(components.AlertView.AlertViewLabel)
local alertViewTextboxModule = require(components.AlertView.AlertViewTextbox)
local alertViewSoakAreaModule = require(components.AlertView.AlertViewSoakArea)
local fitFrameVerticalModule = require(script.Parent.Parent.FitFrameVertical)
local interactiveAlert = UIBlox.App.Dialog.Alert.InteractiveAlert
local alertViewBuilder = roact.Component:extend("AlertViewBuilder")
alertViewBuilder.defaultProps = {
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

function alertViewBuilder.init(p1)
	-- upvalues: roact (ref), text (ref)
	local var1 = 0
	p1.refs = {}
	
	for i, v in pairs(p1.props.textboxes) do
		p1.refs[i] = roact.createRef()
		var1 += 1
	end
	p1.state = { numTextboxes = var1 }
	
	function p0.calcTextboxTextHeight(p2, p3)
		-- upvalues: text (copy), p1 (ref)
		return if p3 and p3 ~= "" then text.GetTextHeight(p3, p2.Font.Body.Font, p2.Font.Body.RelativeSize * p2.Font.BaseSize, p1.props.childComponentWidth) else 0
	end
end

function alertViewBuilder.didMount(p2)
	if type(p2.props.onModalOpen) == "function" then
		p2.props.onModalOpen()
	end
end

function alertViewBuilder.reset(value)
	for i, v in pairs(value.refs) do
		if v.current then
			v.current.Text = ""
		end
	end
end

function alertViewBuilder.makeButtonTable(p2)
	-- upvalues: cryo (ref)
	local t = { buttons = {} }
	
	for i, v in ipairs(p2.props.buttons) do
		table.insert(t.buttons, {})
		t.buttons[i] = cryo.Dictionary.join(v, {
			props = cryo.Dictionary.join(v.props, {
				layoutOrder = i,
				onActivated = function()
					-- upvalues: p2 (ref), v (ref)
					p2.props.onActivated()
					local t = {}
					
					for i, v_1 in pairs(p2.refs) do
						t[i] = if v_1.current then v_1.current.Text else ""
					end
					if v.props.onActivated(t) then
						p2.props.onModalStayOpen()
						
						return
					end
					p2:reset()
					p2:setState({ displayingModal = false })
					p2.props.onModalClose()
				end
			})
		})
	end
	return t
end

function alertViewBuilder.makeTextboxList(p3, p4)
	-- upvalues: roact (ref), fitFrameVerticalModule (ref), alertViewTextboxModule (ref), alertViewLabelModule (ref)
	local t = {}
	local var2 = if p3.props.inputLengthExceeded then p4.Theme.Alert.Color else p4.Theme.TextDefault.Color
	
	for i, v in pairs(p3.props.textboxes) do
		local var3
		local var4 = p3.calcTextboxTextHeight(p4, v.belowText)
		local var5 = p3.calcTextboxTextHeight(p4, v.warningText)
		local createElement = roact.createElement
		local var6 = fitFrameVerticalModule
		local t_1 = {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			width = UDim.new(1, 0),
			LayoutOrder = v.LayoutOrder
		}
		local t_2 = {
			[i] = roact.createElement(alertViewTextboxModule, {
				onTextChanged = v.onTextChanged,
				PlaceholderText = v.PlaceholderText,
				Text = v.Text,
				LayoutOrder = 1,
				[roact.Ref] = p3.refs[i]
			})
		}
		local text = i .. " Below Text"
		
		if v.belowText and v.belowText ~= "" then
			var3 = roact.createElement(alertViewLabelModule, {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Text = v.belowText,
				TextXAlignment = v.belowTextAlignment or Enum.TextXAlignment.Left,
				Size = UDim2.new(1, 0, 0, var4),
				TextColor3 = var2
			}) or nil
		end
		local var7
		t_2[text] = var3
		local text_1 = i .. " Warning Text"
		
		if v.warningText and v.warningText ~= "" then
			var7 = roact.createElement(alertViewLabelModule, {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Text = v.warningText,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(1, 0, 0, var5),
				TextColor3 = p4.Theme.Alert.Color
			}) or nil
		end
		t_2[text_1] = var7
		t[i] = createElement(var6, t_1, t_2)
	end
	return t
end

function alertViewBuilder.makeMiddleContent(p5, p6)
	-- upvalues: roact (ref), fitFrameVerticalModule (ref)
	local var8 = p5:makeTextboxList(p6)
	
	return if p5.state.numTextboxes == 0 then nil else function()
		-- upvalues: roact (copy), fitFrameVerticalModule (copy), var8 (ref)
		return roact.createElement(fitFrameVerticalModule, {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			width = UDim.new(1, 0)
		}, {
			Textboxes = roact.createElement(fitFrameVerticalModule, {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				width = UDim.new(1, 0)
			}, var8)
		})
	end
end

function alertViewBuilder.render(p5)
	-- upvalues: UIBlox (ref), roact (ref), alertViewSoakAreaModule (ref), interactiveAlert (ref)
	assert(p5.props.displayTextbox or not p5.props.mandatoryInput)
	
	return UIBlox.Style.withStyle(function(p6)
		-- upvalues: p5 (ref), roact (copy), alertViewSoakAreaModule (copy), interactiveAlert (copy)
		return roact.createElement(alertViewSoakAreaModule, {
			BackgroundColor3 = p5.props.soakAreaColor3,
			BackgroundTransparency = p5.props.soakAreaTransparency,
			Visible = p5.state.displayingModal
		}, {
			alertView = roact.createElement(interactiveAlert, {
				title = p5.props.title,
				bodyText = if p5.props.bodyText ~= "" then p5.props.bodyText else nil,
				middleContent = p5:makeMiddleContent(p6),
				buttonStackInfo = p5:makeButtonTable(),
				screenSize = p5.props.screenSize
			})
		})
	end)
end

return alertViewBuilder