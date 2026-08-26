local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local builderIconsModule = require(parent.BuilderIcons)
local font = builderIconsModule.Font
local iconVariant = builderIconsModule.IconVariant
local iconSizeModule = require(foundation.Enums.IconSize)
local imageModule = require(foundation.Components.Image)
local textModule = require(foundation.Components.Text)
local loggerModule = require(foundation.Utility.Logger)
local isBuilderIconModule = require(foundation.Utility.isBuilderIcon)
local migrateFontSizeModule = require(script.Parent.migrateFontSize)
local migrateIconNameModule = require(script.Parent.migrateIconName)
local useIconSizeModule = require(foundation.Utility.useIconSize)
local useTextSizeOffsetModule = require(foundation.Providers.Style.useTextSizeOffset)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local _ = require(foundation.Components.Types)
local t = {
	testId = "--foundation-icon",
	size = iconSizeModule.Medium,
	variant = iconVariant.Regular
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useTextSizeOffsetModule (ref), migrateIconNameModule (ref), useIconSizeModule (ref), isBuilderIconModule (ref), migrateFontSizeModule (ref), loggerModule (ref), reactModule (ref), imageModule (ref), withCommonPropsModule (ref), textModule (ref), font (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local var3 = useTextSizeOffsetModule()
	local var4 = migrateIconNameModule(var1.name)
	local var5 = useIconSizeModule(var1.size, isBuilderIconModule(var1.name))
	local variant = var1.variant
	local name = var1.name
	local var6 = if typeof(var5) == "table" then nil else var5.Y.Offset
	
	if not isBuilderIconModule(name) and var4 then
		if typeof(var5) == "table" then
			error("Binding size isn't supported when migrating a UIBlox icon, use Builder Icons directly")
		end
		variant = var4.variant or variant
		name = var4.name
		var6 = migrateFontSizeModule(var6, var2)
	end
	local style = var1.style or var2.Color.Content.Default
	
	if isBuilderIconModule(name) or var4 then
		return reactModule.createElement(textModule, withCommonPropsModule(var1, {
			textStyle = style,
			Text = name,
			fontStyle = { Font = font[variant], FontSize = var6 },
			TextScaled = typeof(var5) == "table",
			Size = var5,
			ref = p2,
			Rotation = var1.Rotation
		}), {
			UITextSizeConstraint = if var3 > 0 and var6 then reactModule.createElement("UITextSizeConstraint", { MaxTextSize = var6 }) else nil,
			Children = reactModule.createElement(reactModule.Fragment, nil, var1.children)
		})
	elseif p1.variant ~= nil then
		loggerModule:warning("variant is not supported when using FoundationImages, consider using BuilderIcons")
	end
	return reactModule.createElement(imageModule, withCommonPropsModule(var1, {
		imageStyle = style,
		Image = name,
		Size = var5,
		ref = p2,
		Rotation = var1.Rotation
	}), var1.children)
end))