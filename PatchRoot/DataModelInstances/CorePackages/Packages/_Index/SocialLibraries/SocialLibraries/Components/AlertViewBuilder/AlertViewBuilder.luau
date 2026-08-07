-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:23 2026 Pacific Standard Time.

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
	onActivated = function() --[[ line: 68 ]] end,
	onModalClose = function() --[[ line: 69 ]] end,
	onModalStayOpen = function() --[[ line: 70 ]] end,
	onModalOpen = function() --[[ line: 71 ]] end,
	screenSize = Vector2.new(0, 0),
	soakAreaColor3 = Color3.fromRGB(255, 0, 255)
}

function alertViewBuilder.init(p0) --[[ line: 83 ]]
	-- upvalues: roact (ref), text (ref)
	local var7 = 0
	p0.refs = {}
	
	for i, v in pairs(p0.props.textboxes) do
		p0.refs[i] = roact.createRef()
		var7 += 1
	end
	p0.state = { numTextboxes = var7 }
	
	function p0.calcTextboxTextHeight(p1, p2) --[[ line: 93 ]]
		-- upvalues: text (copy), p0 (ref)
		return if p2 and p2 ~= "" then text.GetTextHeight(p2, p1.Font.Body.Font, p1.Font.Body.RelativeSize * p1.Font.BaseSize, p0.props.childComponentWidth) else 0
	end
end

function alertViewBuilder.didMount(p3) --[[ line: 105 ]]
	if type(p3.props.onModalOpen) == "function" then
		p3.props.onModalOpen()
	end
end

function alertViewBuilder.reset(value) --[[ line: 111 ]]
	for i, v in pairs(value.refs) do
		if v.current then
			v.current.Text = ""
		end
	end
end

function alertViewBuilder.makeButtonTable(p4) --[[ line: 119 ]]
	-- upvalues: cryo (ref)
	local t = { buttons = {} }
	
	for i, v in ipairs(p4.props.buttons) do
		table.insert(t.buttons, {})
		t.buttons[i] = cryo.Dictionary.join(v, {
			props = cryo.Dictionary.join(v.props, {
				layoutOrder = i,
				onActivated = function() --[[ line: 128 ]]
					-- upvalues: p4 (ref), v (ref)
					p4.props.onActivated()
					local t = {}
					
					for i, v_1 in pairs(p4.refs) do
						t[i] = if v_1.current then v_1.current.Text else ""
					end
					if v.props.onActivated(t) then
						p4.props.onModalStayOpen()
						
						return
					end
					p4:reset()
					p4:setState({ displayingModal = false })
					p4.props.onModalClose()
				end
			})
		})
	end
	return t
end

function alertViewBuilder.makeTextboxList(p5, p6) --[[ line: 153 ]]
	-- upvalues: roact (ref), fitFrameVerticalModule (ref), alertViewTextboxModule (ref), alertViewLabelModule (ref)
	local t = {}
	local var11 = if p5.props.inputLengthExceeded then p6.Theme.Alert.Color else p6.Theme.TextDefault.Color
	
	for i, v in pairs(p5.props.textboxes) do
		local var18
		local var12 = p5.calcTextboxTextHeight(p6, v.belowText)
		local var13 = p5.calcTextboxTextHeight(p6, v.warningText)
		local createElement = roact.createElement
		local var14 = fitFrameVerticalModule
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
				[roact.Ref] = p5.refs[i]
			})
		}
		local text = i .. " Below Text"
		
		if v.belowText and v.belowText ~= "" then
			var18 = roact.createElement(alertViewLabelModule, {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Text = v.belowText,
				TextXAlignment = v.belowTextAlignment or Enum.TextXAlignment.Left,
				Size = UDim2.new(1, 0, 0, var12),
				TextColor3 = var11
			}) or nil
		end
		local var20
		t_2[text] = var18
		local text_1 = i .. " Warning Text"
		
		if v.warningText and v.warningText ~= "" then
			var20 = roact.createElement(alertViewLabelModule, {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Text = v.warningText,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(1, 0, 0, var13),
				TextColor3 = p6.Theme.Alert.Color
			}) or nil
		end
		t_2[text_1] = var20
		t[i] = createElement(var14, t_1, t_2)
	end
	return t
end

function alertViewBuilder.makeMiddleContent(p7, p8) --[[ line: 206 ]]
	-- upvalues: roact (ref), fitFrameVerticalModule (ref)
	local var21 = p7:makeTextboxList(p8)
	
	return if p7.state.numTextboxes == 0 then nil else function() --[[ line: 215 ]]
		-- upvalues: roact (copy), fitFrameVerticalModule (copy), var21 (ref)
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
			}, var21)
		})
	end
end

function alertViewBuilder.render(p9) --[[ line: 231 ]]
	-- upvalues: UIBlox (ref), roact (ref), alertViewSoakAreaModule (ref), interactiveAlert (ref)
	assert(p9.props.displayTextbox or not p9.props.mandatoryInput)
	
	return UIBlox.Style.withStyle(function(p10) --[[ line: 234 ]]
		-- upvalues: p9 (ref), roact (copy), alertViewSoakAreaModule (copy), interactiveAlert (copy)
		return roact.createElement(alertViewSoakAreaModule, {
			BackgroundColor3 = p9.props.soakAreaColor3,
			BackgroundTransparency = p9.props.soakAreaTransparency,
			Visible = p9.state.displayingModal
		}, {
			alertView = roact.createElement(interactiveAlert, {
				title = p9.props.title,
				bodyText = if p9.props.bodyText ~= "" then p9.props.bodyText else nil,
				middleContent = p9:makeMiddleContent(p10),
				buttonStackInfo = p9:makeButtonTable(),
				screenSize = p9.props.screenSize
			})
		})
	end)
end

return alertViewBuilder