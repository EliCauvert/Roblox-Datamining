local textService = game:GetService("TextService")
local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roactModule = require(corePackagesService.Packages.Roact)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local tModule = require(corePackagesService.Packages.t)
local parent = script.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local themedTextLabelModule = require(parent.Components.PortedComponents.ThemedTextLabel)
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

function textEntryField.init(p1)
	-- upvalues: roactModule (ref)
	p1.textBoxRef = p1.props.textBoxRef or roactModule.createRef()
	p1.state = {
		textBoxWidth = 100,
		scrollingFrameHeight = 100,
		canvasPosition = 0,
		cursorPosition = 0
	}
end

function textEntryField.calculateNeedsRescroll(p1, p2, p3)
	-- upvalues: textService (ref)
	p1:setState(function(p4, p5)
		-- upvalues: p3 (ref), p2 (ref), textService (copy)
		if p4.cursorPosition == -1 then
			return nil
		end
		local var1 = p3.RelativeSize * p2.Font.BaseSize
		local var2 = textService:GetTextSize(p5.text:sub(1, p4.cursorPosition - 1), var1, p3.Font, Vector2.new(p5.textBoxWidth, 10000))
		
		return if p4.scrollingFrameHeight + p4.canvasPosition < var2.Y then { canvasPosition = var2.Y - p4.scrollingFrameHeight } elseif var2.Y - var1 < p4.canvasPosition then { canvasPosition = var2.Y - var1 } else nil
	end)
end

function textEntryField.renderWithSelectionCursor(p1, p2)
	-- upvalues: withStyle (ref), textService (ref), roactModule (ref), imageSetLabel (ref), assetsModule (ref), cursorKind (ref), themedTextLabelModule (ref)
	return withStyle(function(p3)
		-- upvalues: textService (copy), p1 (ref), roactModule (copy), imageSetLabel (copy), assetsModule (copy), p2 (ref), cursorKind (copy), themedTextLabelModule (copy)
		local textDefault = p3.Theme.TextDefault
		local body = p3.Font.Body
		
		return roactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Image = assetsModule.Images.RoundedRect.Image,
			ImageColor3 = p3.Theme.BackgroundMuted.Color,
			ImageTransparency = p3.Theme.BackgroundMuted.Transparency,
			Position = p1.props.Position,
			ScaleType = assetsModule.Images.RoundedRect.ScaleType,
			Size = p1.props.Size,
			SliceCenter = assetsModule.Images.RoundedRect.SliceCenter,
			LayoutOrder = p1.props.LayoutOrder
		}, {
			ScrollingFrame = roactModule.createElement("ScrollingFrame", {
				Size = UDim2.new(1, -24, 1, -14),
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 7),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				CanvasSize = UDim2.new(1, -24, 0, textService:GetTextSize(p1.props.text, body.RelativeSize * p3.Font.BaseSize, body.Font, Vector2.new(p1.state.textBoxWidth, 10000)).Y),
				ScrollBarThickness = 8,
				VerticalScrollBarInset = Enum.ScrollBarInset.Always,
				CanvasPosition = Vector2.new(0, p1.state.canvasPosition),
				Selectable = false,
				[roactModule.Change.CanvasPosition] = function(p4)
					-- upvalues: p1 (copy)
					p1:setState({ canvasPosition = p4.CanvasPosition.Y })
				end,
				[roactModule.Change.AbsoluteSize] = function(p4)
					-- upvalues: p1 (copy), p3 (ref), body (ref)
					p1:setState({ scrollingFrameHeight = p4.AbsoluteSize.Y }, function()
						-- upvalues: p1 (copy), p3 (copy), body (copy)
						p1:calculateNeedsRescroll(p3, body)
					end)
				end
			}, {
				TextBox = roactModule.createElement("TextBox", {
					Size = UDim2.new(1, -2, 1, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Text = p1.props.text,
					ClearTextOnFocus = false,
					TextEditable = p1.props.enabled,
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					TextColor3 = textDefault.Color,
					TextTransparency = textDefault.Transparency,
					Font = body.Font,
					TextSize = body.RelativeSize * p3.Font.BaseSize,
					TextWrapped = true,
					MultiLine = true,
					SelectionImageObject = p2(cursorKind.InputFields),
					[roactModule.Ref] = p1.textBoxRef,
					[roactModule.Change.Text] = function(p4)
						-- upvalues: p1 (copy), p3 (ref), body (ref)
						local ok, status = pcall(function()
							-- upvalues: p4 (ref)
							return utf8.len(utf8.nfcnormalize(p4.Text))
						end)
						
						if ok and p1.props.maxTextLength >= status then
							p1.props.textChanged(p4.Text)
							p1:setState({ cursorPosition = p4.CursorPosition }, function()
								-- upvalues: p1 (copy), p3 (copy), body (copy)
								p1:calculateNeedsRescroll(p3, body)
							end)
							
							return
						end
						p4.Text = p1.props.text
					end,
					[roactModule.Change.AbsoluteSize] = function(p4)
						-- upvalues: p1 (copy), p3 (ref), body (ref)
						p1:setState({ textBoxWidth = p4.AbsoluteSize.X }, function()
							-- upvalues: p1 (copy), p3 (copy), body (copy)
							p1:calculateNeedsRescroll(p3, body)
						end)
					end,
					[roactModule.Change.CursorPosition] = function(p4)
						-- upvalues: p1 (copy), p3 (ref), body (ref)
						p1:setState({ cursorPosition = p4.CursorPosition }, function()
							-- upvalues: p1 (copy), p3 (copy), body (copy)
							p1:calculateNeedsRescroll(p3, body)
						end)
					end
				}, {
					PlaceholderText = roactModule.createElement(themedTextLabelModule, {
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
			})
		})
	end)
end

function textEntryField.render(p1)
	-- upvalues: withSelectionCursorProvider (ref)
	return withSelectionCursorProvider(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithSelectionCursor(p2)
	end)
end

function textEntryField.didUpdate(p1, p2)
	if not p1.props.enabled and p2.enabled then
		if p1.textBoxRef.current and p1.textBoxRef.current:IsFocused() then
			p1.textBoxRef.current:ReleaseFocus()
			
			return
		end
	elseif p1.props.enabled and not p2.enabled and (p1.props.autoFocusOnEnabled and p1.textBoxRef.current) then
		p1.textBoxRef.current:CaptureFocus()
	end
end

return roactModule.forwardRef(function(p1, p2)
	-- upvalues: roactModule (ref), textEntryField (ref), cryoModule (ref)
	return roactModule.createElement(textEntryField, cryoModule.Dictionary.join(p1, { textBoxRef = p2 }))
end)