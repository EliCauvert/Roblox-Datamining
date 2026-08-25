local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local roactGamepadModule = require(corePackagesService.Packages.RoactGamepad)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local _ = UIBloxModule.App.Button.Enum.ButtonType
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local withStyle = UIBloxModule.Style.withStyle
local images = UIBloxModule.App.ImageSet.Images
local _ = coreGuiService:WaitForChild("RobloxGui")
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local externalEventConnection = require(corePackagesService.Workspace.Packages.RoactUtils).ExternalEventConnection
local circle17Stroke1 = images["component_assets/circle_17_stroke_1"]
local rect = Rect.new(8, 8, 8, 8)
local promptWithTextField = roactModule.PureComponent:extend("PromptWithTextField")
promptWithTextField.validateProps = tModule.strictInterface({
	fieldText = tModule.string,
	onFieldTextUpdated = tModule.callback,
	title = tModule.string,
	bodyText = tModule.optional(tModule.string),
	buttonStackInfo = tModule.table,
	screenSize = tModule.Vector2
})

function promptWithTextField.init(p0)
	-- upvalues: roactModule (ref), userInputService (ref)
	p0:setState({ alertPosition = UDim2.fromScale(0.5, 0.5) })
	p0.textBoxRef = roactModule.createRef()
	
	function p0.textUpdated(p1)
		-- upvalues: p0 (ref)
		p0.props.onFieldTextUpdated(p1.Text)
	end
	
	p0.lastAlertHeight = 100
	
	function p0.calculateAlertPosition()
		-- upvalues: userInputService (copy), p0 (ref)
		local uDim2 = UDim2.fromScale(0.5, 0.5)
		
		if userInputService.OnScreenKeyboardVisible then
			local var12 = (p0.props.screenSize.Y - userInputService.OnScreenKeyboardSize.Y) / 2
			local var13 = var12 - p0.lastAlertHeight / 2
			
			if var13 < 20 then
				var12 += 20 - var13
			end
			uDim2 = UDim2.new(0.5, 0, 0, var12)
		end
		if p0.state.alertPosition ~= uDim2 then
			p0:setState({ alertPosition = uDim2 })
		end
	end
	
	function p0.alertSizeChanged(p2)
		-- upvalues: p0 (ref)
		p0.lastAlertHeight = p2.AbsoluteSize.Y
		p0.calculateAlertPosition()
	end
	
	function p0.alertMounted()
		-- upvalues: p0 (ref)
		local value = p0.textBoxRef:getValue()
		
		if value then
			value:CaptureFocus()
		end
	end
end

function promptWithTextField.renderAlertMiddleContent(p3)
	-- upvalues: withStyle (ref), roactModule (ref), imageSetLabel (ref), circle17Stroke1 (ref), rect (ref), roactGamepadModule (ref), robloxTranslatorModule (ref)
	return withStyle(function(p4)
		-- upvalues: roactModule (copy), imageSetLabel (copy), circle17Stroke1 (copy), rect (copy), roactGamepadModule (copy), robloxTranslatorModule (copy), p3 (ref)
		local font = p4.Font
		local theme = p4.Theme
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 35),
			Position = UDim2.fromScale(0, 1),
			AnchorPoint = Vector2.new(0, 1)
		}, {
			TextboxBorder = roactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Image = circle17Stroke1,
				ImageColor3 = theme.UIDefault.Color,
				ImageTransparency = theme.UIDefault.Transparency,
				ScaleType = Enum.ScaleType.Slice,
				Size = UDim2.new(1, 0, 1, -5),
				Position = UDim2.fromScale(0, 1),
				AnchorPoint = Vector2.new(0, 1),
				SliceCenter = rect
			}, {
				Textbox = roactModule.createElement(roactGamepadModule.Focusable.TextBox, {
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					Font = font.Header2.Font,
					TextSize = font.BaseSize * font.CaptionBody.RelativeSize,
					PlaceholderColor3 = theme.TextDefault.Color,
					PlaceholderText = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.OutfitNamePlaceholder"),
					Position = UDim2.new(0, 6, 0, 0),
					Size = UDim2.new(1, -12, 1, 0),
					TextColor3 = theme.TextEmphasis.Color,
					TextTruncate = Enum.TextTruncate.AtEnd,
					Text = p3.props.fieldText,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					OverlayNativeInput = true,
					[roactModule.Change.Text] = p3.textUpdated,
					[roactModule.Ref] = p3.textBoxRef
				})
			})
		})
	end)
end

function promptWithTextField.render(p5)
	-- upvalues: roactModule (ref), interactiveAlert (ref), externalEventConnection (ref), userInputService (ref)
	return roactModule.createFragment({
		InteractiveAlert = roactModule.createElement(interactiveAlert, {
			isMiddleContentFocusable = true,
			title = p5.props.title,
			bodyText = p5.props.bodyText,
			buttonStackInfo = p5.props.buttonStackInfo,
			position = p5.state.alertPosition,
			screenSize = p5.props.screenSize,
			middleContent = function()
				-- upvalues: p5 (ref)
				return p5:renderAlertMiddleContent()
			end,
			onAbsoluteSizeChanged = p5.alertSizeChanged,
			onMounted = p5.alertMounted
		}),
		OnScreenKeyboardVisibleConnection = roactModule.createElement(externalEventConnection, {
			event = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"),
			callback = p5.calculateAlertPosition
		}),
		OnScreenKeyboardSizeConnection = roactModule.createElement(externalEventConnection, {
			event = userInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"),
			callback = p5.calculateAlertPosition
		})
	})
end

function promptWithTextField.didMount(p6)
	p6.calculateAlertPosition()
end

return roactRoduxModule.connect(function(p7)
	return { screenSize = p7.screenSize }
end, nil)(promptWithTextField)