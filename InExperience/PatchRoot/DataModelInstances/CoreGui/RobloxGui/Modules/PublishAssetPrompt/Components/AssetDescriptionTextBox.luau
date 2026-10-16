local CorePackages = game:GetService("CorePackages")
local TextService = game:GetService("TextService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local GetTextSizeFunction = require(CorePackages.Workspace.Packages.Style).GetTextSize
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ComponentAssetsCircle17Stroke1 = UIBloxModule.App.ImageSet.Images["component_assets/circle_17_stroke_1"]
local _Rect = Rect.new(8, 8, 8, 8)
local GetFFlagValidateDescriptionModule = require(script.Parent.Parent.GetFFlagValidateDescription)
local AssetDescriptionTextBox = RoactModule.PureComponent:extend("AssetDescriptionTextBox")
AssetDescriptionTextBox.validateProps = TModule.strictInterface({
	Size = TModule.optional(TModule.UDim2),
	Position = TModule.optional(TModule.UDim2),
	onAssetDescriptionUpdated = TModule.callback,
	descriptionTextBoxRef = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	assetType = TModule.optional(TModule.enum(Enum.AssetType)),
	defaultDescription = TModule.optional(TModule.string)
})

local function _(p1): number --[[ Line: 57 | Named "getStringLength" ]]
	local Length = utf8.len(utf8.nfcnormalize(p1))
	
	return if Length == nil then 0 else Length
end

local _ = function(p1, p2): boolean --[[ Line: 66 | Named "isDescriptionTooLong" ]]
	local Length = utf8.len(utf8.nfcnormalize(p1))
	
	return p2 < (if Length == nil then 0 else Length)
end

function AssetDescriptionTextBox.init(p1) --[[ Line: 70 ]]
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
	
	function p1.tryFocusTextBox() --[[ Line: 85 ]]
		-- upvalues: p1 (copy)
		if p1.wasInitiallyFocused then return end
		local Value = p1.props.descriptionTextBoxRef:getValue()
		
		if Value and Value:IsDescendantOf(game) then
			Value:CaptureFocus()
			p1.wasInitiallyFocused = true
		end
	end
end

function AssetDescriptionTextBox.calculateNeedsRescroll(p1, p2, CaptionBody) --[[ Line: 99 ]]
	-- upvalues: FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), TextService (copy)
	if p1.state.cursorPosition == -1 then return end
	local Segment = (p1.state.assetDescription or ""):sub(1, p1.state.cursorPosition - 1)
	local ScaledRelativeSize = CaptionBody.RelativeSize * p2.Font.BaseSize
	local _Vector2 = Vector2.new(p1.state.textBoxWidth, 10000)
	local TextSize = if FoundationFontFaceMigration then GetTextSizeFunction(Segment, ScaledRelativeSize, p2.Tokens.Typography.BodySmall.Font, _Vector2, { addTemporaryPadding = false }) else TextService:GetTextSize(Segment, ScaledRelativeSize, CaptionBody.Font, _Vector2)
	
	if p1.state.scrollingFrameHeight + p1.state.canvasPosition < TextSize.Y then
		p1:setState({
			canvasPosition = TextSize.Y - p1.state.scrollingFrameHeight
		})
		
		return
	end
	if TextSize.Y - ScaledRelativeSize < p1.state.canvasPosition then
		p1:setState({ canvasPosition = TextSize.Y - ScaledRelativeSize })
	end
end

function AssetDescriptionTextBox.onTextChanged(p1, p2, p3, CaptionBody) --[[ Line: 140 ]]
	-- upvalues: GetFFlagValidateDescriptionModule (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), TextService (copy)
	local Text = p2.Text
	local Inverted: boolean = not GetFFlagValidateDescriptionModule() or Text ~= ""
	local LastValidDescription = p1.state.lastValidDescription
	local Length = utf8.len(utf8.nfcnormalize(Text))
	
	if (if Length == nil then 0 else Length) > 1000 then
		Text = LastValidDescription
		p2.Text = Text
	else
		LastValidDescription = p2.Text
	end
	local Length1 = utf8.len(utf8.nfcnormalize(Text))
	local Length11: number = if Length1 == nil then 0 else Length1
	local ScaledRelativeSize = CaptionBody.RelativeSize * p3.Font.BaseSize
	local _Vector2 = Vector2.new(p1.state.textBoxWidth, 10000)
	p1:setState({
		lastValidDescription = LastValidDescription,
		assetDescription = Text,
		descriptionLength = Length11,
		canvasHeight = math.max(100, (if FoundationFontFaceMigration then GetTextSizeFunction(Text, ScaledRelativeSize, p3.Tokens.Typography.BodySmall.Font, _Vector2, { addTemporaryPadding = false }) else TextService:GetTextSize(Text, ScaledRelativeSize, CaptionBody.Font, _Vector2)).Y),
		isDescriptionValid = Inverted
	})
	p1.props.onAssetDescriptionUpdated(Text, Inverted)
end

