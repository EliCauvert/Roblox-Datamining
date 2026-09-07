local parent = script.Parent
local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local styleRuleModule = require(parent.StyleRule)
local _ = require(parent.Rules.Types)
local _ = require(foundation.Enums.ColorMode)
local _ = require(foundation.Enums.Device)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(parent.getOverrideAttributes)
local scaleValueModule = require(foundation.Utility.scaleValue)

local function insertRule(p1, p2, p3)
	-- upvalues: reactModule (ref), styleRuleModule (ref)
	local properties = p2.properties
	local text = "." .. p2
	local var1 = if p2.modifier ~= nil then "" else ":" .. p1.modifier
	local text_1 = text .. var8 .. (if p2.pseudo ~= nil then "" else " ::" .. p1.pseudo)
	
	if p2.pseudo ~= nil then
		text_1 ..= ", " .. text .. var8 .. " > " .. p1.pseudo
	end
	table.insert(p1, reactModule.createElement(styleRuleModule, {
		key = text_1,
		Priority = p2.priority,
		Selector = text_1,
		properties = properties
	}))
end

local function updateRuleAttributes(p1, p2, p3, p4, p5)
	-- upvalues: flagsModule (ref), scaleValueModule (ref)
	p4 = if flagsModule.FoundationDisableTokenScaling then 1 else p4 or 1
	
	for i, v in p2 or {} do
		local var1 = if p5 then p5[v.name] else nil
		local var2 = scaleValueModule(if var1 ~= nil then v.value else var1, p4)
		
		if p3[v.name] ~= var2 then
			p1:SetAttribute(v.name, var2)
			p3[v.name] = var2
		end
	end
end

return function(p6, p7, p8, p9, p10, p11)
	-- upvalues: updateRuleAttributes (ref), insertRule (ref)
	local t = {}
	
	for i, v in p7 do
		local var3 = p6[i]
		
		if var3 ~= nil then
			if p8 and p9 then
				updateRuleAttributes(p8, var3.attributes, p9, p10, p11)
			end
			insertRule(t, var3, i)
			
			if var3.children then
				for i_1, v_1 in var3.children do
					if p8 and p9 then
						updateRuleAttributes(p8, v_1.attributes, p9, p10, p11)
					end
					insertRule(t, v_1, v_1.tag)
				end
			end
		end
	end
	return t
end