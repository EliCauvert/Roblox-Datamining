local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ThumbnailSideModule = require(Modules.AvatarExperience.Common.Components.Landing.ThumbnailSide)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local FFlagEnableCoreContentTheme = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableCoreContentTheme
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local WithStyleFunction = UIBloxModule.Style.withStyle
local NumberSequence1 = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.5, 1),
	NumberSequenceKeypoint.new(1, 0.1)
})
local PageButton = RoactModule.PureComponent:extend("PageButton")
PageButton.validateProps = TModule.strictInterface({
	Size = TModule.UDim2,
	backgroundImage = TModule.string,
	icon = TModule.union(TModule.string, TModule.table),
	text = TModule.string,
	transparencyModifier = TModule.number,
	onActivated = TModule.callback,
	getThumbnail = TModule.optional(TModule.callback),
	thumbnailImageYInsetScale = TModule.optional(TModule.number),
	thumbnailImage = TModule.optional(TModule.string),
	thumbnailSize = TModule.optional(TModule.integer),
	thumbnailScaleOffset = TModule.optional(TModule.Vector2),
	ignoreThumbnail = TModule.optional(TModule.boolean),
	thumbnailZoom = TModule.optional(TModule.number),
	extraThumbnails = TModule.optional(TModule.array(TModule.strictInterface({
		side = ThumbnailSideModule.isEnumValue,
		image = TModule.string,
		imageRectSize = TModule.optional(TModule.Vector2),
		imageRectOffset = TModule.optional(TModule.Vector2),
		paddingTopScale = TModule.optional(TModule.number),
		paddingBottomScale = TModule.optional(TModule.number),
		paddingSideScale = TModule.optional(TModule.number)
	}))),
	iconBeforeText = TModule.optional(TModule.boolean),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	[RoactModule.Children] = TModule.optional(TModule.table),
	forwardRef = TModule.optional(TModule.table),
	dropShadowTransparency = TModule.optional(TModule.number),
	dropShadowOffset = TModule.optional(TModule.Vector2),
	dropShadowColor = TModule.optional(TModule.Color3)
})
PageButton.defaultProps = {
	transparencyModifier = 0,
	thumbnailZoom = 1,
	dropShadowTransparency = 0.6,
	thumbnailScaleOffset = Vector2.new(0, 0),
	dropShadowOffset = Vector2.new(2, 2),
	dropShadowColor = Color3.new(0, 0, 0)
}

function PageButton.calculateShadowPosition(p1, Vector): UDim2
	return UDim2.new(p1.props.dropShadowOffset.X / Vector.X, 0, 1 + p1.props.dropShadowOffset.Y / Vector.Y, 0)
end

function PageButton.init(p1)
	-- upvalues: RoactModule (copy)
	p1.buttonSize, p1.updateButtonSize = RoactModule.createBinding(Vector2.new(1, 1))
	p1:setState({ imageButtonWidth = 0 })
end

function PageButton.renderSideThumbnail(p1, Left)
	-- upvalues: ThumbnailSideModule (copy), RoactModule (copy)
	if not p1.props.extraThumbnails then
		return nil
	end
	local v1 = nil
	
	for _, extraThumbnail in p1.props.extraThumbnails do
		if extraThumbnail.side == Left then
			v1 = extraThumbnail
			break
		end
	end
	if not v1 then
		return nil
	end
	local _Vector2 = nil
	local _UDim2 = nil
	if Left == ThumbnailSideModule.Left then
		_Vector2 = Vector2.new(0, 0)
		_UDim2 = UDim2.fromScale(v1.paddingSideScale, v1.paddingTopScale)
	else
		_Vector2 = Vector2.new(1, 0)
		_UDim2 = UDim2.fromScale(1 - v1.paddingSideScale, v1.paddingTopScale)
	end
	return RoactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Image = v1.image,
		ImageRectSize = v1.imageRectSize,
		ImageRectOffset = v1.imageRectOffset,
		AnchorPoint = _Vector2,
		Position = _UDim2,
		Size = p1.buttonSize:map(function(p2): UDim2
			-- upvalues: v1 (ref)
			local ScaledY = p2.Y * (1 - v1.paddingTopScale - v1.paddingBottomScale)
			
			return UDim2.fromOffset(v1.imageRectSize.X * ScaledY / v1.imageRectSize.Y, ScaledY)
		end)
	})
