local socialLibraries = script:FindFirstAncestor("SocialLibraries")
local dependenciesModule = require(socialLibraries.dependencies)
local roact = dependenciesModule.Roact
local cryo = dependenciesModule.Cryo
local UIBlox = dependenciesModule.UIBlox
local text = dependenciesModule.Text
local foundationFontFaceMigration = dependenciesModule.Foundation.Utility.Flags.FoundationFontFaceMigration
local getTextBoundsAsync = dependenciesModule.Foundation.Utility.getTextBoundsAsync
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
	-- upvalues: roact (ref), foundationFontFaceMigration (ref), getTextBoundsAsync (ref), text (ref)
	local var1 = 0
	p1.refs = {}
	
	for i, v in pairs(p1.props.textboxes) do
		p1.refs[i] = roact.createRef()
		var1 += 1
	end
	p1.state = { numTextboxes = var1 }
	
	if foundationFontFaceMigration then
		p1.isMounted = false
		p1.textMeasurements = {}
		
		function p0.flushTextMeasurements()
			-- upvalues: p1 (ref), getTextBoundsAsync (copy)
			for i, v in p1.textMeasurements do
				if p1.props.textboxes[i] then
					for i_1, v_1 in v do
						if v_1.height == nil and not v_1.inFlight then
							v_1.inFlight = true
							task.spawn(function()
								-- upvalues: getTextBoundsAsync (copy), v_1 (ref), p1 (copy), i (ref), i_1 (ref)
								local var2 = getTextBoundsAsync(v_1.text, v_1.font, v_1.fontSize, v_1.width)
								v_1.inFlight = false
								local var3 = p1.textMeasurements[i]
								
								if var2 and p1.isMounted and (var3 and var3[i_1] == v_1) then
									v_1.height = var2.Y
									p1:setState(function(p2)
										return {
											textMeasurementVersion = (p2.textMeasurementVersion or 0) + 1
										}
									end)
								end
							end)
						end
					end
				else
					p1.textMeasurements[i] = nil
				end
			end
		end
		
		function p0.scheduleTextMeasurementFlush()
			-- upvalues: p1 (ref)
			if p1.textMeasurementFlushScheduled then
				return
			end
			p1.textMeasurementFlushScheduled = true
			task.defer(function()
				-- upvalues: p1 (copy)
				p1.textMeasurementFlushScheduled = false
				
				if p1.isMounted then
					p1.flushTextMeasurements()
				end
			end)
		end
	end
	p1.calcTextboxTextHeight = if foundationFontFaceMigration then function(p2, p3, p4, p5)
		-- upvalues: p1 (ref)
		if p3 and p3 ~= "" then
			local var2 = p2.Font.Body.RelativeSize * p2.Font.BaseSize
			local font = p2.Font.Body.Font
			local childComponentWidth = p1.props.childComponentWidth
			local var3 = p1.textMeasurements[p4]
			
			if not var3 then
				var3 = {}
				p1.textMeasurements[p4] = var3
			end
			local var4 = var3[p5]
			
			if not var4 or var4.text ~= p3 or (var4.font ~= font or var4.fontSize ~= var2) or var4.width ~= childComponentWidth then
				var3[p5] = {
					inFlight = false,
					text = p3,
					font = font,
					fontSize = var2,
					width = childComponentWidth
				}
				p1.scheduleTextMeasurementFlush()
				
				return var2
			end
			return if var4.height == nil then var2 else var4.height
		else
			local var5 = p1.textMeasurements[p4]
			
			if var5 then
				var5[p5] = nil
			end
			return 0
		end
	end else function(p2, p3)
		-- upvalues: text (copy), p1 (ref)
		return if p3 and p3 ~= "" then text.GetTextHeight(p3, p2.Font.Body.Font, p2.Font.Body.RelativeSize * p2.Font.BaseSize, p1.props.childComponentWidth) else 0
	end
end

function alertViewBuilder.didMount(p2)
	-- upvalues: foundationFontFaceMigration (ref)
	if foundationFontFaceMigration then
		p2.isMounted = true
		p2.flushTextMeasurements()
	end
	if type(p2.props.onModalOpen) == "function" then
		p2.props.onModalOpen()
	end
end

function alertViewBuilder.didUpdate(p2)
	-- upvalues: foundationFontFaceMigration (ref)
	if foundationFontFaceMigration then
		p2.flushTextMeasurements()
	end
end

function alertViewBuilder.willUnmount(p2)
	-- upvalues: foundationFontFaceMigration (ref)
	if foundationFontFaceMigration then
		p2.isMounted = false
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
		local belowText = p3.calcTextboxTextHeight(p4, v.belowText, i, "belowText")
		local warningText = p3.calcTextboxTextHeight(p4, v.warningText, i, "warningText")
		local createElement = roact.createElement
		local var4 = fitFrameVerticalModule
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
				Size = UDim2.new(1, 0, 0, belowText),
				TextColor3 = var2
			}) or nil
		end
		local var5
		t_2[text] = var3
		local text_1 = i .. " Warning Text"
		
		if v.warningText and v.warningText ~= "" then
			var5 = roact.createElement(alertViewLabelModule, {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Text = v.warningText,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(1, 0, 0, warningText),
				TextColor3 = p4.Theme.Alert.Color
			}) or nil
		end
		t_2[text_1] = var5
		t[i] = createElement(var4, t_1, t_2)
	end
	return t
end

function alertViewBuilder.makeMiddleContent(p5, p6)
	-- upvalues: roact (ref), fitFrameVerticalModule (ref)
	local var6 = p5:makeTextboxList(p6)
	
	return if p5.state.numTextboxes == 0 then nil else function()
		-- upvalues: roact (copy), fitFrameVerticalModule (copy), var6 (ref)
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
			}, var6)
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