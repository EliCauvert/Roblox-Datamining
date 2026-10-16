local CornerPropertyModule = require(script:FindFirstAncestor("Foundation").Enums.CornerProperty)
local _ = require(script.Parent.Types)
local _UDim = UDim.new(0, 0)
local list = {
	CornerPropertyModule.TopLeft,
	CornerPropertyModule.TopRight,
	CornerPropertyModule.BottomRight,
	CornerPropertyModule.BottomLeft
}
local config = {
	["top-left"] = CornerPropertyModule.TopLeft,
	["top-right"] = CornerPropertyModule.TopRight,
	["bottom-right"] = CornerPropertyModule.BottomRight,
	["bottom-left"] = CornerPropertyModule.BottomLeft
}
local config1 = {
	top = {
		CornerPropertyModule.TopLeft,
		CornerPropertyModule.TopRight
	},
	bottom = {
		CornerPropertyModule.BottomLeft,
		CornerPropertyModule.BottomRight
	},
	left = {
		CornerPropertyModule.TopLeft,
		CornerPropertyModule.BottomLeft
	},
	right = {
		CornerPropertyModule.TopRight,
		CornerPropertyModule.BottomRight
	}
}

local function _(p1, List) --[[ Line: 44 | Named "cornerProperties" ]]
	local t = {}
	
	for _, value in List do
		t[value] = p1
	end
	return t
end

local _ = function(Tag) --[[ Line: 54 | Named "zeroedBaseline" ]]
	-- upvalues: _UDim (copy), list (copy)
	local config = { pseudo = "UICorner", priority = 0, tag = Tag }
	local Properties = {}
	
	for _, value in list do
		Properties[value] = _UDim
	end
	config.properties = Properties
	
	return config
end

return function(List, Callback) --[[ Line: 63 | Named "cornerRules" ]]
	-- upvalues: list (copy), config1 (copy), _UDim (copy), config (copy)
	local List1 = {}
	
	for _, value in List do
		local CallbackResult = Callback(value)
		local CornerValue = CallbackResult.cornerValue
		local Attributes = CallbackResult.attributes
		local config2 = {
			pseudo = "UICorner",
			priority = 1,
			tag = `radius-{value.name}`
		}
		local Properties = {}
		
		for _, value1 in list do
			Properties[value1] = CornerValue
		end
		config2.properties = Properties
		config2.attributes = Attributes
		table.insert(List1, config2)
		
		for i, value2 in config1 do
			local RadiusName: string = `radius-{i}-{value.name}`
			local config3 = { pseudo = "UICorner", priority = 2, tag = RadiusName }
			local Properties1 = {}
			
			for _, value3 in value2 do
				Properties1[value3] = CornerValue
			end
			config3.properties = Properties1
			config3.attributes = Attributes
			local Children = {}
			local config4 = { pseudo = "UICorner", priority = 0, tag = RadiusName }
			local Properties2 = {}
			
			for _, value4 in list do
				Properties2[value4] = _UDim
			end
			config4.properties = Properties2
			Children[1] = config4
			config3.children = Children
			table.insert(List1, config3)
		end
		for i1, value5 in config do
			local RadiusName: string = `radius-{i1}-{value.name}`
			local config5 = { pseudo = "UICorner", priority = 3, tag = RadiusName }
			local Properties3 = {}
			
			for _, value6 in { value5 } do
				Properties3[value6] = CornerValue
			end
			config5.properties = Properties3
			config5.attributes = Attributes
			local Children = {}
			local config6 = { pseudo = "UICorner", priority = 0, tag = RadiusName }
			local Properties4 = {}
			
			for _, value7 in list do
				Properties4[value7] = _UDim
			end
			config6.properties = Properties4
			Children[1] = config6
			config5.children = Children
			table.insert(List1, config5)
		end
	end
	return List1
end