end

function PageButton:calcNormalizedSize(Vector, Y): Vector2
	return if Vector.Y < Vector.X then Vector2.new(Y * Vector.Y / Vector.X, Y) else Vector2.new(Y, Y * Vector.X / Vector.Y)
end

function PageButton.shouldUseImageRectSizeAndOffset(p2)
	return p2.props.thumbnailZoom > 1 and p2.props.thumbnailSize
end

function PageButton.renderThumbnail(p2)
	-- upvalues: RoactModule (copy), ConstantsModule (copy)
	if p2.props.ignoreThumbnail then
		return nil
	else
		local ThumbnailImage = p2.props.thumbnailImage
		local GetThumbnailFunction = p2.props.getThumbnail
		local TransparencyModifier = p2.props.transparencyModifier
		local ThumbnailPosition = p2:getThumbnailPosition()
		local ThumbnailSize = p2:getThumbnailSize()
		local ThumbnailImageRectOffset = p2:getThumbnailImageRectOffset()
		local ThumbnailImageRectSize = p2:getThumbnailImageRectSize()
		
		return if GetThumbnailFunction then GetThumbnailFunction(ThumbnailPosition, ThumbnailSize, ThumbnailImageRectOffset, ThumbnailImageRectSize, 2, {
			UICorner = RoactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, ConstantsModule.PageButtonCornerRadius)
			})
		}) else RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Image = ThumbnailImage,
			ImageTransparency = TransparencyModifier,
			Position = ThumbnailPosition,
			Size = ThumbnailSize,
			ImageRectOffset = ThumbnailImageRectOffset,
			ImageRectSize = ThumbnailImageRectSize
		}, {
			UICorner = RoactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, ConstantsModule.PageButtonCornerRadius)
			})
		})
	end
end

function PageButton.getThumbnailPosition(p2)
	if p2:shouldUseImageRectSizeAndOffset() then
		return UDim2.fromScale(0, 0)
	else
		local ThumbnailScaleOffset = p2.props.thumbnailScaleOffset
		
		return p2.buttonSize:map(function(Vector): UDim2
			-- upvalues: p2 (copy), ThumbnailScaleOffset (copy), ThumbnailScaleOffset (copy)
			local NewThumbnailScaleOffset = ThumbnailScaleOffset - p2:calcNormalizedSize(Vector, p2.props.thumbnailZoom) * Vector2.new(0.5, 0.5) + Vector2.new(0.5, 0.5)
			local _Vector2 = Vector2.new(math.max(NewThumbnailScaleOffset.X, ThumbnailScaleOffset.X - 0.5), (math.max(NewThumbnailScaleOffset.Y, ThumbnailScaleOffset.Y)))
			
			return UDim2.fromScale(_Vector2.X, _Vector2.Y)
		end)
	end
end

function PageButton.getThumbnailSize(p2)
	return if p2:shouldUseImageRectSizeAndOffset() then UDim2.fromScale(1, 1) else p2.buttonSize:map(function(Vector): UDim2
		-- upvalues: p2 (copy)
		local NormalizedSize = p2:calcNormalizedSize(Vector, p2.props.thumbnailZoom)
		
		return UDim2.fromScale(NormalizedSize.X, NormalizedSize.Y)
	end)
end

function PageButton.getThumbnailImageRectOffset(p2)
	return if p2:shouldUseImageRectSizeAndOffset() then p2.buttonSize:map(function(Vector): Vector2
		-- upvalues: p2 (copy)
		local NormalizedSize = p2:calcNormalizedSize(Vector, p2.props.thumbnailZoom)
		local _Vector2 = Vector2.new(p2.props.thumbnailSize / NormalizedSize.X, p2.props.thumbnailSize / NormalizedSize.Y)
		
		return (Vector2.new((p2.props.thumbnailSize - _Vector2.X) * 0.5, if p2.props.thumbnailImageYInsetScale then p2.props.thumbnailSize * p2.props.thumbnailImageYInsetScale else (p2.props.thumbnailSize - _Vector2.Y) * 0.5))
	end) else nil
end

