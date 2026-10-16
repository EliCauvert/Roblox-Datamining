local Foundation = script:FindFirstAncestor("Foundation")
local Parent = script.Parent.Parent
local _ = require(Parent.Enums.ColorMode)
local DeviceModule = require(Parent.Enums.Device)
local ThemeNameModule = require(Parent.Enums.ThemeName)
local _ = require(Parent.Providers.Style.Tokens)
local _ = require(script.Parent.Rules.Types)
local FlagsModule = require(Parent.Utility.Flags)
local DevAssertModule: (any, any) -> () = require(Parent.Utility.devAssert)
local GetGeneratedRulesModule = require(Parent.Utility.getGeneratedRules)
local GetMainGuiModule = require(Parent.Utility.getMainGui)
local GetOverrideAttributesModule = require(script.Parent.getOverrideAttributes)
local ScaleValueModule = require(Parent.Utility.scaleValue)
local HttpService = game:GetService("HttpService")
local FoundationStyleSheets = Instance.new("Folder")

if FlagsModule.FoundationDontParentToFoundationModule then
	FoundationStyleSheets.Name = "FoundationStyleSheets" .. HttpService:GenerateGUID(false)
else
	FoundationStyleSheets.Name = "FoundationStyleSheets"
end
if FlagsModule.FoundationDontParentToFoundationModule then
	local MainGuiModule = GetMainGuiModule()
	DevAssertModule(MainGuiModule ~= nil, "MainGui not found")
	FoundationStyleSheets.Parent = MainGuiModule
else
	FoundationStyleSheets.Parent = Foundation
end
local t = {}
local t1 = {}
local Flag = false

local function createStyleSheet(ColorMode, Device, Scale, TokenOverrides, ThemeName) --[[ Line: 71 ]]
	-- upvalues: DeviceModule (copy), ThemeNameModule (copy), FoundationStyleSheets (copy), GetOverrideAttributesModule (copy), GetGeneratedRulesModule (copy)
	local Device1 = Device or DeviceModule.Desktop
	local Scale1 = Scale or 1
	local ThemeName1 = ThemeName or ThemeNameModule.Default
	local StyleSheet = Instance.new("StyleSheet")
	local Text: string = `{ThemeName1}-`
	StyleSheet.Name = if TokenOverrides == nil then `{Text}{ColorMode}-{Device1}-{Scale1}` else `{Text}{ColorMode}-{Device1}-{Scale1}-{tostring(TokenOverrides)}`
	StyleSheet.Parent = FoundationStyleSheets
	
	return {
		refCount = 0,
		themeName = ThemeName1,
		colorMode = ColorMode,
		device = Device1,
		scale = Scale1,
		tokenOverrides = TokenOverrides,
		overrideAttributes = GetOverrideAttributesModule(ThemeName1, ColorMode, Device1, TokenOverrides),
		instance = StyleSheet,
		tags = {},
		rules = GetGeneratedRulesModule(ThemeName1, ColorMode, Device1),
		attributes = {}
	}
end

local function createStyleRule(Rule, Tag) --[[ Line: 102 ]]
	-- upvalues: FlagsModule (copy)
	local Text = "." .. Tag
	local Text1: string = if Rule.modifier == nil then "" else ":" .. Rule.modifier
	local Text2 = Text .. Text1 .. (if Rule.pseudo == nil then "" else " ::" .. Rule.pseudo)
	
	if FlagsModule.FoundationStyleRulePseudoName then
		if Rule.pseudoName ~= nil then
			Text2 ..= " #" .. Rule.pseudoName
		end
		if Rule.pseudo ~= nil and Rule.pseudoName == nil then
			Text2 ..= ", " .. Text .. Text1 .. " > " .. Rule.pseudo
		end
	elseif Rule.pseudo ~= nil then
		Text2 ..= ", " .. Text .. Text1 .. " > " .. Rule.pseudo
	end
	local StyleRule = Instance.new("StyleRule")
	StyleRule.Name = Text2
	StyleRule.Priority = Rule.priority or 1
	StyleRule.Selector = Text2
	StyleRule:SetProperties(Rule.properties)
	
	return StyleRule
end

local function applyAttributes(StyleSheet, Attributes) --[[ Line: 130 ]]
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

