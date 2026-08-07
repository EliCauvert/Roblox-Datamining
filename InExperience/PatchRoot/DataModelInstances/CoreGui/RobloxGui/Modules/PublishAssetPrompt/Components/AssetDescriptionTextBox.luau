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

local function _(p0) --[[ line: 53 | named "getStringLength" ]]
	local charCount = utf8.len(utf8.nfcnormalize(p0))
	
	return if charCount == nil then 0 else charCount
end

local _ = function(p1, p2) --[[ line: 62 | named "isDescriptionTooLong" ]]
	local charCount = utf8.len(utf8.nfcnormalize(p1))
	
	return p2 < (if charCount == nil then 0 else charCount)
end

function assetDescriptionTextBox.init(p3) --[[ line: 66 ]]
	p3:setState({
		lastValidDescription = "",
		descriptionLength = 0,
		scrollingFrameHeight = 100,
		canvasHeight = 100,
		canvasPosition = 0,
		cursorPosition = 0,
		textBoxWidth = 100,
		isDescriptionValid = true,
		assetDescription = p3.props.defaultDescription or ""
	})
	p3.wasInitiallyFocused = false
	
	function p3.tryFocusTextBox() --[[ line: 81 ]]
		-- upvalues: p3 (ref)
		if p3.wasInitiallyFocused then return end
		local value = p3.props.descriptionTextBoxRef:getValue()
		
		if value and value:IsDescendantOf(game) then
			value:CaptureFocus()
			p3.wasInitiallyFocused = true
		end
	end
end

function assetDescriptionTextBox.calculateNeedsRescroll(p4, p5, p6) --[[ line: 95 ]]
	-- upvalues: textService (ref)
	if p4.state.cursorPosition == -1 then return end
	local var13 = p6.RelativeSize * p5.Font.BaseSize
	local var14 = textService:GetTextSize((p4.state.assetDescription or ""):sub(1, p4.state.cursorPosition - 1), var13, p6.Font, Vector2.new(p4.state.textBoxWidth, 10000))
	
	if p4.state.scrollingFrameHeight + p4.state.canvasPosition < var14.Y then
		p4:setState({ canvasPosition = var14.Y - p4.state.scrollingFrameHeight })
		
		return
	elseif var14.Y - var13 < p4.state.canvasPosition then
		p4:setState({ canvasPosition = var14.Y - var13 })
	end
end

function assetDescriptionTextBox.onTextChanged(p7, p8, p9, p10) --[[ line: 128 ]]
	-- upvalues: getFFlagValidateDescriptionModule (ref), textService (ref)
	local var15
	local text = p8.Text
	
	if getFFlagValidateDescriptionModule() then
		var15 = text ~= ""
	end
	local lastValidDescription = p7.state.lastValidDescription
	local charCount = utf8.len(utf8.nfcnormalize(text))
	
	if (if charCount == nil then 0 else charCount) > 1000 then
		text = lastValidDescription
		p8.Text = text
	else
		lastValidDescription = p8.Text
	end
	local charCount_1 = utf8.len(utf8.nfcnormalize(text))
	p7:setState({
		lastValidDescription = lastValidDescription,
		assetDescription = text,
		descriptionLength = if charCount_1 == nil then 0 else charCount_1,
		canvasHeight = math.max(100, textService:GetTextSize(text, p10.RelativeSize * p9.Font.BaseSize, p10.Font, Vector2.new(p7.state.textBoxWidth, 10000)).Y),
		isDescriptionValid = var15
	})
	p7.props.onAssetDescriptionUpdated(text, var15)
end