function PageButton.getThumbnailImageRectSize(p2)
	return if p2:shouldUseImageRectSizeAndOffset() then p2.buttonSize:map(function(Vector): Vector2
		-- upvalues: p2 (copy)
		local NormalizedSize = p2:calcNormalizedSize(Vector, p2.props.thumbnailZoom)
		
		return Vector2.new(p2.props.thumbnailSize / NormalizedSize.X, p2.props.thumbnailSize / NormalizedSize.Y)
	end) else nil
end

function PageButton:renderTextComponent(IconBeforeText, p2, Text, ScaledBaseSize, TextColor3, TextTransparency, ImageButtonWidth: number)
	-- upvalues: UtilsModule (copy), RoactModule (copy)
	local ImageButtonWidthDelta: number = if IconBeforeText then ImageButtonWidth - 48 - 30 else ImageButtonWidth - 20
	
	if ImageButtonWidthDelta <= 0 then
		return nil
	else
		local LargestPossibleOneLineTextSize, LargestPossibleOneLineTextSize2 = UtilsModule.getLargestPossibleOneLineTextSize(Text, ScaledBaseSize, p2.Header1, ImageButtonWidthDelta)
		
		return if LargestPossibleOneLineTextSize == nil then nil else RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.fromOffset(LargestPossibleOneLineTextSize.X, LargestPossibleOneLineTextSize.Y),
			Font = p2.Header1.Font,
			Text = Text,
			TextColor3 = TextColor3,
			TextSize = LargestPossibleOneLineTextSize2,
			TextTransparency = TextTransparency
		})
	end
end

