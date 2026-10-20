local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local Core = Parent1.Core
local CryoModule = require(Parent2.Cryo)
local ReactModule = require(Parent2.React)
local FoundationModule = require(Parent2.Foundation)
local ImagesModule = require(Parent.ImageSet.Images)
local IconSizeModule = require(Parent.ImageSet.Enum.IconSize)
local GetIconSizeModule = require(Parent.ImageSet.getIconSize)
local UseSelectionCursorModule = require(Parent.SelectionImage.useSelectionCursor)
local CursorKindModule = require(Parent.SelectionImage.CursorKind)
local UseStyleModule = require(Core.Style.useStyle)
local ControlStateModule = require(Core.Control.Enum.ControlState)
local InteractableModule = require(Core.Control.Interactable)
local UseControlStateModule = require(Core.Control.useControlState)
local GetContentStyleModule = require(Core.Button.getContentStyle)
local GenericTextLabelModule = require(Core.Text.GenericTextLabel.GenericTextLabel)
local ImageSetComponentModule = require(Parent1.Core.ImageSet.ImageSetComponent)
local Skeleton = FoundationModule.Skeleton
local Radius = FoundationModule.Enums.Radius
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local GetTextSizeModule = require(Parent1.Core.Text.GetTextSize)
local GetFontFromFontStyleModule = require(Parent1.Core.Text.GetFontFromFontStyle)
local config = {
	hasBorder = false,
	isDisabled = false,
	isLoading = false,
	isSelected = false,
	layoutOrder = 1,
	text = ""
}
local config1 = {
	[ControlStateModule.Default] = "SystemPrimaryContent",
	[ControlStateModule.Hover] = "SystemPrimaryContent"
}
local config2 = {
	[ControlStateModule.Default] = "TextDefault",
	[ControlStateModule.Hover] = "TextEmphasis"
}
local config3 = {
	[ControlStateModule.Default] = "SystemPrimaryContent",
	[ControlStateModule.Hover] = "SystemPrimaryContent"
}
local config4 = {
	[ControlStateModule.Default] = "BackgroundUIDefault",
	[ControlStateModule.Hover] = "BackgroundUIDefault"
}
local config5 = {
	[ControlStateModule.Default] = "SystemPrimaryDefault",
	[ControlStateModule.Hover] = "SystemPrimaryOnHover"
}
local config6 = {
	[ControlStateModule.Default] = "BackgroundOnHover",
	[ControlStateModule.Hover] = "BackgroundOnHover"
}

