local foundation = script:FindFirstAncestor("Foundation")
local deviceModule = require(foundation.Enums.Device)
local _ = require(foundation.Enums.Theme)
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

local function createStyleSheet(p0, p1, p2, p3) --[[ line: 47 ]]
	-- upvalues: deviceModule (ref), foundationStyleSheets (ref), getOverrideAttributesModule (ref), getGeneratedRulesModule (ref)
	p1 = p1 or deviceModule.Desktop
	p2 = p2 or 1
	local styleSheet = Instance.new("StyleSheet")
	styleSheet.Name = if p3 ~= nil then `{p0}-{p1}-{p2}` else `{p0}-{p1}-{p2}-{tostring(p3)}`
	styleSheet.Parent = foundationStyleSheets
	
	return {
		theme = p0,
		device = p1,
		scale = p2,
		tokenOverrides = p3,
		overrideAttributes = getOverrideAttributesModule(p0, p1, p3),
		instance = styleSheet,
		tags = {},
		rules = getGeneratedRulesModule(p0, p1),
		attributes = {}
	}
end

local function createStyleRule(p4, p5) --[[ line: 73 ]]
	local text = "." .. p5
	local var16 = if p4.modifier ~= nil then "" else ":" .. p4.modifier
	local text_1 = text .. var16 .. (if p4.pseudo ~= nil then "" else " ::" .. p4.pseudo)
	
	if p4.pseudo ~= nil then
		text_1 ..= ", " .. text .. var16 .. " > " .. p4.pseudo
	end
	local styleRule = Instance.new("StyleRule")
	styleRule.Name = text_1
	styleRule.Priority = p4.priority or 1
	styleRule.Selector = text_1
	styleRule:SetProperties(p4.properties)
	
	return styleRule
end

local function applyAttributes(p6, p7) --[[ line: 91 ]]
	-- upvalues: flagsModule (ref), scaleValueModule (ref)
	if not p7 then return end
	for i, v in p7 do
		if not p6.attributes[v.name] then
			local name = p6.overrideAttributes[v.name]
			local var19 = if name ~= nil then v.value else name
			local var20 = if flagsModule.FoundationDisableTokenScaling then var19 else scaleValueModule(var19, p6.scale)
			p6.attributes[v.name] = true
			p6.instance:SetAttribute(v.name, var20)
		end
	end
end

local function addRegisteredStyleSheetTags(p8, p9) --[[ line: 109 ]]
	-- upvalues: createStyleRule (ref), applyAttributes (ref)
	for i, v in p9 do
		if not p8.tags[v] then
			local var21 = p8.rules[v]
			
			if var21 then
				createStyleRule(var21, v).Parent = p8.instance
				applyAttributes(p8, var21.attributes)
				
				if var21.children then
					for i_1, v_1 in var21.children do
						createStyleRule(v_1, v_1.tag).Parent = p8.instance
						applyAttributes(p8, v_1.attributes)
					end
				end
				p8.tags[v] = true
			end
		end
	end
end

return {
	getStyleSheet = function(p10, p11, p12, p13) --[[ line: 139 ]]
		-- upvalues: deviceModule (ref), t (ref), createStyleSheet (ref)
		p11 = p11 or deviceModule.Desktop
		p12 = p12 or 1
		
		for i, v in t do
			if v.theme == p10 and v.device == p11 and (v.scale == p12 and v.tokenOverrides == p13) then
				return i
			end
		end
		local var24 = createStyleSheet(p10, p11, p12, p13)
		t[var24.instance] = var24
		
		return var24.instance
	end,
	addStyleTags = function(p14, p15) --[[ line: 162 ]]
		-- upvalues: t (ref), addRegisteredStyleSheetTags (ref)
		local var25 = t[p14]
		
		if not var25 then
			error("StyleSheet not found in registry")
		end
		addRegisteredStyleSheetTags(var25, p15)
	end
}