-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:10 2026 Pacific Standard Time.

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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 50 | named "Text" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useDefaultTagsModule (ref), useStyleTagsModule (ref), reactModule (ref), reactIsModule (ref), fontScalesModule (ref), withGuiObjectPropsModule (ref), indexBindableModule (ref), interactableModule (ref), guiObjectChildrenModule (ref)
	local var12 = withDefaultsModule(p0, t)
	local var13 = if var12.onStateChanged == nil then if var12.onActivated == nil then var12.onSecondaryActivated ~= nil else true else true
	local var14 = if var12.backgroundStyle ~= nil then "gui-object-defaults text-defaults text-size-defaults text-color-defaults" else "gui-object-defaults text-defaults text-size-defaults text-color-defaults x-default-transparency"
	
	if var12.fontStyle and var12.fontStyle.FontSize then
		var14 ..= " x-default-text-size"
	end
	local var15 = useStyleTagsModule(useDefaultTagsModule(var12.tag, var14))
	local var16 = reactModule.useMemo(function() --[[ line: 63 ]]
		-- upvalues: var12 (ref), reactIsModule (copy)
		local var21 = if var12.fontStyle ~= nil then nil else var12.fontStyle.Font
		
		return if typeof(var21) == "table" and not reactIsModule.isBinding(var21) then Font.new(var21.Family, var21.Weight, var21.Style) elseif typeof(var21) == "EnumItem" then Font.fromEnum(var21) else var21
	end, { var12.fontStyle })
	local var17 = reactModule.useMemo(function() --[[ line: 77 ]]
		-- upvalues: var12 (ref), var16 (ref), reactIsModule (copy), fontScalesModule (copy)
		if var12.fontStyle == nil or var12.fontStyle.LineHeight == nil or (var12.fontStyle.FontSize == nil or var16 == nil) then
			return 0
		end
		local var22 = fontScalesModule[if reactIsModule.isBinding(var16) then var16:getValue().Family else var16.Family]
		
		return if var22 == nil then 0 else (var12.fontStyle.FontSize / var22 * (var12.fontStyle.LineHeight * var22) - var12.fontStyle.FontSize) / 2
	end, { var16, var12.fontStyle })
	
	if var12.padding == nil and var17 ~= 0 then
		var12.padding = Vector2.new(0, var17)
	end
	local var18 = if var13 then "TextButton" else "TextLabel"
	local var19 = withGuiObjectPropsModule(var12, {
		AutoButtonColor = if var18 == "TextButton" then var12.AutoButtonColor else nil,
		FontFace = var16,
		LineHeight = if var12.fontStyle ~= nil then nil else var12.fontStyle.LineHeight,
		RichText = var12.RichText,
		Text = var12.Text,
		TextColor3 = if var12.textStyle then indexBindableModule(var12.textStyle, "Color3") else nil,
		TextTransparency = if var12.textStyle then indexBindableModule(var12.textStyle, "Transparency") else nil,
		TextDirection = var12.TextDirection,
		TextScaled = var12.TextScaled,
		TextSize = if var12.fontStyle ~= nil then nil else var12.fontStyle.FontSize,
		TextTruncate = var12.TextTruncate,
		TextWrapped = var12.TextWrapped,
		TextXAlignment = var12.TextXAlignment,
		TextYAlignment = var12.TextYAlignment,
		ref = p1,
		[reactModule.Tag] = var15
	})
	local var20 = var18
	
	if var13 then
		var20 = interactableModule
		var19.component = var18
		var19.onActivated = var12.onActivated
		var19.onSecondaryActivated = var12.onSecondaryActivated
		var19.onStateChanged = var12.onStateChanged
		var19.stateLayer = var12.stateLayer
		var19.isDisabled = var12.isDisabled
		var19.cursor = var12.cursor
	end
	return reactModule.createElement(var20, var19, guiObjectChildrenModule(var12))
end))