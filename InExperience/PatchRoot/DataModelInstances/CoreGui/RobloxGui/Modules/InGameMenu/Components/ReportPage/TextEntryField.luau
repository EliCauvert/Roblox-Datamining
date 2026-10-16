local TextService = game:GetService("TextService")
local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local UIBlox = InGameMenuDependenciesModule.UIBlox
local T = InGameMenuDependenciesModule.t
local Cryo = InGameMenuDependenciesModule.Cryo
local GetTextSizeFunction = require(CorePackages.Workspace.Packages.Style).GetTextSize
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local Images = UIBlox.App.ImageSet.Images
local FoundationModule = require(CorePackages.Packages.Foundation)
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local WithCursorMigration = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorType = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local Parent = script.Parent.Parent.Parent
local AssetsModule = require(Parent.Resources.Assets)
local FillCircleModule = require(script.Parent.FillCircle)
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local Image = FoundationModule.Image
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

function TextEntryField.init(p1) --[[ Line: 66 ]]
	-- upvalues: Roact (copy)
	p1.textBoxRef = p1.props.textBoxRef or Roact.createRef()
	p1.state = {
		textBoxWidth = 100,
		scrollingFrameHeight = 100,
		canvasPosition = 0,
		cursorPosition = 0
	}
end

function TextEntryField.calculateNeedsRescroll(p1, p2, Body) --[[ Line: 77 ]]
	-- upvalues: FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), TextService (copy)
	p1:setState(function(State, p3) --[[ Line: 78 ]]
		-- upvalues: Body (copy), p2 (copy), FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), TextService (upval)
		if State.cursorPosition == -1 then
			return nil
		else
			local Segment = p3.text:sub(1, State.cursorPosition - 1)
			local ScaledRelativeSize = Body.RelativeSize * p2.Font.BaseSize
			local _Vector2 = Vector2.new(p3.textBoxWidth, 10000)
			local TextSize = if FoundationFontFaceMigration then GetTextSizeFunction(Segment, ScaledRelativeSize, p2.Tokens.Typography.BodyLarge.Font, _Vector2, { addTemporaryPadding = false }) else TextService:GetTextSize(Segment, ScaledRelativeSize, Body.Font, _Vector2)
			
			return if State.scrollingFrameHeight + State.canvasPosition < TextSize.Y then { canvasPosition = TextSize.Y - State.scrollingFrameHeight } elseif TextSize.Y - ScaledRelativeSize < State.canvasPosition then { canvasPosition = TextSize.Y - ScaledRelativeSize } else nil
		end
	end)
end

