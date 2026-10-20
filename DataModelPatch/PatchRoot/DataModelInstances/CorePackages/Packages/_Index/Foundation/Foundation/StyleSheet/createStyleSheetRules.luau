local Parent = script.Parent
local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local StyleRuleModule = require(Parent.StyleRule)
local _ = require(Parent.Rules.Types)
local _ = require(Foundation.Enums.Device)
local FlagsModule = require(Foundation.Utility.Flags)
local _ = require(Foundation.Enums.Theme)
local _ = require(Parent.getOverrideAttributes)
local ScaleValueModule = require(Foundation.Utility.scaleValue)

local function insertRule(List, p1, Tag)
	-- upvalues: ReactModule (copy), StyleRuleModule (copy)
	local Properties = p1.properties
	local Text = "." .. Tag
	local Text1: string = if p1.modifier == nil then "" else ":" .. p1.modifier
	local Text2 = Text .. Text1 .. (if p1.pseudo == nil then "" else " ::" .. p1.pseudo)
	
	if p1.pseudo ~= nil then
		Text2 ..= ", " .. Text .. Text1 .. " > " .. p1.pseudo
	end
	table.insert(List, ReactModule.createElement(StyleRuleModule, {
		key = Text2,
		Priority = p1.priority,
		Selector = Text2,
		properties = Properties
	}))
end

local function updateRuleAttributes(Object, Attributes, p1, p2, p3)
	-- upvalues: FlagsModule (copy), ScaleValueModule (copy)
	local Attributes1 = Attributes or {}
	local P5 = if FlagsModule.FoundationDisableTokenScaling then 1 else p2 or 1
	for _, value in Attributes1 do
		local v1 = if p3 then p3[value.name] else nil
		local ScaleValueModuleResult = ScaleValueModule(if v1 == nil then value.value else v1, P5)
		
		if p1[value.name] ~= ScaleValueModuleResult then
			Object:SetAttribute(value.name, ScaleValueModuleResult)
			p1[value.name] = ScaleValueModuleResult
		end
	end
end

return function(p4, List, p5, p6, p7, p8)
	-- upvalues: updateRuleAttributes (copy), insertRule (copy)
	local t = {}
	
	for i, _ in List do
		local v2 = p4[i]
		
		if v2 ~= nil then
			if p5 and p6 then
				updateRuleAttributes(p5, v2.attributes, p6, p7, p8)
			end
			insertRule(t, v2, i)
			
			if v2.children then
				for _, child in v2.children do
					if p5 and p6 then
						updateRuleAttributes(p5, child.attributes, p6, p7, p8)
					end
					insertRule(t, child, child.tag)
				end
			end
		end
	end
	return t
end