local function Pillv2(p1)
	-- upvalues: CryoModule (copy), config (copy), UseControlStateModule (copy), ReactModule (copy), UseStyleModule (copy), UseSelectionCursorModule (copy), CursorKindModule (copy), config3 (copy), config2 (copy), config5 (copy), config4 (copy), GetContentStyleModule (copy), config1 (copy), config6 (copy), GetIconSizeModule (copy), IconSizeModule (copy), GetTextSizeModule (copy), FoundationFontFaceMigration (copy), GetFontFromFontStyleModule (copy), Skeleton (copy), Radius (copy), ControlStateModule (copy), InteractableModule (copy), GenericTextLabelModule (copy), ImageSetComponentModule (copy), ImagesModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local Text: string = JoinResult.text
	local UseControlStateModuleResult, UseControlStateModuleResult2 = UseControlStateModule()
	local UseResult = ReactModule.useCallback(function(p2, p3)
		-- upvalues: JoinResult (copy), UseControlStateModuleResult2 (copy)
		if JoinResult.onStateChanged then
			JoinResult.onStateChanged(p2, p3)
		end
		UseControlStateModuleResult2(p2, p3)
	end, { JoinResult.onStateChanged })
	local UseStyleModuleResult = UseStyleModule()
	local UseStyleModuleResultFont = UseStyleModuleResult.Font
	local UseSelectionCursorModuleResult = UseSelectionCursorModule(CursorKindModule.SmallPill)
	local ContentStyleModule = GetContentStyleModule(config1, UseControlStateModuleResult, UseStyleModuleResult)
	local ContentStyleModule1 = GetContentStyleModule(if JoinResult.isSelected then config3 else config2, UseControlStateModuleResult, UseStyleModuleResult)
	local ContentStyleModule2 = GetContentStyleModule(if JoinResult.isSelected then config5 else config4, UseControlStateModuleResult, UseStyleModuleResult)
	local ContentStyleModule3 = GetContentStyleModule(config6, UseControlStateModuleResult, UseStyleModuleResult)
	local IconSizeModule1: number = GetIconSizeModule(IconSizeModule.Small)
	local ScaledRelativeSize = UseStyleModuleResultFont.CaptionHeader.RelativeSize * UseStyleModuleResultFont.BaseSize
	local X: number = GetTextSizeModule(Text, ScaledRelativeSize, if FoundationFontFaceMigration then GetFontFromFontStyleModule(UseStyleModuleResultFont.CaptionHeader) else UseStyleModuleResultFont.CaptionHeader.Font, Vector2.new(10000, 10000)).X
	local XOffset = X + 24
	local XOffset1 = 216
	
	if JoinResult.isSelected then
		local NewIconSizeModule = 4 + IconSizeModule1
		XOffset += NewIconSizeModule
		XOffset1 -= NewIconSizeModule
	end
	if JoinResult.isLoading then
		return ReactModule.createElement(Skeleton, {
			LayoutOrder = JoinResult.layoutOrder,
			Size = UDim2.fromOffset(XOffset, 28),
			radius = Radius.Circle
		})
	else
		local IsUseControlStateModuleResultMatch: boolean = not JoinResult.isSelected and UseControlStateModuleResult == ControlStateModule.Hover
		
		return ReactModule.createElement(InteractableModule, {
			Size = UDim2.new(0, XOffset, 0, 28),
			BackgroundColor3 = ContentStyleModule2.Color,
			BackgroundTransparency = ContentStyleModule2.Transparency,
			ImageColor3 = ContentStyleModule2.Color,
			ImageTransparency = ContentStyleModule2.Transparency,
			AutoButtonColor = false,
			BorderSizePixel = 0,
			LayoutOrder = JoinResult.layoutOrder,
			ScaleType = Enum.ScaleType.Slice,
			isDisabled = JoinResult.isDisabled,
			SelectionImageObject = UseSelectionCursorModuleResult,
			[ReactModule.Event.Activated] = if JoinResult.isLoading then nil else JoinResult.onActivated,
			onStateChanged = UseResult,
			ref = JoinResult.controlRef,
			NextSelectionLeft = JoinResult.NextSelectionLeft,
			NextSelectionRight = JoinResult.NextSelectionRight,
			NextSelectionUp = JoinResult.NextSelectionUp,
			NextSelectionDown = JoinResult.NextSelectionDown
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
				MinSize = Vector2.new(28, 28),
				MaxSize = Vector2.new(240, 28)
			}),
			BackgroundLayer2 = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = ContentStyleModule3.Color,
				BackgroundTransparency = if IsUseControlStateModuleResultMatch then ContentStyleModule3.Transparency else 1
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
				UIStroke = if JoinResult.hasBorder then ReactModule.createElement("UIStroke", {
					Thickness = 1,
					Color = UseStyleModuleResult.Theme.Divider.Color,
					Transparency = UseStyleModuleResult.Theme.Divider.Transparency
				}) else nil,
				Content = ReactModule.createElement("Frame", {
					ClipsDescendants = true,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Size = UDim2.new(0, X + 4 + IconSizeModule1, 1, 0)
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", {
						Padding = UDim.new(0, 4),
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalAlignment = Enum.HorizontalAlignment.Center
					}),
					TextArea = string.len(Text) > 0 and ReactModule.createElement("Frame", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						Size = UDim2.fromOffset(X, ScaledRelativeSize)
					}, {
						PillText = ReactModule.createElement(GenericTextLabelModule, {
							BackgroundTransparency = 1,
							Text = Text,
							fontStyle = UseStyleModuleResultFont.CaptionHeader,
							colorStyle = ContentStyleModule1,
							TextTruncate = Enum.TextTruncate.AtEnd,
							Size = UDim2.fromOffset(XOffset1, ScaledRelativeSize),
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Center
						}),
						ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(XOffset1, 28) })
					}),
					CloseIcon = JoinResult.isSelected and ReactModule.createElement(ImageSetComponentModule.Label, {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Size = UDim2.fromOffset(IconSizeModule1, IconSizeModule1),
						Image = ImagesModule["icons/navigation/close_small"],
						ImageColor3 = ContentStyleModule.Color,
						ImageTransparency = ContentStyleModule.Transparency
					}),
					UISizeConstraint = ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(216, 28) })
				})
			})
		})
	end
end

return ReactModule.forwardRef(function(p1, ControlRef)
	-- upvalues: ReactModule (copy), Pillv2 (copy), CryoModule (copy)
	return ReactModule.createElement(Pillv2, CryoModule.Dictionary.join(p1, { controlRef = ControlRef }))
end)