local Foundation = script:FindFirstAncestor("Foundation")
local DeviceModule = require(Foundation.Enums.Device)
local _ = require(Foundation.Enums.Theme)
local _ = require(Foundation.Providers.Style.Tokens)
local _ = require(script.Parent.Rules.Types)
local FlagsModule = require(Foundation.Utility.Flags)
local GetGeneratedRulesModule = require(Foundation.Utility.getGeneratedRules)
local GetOverrideAttributesModule = require(script.Parent.getOverrideAttributes)
local ScaleValueModule = require(Foundation.Utility.scaleValue)
local FoundationStyleSheets = Instance.new("Folder")
FoundationStyleSheets.Name = "FoundationStyleSheets"
FoundationStyleSheets.Parent = Foundation
local t = {}

local function createStyleSheet(Theme, Device, Scale, TokenOverrides)
	-- upvalues: DeviceModule (copy), FoundationStyleSheets (copy), GetOverrideAttributesModule (copy), GetGeneratedRulesModule (copy)
	local Device1 = Device or DeviceModule.Desktop
	local Scale1 = Scale or 1
	local StyleSheet = Instance.new("StyleSheet")
	StyleSheet.Name = if TokenOverrides == nil then `{Theme}-{Device1}-{Scale1}` else `{Theme}-{Device1}-{Scale1}-{tostring(TokenOverrides)}`
	StyleSheet.Parent = FoundationStyleSheets
	
	return {
		theme = Theme,
		device = Device1,
		scale = Scale1,
		tokenOverrides = TokenOverrides,
		overrideAttributes = GetOverrideAttributesModule(Theme, Device1, TokenOverrides),
		instance = StyleSheet,
		tags = {},
		rules = GetGeneratedRulesModule(Theme, Device1),
		attributes = {}
	}
end

local function createStyleRule(Rule, Tag)
	local Text = "." .. Tag
	local Text1: string = if Rule.modifier == nil then "" else ":" .. Rule.modifier
	local Text2 = Text .. Text1 .. (if Rule.pseudo == nil then "" else " ::" .. Rule.pseudo)
	
	if Rule.pseudo ~= nil then
		Text2 ..= ", " .. Text .. Text1 .. " > " .. Rule.pseudo
	end
	local StyleRule = Instance.new("StyleRule")
	StyleRule.Name = Text2
	StyleRule.Priority = Rule.priority or 1
	StyleRule.Selector = Text2
	StyleRule:SetProperties(Rule.properties)
	
	return StyleRule
end

local function applyAttributes(StyleSheet, Attributes)
	-- upvalues: FlagsModule (copy), ScaleValueModule (copy)
	if not Attributes then return end
	for _, attribute in Attributes do
		if not StyleSheet.attributes[attribute.name] then
			local OverrideAttribute = StyleSheet.overrideAttributes[attribute.name]
			local Value = if OverrideAttribute == nil then attribute.value else OverrideAttribute
			StyleSheet.attributes[attribute.name] = true
			StyleSheet.instance:SetAttribute(attribute.name, if FlagsModule.FoundationDisableTokenScaling then Value else ScaleValueModule(Value, StyleSheet.scale))
		end
	end
end

local function addRegisteredStyleSheetTags(StyleSheet, List)
	-- upvalues: createStyleRule (copy), applyAttributes (copy)
	for _, value in List do
		if not StyleSheet.tags[value] then
			local Rule = StyleSheet.rules[value]
			
			if Rule then
				createStyleRule(Rule, value).Parent = StyleSheet.instance
				applyAttributes(StyleSheet, Rule.attributes)
				
				if Rule.children then
					for _, child in Rule.children do
						createStyleRule(child, child.tag).Parent = StyleSheet.instance
						applyAttributes(StyleSheet, child.attributes)
					end
				end
				StyleSheet.tags[value] = true
			end
		end
	end
end

return {
	getStyleSheet = function(Theme, p1, p2, TokenOverrides)
		-- upvalues: DeviceModule (copy), t (copy), createStyleSheet (copy)
		local P11 = p1 or DeviceModule.Desktop
		local P12 = p2 or 1
		
		for i, StyleSheet in t do
			if StyleSheet.theme == Theme and StyleSheet.device == P11 and StyleSheet.scale == P12 and StyleSheet.tokenOverrides == TokenOverrides then
				return i
			end
		end
		local StyleSheet1 = createStyleSheet(Theme, P11, P12, TokenOverrides)
		t[StyleSheet1.instance] = StyleSheet1
		
		return StyleSheet1.instance
	end,
	addStyleTags = function(p3, p4)
		-- upvalues: t (copy), addRegisteredStyleSheetTags (copy)
		local Entry = t[p3]
		
		if not Entry then
			error("StyleSheet not found in registry")
		end
		addRegisteredStyleSheetTags(Entry, p4)
	end
}