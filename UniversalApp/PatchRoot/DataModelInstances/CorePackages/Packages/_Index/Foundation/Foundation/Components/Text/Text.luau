local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local InteractableModule = require(Foundation.Components.Interactable)
local FlagsModule = require(Foundation.Utility.Flags)
local GuiObjectChildrenModule = require(Foundation.Utility.GuiObjectChildren)
local _ = require(Foundation.Components.Types)
local IndexBindableModule = require(Foundation.Utility.indexBindable)
local NormalizeFontFaceModule = require(Foundation.Utility.normalizeFontFace)
local UseDefaultTagsModule = require(Foundation.Utility.useDefaultTags)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local WithGuiObjectPropsModule = require(Foundation.Utility.withGuiObjectProps)
local UseStyleTagsModule = require(Foundation.Providers.Style.useStyleTags)
local FontScalesModule = require(script.Parent.FontScales)
local config = {
	AutoLocalize = false,
	AutoButtonColor = false,
	BorderSizePixel = 0,
	isDisabled = false
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 52 | Named "Text" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseDefaultTagsModule (copy), UseStyleTagsModule (copy), ReactModule (copy), FlagsModule (copy), NormalizeFontFaceModule (copy), ReactIsModule (copy), FontScalesModule (copy), WithGuiObjectPropsModule (copy), IndexBindableModule (copy), InteractableModule (copy), GuiObjectChildrenModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local HasOnStateChanged: boolean = WithDefaultsModuleResult.onStateChanged ~= nil or WithDefaultsModuleResult.onActivated ~= nil or WithDefaultsModuleResult.onSecondaryActivated ~= nil
	local GuiObjectDefaultsTextDefaultsTextSizeDefaultsTextColorDefaults: string = if WithDefaultsModuleResult.backgroundStyle == nil then "gui-object-defaults text-defaults text-size-defaults text-color-defaults" else "gui-object-defaults text-defaults text-size-defaults text-color-defaults x-default-transparency"
	
	if WithDefaultsModuleResult.fontStyle and WithDefaultsModuleResult.fontStyle.FontSize then
		GuiObjectDefaultsTextDefaultsTextSizeDefaultsTextColorDefaults ..= " x-default-text-size"
	end
	local UseStyleTagsModuleResult = UseStyleTagsModule((UseDefaultTagsModule(WithDefaultsModuleResult.tag, GuiObjectDefaultsTextDefaultsTextSizeDefaultsTextColorDefaults)))
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 65 ]]
		-- upvalues: FlagsModule (upval), WithDefaultsModuleResult (copy), NormalizeFontFaceModule (upval), ReactIsModule (upval)
		if FlagsModule.FoundationFontFaceMigration then
			return NormalizeFontFaceModule(if WithDefaultsModuleResult.fontStyle == nil then nil else WithDefaultsModuleResult.fontStyle.Font)
		else
			local FontStyleFont = if WithDefaultsModuleResult.fontStyle == nil then nil else WithDefaultsModuleResult.fontStyle.Font
			
			return if typeof(FontStyleFont) == "table" and not ReactIsModule.isBinding(FontStyleFont) then Font.new(FontStyleFont.Family, FontStyleFont.Weight, FontStyleFont.Style) elseif typeof(FontStyleFont) == "EnumItem" then Font.fromEnum(FontStyleFont) else FontStyleFont
		end
	end, { WithDefaultsModuleResult.fontStyle })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 84 ]]
		-- upvalues: WithDefaultsModuleResult (copy), UseMemoResult (copy), ReactIsModule (upval), FontScalesModule (upval)
		if WithDefaultsModuleResult.fontStyle == nil or WithDefaultsModuleResult.fontStyle.LineHeight == nil or WithDefaultsModuleResult.fontStyle.FontSize == nil or UseMemoResult == nil then
			return 0
		else
			local FontScalesModuleEntry = FontScalesModule[if ReactIsModule.isBinding(UseMemoResult) then UseMemoResult:getValue().Family else UseMemoResult.Family]
			
			return if FontScalesModuleEntry == nil then 0 else (WithDefaultsModuleResult.fontStyle.FontSize / FontScalesModuleEntry * (WithDefaultsModuleResult.fontStyle.LineHeight * FontScalesModuleEntry) - WithDefaultsModuleResult.fontStyle.FontSize) / 2
		end
	end, { UseMemoResult, WithDefaultsModuleResult.fontStyle })
	
	if WithDefaultsModuleResult.padding == nil and UseMemoResult1 ~= 0 then
		WithDefaultsModuleResult.padding = Vector2.new(0, UseMemoResult1)
	end
	local TextButton: string = if HasOnStateChanged then "TextButton" else "TextLabel"
	local WithGuiObjectPropsModuleResult = WithGuiObjectPropsModule(WithDefaultsModuleResult, {
		AutoButtonColor = if TextButton == "TextButton" then WithDefaultsModuleResult.AutoButtonColor else nil,
		FontFace = UseMemoResult,
		LineHeight = if WithDefaultsModuleResult.fontStyle == nil then nil else WithDefaultsModuleResult.fontStyle.LineHeight,
		RichText = WithDefaultsModuleResult.RichText,
		Text = WithDefaultsModuleResult.Text,
		TextColor3 = if WithDefaultsModuleResult.textStyle then IndexBindableModule(WithDefaultsModuleResult.textStyle, "Color3") else nil,
		TextTransparency = if WithDefaultsModuleResult.textStyle then IndexBindableModule(WithDefaultsModuleResult.textStyle, "Transparency") else nil,
		TextDirection = WithDefaultsModuleResult.TextDirection,
		TextScaled = WithDefaultsModuleResult.TextScaled,
		TextSize = if WithDefaultsModuleResult.fontStyle == nil then nil else WithDefaultsModuleResult.fontStyle.FontSize,
		TextTruncate = WithDefaultsModuleResult.TextTruncate,
		TextWrapped = WithDefaultsModuleResult.TextWrapped,
		TextXAlignment = WithDefaultsModuleResult.TextXAlignment,
		TextYAlignment = WithDefaultsModuleResult.TextYAlignment,
		ref = Ref,
		[ReactModule.Tag] = UseStyleTagsModuleResult
	})
	local TextButton1: string = TextButton
	
	if HasOnStateChanged then
		TextButton1 = InteractableModule
		WithGuiObjectPropsModuleResult.component = TextButton
		WithGuiObjectPropsModuleResult.onActivated = WithDefaultsModuleResult.onActivated
		WithGuiObjectPropsModuleResult.onSecondaryActivated = WithDefaultsModuleResult.onSecondaryActivated
		WithGuiObjectPropsModuleResult.onStateChanged = WithDefaultsModuleResult.onStateChanged
		WithGuiObjectPropsModuleResult.stateLayer = WithDefaultsModuleResult.stateLayer
		WithGuiObjectPropsModuleResult.isDisabled = WithDefaultsModuleResult.isDisabled
		WithGuiObjectPropsModuleResult.cursor = WithDefaultsModuleResult.cursor
	end
	return ReactModule.createElement(TextButton1, WithGuiObjectPropsModuleResult, GuiObjectChildrenModule(WithDefaultsModuleResult))
end))