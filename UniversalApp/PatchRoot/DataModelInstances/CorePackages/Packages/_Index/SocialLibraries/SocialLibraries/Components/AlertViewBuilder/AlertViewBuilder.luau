local SocialLibraries = script:FindFirstAncestor("SocialLibraries")
local DependenciesModule = require(SocialLibraries.dependencies)
local Roact = DependenciesModule.Roact
local Cryo = DependenciesModule.Cryo
local UIBlox = DependenciesModule.UIBlox
local Text = DependenciesModule.Text
local FoundationFontFaceMigration = DependenciesModule.Foundation.Utility.Flags.FoundationFontFaceMigration
local GetTextBoundsAsyncFunction = DependenciesModule.Foundation.Utility.getTextBoundsAsync
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
	onActivated = function() --[[ Line: 96 ]] end,
	onModalClose = function() --[[ Line: 97 ]] end,
	onModalStayOpen = function() --[[ Line: 98 ]] end,
	onModalOpen = function() --[[ Line: 99 ]] end,
	screenSize = Vector2.new(0, 0),
	soakAreaColor3 = Color3.fromRGB(255, 0, 255)
}

function AlertViewBuilder.init(p1) --[[ Line: 111 ]]
	-- upvalues: Roact (copy), FoundationFontFaceMigration (copy), GetTextBoundsAsyncFunction (copy), Text (copy)
	local NumTextboxes = 0
	p1.refs = {}
	
	for i, _ in pairs(p1.props.textboxes) do
		p1.refs[i] = Roact.createRef()
		NumTextboxes += 1
	end
	p1.state = { numTextboxes = NumTextboxes }
	
	if FoundationFontFaceMigration then
		p1.isMounted = false
		p1.textMeasurements = {}
		
		function p1.flushTextMeasurements() --[[ Line: 126 ]]
			-- upvalues: p1 (copy), GetTextBoundsAsyncFunction (upval)
			for i, textMeasurement in p1.textMeasurements do
				if not p1.props.textboxes[i] then
					p1.textMeasurements[i] = nil
					continue
				end
				for i1, value in textMeasurement do
					if value.height == nil and not value.inFlight then
						value.inFlight = true
						task.spawn(function() --[[ Line: 139 ]]
							-- upvalues: GetTextBoundsAsyncFunction (upval), value (copy), p1 (upval), i (copy), i1 (copy)
							local TextBoundsAsync = GetTextBoundsAsyncFunction(value.text, value.font, value.fontSize, value.width)
							value.inFlight = false
							local TextMeasurement = p1.textMeasurements[i]
							
							if TextBoundsAsync and p1.isMounted and TextMeasurement and TextMeasurement[i1] == value then
								value.height = TextBoundsAsync.Y
								p1:setState(function(p2) --[[ Line: 151 ]]
									return {
										textMeasurementVersion = (p2.textMeasurementVersion or 0) + 1
									}
								end)
							end
						end)
					end
				end
			end
		end
		
		function p1.scheduleTextMeasurementFlush() --[[ Line: 162 ]]
			-- upvalues: p1 (copy)
			if not p1.textMeasurementFlushScheduled then
				p1.textMeasurementFlushScheduled = true
				task.defer(function() --[[ Line: 168 ]]
					-- upvalues: p1 (upval)
					p1.textMeasurementFlushScheduled = false
					
					if p1.isMounted then
						p1.flushTextMeasurements()
					end
				end)
				
				return
			end
		end
	end
	p1.calcTextboxTextHeight = if FoundationFontFaceMigration then function(p2, Text, p3, Key) --[[ Line: 178 ]]
		-- upvalues: p1 (copy)
		if Text and Text ~= "" then
			local ScaledRelativeSize = p2.Font.Body.RelativeSize * p2.Font.BaseSize
			local BodyFont = p2.Font.Body.Font
			local ChildComponentWidth = p1.props.childComponentWidth
			local TextMeasurement1 = p1.textMeasurements[p3]
			
			if not TextMeasurement1 then
				TextMeasurement1 = {}
				p1.textMeasurements[p3] = TextMeasurement1
			end
			local TextMeasurementEntry = TextMeasurement1[Key]
			
			if TextMeasurementEntry and TextMeasurementEntry.text == Text and TextMeasurementEntry.font == BodyFont and TextMeasurementEntry.fontSize == ScaledRelativeSize and TextMeasurementEntry.width == ChildComponentWidth then
				return if TextMeasurementEntry.height == nil then ScaledRelativeSize else TextMeasurementEntry.height
			else
				TextMeasurement1[Key] = {
					inFlight = false,
					text = Text,
					font = BodyFont,
					fontSize = ScaledRelativeSize,
					width = ChildComponentWidth
				}
				p1.scheduleTextMeasurementFlush()
				
				return ScaledRelativeSize
			end
		else
			local TextMeasurement = p1.textMeasurements[p3]
			
			if TextMeasurement then
				TextMeasurement[Key] = nil
			end
			return 0
		end
	end else function(p2, p3) --[[ Line: 222 ]]
		-- upvalues: Text (upval), p1 (copy)
		local ScaledRelativeSize = p2.Font.Body.RelativeSize * p2.Font.BaseSize
		local BodyFont = p2.Font.Body.Font
		
		return if p3 and p3 ~= "" then Text.GetTextHeight(p3, BodyFont, ScaledRelativeSize, p1.props.childComponentWidth) else 0
	end