function AssetDescriptionTextBox.renderWithProviders(p1, p2, Callback) --[[ Line: 181 ]]
	-- upvalues: GetFFlagValidateDescriptionModule (copy), RoactModule (copy), ImageSetLabel (copy), ComponentAssetsCircle17Stroke1 (copy), _Rect (copy), Focusable (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), RobloxTranslatorModule (copy), CursorKind (copy)
	local _Font = p2.Font
	local CaptionBody = _Font.CaptionBody
	local Theme = p2.Theme
	local NoIsDescriptionValid: boolean = if GetFFlagValidateDescriptionModule() then not p1.state.isDescriptionValid else false
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.props.Size,
		Position = p1.props.Position
	}, {
		TextboxContainer = RoactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Image = ComponentAssetsCircle17Stroke1,
			ImageColor3 = Theme.UIDefault.Color,
			ImageTransparency = Theme.UIDefault.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			Size = UDim2.new(1, 0, 1, -15),
			SliceCenter = _Rect
		}, {
			ScrollingFrame = RoactModule.createElement("ScrollingFrame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				CanvasPosition = Vector2.new(0, p1.state.canvasPosition),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				ScrollBarThickness = 12,
				BorderSizePixel = 0,
				[RoactModule.Change.CanvasPosition] = function(ScrollFrame) --[[ Line: 211 ]]
					-- upvalues: p1 (copy)
					p1:setState({ canvasPosition = ScrollFrame.CanvasPosition.Y })
				end,
				[RoactModule.Change.AbsoluteSize] = function(Frame) --[[ Line: 217 ]]
					-- upvalues: p1 (copy), p2 (copy), CaptionBody (copy)
					p1:setState({ scrollingFrameHeight = Frame.AbsoluteSize.Y })
					p1:calculateNeedsRescroll(p2, CaptionBody)
				end
			}, {
				Textbox = RoactModule.createElement(Focusable.TextBox, {
					Text = p1.state.assetDescription,
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					Font = if FoundationFontFaceMigration then nil else _Font.Header2.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.TitleLarge.Font) else nil,
					TextSize = _Font.BaseSize * CaptionBody.RelativeSize,
					PlaceholderColor3 = Theme.PlaceHolder.Color,
					PlaceholderText = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.AssetDescriptionPlaceholder"),
					Position = UDim2.fromOffset(6, 0),
					Size = UDim2.new(1, -24, 0, p1.state.canvasHeight),
					MultiLine = true,
					TextColor3 = Theme.TextDefault.Color,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					OverlayNativeInput = true,
					NextSelectionUp = p1.props.NextSelectionUp,
					[RoactModule.Change.TextFits] = p1.onTextFitsChanged,
					SelectionImageObject = Callback(CursorKind.InputFields),
					[RoactModule.Ref] = p1.props.descriptionTextBoxRef,
					[RoactModule.Event.AncestryChanged] = p1.tryFocusTextBox,
					[RoactModule.Change.Text] = function(p3) --[[ Line: 253 ]]
						-- upvalues: p1 (copy), p2 (copy), CaptionBody (copy)
						p1:onTextChanged(p3, p2, CaptionBody)
					end,
					[RoactModule.Change.AbsoluteSize] = function(Frame) --[[ Line: 257 ]]
						-- upvalues: p1 (copy), p2 (copy), CaptionBody (copy)
						p1:setState({ textBoxWidth = Frame.AbsoluteSize.X })
						p1:calculateNeedsRescroll(p2, CaptionBody)
					end,
					[RoactModule.Change.CursorPosition] = function(TextBox) --[[ Line: 264 ]]
						-- upvalues: p1 (copy), p2 (copy), CaptionBody (copy)
						p1:setState({ cursorPosition = TextBox.CursorPosition })
						p1:calculateNeedsRescroll(p2, CaptionBody)
					end
				})
			})
		}),
		LengthDisplay = if p1.state.descriptionLength / 1000 > 0.9 then RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(if GetFFlagValidateDescriptionModule() then 0.2 else 1, 0, 0, 15),
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.fromScale(1, 1),
			Text = p1.state.descriptionLength .. "/" .. 1000,
			TextXAlignment = Enum.TextXAlignment.Right,
			TextColor3 = Theme.TextDefault.Color
		}) else nil,
		WarningText = GetFFlagValidateDescriptionModule() and (NoIsDescriptionValid and RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			TextSize = 12,
			Position = UDim2.new(0, 0, 1, -15),
			Text = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription"),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			Size = UDim2.new(0.8, 0, 0, 20),
			TextColor3 = Theme.Alert.Color,
			Font = if FoundationFontFaceMigration then nil else _Font.Body.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.BodyLarge.Font) else nil
		}))
	})
end

function AssetDescriptionTextBox.render(p1) --[[ Line: 304 ]]
	-- upvalues: WithStyleFunction (copy), WithSelectionCursorProviderFunction (copy)
	return WithStyleFunction(function(p2) --[[ Line: 305 ]]
		-- upvalues: WithSelectionCursorProviderFunction (upval), p1 (copy)
		return WithSelectionCursorProviderFunction(function(p3) --[[ Line: 306 ]]
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithProviders(p2, p3)
		end)
	end)
end

function AssetDescriptionTextBox.didMount(p1) --[[ Line: 312 ]]
	p1.tryFocusTextBox()
end

return RoactRoduxModule.connect(function(p1) --[[ Line: 316 | Named "mapStateToProps" ]]
	return { assetType = p1.promptRequest.promptInfo.assetType }
end)(AssetDescriptionTextBox)