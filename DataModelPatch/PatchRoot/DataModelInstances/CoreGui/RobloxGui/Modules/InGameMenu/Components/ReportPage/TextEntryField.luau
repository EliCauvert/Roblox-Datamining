local TextService = game:GetService("TextService")
local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local UIBlox = InGameMenuDependenciesModule.UIBlox
local T = InGameMenuDependenciesModule.t
local Cryo = InGameMenuDependenciesModule.Cryo
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local Images = UIBlox.App.ImageSet.Images
local WithSelectionCursorProviderFunction = UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBlox.App.SelectionImage.CursorKind
local Parent = script.Parent.Parent.Parent
local AssetsModule = require(Parent.Resources.Assets)
local FillCircleModule = require(script.Parent.FillCircle)
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local TextEntryField = Roact.PureComponent:extend("TextEntryField")
local ComponentAssetsCircle17 = Images["component_assets/circle_17"]
TextEntryField.validateProps = T.strictInterface({
	enabled = T.boolean,
	text = T.string,
	textChanged = T.callback,
	maxTextLength = T.integer,
	autoFocusOnEnabled = T.boolean,
	PlaceholderText = T.string,
	LayoutOrder = T.optional(T.integer),
	Size = T.UDim2,
	Position = T.optional(T.UDim2),
	textBoxRef = T.optional(T.table)
})

function TextEntryField.init(p1)
	-- upvalues: Roact (copy)
	p1.textBoxRef = p1.props.textBoxRef or Roact.createRef()
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
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), TextService (copy), ComponentAssetsCircle17 (copy), Roact (copy), ImageSetLabel (copy), AssetsModule (copy), CursorKind (copy), ThemedTextLabelModule (copy), Images (copy), FillCircleModule (copy)
	return WithFoundationOrUIBloxStyleFunction(function(p2)
		return {
			Theme = {
				TextDefault = {
					Color = p2.Color.Content.Default.Color3,
					Transparency = p2.Color.Content.Default.Transparency
				},
				BackgroundMuted = {
					Color = p2.Color.Surface.Surface_200.Color3,
					Transparency = p2.Color.Surface.Surface_200.Transparency
				}
			},
			Font = {
				BaseSize = 1,
				Body = {
					Font = p2.Typography.BodyLarge.Font,
					RelativeSize = p2.Typography.BodyLarge.FontSize
				}
			}
		}
	end, function(p2)
		-- upvalues: TextService (upval), p1 (copy), ComponentAssetsCircle17 (upval), Roact (upval), ImageSetLabel (upval), AssetsModule (upval), Callback (copy), CursorKind (upval), ThemedTextLabelModule (upval), Images (upval), FillCircleModule (upval)
		local TextDefault = p2.Theme.TextDefault
		local Body = p2.Font.Body
		local X: number = ComponentAssetsCircle17.ImageRectSize.X
		local Y = X / 2
		
		return Roact.createElement(ImageSetLabel, {
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
			ScrollingFrame = Roact.createElement("ScrollingFrame", {
				Size = UDim2.new(1, -24, 1, -44),
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 7),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				CanvasSize = UDim2.new(1, -24, 0, TextService:GetTextSize(p1.props.text, Body.RelativeSize * p2.Font.BaseSize, Body.Font, Vector2.new(p1.state.textBoxWidth, 10000)).Y),
				ScrollBarThickness = 8,
				VerticalScrollBarInset = Enum.ScrollBarInset.Always,
				CanvasPosition = Vector2.new(0, p1.state.canvasPosition),
				Selectable = false,
				[Roact.Change.CanvasPosition] = function(ScrollFrame)
					-- upvalues: p1 (upval)
					p1:setState({ canvasPosition = ScrollFrame.CanvasPosition.Y })
				end,
				[Roact.Change.AbsoluteSize] = function(Frame)
					-- upvalues: p1 (upval), p2 (copy), Body (copy)
					p1:setState({ scrollingFrameHeight = Frame.AbsoluteSize.Y }, function()
						-- upvalues: p1 (upval), p2 (upval), Body (upval)
						p1:calculateNeedsRescroll(p2, Body)
					end)
				end
			}, {
				TextBox = Roact.createElement("TextBox", {
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
					SelectionImageObject = Callback(CursorKind.InputFields),
					[Roact.Ref] = p1.textBoxRef,
					[Roact.Change.Text] = function(TextBox)
						-- upvalues: p1 (upval), p2 (copy), Body (copy)
						if p1.props.maxTextLength < utf8.len(utf8.nfcnormalize(TextBox.Text)) then
							TextBox.Text = string.sub(TextBox.Text, 1, utf8.offset(TextBox.Text, p1.props.maxTextLength + 1) - 1)
							
							return
						else
							p1.props.textChanged(TextBox.Text)
							p1:setState({ cursorPosition = TextBox.CursorPosition }, function()
								-- upvalues: p1 (upval), p2 (upval), Body (upval)
								p1:calculateNeedsRescroll(p2, Body)
							end)
						end
					end,
					[Roact.Change.AbsoluteSize] = function(Frame)
						-- upvalues: p1 (upval), p2 (copy), Body (copy)
						p1:setState({ textBoxWidth = Frame.AbsoluteSize.X }, function()
							-- upvalues: p1 (upval), p2 (upval), Body (upval)
							p1:calculateNeedsRescroll(p2, Body)
						end)
					end,
					[Roact.Change.CursorPosition] = function(TextBox)
						-- upvalues: p1 (upval), p2 (copy), Body (copy)
						p1:setState({ cursorPosition = TextBox.CursorPosition }, function()
							-- upvalues: p1 (upval), p2 (upval), Body (upval)
							p1:calculateNeedsRescroll(p2, Body)
						end)
					end
				}, {
					PlaceholderText = Roact.createElement(ThemedTextLabelModule, {
						themeKey = "TextDefault",
						fontKey = "Body",
						TextTransparency = 0.5,
						Text = p1.props.PlaceholderText,
						Size = UDim2.new(1, 0, 1, 0),
						Position = UDim2.new(0, 0, 0, 0),
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top,
						Visible = p1.props.text == ""
					})
				})
			}),
			BottomBar = Roact.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Image = ComponentAssetsCircle17.Image,
				ImageColor3 = p2.Theme.BackgroundMuted.Color,
				ScaleType = Enum.ScaleType.Slice,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, 32),
				SliceCenter = Rect.new(Y - 1, 0, Y + 1, 1),
				SliceScale = 1 / Images.ImagesResolutionScale,
				ImageRectSize = Vector2.new(X, Y),
				ImageRectOffset = ComponentAssetsCircle17.ImageRectOffset + Vector2.new(0, Y)
			}, {
				TextAmmountIndicator = Roact.createElement("Frame", {
					BackgroundTransparency = 1,
					Position = UDim2.new(1, -10, 0.5, 0),
					AnchorPoint = Vector2.new(1, 0.5),
					Size = UDim2.new(0, 20, 0, 20)
				}, {
					Roact.createElement(FillCircleModule, {
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

return Roact.forwardRef(function(p1, TextBoxRef)
	-- upvalues: Roact (copy), TextEntryField (copy), Cryo (copy)
	return Roact.createElement(TextEntryField, Cryo.Dictionary.join(p1, { textBoxRef = TextBoxRef }))
end)