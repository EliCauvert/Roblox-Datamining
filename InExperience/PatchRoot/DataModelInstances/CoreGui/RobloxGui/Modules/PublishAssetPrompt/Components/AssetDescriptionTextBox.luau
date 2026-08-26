local corePackagesService = game:GetService("CorePackages")
local textService = game:GetService("TextService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local focusable = require(corePackagesService.Packages.RoactGamepad).Focusable
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local withStyle = UIBloxModule.Style.withStyle
local withSelectionCursorProvider = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local circle17Stroke1 = UIBloxModule.App.ImageSet.Images["component_assets/circle_17_stroke_1"]
local rect = Rect.new(8, 8, 8, 8)
local getFFlagValidateDescriptionModule = require(script.Parent.Parent.GetFFlagValidateDescription)
local assetDescriptionTextBox = roactModule.PureComponent:extend("AssetDescriptionTextBox")
assetDescriptionTextBox.validateProps = tModule.strictInterface({
	Size = tModule.optional(tModule.UDim2),
	Position = tModule.optional(tModule.UDim2),
	onAssetDescriptionUpdated = tModule.callback,
	descriptionTextBoxRef = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	assetType = tModule.optional(tModule.enum(Enum.AssetType)),
	defaultDescription = tModule.optional(tModule.string)
})

local function _(p1)
	local charCount = utf8.len(utf8.nfcnormalize(p1))
	
	return if charCount == nil then 0 else charCount
end

local _ = function(p1, p2)
	local charCount = utf8.len(utf8.nfcnormalize(p1))
	
	return p2 < (if charCount == nil then 0 else charCount)
end

function assetDescriptionTextBox.init(p1)
	p1:setState({
		lastValidDescription = "",
		descriptionLength = 0,
		scrollingFrameHeight = 100,
		canvasHeight = 100,
		canvasPosition = 0,
		cursorPosition = 0,
		textBoxWidth = 100,
		isDescriptionValid = true,
		assetDescription = p1.props.defaultDescription or ""
	})
	p1.wasInitiallyFocused = false
	
	function p3.tryFocusTextBox()
		-- upvalues: p1 (ref)
		if p1.wasInitiallyFocused then return end
		local value = p1.props.descriptionTextBoxRef:getValue()
		
		if value and value:IsDescendantOf(game) then
			value:CaptureFocus()
			p1.wasInitiallyFocused = true
		end
	end
end

function assetDescriptionTextBox.calculateNeedsRescroll(p1, p2, p3)
	-- upvalues: textService (ref)
	if p1.state.cursorPosition == -1 then return end
	local var1 = p3.RelativeSize * p2.Font.BaseSize
	local var2 = textService:GetTextSize((p1.state.assetDescription or ""):sub(1, p1.state.cursorPosition - 1), var1, p3.Font, Vector2.new(p1.state.textBoxWidth, 10000))
	
	if p1.state.scrollingFrameHeight + p1.state.canvasPosition < var2.Y then
		p1:setState({ canvasPosition = var2.Y - p1.state.scrollingFrameHeight })
		
		return
	elseif var2.Y - var1 < p1.state.canvasPosition then
		p1:setState({ canvasPosition = var2.Y - var1 })
	end
end

function assetDescriptionTextBox.onTextChanged(p1, p2, p3, p4)
	-- upvalues: getFFlagValidateDescriptionModule (ref), textService (ref)
	local var1
	local text = p2.Text
	
	if getFFlagValidateDescriptionModule() then
		var1 = text ~= ""
	end
	local lastValidDescription = p1.state.lastValidDescription
	local charCount = utf8.len(utf8.nfcnormalize(text))
	
	if (if charCount == nil then 0 else charCount) > 1000 then
		text = lastValidDescription
		p2.Text = text
	else
		lastValidDescription = p2.Text
	end
	local charCount_1 = utf8.len(utf8.nfcnormalize(text))
	p1:setState({
		lastValidDescription = lastValidDescription,
		assetDescription = text,
		descriptionLength = if charCount_1 == nil then 0 else charCount_1,
		canvasHeight = math.max(100, textService:GetTextSize(text, p4.RelativeSize * p3.Font.BaseSize, p4.Font, Vector2.new(p1.state.textBoxWidth, 10000)).Y),
		isDescriptionValid = var1
	})
	p1.props.onAssetDescriptionUpdated(text, var1)
end

function assetDescriptionTextBox.renderWithProviders(p1, p2, p3)
	-- upvalues: getFFlagValidateDescriptionModule (ref), roactModule (ref), imageSetLabel (ref), circle17Stroke1 (ref), rect (ref), focusable (ref), robloxTranslatorModule (ref), cursorKind (ref)
	local font = p2.Font
	local captionBody = font.CaptionBody
	local theme = p2.Theme
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.props.Size,
		Position = p1.props.Position
	}, {
		TextboxContainer = roactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Image = circle17Stroke1,
			ImageColor3 = theme.UIDefault.Color,
			ImageTransparency = theme.UIDefault.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			Size = UDim2.new(1, 0, 1, -15),
			SliceCenter = rect
		}, {
			ScrollingFrame = roactModule.createElement("ScrollingFrame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				CanvasPosition = Vector2.new(0, p1.state.canvasPosition),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				ScrollBarThickness = 12,
				BorderSizePixel = 0,
				[roactModule.Change.CanvasPosition] = function(p4)
					-- upvalues: p1 (ref)
					p1:setState({ canvasPosition = p4.CanvasPosition.Y })
				end,
				[roactModule.Change.AbsoluteSize] = function(p4)
					-- upvalues: p1 (ref), p2 (ref), captionBody (ref)
					p1:setState({ scrollingFrameHeight = p4.AbsoluteSize.Y })
					p1:calculateNeedsRescroll(p2, captionBody)
				end
			}, {
				Textbox = roactModule.createElement(focusable.TextBox, {
					Text = p1.state.assetDescription,
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					Font = font.Header2.Font,
					TextSize = font.BaseSize * captionBody.RelativeSize,
					PlaceholderColor3 = theme.PlaceHolder.Color,
					PlaceholderText = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.AssetDescriptionPlaceholder"),
					Position = UDim2.fromOffset(6, 0),
					Size = UDim2.new(1, -24, 0, p1.state.canvasHeight),
					MultiLine = true,
					TextColor3 = theme.TextDefault.Color,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					OverlayNativeInput = true,
					NextSelectionUp = p1.props.NextSelectionUp,
					[roactModule.Change.TextFits] = p1.onTextFitsChanged,
					SelectionImageObject = p3(cursorKind.InputFields),
					[roactModule.Ref] = p1.props.descriptionTextBoxRef,
					[roactModule.Event.AncestryChanged] = p1.tryFocusTextBox,
					[roactModule.Change.Text] = function(p4)
						-- upvalues: p1 (ref), p2 (ref), captionBody (ref)
						p1:onTextChanged(p4, p2, captionBody)
					end,
					[roactModule.Change.AbsoluteSize] = function(p4)
						-- upvalues: p1 (ref), p2 (ref), captionBody (ref)
						p1:setState({ textBoxWidth = p4.AbsoluteSize.X })
						p1:calculateNeedsRescroll(p2, captionBody)
					end,
					[roactModule.Change.CursorPosition] = function(p4)
						-- upvalues: p1 (ref), p2 (ref), captionBody (ref)
						p1:setState({ cursorPosition = p4.CursorPosition })
						p1:calculateNeedsRescroll(p2, captionBody)
					end
				})
			})
		}),
		LengthDisplay = if p1.state.descriptionLength / 1000 > 0.9 then roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(if getFFlagValidateDescriptionModule() then 0.2 else 1, 0, 0, 15),
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.fromScale(1, 1),
			Text = p1.state.descriptionLength .. "/" .. 1000,
			TextXAlignment = Enum.TextXAlignment.Right,
			TextColor3 = theme.TextDefault.Color
		}) else nil,
		WarningText = getFFlagValidateDescriptionModule() and ((if getFFlagValidateDescriptionModule() then not p1.state.isDescriptionValid else false) and roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			TextSize = 12,
			Position = UDim2.new(0, 0, 1, -15),
			Text = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription"),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			Size = UDim2.new(0.8, 0, 0, 20),
			TextColor3 = theme.Alert.Color,
			Font = font.Body.Font
		}))
	})
end

function assetDescriptionTextBox.render(p1)
	-- upvalues: withStyle (ref), withSelectionCursorProvider (ref)
	return withStyle(function(p2)
		-- upvalues: withSelectionCursorProvider (copy), p1 (ref)
		return withSelectionCursorProvider(function(p3)
			-- upvalues: p1 (copy), p2 (ref)
			return p1:renderWithProviders(p2, p3)
		end)
	end)
end

function assetDescriptionTextBox.didMount(p1)
	p1.tryFocusTextBox()
end

return roactRoduxModule.connect(function(p1)
	return { assetType = p1.promptRequest.promptInfo.assetType }
end)(assetDescriptionTextBox)