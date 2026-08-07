local textService = game:GetService("TextService")
local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roactModule = require(corePackagesService.Packages.Roact)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local tModule = require(corePackagesService.Packages.t)
local parent = script.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local themedTextLabelModule = require(require(parent.Dependencies).ThemedTextLabel)
local fillCircleModule = require(parent.Components.FillCircle)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local withStyle = UIBloxModule.Core.Style.withStyle
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local withSelectionCursorProvider = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local textEntryField = roactModule.PureComponent:extend("TextEntryField")
textEntryField.validateProps = tModule.strictInterface({
	enabled = tModule.boolean,
	text = tModule.string,
	textChanged = tModule.callback,
	maxTextLength = tModule.integer,
	autoFocusOnEnabled = tModule.boolean,
	PlaceholderText = tModule.string,
	LayoutOrder = tModule.optional(tModule.integer),
	Size = tModule.UDim2,
	Position = tModule.optional(tModule.UDim2),
	textBoxRef = tModule.optional(tModule.table)
})

function textEntryField.init(p0) --[[ line: 47 ]]
	-- upvalues: roactModule (ref)
	p0.textBoxRef = p0.props.textBoxRef or roactModule.createRef()
	p0.state = {
		textBoxWidth = 100,
		scrollingFrameHeight = 100,
		canvasPosition = 0,
		cursorPosition = 0
	}
end

function textEntryField.calculateNeedsRescroll(p1, p2, p3) --[[ line: 58 ]]
	-- upvalues: textService (ref)
	p1:setState(function(p4, p5) --[[ line: 59 ]]
		-- upvalues: p3 (ref), p2 (ref), textService (copy)
		if p4.cursorPosition == -1 then
			return nil
		end
		local var10 = p3.RelativeSize * p2.Font.BaseSize
		local var11 = textService:GetTextSize(p5.text:sub(1, p4.cursorPosition - 1), var10, p3.Font, Vector2.new(p5.textBoxWidth, 10000))
		
		return if p4.scrollingFrameHeight + p4.canvasPosition < var11.Y then { canvasPosition = var11.Y - p4.scrollingFrameHeight } elseif var11.Y - var10 < p4.canvasPosition then { canvasPosition = var11.Y - var10 } else nil
	end)
end

