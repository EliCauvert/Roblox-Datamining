local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Enums.ColorMode)
local deviceModule = require(foundation.Enums.Device)
local themeNameModule = require(foundation.Enums.ThemeName)
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(script.Parent.Rules.Types)
local flagsModule = require(foundation.Utility.Flags)
local getGeneratedRulesModule = require(foundation.Utility.getGeneratedRules)
local getOverrideAttributesModule = require(script.Parent.getOverrideAttributes)
local scaleValueModule = require(foundation.Utility.scaleValue)
local foundationStyleSheets = Instance.new("Folder")
foundationStyleSheets.Name = "FoundationStyleSheets"
foundationStyleSheets.Parent = foundation
local t = {}
local t_1 = {}
local var1 = false

local function createStyleSheet(p1, p2, p3, p4, p5)
	-- upvalues: deviceModule (ref), themeNameModule (ref), flagsModule (ref), foundationStyleSheets (ref), getOverrideAttributesModule (ref), getGeneratedRulesModule (ref)
	p2 = p2 or deviceModule.Desktop
	p3 = p3 or 1
	p5 = p5 or themeNameModule.Default
	local styleSheet = Instance.new("StyleSheet")
	local var2 = if flagsModule.FoundationThemeName then `{p5}-` else ""
	styleSheet.Name = if p4 ~= nil then `{var2}{p1}-{p2}-{p3}` else `{var2}{p1}-{p2}-{p3}-{tostring(p4)}`
	styleSheet.Parent = foundationStyleSheets
	
	return {
		refCount = 0,
		themeName = p5,
		colorMode = p1,
		device = p2,
		scale = p3,
		tokenOverrides = p4,
		overrideAttributes = getOverrideAttributesModule(if flagsModule.FoundationThemeName then p5 else nil, p1, p2, p4),
		instance = styleSheet,
		tags = {},
		rules = getGeneratedRulesModule(if flagsModule.FoundationThemeName then p5 else nil, p1, p2),
		attributes = {}
	}
end

local function createStyleRule(p1, p2)
	-- upvalues: flagsModule (ref)
	local text = "." .. p6
	local var2 = if p1.modifier ~= nil then "" else ":" .. p5.modifier
	local text_1 = text .. var24 .. (if p1.pseudo ~= nil then "" else " ::" .. p5.pseudo)
	
	if flagsModule.FoundationStyleRulePseudoName then
		if p1.pseudoName ~= nil then
			text_1 ..= " #" .. p5.pseudoName
		end
		if p1.pseudo ~= nil and p1.pseudoName == nil then
			text_1 ..= ", " .. text .. var24 .. " > " .. p5.pseudo
		end
	elseif p1.pseudo ~= nil then
		text_1 ..= ", " .. text .. var24 .. " > " .. p5.pseudo
	end
	local styleRule = Instance.new("StyleRule")
	styleRule.Name = text_1
	styleRule.Priority = p1.priority or 1
	styleRule.Selector = text_1
	styleRule:SetProperties(p1.properties)
	
	return styleRule
end

local function applyAttributes(p1, p2)
	-- upvalues: flagsModule (ref), scaleValueModule (ref)
	if not p2 then return end
	for i, v in p2 do
		if not p1.attributes[v.name] then
			local name = p1.overrideAttributes[v.name]
			local var2 = if name ~= nil then v.value else name
			local var3 = if flagsModule.FoundationDisableTokenScaling then var2 else scaleValueModule(var2, p1.scale)
			p1.attributes[v.name] = true
			p1.instance:SetAttribute(v.name, var3)
		end
	end
end

