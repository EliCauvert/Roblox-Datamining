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
	local var1 = if flagsModule.FoundationThemeName then `{p5}-` else ""
	styleSheet.Name = if p4 ~= nil then `{var1}{p1}-{p2}-{p3}` else `{var1}{p1}-{p2}-{p3}-{tostring(p4)}`
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
	local text = "." .. p6
	local var1 = if p1.modifier ~= nil then "" else ":" .. p5.modifier
	local text_1 = text .. var24 .. (if p1.pseudo ~= nil then "" else " ::" .. p5.pseudo)
	
	if p1.pseudo ~= nil then
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
			local var1 = if name ~= nil then v.value else name
			local var2 = if flagsModule.FoundationDisableTokenScaling then var1 else scaleValueModule(var1, p1.scale)
			p1.attributes[v.name] = true
			p1.instance:SetAttribute(v.name, var2)
		end
	end
end

local function addRegisteredStyleSheetTags(p1, p2)
	-- upvalues: createStyleRule (ref), applyAttributes (ref)
	for i, v in p2 do
		if not p1.tags[v] then
			local var1 = p1.rules[v]
			
			if var1 then
				createStyleRule(var1, v).Parent = p1.instance
				applyAttributes(p1, var1.attributes)
				
				if var1.children then
					for i_1, v_1 in var1.children do
						createStyleRule(v_1, v_1.tag).Parent = p1.instance
						applyAttributes(p1, v_1.attributes)
					end
				end
				p1.tags[v] = true
			end
		end
	end
end

local function resolveStyleSheet(p1, p2, p3, p4, p5)
	-- upvalues: deviceModule (ref), themeNameModule (ref), t (ref), flagsModule (ref), t_1 (ref), createStyleSheet (ref)
	p2 = p2 or deviceModule.Desktop
	p3 = p3 or 1
	p5 = p5 or themeNameModule.Default
	
	for i, v in t do
		if (not flagsModule.FoundationThemeName or v.themeName == p5) and (v.colorMode == p1 and v.device == p2) and (v.scale == p3 and v.tokenOverrides == p4) then
			if flagsModule.FoundationStyleSheetRefCounting then
				t_1[i] = nil
			end
			return i
		end
	end
	local var1 = createStyleSheet(p1, p2, p3, p4, p5)
	t[var1.instance] = var1
	
	return var1.instance
end

local function addStyleTags(p1, p2)
	-- upvalues: t (ref), addRegisteredStyleSheetTags (ref)
	local var1 = t[p1]
	
	if not var1 then
		error("StyleSheet not found in registry")
	end
	addRegisteredStyleSheetTags(var1, p2)
end

local function _(p1)
	-- upvalues: t (ref)
	local var1 = t[p1]
	
	if var1 == nil or var1.refCount > 0 then
		return
	end
	t[p1] = nil
	p1:Destroy()
end

local function flushPendingCleanup()
	-- upvalues: var1 (write), t_1 (ref), t (ref)
	var1 = false
	
	for i in t_1 do
		t_1[i] = nil
		local var1 = t[i]
		
		if var1 ~= nil and var1.refCount <= 0 then
			t[i] = nil
			i:Destroy()
		end
	end
end

local _ = function(p1)
	-- upvalues: t_1 (ref), var1 (write), flushPendingCleanup (ref)
	t_1[p1] = true
	
	if var1 then
		return
	end
	var1 = true
	task.delay(5, flushPendingCleanup)
end

return {
	resolveStyleSheet = resolveStyleSheet,
	getStyleSheet = function(p1, p2, p3, p4, p5)
		-- upvalues: resolveStyleSheet (ref), flagsModule (ref), t (ref), t_1 (ref)
		local var1 = resolveStyleSheet(p1, p2, p3, p4, p5)
		
		if not flagsModule.FoundationStyleSheetRefCounting then
			return var1
		end
		local var2 = t[var1]
		
		if var2 == nil then
			return var1
		end
		var2.refCount += 1
		t_1[var1] = nil
		
		return var1
	end,
	addStyleTags = addStyleTags,
	acquireStyleSheet = function(p1)
		-- upvalues: flagsModule (ref), t (ref), t_1 (ref)
		if not flagsModule.FoundationStyleSheetRefCounting then return end
		local var1 = t[p1]
		
		if var1 == nil then
			return
		end
		var1.refCount += 1
		t_1[p1] = nil
	end,
	releaseStyleSheet = function(p1)
		-- upvalues: flagsModule (ref), t (ref), t_1 (ref), var1 (write), flushPendingCleanup (ref)
		if not flagsModule.FoundationStyleSheetRefCounting then return end
		local var1 = t[p1]
		
		if var1 == nil or var1.refCount == 0 then return end
		var1.refCount -= 1
		
		if var1.refCount == 0 then
			t_1[p1] = true
			
			if var1 then return end
			var1 = true
			task.delay(5, flushPendingCleanup)
		end
	end,
	flushPendingCleanup = flushPendingCleanup
}