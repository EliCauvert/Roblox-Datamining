-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:28 2026 Pacific Standard Time.

local parent = script.Parent
local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local styleRuleModule = require(parent.StyleRule)
local _ = require(parent.Rules.Types)
local _ = require(foundation.Enums.Device)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Enums.Theme)
local _ = require(parent.getOverrideAttributes)
local scaleValueModule = require(foundation.Utility.scaleValue)

local function insertRule(p0, p1, p2) --[[ line: 23 ]]
	-- upvalues: reactModule (ref), styleRuleModule (ref)
	local properties = p1.properties
	local text = "." .. p2
	local var8 = if p1.modifier ~= nil then "" else ":" .. p1.modifier
	local text_1 = text .. var8 .. (if p1.pseudo ~= nil then "" else " ::" .. p1.pseudo)
	
	if p1.pseudo ~= nil then
		text_1 ..= ", " .. text .. var8 .. " > " .. p1.pseudo
	end
	table.insert(p0, reactModule.createElement(styleRuleModule, {
		key = text_1,
		Priority = p1.priority,
		Selector = text_1,
		properties = properties
	}))
end

local function updateRuleAttributes(p3, p4, p5, p6, p7) --[[ line: 46 ]]
	-- upvalues: flagsModule (ref), scaleValueModule (ref)
	p6 = if flagsModule.FoundationDisableTokenScaling then 1 else p6 or 1
	
	for i, v in p4 or {} do
		local var10 = if p7 then p7[v.name] else nil
		local var11 = scaleValueModule(if var10 ~= nil then v.value else var10, p6)
		
		if p5[v.name] ~= var11 then
			p3:SetAttribute(v.name, var11)
			p5[v.name] = var11
		end
	end
end

return function(p8, p9, p10, p11, p12, p13) --[[ line: 67 | named "createStyleSheetRules" ]]
	-- upvalues: updateRuleAttributes (ref), insertRule (ref)
	local t = {}
	
	for i, v in p9 do
		local var13 = p8[i]
		
		if var13 ~= nil then
			if p10 and p11 then
				updateRuleAttributes(p10, var13.attributes, p11, p12, p13)
			end
			insertRule(t, var13, i)
			
			if var13.children then
				for i_1, v_1 in var13.children do
					if p10 and p11 then
						updateRuleAttributes(p10, v_1.attributes, p11, p12, p13)
					end
					insertRule(t, v_1, v_1.tag)
				end
			end
		end
	end
	return t
end