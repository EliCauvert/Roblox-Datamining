-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:28 2026 Pacific Standard Time.

local cornerPropertyModule = require(script:FindFirstAncestor("Foundation").Enums.CornerProperty)
local _ = require(script.Parent.Types)
local uDim = UDim.new(0, 0)
local list = {
	cornerPropertyModule.TopLeft,
	cornerPropertyModule.TopRight,
	cornerPropertyModule.BottomRight,
	cornerPropertyModule.BottomLeft
}
local t = {
	["top-left"] = cornerPropertyModule.TopLeft,
	["top-right"] = cornerPropertyModule.TopRight,
	["bottom-right"] = cornerPropertyModule.BottomRight,
	["bottom-left"] = cornerPropertyModule.BottomLeft
}
local t_1 = {
	top = {
		cornerPropertyModule.TopLeft,
		cornerPropertyModule.TopRight
	},
	bottom = {
		cornerPropertyModule.BottomLeft,
		cornerPropertyModule.BottomRight
	},
	left = {
		cornerPropertyModule.TopLeft,
		cornerPropertyModule.BottomLeft
	},
	right = {
		cornerPropertyModule.TopRight,
		cornerPropertyModule.BottomRight
	}
}

local function _(p0, p1) --[[ line: 44 | named "cornerProperties" ]]
	local t = {}
	
	for i, v in p1 do
		t[v] = p0
	end
	return t
end

local _ = function(p2) --[[ line: 54 | named "zeroedBaseline" ]]
	-- upvalues: uDim (ref), list (ref)
	local t = { pseudo = "UICorner", priority = 0, tag = p2 }
	local t_1 = {}
	
	for i, v in list do
		t_1[v] = uDim
	end
	t.properties = t_1
	
	return t
end

return function(p3, p4) --[[ line: 63 | named "cornerRules" ]]
	-- upvalues: list (ref), t_1 (ref), uDim (ref), t (ref)
	local t_2 = {}
	
	for i, v in p3 do
		local v_1
		local var9 = p4(v)
		local cornerValue = var9.cornerValue
		local attributes = var9.attributes
		local t_3 = {
			pseudo = "UICorner",
			priority = 1,
			tag = `radius-{v.name}`
		}
		local t_4 = {}
		
		for i_1, v_1 in list do
			t_4[v_1] = cornerValue
		end
		local i_1, t_7
		t_3.properties = t_4
		t_3.attributes = attributes
		table.insert(t_2, t_3)
		
		for i_2, v_2 in t_1 do
			local var17 = `radius-{i_2}-{v.name}`
			local t_5 = { pseudo = "UICorner", priority = 2, tag = var17 }
			v_1 = {}
			
			for t_7, i_4 in v_2 do
				v_1[i_4] = cornerValue
			end
			t_5.properties = v_1
			t_5.attributes = attributes
			i_1 = {}
			v_1 = { pseudo = "UICorner", priority = 0, tag = var17 }
			local var19 = uDim
			t_7 = {}
			
			for i_5, v_5 in list do
				t_7[v_5] = var19
			end
			v_1.properties = t_7
			-- Unknown statement at pc 1: <SetList>
			t_5.children = i_1
			table.insert(t_2, t_5)
		end
		for i_2, v_2 in t do
			local var12 = `radius-{i_2}-{v.name}`
			local t_5 = { pseudo = "UICorner", priority = 3, tag = var12 }
			local t_6 = {}
			
			for i_4, v_4 in { v_2 } do
				t_6[v_4] = cornerValue
			end
			t_5.properties = t_6
			t_5.attributes = attributes
			i_1 = {}
			v_1 = { pseudo = "UICorner", priority = 0, tag = var12 }
			local var15 = uDim
			t_7 = {}
			
			for i_5, v_5 in list do
				t_7[v_5] = var15
			end
			v_1.properties = t_7
			-- Unknown statement at pc 1: <SetList>
			t_5.children = i_1
			table.insert(t_2, t_5)
		end
	end
	return t_2
end