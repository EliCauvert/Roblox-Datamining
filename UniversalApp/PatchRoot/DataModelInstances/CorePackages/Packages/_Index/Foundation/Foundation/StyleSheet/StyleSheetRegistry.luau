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
local var10 = false

local function createStyleSheet(p0, p1, p2, p3, p4) --[[ line: 55 ]]
	-- upvalues: deviceModule (ref), themeNameModule (ref), flagsModule (ref), foundationStyleSheets (ref), getOverrideAttributesModule (ref), getGeneratedRulesModule (ref)
	p1 = p1 or deviceModule.Desktop
	p2 = p2 or 1
	p4 = p4 or themeNameModule.Default
	local styleSheet = Instance.new("StyleSheet")
	local var22 = if flagsModule.FoundationThemeName then `{p4}-` else ""
	styleSheet.Name = if p3 ~= nil then `{var22}{p0}-{p1}-{p2}` else `{var22}{p0}-{p1}-{p2}-{tostring(p3)}`
	styleSheet.Parent = foundationStyleSheets
	
	return {
		refCount = 0,
		themeName = p4,
		colorMode = p0,
		device = p1,
		scale = p2,
		tokenOverrides = p3,
		overrideAttributes = getOverrideAttributesModule(if flagsModule.FoundationThemeName then p4 else nil, p0, p1, p3),
		instance = styleSheet,
		tags = {},
		rules = getGeneratedRulesModule(if flagsModule.FoundationThemeName then p4 else nil, p0, p1),
		attributes = {}
	}
end

local function createStyleRule(p5, p6) --[[ line: 91 ]]
	local text = "." .. p6
	local var24 = if p5.modifier ~= nil then "" else ":" .. p5.modifier
	local text_1 = text .. var24 .. (if p5.pseudo ~= nil then "" else " ::" .. p5.pseudo)
	
	if p5.pseudo ~= nil then
		text_1 ..= ", " .. text .. var24 .. " > " .. p5.pseudo
	end
	local styleRule = Instance.new("StyleRule")
	styleRule.Name = text_1
	styleRule.Priority = p5.priority or 1
	styleRule.Selector = text_1
	styleRule:SetProperties(p5.properties)
	
	return styleRule
end

local function applyAttributes(p7, p8) --[[ line: 109 ]]
	-- upvalues: flagsModule (ref), scaleValueModule (ref)
	if not p8 then return end
	for i, v in p8 do
		if not p7.attributes[v.name] then
			local name = p7.overrideAttributes[v.name]
			local var27 = if name ~= nil then v.value else name
			local var28 = if flagsModule.FoundationDisableTokenScaling then var27 else scaleValueModule(var27, p7.scale)
			p7.attributes[v.name] = true
			p7.instance:SetAttribute(v.name, var28)
		end
	end
end

local function addRegisteredStyleSheetTags(p9, p10) --[[ line: 127 ]]
	-- upvalues: createStyleRule (ref), applyAttributes (ref)
	for i, v in p10 do
		if not p9.tags[v] then
			local var29 = p9.rules[v]
			
			if var29 then
				createStyleRule(var29, v).Parent = p9.instance
				applyAttributes(p9, var29.attributes)
				
				if var29.children then
					for i_1, v_1 in var29.children do
						createStyleRule(v_1, v_1.tag).Parent = p9.instance
						applyAttributes(p9, v_1.attributes)
					end
				end
				p9.tags[v] = true
			end
		end
	end
end

local function resolveStyleSheet(p11, p12, p13, p14, p15) --[[ line: 161 ]]
	-- upvalues: deviceModule (ref), themeNameModule (ref), t (ref), flagsModule (ref), t_1 (ref), createStyleSheet (ref)
	p12 = p12 or deviceModule.Desktop
	p13 = p13 or 1
	p15 = p15 or themeNameModule.Default
	
	for i, v in t do
		if (not flagsModule.FoundationThemeName or v.themeName == p15) and (v.colorMode == p11 and v.device == p12) and (v.scale == p13 and v.tokenOverrides == p14) then
			if flagsModule.FoundationStyleSheetRefCounting then
				t_1[i] = nil
			end
			return i
		end
	end
	local var33 = createStyleSheet(p11, p12, p13, p14, p15)
	t[var33.instance] = var33
	
	return var33.instance
end

local function addStyleTags(p16, p17) --[[ line: 193 ]]
	-- upvalues: t (ref), addRegisteredStyleSheetTags (ref)
	local var34 = t[p16]
	
	if not var34 then
		error("StyleSheet not found in registry")
	end
	addRegisteredStyleSheetTags(var34, p17)
end

local function _(p18) --[[ line: 211 | named "destroyStyleSheet" ]]
	-- upvalues: t (ref)
	local var35 = t[p18]
	
	if var35 == nil or var35.refCount > 0 then
		return
	end
	t[p18] = nil
	p18:Destroy()
end

local function flushPendingCleanup() --[[ line: 220 ]]
	-- upvalues: var10 (write), t_1 (ref), t (ref)
	var10 = false
	
	for i in t_1 do
		t_1[i] = nil
		local var36 = t[i]
		
		if var36 ~= nil and var36.refCount <= 0 then
			t[i] = nil
			i:Destroy()
		end
	end
end

local _ = function(p19) --[[ line: 228 | named "scheduleCleanup" ]]
	-- upvalues: t_1 (ref), var10 (write), flushPendingCleanup (ref)
	t_1[p19] = true
	
	if var10 then
		return
	end
	var10 = true
	task.delay(5, flushPendingCleanup)
end

return {
	resolveStyleSheet = resolveStyleSheet,
	getStyleSheet = function(p20, p21, p22, p23, p24) --[[ line: 278 ]]
		-- upvalues: resolveStyleSheet (ref), flagsModule (ref), t (ref), t_1 (ref)
		local var37 = resolveStyleSheet(p20, p21, p22, p23, p24)
		
		if not flagsModule.FoundationStyleSheetRefCounting then
			return var37
		end
		local var38 = t[var37]
		
		if var38 == nil then
			return var37
		end
		var38.refCount += 1
		t_1[var37] = nil
		
		return var37
	end,
	addStyleTags = addStyleTags,
	acquireStyleSheet = function(p25) --[[ line: 237 ]]
		-- upvalues: flagsModule (ref), t (ref), t_1 (ref)
		if not flagsModule.FoundationStyleSheetRefCounting then return end
		local var39 = t[p25]
		
		if var39 == nil then
			return
		end
		var39.refCount += 1
		t_1[p25] = nil
	end,
	releaseStyleSheet = function(p26) --[[ line: 250 ]]
		-- upvalues: flagsModule (ref), t (ref), t_1 (ref), var10 (write), flushPendingCleanup (ref)
		if not flagsModule.FoundationStyleSheetRefCounting then return end
		local var40 = t[p26]
		
		if var40 == nil or var40.refCount == 0 then return end
		var40.refCount -= 1
		
		if var40.refCount == 0 then
			t_1[p26] = true
			
			if var10 then return end
			var10 = true
			task.delay(5, flushPendingCleanup)
		end
	end,
	flushPendingCleanup = flushPendingCleanup
}