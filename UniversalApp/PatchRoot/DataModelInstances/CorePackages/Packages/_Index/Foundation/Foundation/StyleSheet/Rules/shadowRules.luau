local foundation = script:FindFirstAncestor("Foundation")
local shadowPresetModule = require(foundation.Enums.ShadowPreset)
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(script.Parent.Types)
local list = {
	{
		name = shadowPresetModule.Raised100,
		layers = {
			{ blur = "100", spread = "0" },
			{ blur = "500", spread = "0" }
		}
	},
	{
		name = shadowPresetModule.Raised300,
		layers = {
			{ blur = "100", spread = "0" },
			{ blur = "500", spread = "0" },
			{ blur = "800", spread = "0" },
			{ blur = "1400", spread = "0" }
		}
	},
	{
		name = shadowPresetModule.Overlay100,
		layers = {
			{ offsetY = "50", blur = "100", spread = "-0.5" },
			{ offsetY = "250", blur = "500", spread = "-0.75" }
		}
	},
	{
		name = shadowPresetModule.Overlay300,
		layers = {
			{ offsetY = "50", blur = "100", spread = "-0.5" },
			{ offsetY = "250", blur = "500", spread = "-0.75" },
			{ offsetY = "400", blur = "800", spread = "-1" },
			{ offsetY = "1200", blur = "1400", spread = "-1.5" }
		}
	}
}

local function _(p1)
	return `Size_{p1}`
end

local _ = function(p1, p2)
	return `Shadow{p1}Size{p2}`
end

local function layerRule(p1, p2, p3, p4, p5)
	local blur = `ShadowBlurSize{p2.blur}`
	local floored = math.floor(tonumber(p2.spread))
	blur = {
		Transparency = 0.92,
		BlurRadius = "$" .. blur,
		Color = p5,
		Spread = UDim2.fromOffset(floored, floored),
		ZIndex = -p3
	}
	local list = {
		{ name = blur, value = UDim.new(0, p4[`Size_{p2.blur}`]) }
	}
	
	if p2.offsetY == nil then
		blur.Offset = UDim2.new()
	else
		local offsetY = `ShadowOffsetSize{p2.offsetY}`
		blur.Offset = "$" .. offsetY
		table.insert(list, {
			name = offsetY,
			value = UDim2.fromOffset(0, p4[`Size_{p2.offsetY}`])
		})
	end
	return {
		pseudo = "UIShadow",
		tag = p1,
		pseudoName = `{p1}-{p3}`,
		properties = blur,
		attributes = list
	}
end

return function(p1)
	-- upvalues: list (ref), layerRule (ref)
	local size = p1.Size
	local color3 = p1.Color.Common.Shadow.Color3
	local t = {}
	
	for i, v in list do
		local name = `shadow-{v.name}`
		local layers = v.layers
		local var1 = layerRule(name, layers[1], 1, size, color3)
		
		if #layers <= 1 then
			table.insert(t, var1)
			continue
		end
		local t_1 = {}
		
		for i_1 = 2, #layers do
			table.insert(t_1, layerRule(name, layers[i_1], i_1, size, color3))
		end
		var1.children = t_1
	end
	return t
end