function textEntryField.renderWithSelectionCursor(p6, p7) --[[ line: 82 ]]
	-- upvalues: withStyle (ref), textService (ref), roactModule (ref), imageSetLabel (ref), assetsModule (ref), cursorKind (ref), themedTextLabelModule (ref), fillCircleModule (ref)
	return withStyle(function(p8) --[[ line: 83 ]]
		-- upvalues: textService (copy), p6 (ref), roactModule (copy), imageSetLabel (copy), assetsModule (copy), p7 (ref), cursorKind (copy), themedTextLabelModule (copy), fillCircleModule (copy)
		local textDefault = p8.Theme.TextDefault
		local body = p8.Font.Body
		
		return roactModule.createElement(imageSetLabel, {
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
			ScrollingFrame = roactModule.createElement("ScrollingFrame", {
				Size = UDim2.new(1, -24, 1, -14),
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 7),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				CanvasSize = UDim2.new(1, -24, 0, textService:GetTextSize(p6.props.text, body.RelativeSize * p8.Font.BaseSize, body.Font, Vector2.new(p6.state.textBoxWidth, 10000)).Y),
				ScrollBarThickness = 8,
				VerticalScrollBarInset = Enum.ScrollBarInset.Always,
				CanvasPosition = Vector2.new(0, p6.state.canvasPosition),
				Selectable = false,
				[roactModule.Change.CanvasPosition] = function(p9) --[[ line: 117 ]]
					-- upvalues: p6 (copy)
					p6:setState({ canvasPosition = p9.CanvasPosition.Y })
				end,
				[roactModule.Change.AbsoluteSize] = function(p10) --[[ line: 123 ]]
					-- upvalues: p6 (copy), p8 (ref), body (ref)
					p6:setState({ scrollingFrameHeight = p10.AbsoluteSize.Y }, function() --[[ line: 124 ]]
						-- upvalues: p6 (copy), p8 (copy), body (copy)
						p6:calculateNeedsRescroll(p8, body)
					end)
				end
			}, {
				TextBox = roactModule.createElement("TextBox", {
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
					MultiLine = true,
					SelectionImageObject = p7(cursorKind.InputFields),
					[roactModule.Ref] = p6.textBoxRef,
					[roactModule.Change.Text] = function(p11) --[[ line: 149 ]]
						-- upvalues: p6 (copy), p8 (ref), body (ref)
						local ok, status = pcall(function() --[[ line: 150 ]]
							-- upvalues: p11 (ref)
							return utf8.len(utf8.nfcnormalize(p11.Text))
						end)
						
						if ok and p6.props.maxTextLength >= status then
							p6.props.textChanged(p11.Text)
							p6:setState({ cursorPosition = p11.CursorPosition }, function() --[[ line: 159 ]]
								-- upvalues: p6 (copy), p8 (copy), body (copy)
								p6:calculateNeedsRescroll(p8, body)
							end)
							
							return
						end
						p11.Text = p6.props.text
					end,
					[roactModule.Change.AbsoluteSize] = function(p12) --[[ line: 164 ]]
						-- upvalues: p6 (copy), p8 (ref), body (ref)
						p6:setState({ textBoxWidth = p12.AbsoluteSize.X }, function() --[[ line: 165 ]]
							-- upvalues: p6 (copy), p8 (copy), body (copy)
							p6:calculateNeedsRescroll(p8, body)
						end)
					end,
					[roactModule.Change.CursorPosition] = function(p13) --[[ line: 170 ]]
						-- upvalues: p6 (copy), p8 (ref), body (ref)
						p6:setState({ cursorPosition = p13.CursorPosition }, function() --[[ line: 171 ]]
							-- upvalues: p6 (copy), p8 (copy), body (copy)
							p6:calculateNeedsRescroll(p8, body)
						end)
					end
				}, {
					PlaceholderText = roactModule.createElement(themedTextLabelModule, {
						themeKey = "TextDefault",
						fontKey = "Body",
						TextTransparency = 0.5,
						TextWrapped = true,
						Text = p6.props.PlaceholderText,
						Size = UDim2.new(1, 0, 1, 0),
						Position = UDim2.new(0, 0, 0, 0),
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top,
						Visible = p6.props.text == ""
					})
				})
			}),
			TextAmmountIndicator = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 1,
				Position = UDim2.new(1, -10, 1, -16),
				AnchorPoint = Vector2.new(1, 0.5),
				Size = UDim2.new(0, 20, 0, 20)
			}, {
				roactModule.createElement(fillCircleModule, {
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
	end)
end

function textEntryField.render(p14) --[[ line: 214 ]]
	-- upvalues: withSelectionCursorProvider (ref)
	return withSelectionCursorProvider(function(p15) --[[ line: 215 ]]
		-- upvalues: p14 (ref)
		return p14:renderWithSelectionCursor(p15)
	end)
end

function textEntryField.didUpdate(p16, p17, _) --[[ line: 220 ]]
	if not p16.props.enabled and p17.enabled then
		if p16.textBoxRef.current and p16.textBoxRef.current:IsFocused() then
			p16.textBoxRef.current:ReleaseFocus()
			
			return
		end
	elseif p16.props.enabled and not p17.enabled and (p16.props.autoFocusOnEnabled and p16.textBoxRef.current) then
		p16.textBoxRef.current:CaptureFocus()
	end
end

return roactModule.forwardRef(function(p18, p19) --[[ line: 233 ]]
	-- upvalues: roactModule (ref), textEntryField (ref), cryoModule (ref)
	return roactModule.createElement(textEntryField, cryoModule.Dictionary.join(p18, { textBoxRef = p19 }))
end)