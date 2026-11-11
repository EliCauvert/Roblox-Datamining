local TextService = game:GetService("TextService")
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local Parent = script.Parent.Parent
local AssetsModule = require(Parent.Resources.Assets)
local ThemedTextLabelModule = require(require(Parent.Dependencies).ThemedTextLabel)
local FillCircleModule = require(Parent.Components.FillCircle)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local TextEntryField = RoactModule.PureComponent:extend("TextEntryField")
TextEntryField.validateProps = TModule.strictInterface({
	enabled = TModule.boolean,
	text = TModule.string,
	textChanged = TModule.callback,
	maxTextLength = TModule.integer,
	autoFocusOnEnabled = TModule.boolean,
	PlaceholderText = TModule.string,
	LayoutOrder = TModule.optional(TModule.integer),
	Size = TModule.UDim2,
	Position = TModule.optional(TModule.UDim2),
	textBoxRef = TModule.optional(TModule.table)
})

function TextEntryField.init(p1)
	-- upvalues: RoactModule (copy)
	p1.textBoxRef = p1.props.textBoxRef or RoactModule.createRef()
	p1.state = {
		textBoxWidth = 100,
		scrollingFrameHeight = 100,
		canvasPosition = 0,
		cursorPosition = 0
	}
end

function TextEntryField.calculateNeedsRescroll(p1, p2, Body)
	-- upvalues: TextService (copy)
	p1:setState(function(State, p3)
		-- upvalues: Body (copy), p2 (copy), TextService (upval)
		if State.cursorPosition == -1 then
			return nil
		else
			local ScaledRelativeSize = Body.RelativeSize * p2.Font.BaseSize
			local TextSize = TextService:GetTextSize(p3.text:sub(1, State.cursorPosition - 1), ScaledRelativeSize, Body.Font, (Vector2.new(p3.textBoxWidth, 10000)))
			
			return if State.scrollingFrameHeight + State.canvasPosition < TextSize.Y then { canvasPosition = TextSize.Y - State.scrollingFrameHeight } elseif TextSize.Y - ScaledRelativeSize < State.canvasPosition then { canvasPosition = TextSize.Y - ScaledRelativeSize } else nil
		end
	end)
end