function assetDescriptionTextBox.renderWithProviders(p11, p12, p13) --[[ line: 161 ]]
	-- upvalues: getFFlagValidateDescriptionModule (ref), roactModule (ref), imageSetLabel (ref), circle17Stroke1 (ref), rect (ref), focusable (ref), robloxTranslatorModule (ref), cursorKind (ref)
	local font = p12.Font
	local captionBody = font.CaptionBody
	local theme = p12.Theme
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p11.props.Size,
		Position = p11.props.Position
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
				CanvasPosition = Vector2.new(0, p11.state.canvasPosition),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				ScrollBarThickness = 12,
				BorderSizePixel = 0,
				[roactModule.Change.CanvasPosition] = function(p14) --[[ line: 191 ]]
					-- upvalues: p11 (ref)
					p11:setState({ canvasPosition = p14.CanvasPosition.Y })
				end,
				[roactModule.Change.AbsoluteSize] = function(p15) --[[ line: 197 ]]
					-- upvalues: p11 (ref), p12 (ref), captionBody (ref)
					p11:setState({ scrollingFrameHeight = p15.AbsoluteSize.Y })
					p11:calculateNeedsRescroll(p12, captionBody)
				end
			}, {
				Textbox = roactModule.createElement(focusable.TextBox, {
					Text = p11.state.assetDescription,
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					Font = font.Header2.Font,
					TextSize = font.BaseSize * captionBody.RelativeSize,
					PlaceholderColor3 = theme.PlaceHolder.Color,
					PlaceholderText = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.AssetDescriptionPlaceholder"),
					Position = UDim2.fromOffset(6, 0),
					Size = UDim2.new(1, -24, 0, p11.state.canvasHeight),
					MultiLine = true,
					TextColor3 = theme.TextDefault.Color,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					OverlayNativeInput = true,
					NextSelectionUp = p11.props.NextSelectionUp,
					[roactModule.Change.TextFits] = p11.onTextFitsChanged,
					SelectionImageObject = p13(cursorKind.InputFields),
					[roactModule.Ref] = p11.props.descriptionTextBoxRef,
					[roactModule.Event.AncestryChanged] = p11.tryFocusTextBox,
					[roactModule.Change.Text] = function(p16) --[[ line: 230 ]]
						-- upvalues: p11 (ref), p12 (ref), captionBody (ref)
						p11:onTextChanged(p16, p12, captionBody)
					end,
					[roactModule.Change.AbsoluteSize] = function(p17) --[[ line: 234 ]]
						-- upvalues: p11 (ref), p12 (ref), captionBody (ref)
						p11:setState({ textBoxWidth = p17.AbsoluteSize.X })
						p11:calculateNeedsRescroll(p12, captionBody)
					end,
					[roactModule.Change.CursorPosition] = function(p18) --[[ line: 241 ]]
						-- upvalues: p11 (ref), p12 (ref), captionBody (ref)
						p11:setState({ cursorPosition = p18.CursorPosition })
						p11:calculateNeedsRescroll(p12, captionBody)
					end
				})
			})
		}),
		LengthDisplay = if p11.state.descriptionLength / 1000 > 0.9 then roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(if getFFlagValidateDescriptionModule() then 0.2 else 1, 0, 0, 15),
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.fromScale(1, 1),
			Text = p11.state.descriptionLength .. "/" .. 1000,
			TextXAlignment = Enum.TextXAlignment.Right,
			TextColor3 = theme.TextDefault.Color
		}) else nil,
		WarningText = getFFlagValidateDescriptionModule() and ((if getFFlagValidateDescriptionModule() then not p11.state.isDescriptionValid else false) and roactModule.createElement("TextLabel", {
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

function assetDescriptionTextBox.render(p19) --[[ line: 278 ]]
	-- upvalues: withStyle (ref), withSelectionCursorProvider (ref)
	return withStyle(function(p20) --[[ line: 279 ]]
		-- upvalues: withSelectionCursorProvider (copy), p19 (ref)
		return withSelectionCursorProvider(function(p21) --[[ line: 280 ]]
			-- upvalues: p19 (copy), p20 (ref)
			return p19:renderWithProviders(p20, p21)
		end)
	end)
end

function assetDescriptionTextBox.didMount(p22) --[[ line: 286 ]]
	p22.tryFocusTextBox()
end

return roactRoduxModule.connect(function(p23) --[[ line: 290 | named "mapStateToProps" ]]
	return { assetType = p23.promptRequest.promptInfo.assetType }
end)(assetDescriptionTextBox)