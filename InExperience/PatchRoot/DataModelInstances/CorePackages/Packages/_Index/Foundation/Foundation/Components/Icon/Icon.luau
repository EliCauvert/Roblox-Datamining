local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local BuilderIconsModule = require(Parent.BuilderIcons)
local BuilderIconsModuleFont = BuilderIconsModule.Font
local ImageModule = require(Foundation.Components.Image)
local TextModule = require(Foundation.Components.Text)
local LoggerModule = require(Foundation.Utility.Logger)
local IsBuilderIconModule = require(Foundation.Utility.isBuilderIcon)
local MigrateFontSizeModule = require(script.Parent.migrateFontSize)
local MigrateIconNameModule = require(script.Parent.migrateIconName)
local UseIconSizeModule = require(Foundation.Utility.useIconSize)
local UseTextSizeOffsetModule = require(Foundation.Providers.Style.useTextSizeOffset)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local _ = require(Foundation.Components.Types)
local config = {
	testId = "--foundation-icon",
	size = require(Foundation.Enums.IconSize).Medium,
	variant = BuilderIconsModule.IconVariant.Regular
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 46 | Named "Icon" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseTextSizeOffsetModule (copy), MigrateIconNameModule (copy), UseIconSizeModule (copy), IsBuilderIconModule (copy), MigrateFontSizeModule (copy), LoggerModule (copy), ReactModule (copy), ImageModule (copy), WithCommonPropsModule (copy), TextModule (copy), BuilderIconsModuleFont (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseTextSizeOffsetModuleResult: number = UseTextSizeOffsetModule()
	local MigrateIconNameModuleResult = MigrateIconNameModule(WithDefaultsModuleResult.name)
	local UseIconSizeModuleResult = UseIconSizeModule(WithDefaultsModuleResult.size, IsBuilderIconModule(WithDefaultsModuleResult.name))
	local Variant = WithDefaultsModuleResult.variant
	local Name = WithDefaultsModuleResult.name
	local Offset = if typeof(UseIconSizeModuleResult) == "table" then nil else UseIconSizeModuleResult.Y.Offset
	
	if not IsBuilderIconModule(Name) and MigrateIconNameModuleResult then
		if typeof(UseIconSizeModuleResult) == "table" then
			error("Binding size isn't supported when migrating a UIBlox icon, use Builder Icons directly")
		end
		Variant = MigrateIconNameModuleResult.variant or Variant
		Name = MigrateIconNameModuleResult.name
		Offset = MigrateFontSizeModule(Offset, UseTokensModuleResult)
	end
	local Style = WithDefaultsModuleResult.style or UseTokensModuleResult.Color.Content.Default
	
	if IsBuilderIconModule(Name) or MigrateIconNameModuleResult then
		return ReactModule.createElement(TextModule, WithCommonPropsModule(WithDefaultsModuleResult, {
			textStyle = Style,
			Text = Name,
			fontStyle = {
				Font = BuilderIconsModuleFont[Variant],
				FontSize = Offset
			},
			TextScaled = typeof(UseIconSizeModuleResult) == "table",
			Size = UseIconSizeModuleResult,
			ref = Ref,
			Rotation = WithDefaultsModuleResult.Rotation
		}), {
			UITextSizeConstraint = if UseTextSizeOffsetModuleResult > 0 and Offset then ReactModule.createElement("UITextSizeConstraint", { MaxTextSize = Offset }) else nil,
			Children = ReactModule.createElement(ReactModule.Fragment, nil, WithDefaultsModuleResult.children)
		})
	end
	if p1.variant ~= nil then
		LoggerModule:warning("variant is not supported when using FoundationImages, consider using BuilderIcons")
	end
	return (ReactModule.createElement(ImageModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		imageStyle = Style,
		Image = Name,
		Size = UseIconSizeModuleResult,
		ref = Ref,
		Rotation = WithDefaultsModuleResult.Rotation
	}), WithDefaultsModuleResult.children))
end))