function TextEntryField.renderWithSelectionCursor(p1, Callback) --[[ Line: 104 ]]
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), TextService (copy), ComponentAssetsCircle17 (copy), Roact (copy), NormalizeFontFaceFunction (copy), CursorType (copy), ThemedTextLabelModule (copy), Images (copy), FillCircleModule (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), Image (copy), AssetsModule (copy), ImageSetLabel (copy)
	return WithFoundationOrUIBloxStyleFunction(function(p2) --[[ Line: 105 ]]
		-- upvalues: FoundationFontFaceMigration (upval)
		return {
			Tokens = if FoundationFontFaceMigration then p2 else nil,
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
	end, function(p2) --[[ Line: 126 ]]
		-- upvalues: FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), p1 (copy), TextService (upval), ComponentAssetsCircle17 (upval), Roact (upval), NormalizeFontFaceFunction (upval), Callback (copy), CursorType (upval), ThemedTextLabelModule (upval), Images (upval), FillCircleModule (upval), FFlagCoreUiMigrateUIBloxToFoundation (upval), Image (upval), AssetsModule (upval), ImageSetLabel (upval)
		local TextDefault = p2.Theme.TextDefault
		local Body = p2.Font.Body
		local X: number = ComponentAssetsCircle17.ImageRectSize.X
		local Y = X / 2
		local config = {
			ScrollingFrame = Roact.createElement("ScrollingFrame", {
				Size = UDim2.new(1, -24, 1, -44),
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 7),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				CanvasSize = UDim2.new(1, -24, 0, (if FoundationFontFaceMigration then GetTextSizeFunction(p1.props.text, Body.RelativeSize * p2.Font.BaseSize, p2.Tokens.Typography.BodyLarge.Font, Vector2.new(p1.state.textBoxWidth, 10000), { addTemporaryPadding = false }) else TextService:GetTextSize(p1.props.text, Body.RelativeSize * p2.Font.BaseSize, Body.Font, Vector2.new(p1.state.textBoxWidth, 10000))).Y),
				ScrollBarThickness = 8,
				VerticalScrollBarInset = Enum.ScrollBarInset.Always,
				CanvasPosition = Vector2.new(0, p1.state.canvasPosition),
				Selectable = false,
				[Roact.Change.CanvasPosition] = function(ScrollFrame) --[[ Line: 163 ]]
					-- upvalues: p1 (upval)
					p1:setState({ canvasPosition = ScrollFrame.CanvasPosition.Y })
				end,
				[Roact.Change.AbsoluteSize] = function(Frame) --[[ Line: 169 ]]
					-- upvalues: p1 (upval), p2 (copy), Body (copy)
					p1:setState({ scrollingFrameHeight = Frame.AbsoluteSize.Y }, function() --[[ Line: 170 ]]
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
					Font = if FoundationFontFaceMigration then nil else Body.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.BodyLarge.Font) else nil,
					TextSize = Body.RelativeSize * p2.Font.BaseSize,
					TextWrapped = true,
					SelectionImageObject = Callback(CursorType.InputFields),
					[Roact.Ref] = p1.textBoxRef,
					[Roact.Change.Text] = function(TextBox) --[[ Line: 196 ]]
						-- upvalues: p1 (upval), p2 (copy), Body (copy)
						if p1.props.maxTextLength < utf8.len(utf8.nfcnormalize(TextBox.Text)) then
							TextBox.Text = string.sub(TextBox.Text, 1, utf8.offset(TextBox.Text, p1.props.maxTextLength + 1) - 1)
							
							return
						else
							p1.props.textChanged(TextBox.Text)
							p1:setState({ cursorPosition = TextBox.CursorPosition }, function() --[[ Line: 203 ]]
								-- upvalues: p1 (upval), p2 (upval), Body (upval)
								p1:calculateNeedsRescroll(p2, Body)
							end)
						end
					end,
					[Roact.Change.AbsoluteSize] = function(Frame) --[[ Line: 208 ]]
						-- upvalues: p1 (upval), p2 (copy), Body (copy)
						p1:setState({ textBoxWidth = Frame.AbsoluteSize.X }, function() --[[ Line: 209 ]]
							-- upvalues: p1 (upval), p2 (upval), Body (upval)
							p1:calculateNeedsRescroll(p2, Body)
						end)
					end,
					[Roact.Change.CursorPosition] = function(TextBox) --[[ Line: 214 ]]
						-- upvalues: p1 (upval), p2 (copy), Body (copy)
						p1:setState({ cursorPosition = TextBox.CursorPosition }, function() --[[ Line: 215 ]]
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
		}
		
		return if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Image, {
			Image = AssetsModule.Images.RoundedRectImageKey,
			imageStyle = {
				Color3 = p2.Theme.BackgroundMuted.Color,
				Transparency = p2.Theme.BackgroundMuted.Transparency
			},
			Position = p1.props.Position,
			Size = p1.props.Size,
			LayoutOrder = p1.props.LayoutOrder,
			slice = { center = Rect.new(8, 8, 9, 9) }
		}, config) else Roact.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			Image = AssetsModule.Images.RoundedRect.Image,
			ImageColor3 = p2.Theme.BackgroundMuted.Color,
			ImageTransparency = p2.Theme.BackgroundMuted.Transparency,
			Position = p1.props.Position,
			ScaleType = AssetsModule.Images.RoundedRect.ScaleType,
			Size = p1.props.Size,
			SliceCenter = AssetsModule.Images.RoundedRect.SliceCenter,
			LayoutOrder = p1.props.LayoutOrder
		}, config)
	end)
end

function TextEntryField.render(p1) --[[ Line: 299 ]]
	-- upvalues: WithCursorMigration (copy)
	return WithCursorMigration(function(p2) --[[ Line: 300 ]]
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end)
end

function TextEntryField.didUpdate(p1, p2, _) --[[ Line: 305 ]]
	if p1.props.enabled or not p2.enabled then
		if p1.props.enabled and not p2.enabled and p1.props.autoFocusOnEnabled and p1.textBoxRef.current then
			p1.textBoxRef.current:CaptureFocus()
		end
	elseif p1.textBoxRef.current and p1.textBoxRef.current:IsFocused() then
		p1.textBoxRef.current:ReleaseFocus()
		
		return
	end
end

return Roact.forwardRef(function(p1, TextBoxRef) --[[ Line: 318 ]]
	-- upvalues: Roact (copy), TextEntryField (copy), Cryo (copy)
	return Roact.createElement(TextEntryField, Cryo.Dictionary.join(p1, { textBoxRef = TextBoxRef }))
end)