end

function AlertViewBuilder.didMount(p2) --[[ Line: 234 ]]
	-- upvalues: FoundationFontFaceMigration (copy)
	if FoundationFontFaceMigration then
		p2.isMounted = true
		p2.flushTextMeasurements()
	end
	if type(p2.props.onModalOpen) == "function" then
		p2.props.onModalOpen()
	end
end

function AlertViewBuilder.didUpdate(p2) --[[ Line: 245 ]]
	-- upvalues: FoundationFontFaceMigration (copy)
	if FoundationFontFaceMigration then
		p2.flushTextMeasurements()
	end
end

function AlertViewBuilder.willUnmount(p2) --[[ Line: 251 ]]
	-- upvalues: FoundationFontFaceMigration (copy)
	if FoundationFontFaceMigration then
		p2.isMounted = false
	end
end

function AlertViewBuilder.reset(p2) --[[ Line: 257 ]]
	for _, ref in pairs(p2.refs) do
		if ref.current then
			ref.current.Text = ""
		end
	end
end

function AlertViewBuilder.makeButtonTable(p3) --[[ Line: 265 ]]
	-- upvalues: Cryo (copy)
	local config = { buttons = {} }
	
	for LayoutOrder, button in ipairs(p3.props.buttons) do
		table.insert(config.buttons, {})
		config.buttons[LayoutOrder] = Cryo.Dictionary.join(button, {
			props = Cryo.Dictionary.join(button.props, {
				layoutOrder = LayoutOrder,
				onActivated = function() --[[ Line: 274 ]]
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

function AlertViewBuilder.makeTextboxList(p4, p5) --[[ Line: 299 ]]
	-- upvalues: Roact (copy), FitFrameVerticalModule (copy), AlertViewTextboxModule (copy), AlertViewLabelModule (copy)
	local Elements = {}
	local Color = if p4.props.inputLengthExceeded then p5.Theme.Alert.Color else p5.Theme.TextDefault.Color
	for i, textbox in pairs(p4.props.textboxes) do
		local BelowText = p4.calcTextboxTextHeight(p5, textbox.belowText, i, "belowText")
		local WarningText = p4.calcTextboxTextHeight(p5, textbox.warningText, i, "warningText")
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
				Size = UDim2.new(1, 0, 0, BelowText),
				TextColor3 = Color
			}) or nil,
			[i .. " Warning Text"] = textbox.warningText and textbox.warningText ~= "" and Roact.createElement(AlertViewLabelModule, {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Text = textbox.warningText,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(1, 0, 0, WarningText),
				TextColor3 = p5.Theme.Alert.Color
			}) or nil
		})
	end
	return Elements
end

function AlertViewBuilder.makeMiddleContent(p6, p7) --[[ Line: 352 ]]
	-- upvalues: Roact (copy), FitFrameVerticalModule (copy)
	local TextboxList = p6:makeTextboxList(p7)
	
	return if p6.state.numTextboxes == 0 then nil else function() --[[ Line: 361 ]]
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

function AlertViewBuilder.render(p6) --[[ Line: 377 ]]
	-- upvalues: UIBlox (copy), Roact (copy), AlertViewSoakAreaModule (copy), InteractiveAlert (copy)
	assert(p6.props.displayTextbox or not p6.props.mandatoryInput)
	
	return UIBlox.Style.withStyle(function(p7) --[[ Line: 380 ]]
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