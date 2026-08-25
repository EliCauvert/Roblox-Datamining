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
local var4 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var5 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
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

function textEntryField.init(p0)
	-- upvalues: roact (ref)
	p0.textBoxRef = p0.props.textBoxRef or roact.createRef()
	p0.state = {
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
		local var10 = p3.RelativeSize * p2.Font.BaseSize
		local var11 = textService:GetTextSize(p5.text:sub(1, p4.cursorPosition - 1), var10, p3.Font, Vector2.new(p5.textBoxWidth, 10000))
		
		return if p4.scrollingFrameHeight + p4.canvasPosition < var11.Y then { canvasPosition = var11.Y - p4.scrollingFrameHeight } elseif var11.Y - var10 < p4.canvasPosition then { canvasPosition = var11.Y - var10 } else nil
	end)
end

function textEntryField.renderWithSelectionCursor(p6, p7)
	-- upvalues: withFoundationOrUIBloxStyle (ref), textService (ref), circle17 (ref), roact (ref), var5 (ref), themedTextLabelModule (ref), images (ref), fillCircleModule (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), assetsModule (ref), imageSetLabel (ref)
	return withFoundationOrUIBloxStyle(function(p8)
		return {
			Theme = {
				TextDefault = {
					Color = p8.Color.Content.Default.Color3,
					Transparency = p8.Color.Content.Default.Transparency
				},
				BackgroundMuted = {
					Color = p8.Color.Surface.Surface_200.Color3,
					Transparency = p8.Color.Surface.Surface_200.Transparency
				}
			},
			Font = {
				BaseSize = 1,
				Body = {
					Font = p8.Typography.BodyLarge.Font,
					RelativeSize = p8.Typography.BodyLarge.FontSize
				}
			}
		}
	end, function(p9)
		-- upvalues: textService (copy), p6 (ref), circle17 (copy), roact (copy), p7 (ref), var5 (copy), themedTextLabelModule (copy), images (copy), fillCircleModule (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), image (copy), assetsModule (copy), imageSetLabel (copy)
		local textDefault = p9.Theme.TextDefault
		local body = p9.Font.Body
		local textTextSize = textService:GetTextSize(p6.props.text, body.RelativeSize * p9.Font.BaseSize, body.Font, Vector2.new(p6.state.textBoxWidth, 10000))
		local imageRectOffset = circle17.ImageRectOffset
		local x = circle17.ImageRectSize.X
		local var13 = x / 2
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
				CanvasPosition = Vector2.new(0, p6.state.canvasPosition),
				Selectable = false,
				[roact.Change.CanvasPosition] = function(p10)
					-- upvalues: p6 (copy)
					p6:setState({ canvasPosition = p10.CanvasPosition.Y })
				end,
				[roact.Change.AbsoluteSize] = function(p11)
					-- upvalues: p6 (copy), p9 (ref), body (ref)
					p6:setState({ scrollingFrameHeight = p11.AbsoluteSize.Y }, function()
						-- upvalues: p6 (copy), p9 (copy), body (copy)
						p6:calculateNeedsRescroll(p9, body)
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
					TextSize = body.RelativeSize * p9.Font.BaseSize,
					TextWrapped = true,
					SelectionImageObject = p7(var5.InputFields),
					[roact.Ref] = p6.textBoxRef,
					[roact.Change.Text] = function(p12)
						-- upvalues: p6 (copy), p9 (ref), body (ref)
						if p6.props.maxTextLength < utf8.len(utf8.nfcnormalize(p12.Text)) then
							p12.Text = string.sub(p12.Text, 1, utf8.offset(p12.Text, p6.props.maxTextLength + 1) - 1)
							
							return
						end
						p6.props.textChanged(p12.Text)
						p6:setState({ cursorPosition = p12.CursorPosition }, function()
							-- upvalues: p6 (copy), p9 (copy), body (copy)
							p6:calculateNeedsRescroll(p9, body)
						end)
					end,
					[roact.Change.AbsoluteSize] = function(p13)
						-- upvalues: p6 (copy), p9 (ref), body (ref)
						p6:setState({ textBoxWidth = p13.AbsoluteSize.X }, function()
							-- upvalues: p6 (copy), p9 (copy), body (copy)
							p6:calculateNeedsRescroll(p9, body)
						end)
					end,
					[roact.Change.CursorPosition] = function(p14)
						-- upvalues: p6 (copy), p9 (ref), body (ref)
						p6:setState({ cursorPosition = p14.CursorPosition }, function()
							-- upvalues: p6 (copy), p9 (copy), body (copy)
							p6:calculateNeedsRescroll(p9, body)
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
				ImageColor3 = p9.Theme.BackgroundMuted.Color,
				ScaleType = Enum.ScaleType.Slice,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, 32),
				SliceCenter = Rect.new(var13 - 1, 0, var13 + 1, 1),
				SliceScale = 1 / images.ImagesResolutionScale,
				ImageRectSize = Vector2.new(x, var13),
				ImageRectOffset = imageRectOffset + Vector2.new(0, var13)
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
						BackgroundColor = p9.Theme.BackgroundMuted.Color
					})
				})
			})
		}
		
		return if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
			Image = assetsModule.Images.RoundedRectImageKey,
			imageStyle = {
				Color3 = p9.Theme.BackgroundMuted.Color,
				Transparency = p9.Theme.BackgroundMuted.Transparency
			},
			Position = p6.props.Position,
			Size = p6.props.Size,
			LayoutOrder = p6.props.LayoutOrder,
			slice = { center = Rect.new(8, 8, 9, 9) }
		}, t) else roact.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Image = assetsModule.Images.RoundedRect.Image,
			ImageColor3 = p9.Theme.BackgroundMuted.Color,
			ImageTransparency = p9.Theme.BackgroundMuted.Transparency,
			Position = p6.props.Position,
			ScaleType = assetsModule.Images.RoundedRect.ScaleType,
			Size = p6.props.Size,
			SliceCenter = assetsModule.Images.RoundedRect.SliceCenter,
			LayoutOrder = p6.props.LayoutOrder
		}, t)
	end)
end

function textEntryField.render(p15)
	-- upvalues: var4 (ref)
	return var4(function(p16)
		-- upvalues: p15 (ref)
		return p15:renderWithSelectionCursor(p16)
	end)
end

function textEntryField.didUpdate(p17, p18, _)
	if not p17.props.enabled and p18.enabled then
		if p17.textBoxRef.current and p17.textBoxRef.current:IsFocused() then
			p17.textBoxRef.current:ReleaseFocus()
			
			return
		end
	elseif p17.props.enabled and not p18.enabled and (p17.props.autoFocusOnEnabled and p17.textBoxRef.current) then
		p17.textBoxRef.current:CaptureFocus()
	end
end

return roact.forwardRef(function(p19, p20)
	-- upvalues: roact (ref), textEntryField (ref), cryo (ref)
	return roact.createElement(textEntryField, cryo.Dictionary.join(p19, { textBoxRef = p20 }))
end)