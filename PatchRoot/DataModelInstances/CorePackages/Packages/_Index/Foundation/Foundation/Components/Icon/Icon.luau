-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:03 2026 Pacific Standard Time.

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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 46 | named "Icon" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useTextSizeOffsetModule (ref), migrateIconNameModule (ref), useIconSizeModule (ref), isBuilderIconModule (ref), migrateFontSizeModule (ref), loggerModule (ref), reactModule (ref), imageModule (ref), withCommonPropsModule (ref), textModule (ref), font (ref)
	local var16 = withDefaultsModule(p0, t)
	local var17 = useTokensModule()
	local var18 = useTextSizeOffsetModule()
	local var19 = migrateIconNameModule(var16.name)
	local var20 = useIconSizeModule(var16.size, isBuilderIconModule(var16.name))
	local variant = var16.variant
	local name = var16.name
	local var21 = if typeof(var20) == "table" then nil else var20.Y.Offset
	
	if not isBuilderIconModule(name) and var19 then
		if typeof(var20) == "table" then
			error("Binding size isn't supported when migrating a UIBlox icon, use Builder Icons directly")
		end
		variant = var19.variant or variant
		name = var19.name
		var21 = migrateFontSizeModule(var21, var17)
	end
	local style = var16.style or var17.Color.Content.Default
	
	if isBuilderIconModule(name) or var19 then
		return reactModule.createElement(textModule, withCommonPropsModule(var16, {
			textStyle = style,
			Text = name,
			fontStyle = { Font = font[variant], FontSize = var21 },
			TextScaled = typeof(var20) == "table",
			Size = var20,
			ref = p1,
			Rotation = var16.Rotation
		}), {
			UITextSizeConstraint = if var18 > 0 and var21 then reactModule.createElement("UITextSizeConstraint", { MaxTextSize = var21 }) else nil,
			Children = reactModule.createElement(reactModule.Fragment, nil, var16.children)
		})
	elseif p0.variant ~= nil then
		loggerModule:warning("variant is not supported when using FoundationImages, consider using BuilderIcons")
	end
	return reactModule.createElement(imageModule, withCommonPropsModule(var16, {
		imageStyle = style,
		Image = name,
		Size = var20,
		ref = p1,
		Rotation = var16.Rotation
	}), var16.children)
end))