local foundation = script:FindFirstAncestor("Foundation")
local parent = script.Parent.Parent
local _ = require(parent.Enums.ColorMode)
local deviceModule = require(parent.Enums.Device)
local themeNameModule = require(parent.Enums.ThemeName)
local _ = require(parent.Providers.Style.Tokens)
local _ = require(script.Parent.Rules.Types)
local flagsModule = require(parent.Utility.Flags)
local devAssertModule = require(parent.Utility.devAssert)
local getGeneratedRulesModule = require(parent.Utility.getGeneratedRules)
local getMainGuiModule = require(parent.Utility.getMainGui)
local getOverrideAttributesModule = require(script.Parent.getOverrideAttributes)
local scaleValueModule = require(parent.Utility.scaleValue)
local httpService = game:GetService("HttpService")
local foundationStyleSheets = Instance.new("Folder")

if flagsModule.FoundationDontParentToFoundationModule then
	foundationStyleSheets.Name = "FoundationStyleSheets" .. httpService:GenerateGUID(false)
else
	foundationStyleSheets.Name = "FoundationStyleSheets"
end
if flagsModule.FoundationDontParentToFoundationModule then
	local var1 = getMainGuiModule()
	devAssertModule(var1 ~= nil, "MainGui not found")
	foundationStyleSheets.Parent = var1
else
	foundationStyleSheets.Parent = foundation
end
local t = {}
local t_1 = {}
local var2 = false

local function createStyleSheet(p1, p2, p3, p4, p5)
	-- upvalues: deviceModule (ref), themeNameModule (ref), foundationStyleSheets (ref), getOverrideAttributesModule (ref), getGeneratedRulesModule (ref)
	p2 = p2 or deviceModule.Desktop
	p3 = p3 or 1
	p5 = p5 or themeNameModule.Default
	local styleSheet = Instance.new("StyleSheet")
	local var3 = `{p5}-`
	styleSheet.Name = if p4 ~= nil then `{var3}{p1}-{p2}-{p3}` else `{var3}{p1}-{p2}-{p3}-{tostring(p4)}`
	styleSheet.Parent = foundationStyleSheets
	
	return {
		refCount = 0,
		themeName = p5,
		colorMode = p1,
		device = p2,
		scale = p3,
		tokenOverrides = p4,
		overrideAttributes = getOverrideAttributesModule(p5, p1, p2, p4),
		instance = styleSheet,
		tags = {},
		rules = getGeneratedRulesModule(p5, p1, p2),
		attributes = {}
	}
end

local function createStyleRule(p1, p2)
	-- upvalues: flagsModule (ref)
	local text = "." .. p6
	local var3 = if p1.modifier ~= nil then "" else ":" .. p5.modifier
	local text_1 = text .. var28 .. (if p1.pseudo ~= nil then "" else " ::" .. p5.pseudo)
	
	if flagsModule.FoundationStyleRulePseudoName then
		if p1.pseudoName ~= nil then
			text_1 ..= " #" .. p5.pseudoName
		end
		if p1.pseudo ~= nil and p1.pseudoName == nil then
			text_1 ..= ", " .. text .. var28 .. " > " .. p5.pseudo
		end
	elseif p1.pseudo ~= nil then
		text_1 ..= ", " .. text .. var28 .. " > " .. p5.pseudo
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
			local var3 = if name ~= nil then v.value else name
			local var4 = if flagsModule.FoundationDisableTokenScaling then var3 else scaleValueModule(var3, p1.scale)
			p1.attributes[v.name] = true
			p1.instance:SetAttribute(v.name, var4)
		end
	end
end

local function addRegisteredStyleSheetTags(p3, p4)
	-- upvalues: flagsModule (ref), createStyleRule (ref), applyAttributes (ref)
	for i, v in p4 do
		if not p3.tags[v] then
			local var5 = p3.rules[v]
			
			if var5 and (flagsModule.FoundationStyleRulePseudoName or var5.pseudoName == nil) then
				createStyleRule(var5, v).Parent = p3.instance
				applyAttributes(p3, var5.attributes)
				
				if var5.children then
					for i_1, v_1 in var5.children do
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
	-- upvalues: deviceModule (ref), themeNameModule (ref), t (ref), t_1 (ref), createStyleSheet (ref)
	p6 = p6 or deviceModule.Desktop
	p7 = p7 or 1
	p9 = p9 or themeNameModule.Default
	
	for i, v in t do
		if v.themeName == p9 and v.colorMode == p5 and (v.device == p6 and v.scale == p7) and v.tokenOverrides == p8 then
			t_1[i] = nil
			
			return i
		end
	end
	local var6 = createStyleSheet(p5, p6, p7, p8, p9)
	t[var6.instance] = var6
	
	return var6.instance
end

local function addStyleTags(p10, p11)
	-- upvalues: t (ref), addRegisteredStyleSheetTags (ref)
	local var7 = t[p10]
	
	if not var7 then
		error("StyleSheet not found in registry")
	end
	addRegisteredStyleSheetTags(var7, p11)
end

local function _(p10)
	-- upvalues: t (ref)
	local var7 = t[p10]
	
	if var7 == nil or var7.refCount > 0 then
		return
	end
	t[p10] = nil
	p10:Destroy()
end

local function flushPendingCleanup()
	-- upvalues: var2 (write), t_1 (ref), t (ref)
	var2 = false
	
	for i in t_1 do
		t_1[i] = nil
		local var7 = t[i]
		
		if var7 ~= nil and var7.refCount <= 0 then
			t[i] = nil
			i:Destroy()
		end
	end
end

local _ = function(p10)
	-- upvalues: t_1 (ref), var2 (write), flushPendingCleanup (ref)
	t_1[p10] = true
	
	if var2 then
		return
	end
	var2 = true
	task.delay(5, flushPendingCleanup)
end

return {
	resolveStyleSheet = resolveStyleSheet,
	getStyleSheet = function(p10, p11, p12, p13, p14)
		-- upvalues: resolveStyleSheet (ref), t (ref), t_1 (ref)
		local var8 = resolveStyleSheet(p10, p11, p12, p13, p14)
		local var9 = t[var8]
		
		if var9 == nil then
			return var8
		end
		var9.refCount += 1
		t_1[var8] = nil
		
		return var8
	end,
	addStyleTags = addStyleTags,
	acquireStyleSheet = function(p10)
		-- upvalues: t (ref), t_1 (ref)
		local var8 = t[p10]
		
		if var8 == nil then
			return
		end
		var8.refCount += 1
		t_1[p10] = nil
	end,
	releaseStyleSheet = function(p10)
		-- upvalues: t (ref), t_1 (ref), var2 (write), flushPendingCleanup (ref)
		local var8 = t[p10]
		
		if var8 == nil or var8.refCount == 0 then return end
		var8.refCount -= 1
		
		if var8.refCount == 0 then
			t_1[p10] = true
			
			if var2 then return end
			var2 = true
			task.delay(5, flushPendingCleanup)
		end
	end,
	flushPendingCleanup = flushPendingCleanup
}