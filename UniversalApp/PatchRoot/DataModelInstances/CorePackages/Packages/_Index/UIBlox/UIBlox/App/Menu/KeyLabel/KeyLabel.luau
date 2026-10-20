local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local FoundationModule = require(Parent3.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local ReactModule = require(Parent3.React)
local LuauPolyfillModule = require(Parent3.LuauPolyfill)
local _ = require(Parent.Types)
local ConstantsModule = require(Parent.Constants)
local UtilitiesModule = require(Parent.Utilities)
local UseStyleModule = require(Parent2.Core.Style.useStyle)
local GetFontFromFontStyleModule = require(Parent2.Core.Text.GetFontFromFontStyle)
local ImagesModule = require(Parent1.ImageSet.Images)
local Label = require(Parent2.Core.ImageSet.ImageSetComponent).Label

return function(Frame: Frame)
	-- upvalues: UseStyleModule (copy), ConstantsModule (copy), UtilitiesModule (copy), ReactModule (copy), ImagesModule (copy), Label (copy), LuauPolyfillModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), GetFontFromFontStyleModule (copy)
	local UseStyleModuleResult = UseStyleModule()
	local ThemeEntry = UseStyleModuleResult.Theme[Frame.iconThemeKey or ConstantsModule.DEFAULT_ICON_THEME]
	local KeyCodeContent = UtilitiesModule.getKeyCodeContent(Frame.keyCode)
	local config = {
		AnchorPoint = Frame.AnchorPoint,
		Position = Frame.Position,
		LayoutOrder = Frame.LayoutOrder,
		ZIndex = Frame.ZIndex,
		[ReactModule.Change.AbsoluteSize] = Frame[ReactModule.Change.AbsoluteSize],
		Size = UDim2.fromOffset(UtilitiesModule.getWidthFromContent(KeyCodeContent, UseStyleModuleResult.Font), ConstantsModule.HEIGHT)
	}
	
	if KeyCodeContent.inputType == "keyboard" then
		local ThemeEntry1 = UseStyleModuleResult.Theme[Frame.textThemeKey or ConstantsModule.DEFAULT_TEXT_THEME]
		local UseStyleModuleResultFont = UseStyleModuleResult.Font
		local CaptionHeader = UseStyleModuleResultFont.CaptionHeader
		local ScaledBaseSize = UseStyleModuleResultFont.BaseSize * CaptionHeader.RelativeSize
		local Content = ""
		local Element = nil
		
		if type(KeyCodeContent.content) == "string" then
			Content = KeyCodeContent.content
		else
			local ImageRectSizeRatio = KeyCodeContent.content.ImageRectSize / ImagesModule.ImagesResolutionScale
			Element = ReactModule.createElement(Label, {
				BackgroundTransparency = 1,
				Image = KeyCodeContent.content,
				ImageColor3 = ThemeEntry1.Color,
				ImageTransparency = ThemeEntry1.Transparency,
				Size = UDim2.fromOffset(ImageRectSizeRatio.X, ImageRectSizeRatio.Y),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5)
			})
		end
		return ReactModule.createElement(Label, LuauPolyfillModule.Object.assign(config, {
			BackgroundTransparency = 1,
			ImageTransparency = ThemeEntry.Transparency,
			ImageColor3 = ThemeEntry.Color,
			Image = ImagesModule["icons/controls/keys/key_single"],
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(Vector2.new(10, 9), Vector2.new(25, 25))
		}), {
			LabelContent = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				RichText = false,
				Text = Content,
				TextColor3 = ThemeEntry1.Color,
				TextTransparency = ThemeEntry1.Transparency,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextSize = ScaledBaseSize,
				Font = if FoundationFontFaceMigration then nil else CaptionHeader.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(GetFontFromFontStyleModule(CaptionHeader)) else nil,
				Position = UDim2.fromOffset(0, ConstantsModule.TEXT_CENTER_OFFSET),
				Size = UDim2.fromScale(1, 1)
			}, { Icon = Element })
		})
	elseif KeyCodeContent.inputType == "gamepad" then
		return ReactModule.createElement(Label, LuauPolyfillModule.Object.assign(config, {
			BackgroundTransparency = 1,
			Image = KeyCodeContent.content,
			ImageColor3 = ThemeEntry.Color,
			ImageTransparency = ThemeEntry.Transparency
		}))
	else
		assert(false, string.format("Unreachable: Invalid inputType value: \"%s\"", KeyCodeContent.inputType))
	end
end