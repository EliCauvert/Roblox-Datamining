local textService = game:GetService("TextService")
local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local cryo = inGameMenuDependenciesModule.Cryo
local withStyle = UIBlox.Core.Style.withStyle
local images = UIBlox.App.ImageSet.Images
local withSelectionCursorProvider = UIBlox.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBlox.App.SelectionImage.CursorKind
local parent = script.Parent.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local fillCircleModule = require(script.Parent.FillCircle)
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local textEntryField = roact.PureComponent:extend("TextEntryField")
local circle17 = images["component_assets/circle_17"]
textEntryField.validateProps = t.strictInterface({
	enabled = t.boolean,
	text = t.string,
	textChanged = t.callback,
	maxTextLength = t.integer,
	autoFocusOnEnabled = t.boolean,
	PlaceholderText = t.string,
	LayoutOrder = t.optional(t.integer),
	Size = t.UDim2,
	Position = t.optional(t.UDim2),
	textBoxRef = t.optional(t.table)
})

function textEntryField.init(p0) --[[ line: 53 ]]
	-- upvalues: roact (ref)
	p0.textBoxRef = p0.props.textBoxRef or roact.createRef()
	p0.state = {
		textBoxWidth = 100,
		scrollingFrameHeight = 100,
		canvasPosition = 0,
		cursorPosition = 0
	}
end

function textEntryField.calculateNeedsRescroll(p1, p2, p3) --[[ line: 64 ]]
	-- upvalues: textService (ref)
	p1:setState(function(p4, p5) --[[ line: 65 ]]
		-- upvalues: p3 (ref), p2 (ref), textService (copy)
		if p4.cursorPosition == -1 then
			return nil
		end
		local var6 = p3.RelativeSize * p2.Font.BaseSize
		local var7 = textService:GetTextSize(p5.text:sub(1, p4.cursorPosition - 1), var6, p3.Font, Vector2.new(p5.textBoxWidth, 10000))
		
		return if p4.scrollingFrameHeight + p4.canvasPosition < var7.Y then { canvasPosition = var7.Y - p4.scrollingFrameHeight } elseif var7.Y - var6 < p4.canvasPosition then { canvasPosition = var7.Y - var6 } else nil
	end)
end

