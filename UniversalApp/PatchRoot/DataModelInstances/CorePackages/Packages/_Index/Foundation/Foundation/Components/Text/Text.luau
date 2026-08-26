local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local interactableModule = require(foundation.Components.Interactable)
local guiObjectChildrenModule = require(foundation.Utility.GuiObjectChildren)
local _ = require(foundation.Components.Types)
local indexBindableModule = require(foundation.Utility.indexBindable)
local useDefaultTagsModule = require(foundation.Utility.useDefaultTags)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local withGuiObjectPropsModule = require(foundation.Utility.withGuiObjectProps)
local useStyleTagsModule = require(foundation.Providers.Style.useStyleTags)
local fontScalesModule = require(script.Parent.FontScales)
local t = {
	AutoLocalize = false,
	AutoButtonColor = false,
	BorderSizePixel = 0,
	isDisabled = false
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useDefaultTagsModule (ref), useStyleTagsModule (ref), reactModule (ref), reactIsModule (ref), fontScalesModule (ref), withGuiObjectPropsModule (ref), indexBindableModule (ref), interactableModule (ref), guiObjectChildrenModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = if var1.onStateChanged == nil then if var1.onActivated == nil then var1.onSecondaryActivated ~= nil else true else true
	local var3 = if var1.backgroundStyle ~= nil then "gui-object-defaults text-defaults text-size-defaults text-color-defaults" else "gui-object-defaults text-defaults text-size-defaults text-color-defaults x-default-transparency"
	
	if var1.fontStyle and var1.fontStyle.FontSize then
		var3 ..= " x-default-text-size"
	end
	local var4 = useStyleTagsModule(useDefaultTagsModule(var1.tag, var3))
	local var5 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), reactIsModule (copy)
		local var6 = if var1.fontStyle ~= nil then nil else var1.fontStyle.Font
		
		return if typeof(var6) == "table" and not reactIsModule.isBinding(var6) then Font.new(var6.Family, var6.Weight, var6.Style) elseif typeof(var6) == "EnumItem" then Font.fromEnum(var6) else var6
	end, { var1.fontStyle })
	local var6 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), var5 (ref), reactIsModule (copy), fontScalesModule (copy)
		if var1.fontStyle == nil or var1.fontStyle.LineHeight == nil or (var1.fontStyle.FontSize == nil or var5 == nil) then
			return 0
		end
		local var7 = fontScalesModule[if reactIsModule.isBinding(var5) then var5:getValue().Family else var5.Family]
		
		return if var7 == nil then 0 else (var1.fontStyle.FontSize / var7 * (var1.fontStyle.LineHeight * var7) - var1.fontStyle.FontSize) / 2
	end, { var5, var1.fontStyle })
	
	if var1.padding == nil and var6 ~= 0 then
		var1.padding = Vector2.new(0, var6)
	end
	local var8 = if var2 then "TextButton" else "TextLabel"
	local var9 = withGuiObjectPropsModule(var1, {
		AutoButtonColor = if var8 == "TextButton" then var1.AutoButtonColor else nil,
		FontFace = var5,
		LineHeight = if var1.fontStyle ~= nil then nil else var1.fontStyle.LineHeight,
		RichText = var1.RichText,
		Text = var1.Text,
		TextColor3 = if var1.textStyle then indexBindableModule(var1.textStyle, "Color3") else nil,
		TextTransparency = if var1.textStyle then indexBindableModule(var1.textStyle, "Transparency") else nil,
		TextDirection = var1.TextDirection,
		TextScaled = var1.TextScaled,
		TextSize = if var1.fontStyle ~= nil then nil else var1.fontStyle.FontSize,
		TextTruncate = var1.TextTruncate,
		TextWrapped = var1.TextWrapped,
		TextXAlignment = var1.TextXAlignment,
		TextYAlignment = var1.TextYAlignment,
		ref = p2,
		[reactModule.Tag] = var4
	})
	local var10 = var8
	
	if var2 then
		var10 = interactableModule
		var9.component = var8
		var9.onActivated = var1.onActivated
		var9.onSecondaryActivated = var1.onSecondaryActivated
		var9.onStateChanged = var1.onStateChanged
		var9.stateLayer = var1.stateLayer
		var9.isDisabled = var1.isDisabled
		var9.cursor = var1.cursor
	end
	return reactModule.createElement(var10, var9, guiObjectChildrenModule(var1))
end))