local function addRegisteredStyleSheetTags(p3, p4)
	-- upvalues: flagsModule (ref), createStyleRule (ref), applyAttributes (ref)
	for i, v in p4 do
		if not p3.tags[v] then
			local var4 = p3.rules[v]
			
			if var4 and (flagsModule.FoundationStyleRulePseudoName or var4.pseudoName == nil) then
				createStyleRule(var4, v).Parent = p3.instance
				applyAttributes(p3, var4.attributes)
				
				if var4.children then
					for i_1, v_1 in var4.children do
						createStyleRule(v_1, v_1.tag).Parent = p3.instance
						applyAttributes(p3, v_1.attributes)
					end
				end
				p3.tags[v] = true
			end
		end
	end
end

local function resolveStyleSheet(p5, p6, p7, p8, p9)
	-- upvalues: deviceModule (ref), themeNameModule (ref), t (ref), flagsModule (ref), t_1 (ref), createStyleSheet (ref)
	p6 = p6 or deviceModule.Desktop
	p7 = p7 or 1
	p9 = p9 or themeNameModule.Default
	
	for i, v in t do
		if (not flagsModule.FoundationThemeName or v.themeName == p9) and (v.colorMode == p5 and v.device == p6) and (v.scale == p7 and v.tokenOverrides == p8) then
			if flagsModule.FoundationStyleSheetRefCounting then
				t_1[i] = nil
			end
			return i
		end
	end
	local var5 = createStyleSheet(p5, p6, p7, p8, p9)
	t[var5.instance] = var5
	
	return var5.instance
end

local function addStyleTags(p10, p11)
	-- upvalues: t (ref), addRegisteredStyleSheetTags (ref)
	local var6 = t[p10]
	
	if not var6 then
		error("StyleSheet not found in registry")
	end
	addRegisteredStyleSheetTags(var6, p11)
end

local function _(p10)
	-- upvalues: t (ref)
	local var6 = t[p10]
	
	if var6 == nil or var6.refCount > 0 then
		return
	end
	t[p10] = nil
	p10:Destroy()
end

local function flushPendingCleanup()
	-- upvalues: var1 (write), t_1 (ref), t (ref)
	var1 = false
	
	for i in t_1 do
		t_1[i] = nil
		local var6 = t[i]
		
		if var6 ~= nil and var6.refCount <= 0 then
			t[i] = nil
			i:Destroy()
		end
	end
end

local _ = function(p10)
	-- upvalues: t_1 (ref), var1 (write), flushPendingCleanup (ref)
	t_1[p10] = true
	
	if var1 then
		return
	end
	var1 = true
	task.delay(5, flushPendingCleanup)
end

return {
	resolveStyleSheet = resolveStyleSheet,
	getStyleSheet = function(p10, p11, p12, p13, p14)
		-- upvalues: resolveStyleSheet (ref), flagsModule (ref), t (ref), t_1 (ref)
		local var7 = resolveStyleSheet(p10, p11, p12, p13, p14)
		
		if not flagsModule.FoundationStyleSheetRefCounting then
			return var7
		end
		local var8 = t[var7]
		
		if var8 == nil then
			return var7
		end
		var8.refCount += 1
		t_1[var7] = nil
		
		return var7
	end,
	addStyleTags = addStyleTags,
	acquireStyleSheet = function(p10)
		-- upvalues: flagsModule (ref), t (ref), t_1 (ref)
		if not flagsModule.FoundationStyleSheetRefCounting then return end
		local var7 = t[p10]
		
		if var7 == nil then
			return
		end
		var7.refCount += 1
		t_1[p10] = nil
	end,
	releaseStyleSheet = function(p10)
		-- upvalues: flagsModule (ref), t (ref), t_1 (ref), var1 (write), flushPendingCleanup (ref)
		if not flagsModule.FoundationStyleSheetRefCounting then return end
		local var7 = t[p10]
		
		if var7 == nil or var7.refCount == 0 then return end
		var7.refCount -= 1
		
		if var7.refCount == 0 then
			t_1[p10] = true
			
			if var1 then return end
			var1 = true
			task.delay(5, flushPendingCleanup)
		end
	end,
	flushPendingCleanup = flushPendingCleanup
}