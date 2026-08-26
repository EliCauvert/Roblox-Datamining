local textService = game:GetService("TextService")
local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local cryo = inGameMenuDependenciesModule.Cryo
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local images = UIBlox.App.ImageSet.Images
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var1 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var2 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local parent = script.Parent.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local fillCircleModule = require(script.Parent.FillCircle)
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local image = foundationModule.Image
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

function textEntryField.init(p1)
	-- upvalues: roact (ref)
	p1.textBoxRef = p1.props.textBoxRef or roact.createRef()
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
		local var3 = p3.RelativeSize * p2.Font.BaseSize
		local var4 = textService:GetTextSize(p5.text:sub(1, p4.cursorPosition - 1), var3, p3.Font, Vector2.new(p5.textBoxWidth, 10000))
		
		return if p4.scrollingFrameHeight + p4.canvasPosition < var4.Y then { canvasPosition = var4.Y - p4.scrollingFrameHeight } elseif var4.Y - var3 < p4.canvasPosition then { canvasPosition = var4.Y - var3 } else nil
	end)
end

function textEntryField.renderWithSelectionCursor(p1, p2)
	-- upvalues: withFoundationOrUIBloxStyle (ref), textService (ref), circle17 (ref), roact (ref), var2 (ref), themedTextLabelModule (ref), images (ref), fillCircleModule (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), assetsModule (ref), imageSetLabel (ref)
	return withFoundationOrUIBloxStyle(function(p3)
		return {
			Theme = {
				TextDefault = {
					Color = p3.Color.Content.Default.Color3,
					Transparency = p3.Color.Content.Default.Transparency
				},
				BackgroundMuted = {
					Color = p3.Color.Surface.Surface_200.Color3,
					Transparency = p3.Color.Surface.Surface_200.Transparency
				}
			},
			Font = {
				BaseSize = 1,
				Body = {
					Font = p3.Typography.BodyLarge.Font,
					RelativeSize = p3.Typography.BodyLarge.FontSize
				}
			}
		}
	end, function(p3)
		-- upvalues: textService (copy), p1 (ref), circle17 (copy), roact (copy), p2 (ref), var2 (copy), themedTextLabelModule (copy), images (copy), fillCircleModule (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), image (copy), assetsModule (copy), imageSetLabel (copy)
		local textDefault = p3.Theme.TextDefault
		local body = p3.Font.Body
		local textTextSize = textService:GetTextSize(p1.props.text, body.RelativeSize * p3.Font.BaseSize, body.Font, Vector2.new(p1.state.textBoxWidth, 10000))
		local imageRectOffset = circle17.ImageRectOffset
		local x = circle17.ImageRectSize.X
		local var3 = x / 2
		local t = {
			ScrollingFrame = roact.createElement("ScrollingFrame", {
				Size = UDim2.new(1, -24, 1, -44),
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 7),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				CanvasSize = UDim2.new(1, -24, 0, textTextSize.Y),
				ScrollBarThickness = 8,
				VerticalScrollBarInset = Enum.ScrollBarInset.Always,
				CanvasPosition = Vector2.new(0, p1.state.canvasPosition),
				Selectable = false,
				[roact.Change.CanvasPosition] = function(p4)
					-- upvalues: p1 (copy)
					p1:setState({ canvasPosition = p4.CanvasPosition.Y })
				end,
				[roact.Change.AbsoluteSize] = function(p4)
					-- upvalues: p1 (copy), p3 (ref), body (ref)
					p1:setState({ scrollingFrameHeight = p4.AbsoluteSize.Y }, function()
						-- upvalues: p1 (copy), p3 (copy), body (copy)
						p1:calculateNeedsRescroll(p3, body)
					end)
				end
			}, {
				TextBox = roact.createElement("TextBox", {
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
					SelectionImageObject = p2(var2.InputFields),
					[roact.Ref] = p1.textBoxRef,
					[roact.Change.Text] = function(p4)
						-- upvalues: p1 (copy), p3 (ref), body (ref)
						if p1.props.maxTextLength < utf8.len(utf8.nfcnormalize(p4.Text)) then
							p4.Text = string.sub(p4.Text, 1, utf8.offset(p4.Text, p1.props.maxTextLength + 1) - 1)
							
							return
						end
						p1.props.textChanged(p4.Text)
						p1:setState({ cursorPosition = p4.CursorPosition }, function()
							-- upvalues: p1 (copy), p3 (copy), body (copy)
							p1:calculateNeedsRescroll(p3, body)
						end)
					end,
					[roact.Change.AbsoluteSize] = function(p4)
						-- upvalues: p1 (copy), p3 (ref), body (ref)
						p1:setState({ textBoxWidth = p4.AbsoluteSize.X }, function()
							-- upvalues: p1 (copy), p3 (copy), body (copy)
							p1:calculateNeedsRescroll(p3, body)
						end)
					end,
					[roact.Change.CursorPosition] = function(p4)
						-- upvalues: p1 (copy), p3 (ref), body (ref)
						p1:setState({ cursorPosition = p4.CursorPosition }, function()
							-- upvalues: p1 (copy), p3 (copy), body (copy)
							p1:calculateNeedsRescroll(p3, body)
						end)
					end
				}, {
					PlaceholderText = roact.createElement(themedTextLabelModule, {
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
			BottomBar = roact.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				Image = circle17.Image,
				ImageColor3 = p3.Theme.BackgroundMuted.Color,
				ScaleType = Enum.ScaleType.Slice,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, 32),
				SliceCenter = Rect.new(var3 - 1, 0, var3 + 1, 1),
				SliceScale = 1 / images.ImagesResolutionScale,
				ImageRectSize = Vector2.new(x, var3),
				ImageRectOffset = imageRectOffset + Vector2.new(0, var3)
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
						fillFraction = utf8.len(utf8.nfcnormalize(p1.props.text)) / (p1.props.maxTextLength - 10),
						largerCircleFraction = (p1.props.maxTextLength - 20) / p1.props.maxTextLength,
						shakeCircleFraction = p1.props.maxTextLength / (p1.props.maxTextLength - 10),
						BackgroundColor = p3.Theme.BackgroundMuted.Color
					})
				})
			})
		}
		
		return if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
			Image = assetsModule.Images.RoundedRectImageKey,
			imageStyle = {
				Color3 = p3.Theme.BackgroundMuted.Color,
				Transparency = p3.Theme.BackgroundMuted.Transparency
			},
			Position = p1.props.Position,
			Size = p1.props.Size,
			LayoutOrder = p1.props.LayoutOrder,
			slice = { center = Rect.new(8, 8, 9, 9) }
		}, t) else roact.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Image = assetsModule.Images.RoundedRect.Image,
			ImageColor3 = p3.Theme.BackgroundMuted.Color,
			ImageTransparency = p3.Theme.BackgroundMuted.Transparency,
			Position = p1.props.Position,
			ScaleType = assetsModule.Images.RoundedRect.ScaleType,
			Size = p1.props.Size,
			SliceCenter = assetsModule.Images.RoundedRect.SliceCenter,
			LayoutOrder = p1.props.LayoutOrder
		}, t)
	end)
end

function textEntryField.render(p1)
	-- upvalues: var1 (ref)
	return var1(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithSelectionCursor(p2)
	end)
end

function textEntryField.didUpdate(p1, p2, _)
	if not p1.props.enabled and p2.enabled then
		if p1.textBoxRef.current and p1.textBoxRef.current:IsFocused() then
			p1.textBoxRef.current:ReleaseFocus()
			
			return
		end
	elseif p1.props.enabled and not p2.enabled and (p1.props.autoFocusOnEnabled and p1.textBoxRef.current) then
		p1.textBoxRef.current:CaptureFocus()
	end
end

return roact.forwardRef(function(p1, p2)
	-- upvalues: roact (ref), textEntryField (ref), cryo (ref)
	return roact.createElement(textEntryField, cryo.Dictionary.join(p1, { textBoxRef = p2 }))
end)