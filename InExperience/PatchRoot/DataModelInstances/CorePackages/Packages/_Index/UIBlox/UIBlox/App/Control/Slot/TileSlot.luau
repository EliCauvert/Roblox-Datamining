local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local Core = Parent1.Core
local ReactModule = require(Parent2.React)
local ControlStateModule = require(Core.Control.Enum.ControlState)
local GetContentStyleModule = require(Core.Button.getContentStyle)
local InteractableModule = require(Core.Control.Interactable)
local UseStyleModule = require(Core.Style.useStyle)
local ImageSetComponentModule = require(Core.ImageSet.ImageSetComponent)
local Skeleton = require(Parent2.Foundation).Skeleton
local GenericTextLabelModule = require(Core.Text.GenericTextLabel.GenericTextLabel)
local ImagesModule = require(Parent.ImageSet.Images)
local IconSizeModule = require(Parent.ImageSet.Enum.IconSize)
local GetIconSizeModule = require(Parent.ImageSet.getIconSize)
local ComponentAssetsCircle9 = ImagesModule["component_assets/circle_9"]
local ComponentAssetsCircle9Stroke1 = ImagesModule["component_assets/circle_9_stroke_1"]
local config = {
	[ControlStateModule.Default] = "SecondaryDefault",
	[ControlStateModule.Hover] = "SecondaryOnHover"
}
local config1 = {
	[ControlStateModule.Default] = "SecondaryDefault",
	[ControlStateModule.Hover] = "SecondaryDefault"
}
local config2 = {
	[ControlStateModule.Default] = "TextDefault",
	[ControlStateModule.Hover] = "TextEmphasis"
}
local config3 = {
	[ControlStateModule.Default] = "TextEmphasis",
	[ControlStateModule.Hover] = "TextEmphasis"
}
local config4 = { [ControlStateModule.Default] = "BackgroundMuted" }
local config5 = { [ControlStateModule.Default] = "PlaceHolder" }
local config6 = { [ControlStateModule.Default] = "PlaceHolder" }
local config7 = { [ControlStateModule.Default] = "TextEmphasis" }

return function(p1)
	-- upvalues: ReactModule (copy), ControlStateModule (copy), UseStyleModule (copy), GetContentStyleModule (copy), config1 (copy), config (copy), config3 (copy), config2 (copy), config7 (copy), config5 (copy), config4 (copy), config6 (copy), InteractableModule (copy), ImageSetComponentModule (copy), ComponentAssetsCircle9 (copy), ComponentAssetsCircle9Stroke1 (copy), GetIconSizeModule (copy), IconSizeModule (copy), GenericTextLabelModule (copy), Skeleton (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(ControlStateModule.Initialize)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.onActivated(p1.index)
	end, { p1.onActivated, p1.index })
	local UseResult1 = ReactModule.useCallback(function(p2, Hover)
		-- upvalues: UseStateResult2 (copy), ControlStateModule (upval), UseStateResult2_1 (copy), p1 (copy)
		UseStateResult2(Hover)
		
		if Hover == ControlStateModule.Hover then
			UseStateResult2_1(true)
		else
			UseStateResult2_1(false)
		end
		if p1.onStateChanged then
			p1.onStateChanged(p2, Hover)
		end
	end, { p1.onStateChanged })
	local UseStyleModuleResult = UseStyleModule()
	local IsDisabled = p1.isDisabled
	local IsLoading = p1.isLoading
	local Disabled = IsDisabled and ControlStateModule.Disabled or UseStateResult
	local IsSelected = p1.isSelected
	local UseStateResult1_1 = UseStateResult1 or IsSelected
	local ContentStyleModule = IsSelected and GetContentStyleModule(config1, Disabled, UseStyleModuleResult) or GetContentStyleModule(config, Disabled, UseStyleModuleResult)
	local ContentStyleModule1 = IsSelected and GetContentStyleModule(config3, Disabled, UseStyleModuleResult) or GetContentStyleModule(config2, Disabled, UseStyleModuleResult)
	local ContentStyleModule2 = GetContentStyleModule(config7, Disabled, UseStyleModuleResult)
	local ContentStyleModule3 = IsSelected and GetContentStyleModule(config5, Disabled, UseStyleModuleResult) or GetContentStyleModule(config4, Disabled, UseStyleModuleResult)
	local ContentStyleModule4 = GetContentStyleModule(config6, Disabled, UseStyleModuleResult)
	local SubHeader1 = UseStyleModuleResult.Font.SubHeader1
	local Thumbnail = p1.thumbnail
	local HasThumbnail = p1.thumbnail ~= nil
	local HasDisplayText = p1.displayText ~= nil
	local IsDisabled1 = IsDisabled or IsLoading
	
	if IsDisabled1 then
		UseStateResult1_1 = false
	end
	return ReactModule.createElement(InteractableModule, {
		Size = UDim2.fromOffset(48, 48),
		Position = p1.position or UDim2.fromScale(0, 0),
		BackgroundTransparency = 1,
		onStateChanged = UseResult1,
		[ReactModule.Event.Activated] = if IsDisabled1 then nil else UseResult or nil
	}, {
		Button = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
			Background = ReactModule.createElement(ImageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				ZIndex = 1,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromScale(0, 0),
				Image = ComponentAssetsCircle9,
				ImageColor3 = HasDisplayText and ContentStyleModule3.Color or ContentStyleModule4.Color,
				ImageTransparency = HasDisplayText and ContentStyleModule3.Transparency or ContentStyleModule4.Transparency,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(4, 4, 5, 5)
			}),
			Border = if UseStateResult1_1 then ReactModule.createElement(ImageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromScale(0, 0),
				Image = ComponentAssetsCircle9Stroke1,
				ImageColor3 = ContentStyleModule.Color,
				ImageTransparency = ContentStyleModule.Transparency,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(4, 4, 5, 5)
			}) else nil,
			ButtonContentLayer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 3,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromScale(0, 0)
			}, {
				Thumbnail = if IsLoading or not HasThumbnail then nil else ReactModule.createElement(ImageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					ZIndex = 3,
					Size = UDim2.fromOffset(GetIconSizeModule(IconSizeModule.Medium), GetIconSizeModule(IconSizeModule.Medium)),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Image = Thumbnail,
					ImageColor3 = ContentStyleModule2.Color,
					ImageTransparency = ContentStyleModule2.Transparency
				}),
				Text = if IsLoading or not HasDisplayText then nil else ReactModule.createElement(GenericTextLabelModule, {
					BackgroundTransparency = 1,
					ZIndex = 3,
					Size = UDim2.new(1, -24, 1, -24),
					Text = p1.displayText,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					fontStyle = SubHeader1,
					colorStyle = ContentStyleModule1
				}),
				LoadingShimmer = if IsLoading then ReactModule.createElement(Skeleton, { Size = UDim2.fromScale(1, 1) }) else nil
			})
		})
	})
end