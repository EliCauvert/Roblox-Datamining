local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local _ = UIBloxModule.App.Button.Enum.ButtonType
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local WithStyleFunction = UIBloxModule.Style.withStyle
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local ComponentAssetsCircle17Stroke1 = UIBloxModule.App.ImageSet.Images["component_assets/circle_17_stroke_1"]
local _Rect = Rect.new(8, 8, 8, 8)
local PromptWithTextField = RoactModule.PureComponent:extend("PromptWithTextField")
PromptWithTextField.validateProps = TModule.strictInterface({
	fieldText = TModule.string,
	onFieldTextUpdated = TModule.callback,
	title = TModule.string,
	bodyText = TModule.optional(TModule.string),
	buttonStackInfo = TModule.table,
	screenSize = TModule.Vector2
})

function PromptWithTextField.init(p1)
	-- upvalues: RoactModule (copy), UserInputService (copy)
	p1:setState({ alertPosition = UDim2.fromScale(0.5, 0.5) })
	p1.textBoxRef = RoactModule.createRef()
	
	function p1.textUpdated(p2)
		-- upvalues: p1 (copy)
		p1.props.onFieldTextUpdated(p2.Text)
	end
	
	p1.lastAlertHeight = 100
	
	function p1.calculateAlertPosition()
		-- upvalues: UserInputService (upval), p1 (copy)
		local _UDim2 = UDim2.fromScale(0.5, 0.5)
		
		if UserInputService.OnScreenKeyboardVisible then
			local YRatio = (p1.props.screenSize.Y - UserInputService.OnScreenKeyboardSize.Y) / 2
			local YRatioDelta = YRatio - p1.lastAlertHeight / 2
			
			if YRatioDelta < 20 then
				YRatio += 20 - YRatioDelta
			end
			_UDim2 = UDim2.new(0.5, 0, 0, YRatio)
		end
		if p1.state.alertPosition ~= _UDim2 then
			p1:setState({ alertPosition = _UDim2 })
		end
	end
	
	function p1.alertSizeChanged(Frame)
		-- upvalues: p1 (copy)
		p1.lastAlertHeight = Frame.AbsoluteSize.Y
		p1.calculateAlertPosition()
	end
	
	function p1.alertMounted()
		-- upvalues: p1 (copy)
		local Value = p1.textBoxRef:getValue()
		
		if Value then
			Value:CaptureFocus()
		end
	end
end

function PromptWithTextField.renderAlertMiddleContent(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), ImageSetLabel (copy), ComponentAssetsCircle17Stroke1 (copy), _Rect (copy), RoactGamepadModule (copy), RobloxTranslatorModule (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), ImageSetLabel (upval), ComponentAssetsCircle17Stroke1 (upval), _Rect (upval), RoactGamepadModule (upval), RobloxTranslatorModule (upval), p1 (copy)
		local _Font = p2.Font
		local Theme = p2.Theme
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 35),
			Position = UDim2.fromScale(0, 1),
			AnchorPoint = Vector2.new(0, 1)
		}, {
			TextboxBorder = RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Image = ComponentAssetsCircle17Stroke1,
				ImageColor3 = Theme.UIDefault.Color,
				ImageTransparency = Theme.UIDefault.Transparency,
				ScaleType = Enum.ScaleType.Slice,
				Size = UDim2.new(1, 0, 1, -5),
				Position = UDim2.fromScale(0, 1),
				AnchorPoint = Vector2.new(0, 1),
				SliceCenter = _Rect
			}, {
				Textbox = RoactModule.createElement(RoactGamepadModule.Focusable.TextBox, {
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					Font = _Font.Header2.Font,
					TextSize = _Font.BaseSize * _Font.CaptionBody.RelativeSize,
					PlaceholderColor3 = Theme.TextDefault.Color,
					PlaceholderText = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.OutfitNamePlaceholder"),
					Position = UDim2.new(0, 6, 0, 0),
					Size = UDim2.new(1, -12, 1, 0),
					TextColor3 = Theme.TextEmphasis.Color,
					TextTruncate = Enum.TextTruncate.AtEnd,
					Text = p1.props.fieldText,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					OverlayNativeInput = true,
					[RoactModule.Change.Text] = p1.textUpdated,
					[RoactModule.Ref] = p1.textBoxRef
				})
			})
		})
	end)
end

function PromptWithTextField.render(p1)
	-- upvalues: RoactModule (copy), InteractiveAlert (copy), ExternalEventConnection (copy), UserInputService (copy)
	return RoactModule.createFragment({
		InteractiveAlert = RoactModule.createElement(InteractiveAlert, {
			isMiddleContentFocusable = true,
			title = p1.props.title,
			bodyText = p1.props.bodyText,
			buttonStackInfo = p1.props.buttonStackInfo,
			position = p1.state.alertPosition,
			screenSize = p1.props.screenSize,
			middleContent = function()
				-- upvalues: p1 (copy)
				return p1:renderAlertMiddleContent()
			end,
			onAbsoluteSizeChanged = p1.alertSizeChanged,
			onMounted = p1.alertMounted
		}),
		OnScreenKeyboardVisibleConnection = RoactModule.createElement(ExternalEventConnection, {
			event = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"),
			callback = p1.calculateAlertPosition
		}),
		OnScreenKeyboardSizeConnection = RoactModule.createElement(ExternalEventConnection, {
			event = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"),
			callback = p1.calculateAlertPosition
		})
	})
end

function PromptWithTextField.didMount(p1)
	p1.calculateAlertPosition()
end

return RoactRoduxModule.connect(function(p1)
	return { screenSize = p1.screenSize }
end, nil)(PromptWithTextField)