function textEntryField.renderWithSelectionCursor(p6, p7) --[[ line: 87 ]]
	-- upvalues: withStyle (ref), textService (ref), circle17 (ref), roact (ref), imageSetLabel (ref), assetsModule (ref), cursorKind (ref), themedTextLabelModule (ref), images (ref), fillCircleModule (ref)
	return withStyle(function(p8) --[[ line: 88 ]]
		-- upvalues: textService (copy), p6 (ref), circle17 (copy), roact (copy), imageSetLabel (copy), assetsModule (copy), p7 (ref), cursorKind (copy), themedTextLabelModule (copy), images (copy), fillCircleModule (copy)
		local textDefault = p8.Theme.TextDefault
		local body = p8.Font.Body
		local textTextSize = textService:GetTextSize(p6.props.text, body.RelativeSize * p8.Font.BaseSize, body.Font, Vector2.new(p6.state.textBoxWidth, 10000))
		local imageRectOffset = circle17.ImageRectOffset
		local x = circle17.ImageRectSize.X
		local var9 = x / 2
		
		return roact.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Image = assetsModule.Images.RoundedRect.Image,
			ImageColor3 = p8.Theme.BackgroundMuted.Color,
			ImageTransparency = p8.Theme.BackgroundMuted.Transparency,
			Position = p6.props.Position,
			ScaleType = assetsModule.Images.RoundedRect.ScaleType,
			Size = p6.props.Size,
			SliceCenter = assetsModule.Images.RoundedRect.SliceCenter,
			LayoutOrder = p6.props.LayoutOrder
		}, {
			ScrollingFrame = roact.createElement("ScrollingFrame", {
				Size = UDim2.new(1, -24, 1, -44),
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 7),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				CanvasSize = UDim2.new(1, -24, 0, textTextSize.Y),
				ScrollBarThickness = 8,
				VerticalScrollBarInset = Enum.ScrollBarInset.Always,
				CanvasPosition = Vector2.new(0, p6.state.canvasPosition),
				Selectable = false,
				[roact.Change.CanvasPosition] = function(p9) --[[ line: 127 ]]
					-- upvalues: p6 (copy)
					p6:setState({ canvasPosition = p9.CanvasPosition.Y })
				end,
				[roact.Change.AbsoluteSize] = function(p10) --[[ line: 133 ]]
					-- upvalues: p6 (copy), p8 (ref), body (ref)
					p6:setState({ scrollingFrameHeight = p10.AbsoluteSize.Y }, function() --[[ line: 134 ]]
						-- upvalues: p6 (copy), p8 (copy), body (copy)
						p6:calculateNeedsRescroll(p8, body)
					end)
				end
			}, {
				TextBox = roact.createElement("TextBox", {
					Size = UDim2.new(1, -2, 1, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Text = p6.props.text,
					ClearTextOnFocus = false,
					TextEditable = p6.props.enabled,
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					TextColor3 = textDefault.Color,
					TextTransparency = textDefault.Transparency,
					Font = body.Font,
					TextSize = body.RelativeSize * p8.Font.BaseSize,
					TextWrapped = true,
					SelectionImageObject = p7(cursorKind.InputFields),
					[roact.Ref] = p6.textBoxRef,
					[roact.Change.Text] = function(p11) --[[ line: 159 ]]
						-- upvalues: p6 (copy), p8 (ref), body (ref)
						if p6.props.maxTextLength < utf8.len(utf8.nfcnormalize(p11.Text)) then
							p11.Text = string.sub(p11.Text, 1, utf8.offset(p11.Text, p6.props.maxTextLength + 1) - 1)
							
							return
						end
						p6.props.textChanged(p11.Text)
						p6:setState({ cursorPosition = p11.CursorPosition }, function() --[[ line: 166 ]]
							-- upvalues: p6 (copy), p8 (copy), body (copy)
							p6:calculateNeedsRescroll(p8, body)
						end)
					end,
					[roact.Change.AbsoluteSize] = function(p12) --[[ line: 171 ]]
						-- upvalues: p6 (copy), p8 (ref), body (ref)
						p6:setState({ textBoxWidth = p12.AbsoluteSize.X }, function() --[[ line: 172 ]]
							-- upvalues: p6 (copy), p8 (copy), body (copy)
							p6:calculateNeedsRescroll(p8, body)
						end)
					end,
					[roact.Change.CursorPosition] = function(p13) --[[ line: 177 ]]
						-- upvalues: p6 (copy), p8 (ref), body (ref)
						p6:setState({ cursorPosition = p13.CursorPosition }, function() --[[ line: 178 ]]
							-- upvalues: p6 (copy), p8 (copy), body (copy)
							p6:calculateNeedsRescroll(p8, body)
						end)
					end
				}, {
					PlaceholderText = roact.createElement(themedTextLabelModule, {
						themeKey = "TextDefault",
						fontKey = "Body",
						TextTransparency = 0.5,
						Text = p6.props.PlaceholderText,
						Size = UDim2.new(1, 0, 1, 0),
						Position = UDim2.new(0, 0, 0, 0),
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top,
						Visible = p6.props.text == ""
					})
				})
			}),
			BottomBar = roact.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Image = circle17.Image,
				ImageColor3 = p8.Theme.BackgroundMuted.Color,
				ScaleType = Enum.ScaleType.Slice,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, 32),
				SliceCenter = Rect.new(var9 - 1, 0, var9 + 1, 1),
				SliceScale = 1 / images.ImagesResolutionScale,
				ImageRectSize = Vector2.new(x, var9),
				ImageRectOffset = imageRectOffset + Vector2.new(0, var9)
			}, {
				TextAmmountIndicator = roact.createElement("Frame", {
					BackgroundTransparency = 1,
					Position = UDim2.new(1, -10, 0.5, 0),
					AnchorPoint = Vector2.new(1, 0.5),
					Size = UDim2.new(0, 20, 0, 20)
				}, {
					roact.createElement(fillCircleModule, {
						popCircleFraction = 1,
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						fillFraction = utf8.len(utf8.nfcnormalize(p6.props.text)) / (p6.props.maxTextLength - 10),
						largerCircleFraction = (p6.props.maxTextLength - 20) / p6.props.maxTextLength,
						shakeCircleFraction = p6.props.maxTextLength / (p6.props.maxTextLength - 10),
						BackgroundColor = p8.Theme.BackgroundMuted.Color
					})
				})
			})
		})
	end)
end

function textEntryField.render(p14) --[[ line: 236 ]]
	-- upvalues: withSelectionCursorProvider (ref)
	return withSelectionCursorProvider(function(p15) --[[ line: 237 ]]
		-- upvalues: p14 (ref)
		return p14:renderWithSelectionCursor(p15)
	end)
end

function textEntryField.didUpdate(p16, p17, _) --[[ line: 242 ]]
	if not p16.props.enabled and p17.enabled then
		if p16.textBoxRef.current and p16.textBoxRef.current:IsFocused() then
			p16.textBoxRef.current:ReleaseFocus()
			
			return
		end
	elseif p16.props.enabled and not p17.enabled and (p16.props.autoFocusOnEnabled and p16.textBoxRef.current) then
		p16.textBoxRef.current:CaptureFocus()
	end
end

return roact.forwardRef(function(p18, p19) --[[ line: 255 ]]
	-- upvalues: roact (ref), textEntryField (ref), cryo (ref)
	return roact.createElement(textEntryField, cryo.Dictionary.join(p18, { textBoxRef = p19 }))
end)