function PageButton.renderWithSelectionCursor(p2, Callback)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), Focusable (copy), CursorKind (copy), FFlagEnableCoreContentTheme (copy), ConstantsModule (copy), ThumbnailSideModule (copy), NumberSequence1 (copy), ImageSetLabel (copy)
	local Size = p2.props.Size
	local BackgroundImage = p2.props.backgroundImage
	local Icon = p2.props.icon
	local IconBeforeText = p2.props.iconBeforeText
	local Text = p2.props.text
	local TransparencyModifier = p2.props.transparencyModifier
	local NextSelectionLeft = p2.props.NextSelectionLeft
	local NextSelectionRight = p2.props.NextSelectionRight
	local NextSelectionUp = p2.props.NextSelectionUp
	local NextSelectionDown = p2.props.NextSelectionDown
	local _UDim2 = UDim2.new(1, 0, 0.6666666666666666, 0)
	
	return WithStyleFunction(function(p3)
		-- upvalues: p2 (copy), RoactModule (upval), Focusable (upval), Size (copy), NextSelectionLeft (copy), NextSelectionRight (copy), NextSelectionUp (copy), NextSelectionDown (copy), Callback (copy), CursorKind (upval), BackgroundImage (copy), TransparencyModifier (copy), FFlagEnableCoreContentTheme (upval), ConstantsModule (upval), ThumbnailSideModule (upval), NumberSequence1 (upval), _UDim2 (copy), IconBeforeText (copy), ImageSetLabel (upval), Icon (copy), Text (copy)
		local Theme = p3.Theme
		local _Font = p3.Font
		local ScaledBaseSize = _Font.BaseSize * _Font.Header1.RelativeSize
		local DropShadowTransparency = p2.props.dropShadowTransparency
		local DropShadowColor = p2.props.dropShadowColor
		
		return RoactModule.createElement(Focusable.ImageButton, {
			BackgroundTransparency = 0.9,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Size = Size,
			NextSelectionLeft = NextSelectionLeft,
			NextSelectionRight = NextSelectionRight,
			NextSelectionUp = NextSelectionUp,
			NextSelectionDown = NextSelectionDown,
			[RoactModule.Ref] = p2.props.forwardRef,
			SelectionImageObject = Callback(CursorKind.RoundedRectNoInset),
			[RoactModule.Event.Activated] = p2.props.onActivated,
			[RoactModule.Change.AbsoluteSize] = function(Frame: Frame)
				-- upvalues: p2 (upval)
				p2:setState({ imageButtonWidth = Frame.AbsoluteSize.X })
				p2.updateButtonSize(Frame.AbsoluteSize)
			end
		}, {
			BackgroundImage = RoactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = BackgroundImage,
				ImageTransparency = TransparencyModifier,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.fromScale(1, 1),
				ScaleType = Enum.ScaleType.Crop,
				ZIndex = if FFlagEnableCoreContentTheme then 0 else 1
			}, {
				UICorner = RoactModule.createElement("UICorner", {
					CornerRadius = UDim.new(0, ConstantsModule.PageButtonCornerRadius)
				})
			}),
			BackgroundImageOverlay = if FFlagEnableCoreContentTheme then RoactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				ZIndex = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = BackgroundImage,
				ImageColor3 = Theme.BackgroundUIDefault.Color,
				ImageTransparency = 1 - (1 - TransparencyModifier) * 0.5,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.fromScale(1, 1),
				ScaleType = Enum.ScaleType.Crop
			}, {
				UICorner = RoactModule.createElement("UICorner", {
					CornerRadius = UDim.new(0, ConstantsModule.PageButtonCornerRadius)
				})
			}) else nil,
			Thumbnail = p2:renderThumbnail(),
			LeftThumbnail = p2:renderSideThumbnail(ThumbnailSideModule.Left),
			RightThumbnail = p2:renderSideThumbnail(ThumbnailSideModule.Right),
			Overlay = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 3,
				BackgroundTransparency = TransparencyModifier,
				BackgroundColor3 = Theme.Overlay.Color,
				Size = UDim2.fromScale(1, 1)
			}, {
				Gradient = RoactModule.createElement("UIGradient", {
					Rotation = 90,
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)),
						ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
					}),
					Transparency = NumberSequence1
				}),
				UICorner = RoactModule.createElement("UICorner", {
					CornerRadius = UDim.new(0, ConstantsModule.PageButtonCornerRadius)
				})
			}),
			ForegroundShadow = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 4,
				AnchorPoint = Vector2.new(0, 1),
				Position = p2.buttonSize:map(function(p4)
					-- upvalues: p2 (upval)
					return p2:calculateShadowPosition(p4)
				end),
				Size = p2.props.iconBeforeText and UDim2.fromScale(1, 1) or _UDim2
			}, {
				uiSizeConstraint = if p2.props.iconBeforeText then nil else RoactModule.createElement("UISizeConstraint", {
					MinSize = Vector2.new(0, ConstantsModule.PageButtonForegroundMinHeightPix)
				}) or nil,
				UIListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = IconBeforeText and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 10)
				}),
				IconShadow = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Image = Icon,
					ImageColor3 = DropShadowColor,
					ImageTransparency = DropShadowTransparency,
					Size = UDim2.new(0, 48, 0, 48)
				}),
				DropShadow = p2:renderTextComponent(IconBeforeText, _Font, Text, ScaledBaseSize, DropShadowColor, DropShadowTransparency, p2.state.imageButtonWidth)
			}),
			Foreground = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 4,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				Size = p2.props.iconBeforeText and UDim2.fromScale(1, 1) or _UDim2
			}, {
				uiSizeConstraint = if p2.props.iconBeforeText then nil else RoactModule.createElement("UISizeConstraint", {
					MinSize = Vector2.new(0, ConstantsModule.PageButtonForegroundMinHeightPix)
				}) or nil,
				UIListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = IconBeforeText and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 10)
				}),
				Icon = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Image = Icon,
					ImageTransparency = TransparencyModifier,
					Size = UDim2.new(0, 48, 0, 48)
				}),
				Text = p2:renderTextComponent(IconBeforeText, _Font, Text, ScaledBaseSize, Color3.new(1, 1, 1), TransparencyModifier, p2.state.imageButtonWidth)
			}),
			UICorner = RoactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, ConstantsModule.PageButtonCornerRadius)
			})
		})
	end)
end

function PageButton.render(p2)
	-- upvalues: WithSelectionCursorProviderFunction (copy)
	return WithSelectionCursorProviderFunction(function(p3)
		-- upvalues: p2 (copy)
		return p2:renderWithSelectionCursor(p3)
	end)
end

return RoactModule.forwardRef(function(p2, ForwardRef)
	-- upvalues: RoactModule (copy), PageButton (copy), CryoModule (copy)
	return RoactModule.createElement(PageButton, CryoModule.Dictionary.join(p2, { forwardRef = ForwardRef }))
end)