local function addRegisteredStyleSheetTags(StyleSheet, List) --[[ Line: 148 ]]
	-- upvalues: FlagsModule (copy), createStyleRule (copy), applyAttributes (copy)
	for _, value in List do
		if not StyleSheet.tags[value] then
			local Rule = StyleSheet.rules[value]
			
			if Rule and (FlagsModule.FoundationStyleRulePseudoName or Rule.pseudoName == nil) then
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

local function resolveStyleSheet(ColorMode, p1, p2, TokenOverrides, p3) --[[ Line: 188 ]]
	-- upvalues: DeviceModule (copy), ThemeNameModule (copy), t (copy), t1 (copy), createStyleSheet (copy)
	local P12 = p1 or DeviceModule.Desktop
	local P13 = p2 or 1
	local P15 = p3 or ThemeNameModule.Default
	for i, StyleSheet in t do
		if StyleSheet.themeName == P15 and StyleSheet.colorMode == ColorMode and StyleSheet.device == P12 and StyleSheet.scale == P13 and StyleSheet.tokenOverrides == TokenOverrides then
			t1[i] = nil
			
			return i
		end
	end
	local StyleSheet1 = createStyleSheet(ColorMode, P12, P13, TokenOverrides, P15)
	t[StyleSheet1.instance] = StyleSheet1
	
	return StyleSheet1.instance
end

local function _(Key) --[[ Line: 233 | Named "destroyStyleSheet" ]]
	-- upvalues: t (copy)
	local Entry = t[Key]
	
	if Entry ~= nil and Entry.refCount <= 0 then
		t[Key] = nil
		Key:Destroy()
		
		return
	end
end

local function flushPendingCleanup() --[[ Line: 242 ]]
	-- upvalues: Flag (ref), t1 (copy), t (copy)
	Flag = false
	
	for i in t1 do
		t1[i] = nil
		local Entry = t[i]
		
		if Entry ~= nil and Entry.refCount <= 0 then
			t[i] = nil
			i:Destroy()
		end
	end
end

local _ = function(Key) --[[ Line: 250 | Named "scheduleCleanup" ]]
	-- upvalues: t1 (copy), Flag (ref), flushPendingCleanup (copy)
	t1[Key] = true
	
	if not Flag then
		Flag = true
		task.delay(5, flushPendingCleanup)
		
		return
	end
end

return {
	resolveStyleSheet = resolveStyleSheet,
	getStyleSheet = function(ColorMode, p4, p5, TokenOverrides, p6) --[[ Line: 294 ]]
		-- upvalues: resolveStyleSheet (copy), t (copy), t1 (copy)
		local ResolveStyleSheetResult = resolveStyleSheet(ColorMode, p4, p5, TokenOverrides, p6)
		local Entry = t[ResolveStyleSheetResult]
		
		if Entry == nil then
			return ResolveStyleSheetResult
		else
			Entry.refCount += 1
			t1[ResolveStyleSheetResult] = nil
			
			return ResolveStyleSheetResult
		end
	end,
	addStyleTags = function(p4, p5) --[[ Line: 215 ]]
		-- upvalues: t (copy), addRegisteredStyleSheetTags (copy)
		local Entry = t[p4]
		
		if not Entry then
			error("StyleSheet not found in registry")
		end
		addRegisteredStyleSheetTags(Entry, p5)
	end,
	acquireStyleSheet = function(Key) --[[ Line: 259 ]]
		-- upvalues: t (copy), t1 (copy)
		local Entry = t[Key]
		
		if Entry ~= nil then
			Entry.refCount += 1
			t1[Key] = nil
			
			return
		end
	end,
	releaseStyleSheet = function(Key) --[[ Line: 269 ]]
		-- upvalues: t (copy), t1 (copy), Flag (ref), flushPendingCleanup (copy)
		local Entry = t[Key]
		
		if Entry == nil or Entry.refCount == 0 then return end
		Entry.refCount -= 1
		
		if Entry.refCount == 0 then
			t1[Key] = true
			
			if Flag then return end
			Flag = true
			task.delay(5, flushPendingCleanup)
		end
	end,
	flushPendingCleanup = flushPendingCleanup
}