function TextEntryField.renderWithSelectionCursor(p1, Callback)
	-- upvalues: WithStyleFunction (copy), TextService (copy), RoactModule (copy), ImageSetLabel (copy), AssetsModule (copy), CursorKind (copy), ThemedTextLabelModule (copy), FillCircleModule (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: TextService (upval), p1 (copy), RoactModule (upval), ImageSetLabel (upval), AssetsModule (upval), Callback (copy), CursorKind (upval), ThemedTextLabelModule (upval), FillCircleModule (upval)
		local TextDefault = p2.Theme.TextDefault
		local Body = p2.Font.Body
		
		return RoactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			Image = AssetsModule.Images.RoundedRect.Image,
			ImageColor3 = p2.Theme.BackgroundMuted.Color,
			ImageTransparency = p2.Theme.BackgroundMuted.Transparency,
			Position = p1.props.Position,
			ScaleType = AssetsModule.Images.RoundedRect.ScaleType,
			Size = p1.props.Size,
			SliceCenter = AssetsModule.Images.RoundedRect.SliceCenter,
			LayoutOrder = p1.props.LayoutOrder
		}, {
			ScrollingFrame = RoactModule.createElement("ScrollingFrame", {
				Size = UDim2.new(1, -24, 1, -14),
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 7),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				CanvasSize = UDim2.new(1, -24, 0, TextService:GetTextSize(p1.props.text, Body.RelativeSize * p2.Font.BaseSize, Body.Font, Vector2.new(p1.state.textBoxWidth, 10000)).Y),
				ScrollBarThickness = 8,
				VerticalScrollBarInset = Enum.ScrollBarInset.Always,
				CanvasPosition = Vector2.new(0, p1.state.canvasPosition),
				Selectable = false,
				[RoactModule.Change.CanvasPosition] = function(ScrollFrame)
					-- upvalues: p1 (upval)
					p1:setState({ canvasPosition = ScrollFrame.CanvasPosition.Y })
				end,
				[RoactModule.Change.AbsoluteSize] = function(Frame)
					-- upvalues: p1 (upval), p2 (copy), Body (copy)
					p1:setState({ scrollingFrameHeight = Frame.AbsoluteSize.Y }, function()
						-- upvalues: p1 (upval), p2 (upval), Body (upval)
						p1:calculateNeedsRescroll(p2, Body)
					end)
				end
			}, {
				TextBox = RoactModule.createElement("TextBox", {
					Size = UDim2.new(1, -2, 1, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Text = p1.props.text,
					ClearTextOnFocus = false,
					TextEditable = p1.props.enabled,
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					TextColor3 = TextDefault.Color,
					TextTransparency = TextDefault.Transparency,
					Font = Body.Font,
					TextSize = Body.RelativeSize * p2.Font.BaseSize,
					TextWrapped = true,
					MultiLine = true,
					SelectionImageObject = Callback(CursorKind.InputFields),
					[RoactModule.Ref] = p1.textBoxRef,
					[RoactModule.Change.Text] = function(TextBox)
						-- upvalues: p1 (upval), p2 (copy), Body (copy)
						local Success, Result = pcall(function(): number
							-- upvalues: TextBox (copy)
							return utf8.len(utf8.nfcnormalize(TextBox.Text))
						end)
						
						if Success and p1.props.maxTextLength >= Result then
							p1.props.textChanged(TextBox.Text)
							p1:setState({ cursorPosition = TextBox.CursorPosition }, function()
								-- upvalues: p1 (upval), p2 (upval), Body (upval)
								p1:calculateNeedsRescroll(p2, Body)
							end)
							
							return
						else
							TextBox.Text = p1.props.text
						end
					end,
					[RoactModule.Change.AbsoluteSize] = function(Frame)
						-- upvalues: p1 (upval), p2 (copy), Body (copy)
						p1:setState({ textBoxWidth = Frame.AbsoluteSize.X }, function()
							-- upvalues: p1 (upval), p2 (upval), Body (upval)
							p1:calculateNeedsRescroll(p2, Body)
						end)
					end,
					[RoactModule.Change.CursorPosition] = function(TextBox)
						-- upvalues: p1 (upval), p2 (copy), Body (copy)
						p1:setState({ cursorPosition = TextBox.CursorPosition }, function()
							-- upvalues: p1 (upval), p2 (upval), Body (upval)
							p1:calculateNeedsRescroll(p2, Body)
						end)
					end
				}, {
					PlaceholderText = RoactModule.createElement(ThemedTextLabelModule, {
						themeKey = "TextDefault",
						fontKey = "Body",
						TextTransparency = 0.5,
						TextWrapped = true,
						Text = p1.props.PlaceholderText,
						Size = UDim2.new(1, 0, 1, 0),
						Position = UDim2.new(0, 0, 0, 0),
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top,
						Visible = p1.props.text == ""
					})
				})
			}),
			TextAmmountIndicator = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 1,
				Position = UDim2.new(1, -10, 1, -16),
				AnchorPoint = Vector2.new(1, 0.5),
				Size = UDim2.new(0, 20, 0, 20)
			}, {
				RoactModule.createElement(FillCircleModule, {
					popCircleFraction = 1,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					fillFraction = utf8.len(utf8.nfcnormalize(p1.props.text)) / (p1.props.maxTextLength - 10),
					largerCircleFraction = (p1.props.maxTextLength - 20) / p1.props.maxTextLength,
					shakeCircleFraction = p1.props.maxTextLength / (p1.props.maxTextLength - 10),
					BackgroundColor = p2.Theme.BackgroundMuted.Color
				})
			})
		})
	end)
end

function TextEntryField.render(p1)
	-- upvalues: WithSelectionCursorProviderFunction (copy)
	return WithSelectionCursorProviderFunction(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end)
end

function TextEntryField.didUpdate(p1, p2, _)
	if p1.props.enabled or not p2.enabled then
		if p1.props.enabled and not p2.enabled and p1.props.autoFocusOnEnabled and p1.textBoxRef.current then
			p1.textBoxRef.current:CaptureFocus()
		end
	elseif p1.textBoxRef.current and p1.textBoxRef.current:IsFocused() then
		p1.textBoxRef.current:ReleaseFocus()
		
		return
	end
end

return RoactModule.forwardRef(function(p1, TextBoxRef)
	-- upvalues: RoactModule (copy), TextEntryField (copy), CryoModule (copy)
	return RoactModule.createElement(TextEntryField, CryoModule.Dictionary.join(p1, { textBoxRef = TextBoxRef }))
end)