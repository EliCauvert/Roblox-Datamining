local Foundation = script:FindFirstAncestor("Foundation")
local ShadowPresetModule = require(Foundation.Enums.ShadowPreset)
local _ = require(Foundation.Providers.Style.Tokens)
local _ = require(script.Parent.Types)
local list = {
	{
		name = ShadowPresetModule.Raised100,
		layers = {
			{ blur = "100", spread = "0" },
			{ blur = "500", spread = "0" }
		}
	},
	{
		name = ShadowPresetModule.Raised300,
		layers = {
			{ blur = "100", spread = "0" },
			{ blur = "500", spread = "0" },
			{ blur = "800", spread = "0" },
			{ blur = "1400", spread = "0" }
		}
	},
	{
		name = ShadowPresetModule.Overlay100,
		layers = {
			{ offsetY = "50", blur = "100", spread = "-0.5" },
			{ offsetY = "250", blur = "500", spread = "-0.75" }
		}
	},
	{
		name = ShadowPresetModule.Overlay300,
		layers = {
			{ offsetY = "50", blur = "100", spread = "-0.5" },
			{ offsetY = "250", blur = "500", spread = "-0.75" },
			{ offsetY = "400", blur = "800", spread = "-1" },
			{ offsetY = "1200", blur = "1400", spread = "-1.5" }
		}
	}
}

local function _(p1): string
	return `Size_{p1}`
end

local _ = function(p1, p2): string
	return `Shadow{p1}Size{p2}`
end

local function layerRule(ShadowName, p1, p2, Size, ShadowColor)
	local ShadowBlurSizeName: string = `ShadowBlurSize{p1.blur}`
	local Floored = math.floor((tonumber(p1.spread)))
	local Properties = {
		Transparency = 0.92,
		BlurRadius = "$" .. ShadowBlurSizeName,
		Color = ShadowColor,
		Spread = UDim2.fromOffset(Floored, Floored),
		ZIndex = -p2
	}
	local Attributes = {
		{
			name = ShadowBlurSizeName,
			value = UDim.new(0, Size[`Size_{p1.blur}`])
		}
	}
	
	if p1.offsetY == nil then
		Properties.Offset = UDim2.new()
	else
		local ShadowOffsetSizeName: string = `ShadowOffsetSize{p1.offsetY}`
		Properties.Offset = "$" .. ShadowOffsetSizeName
		table.insert(Attributes, {
			name = ShadowOffsetSizeName,
			value = UDim2.fromOffset(0, Size[`Size_{p1.offsetY}`])
		})
	end
	return {
		pseudo = "UIShadow",
		tag = ShadowName,
		pseudoName = `{ShadowName}-{p2}`,
		properties = Properties,
		attributes = Attributes
	}
end

return function(p1)
	-- upvalues: list (copy), layerRule (copy)
	local Size = p1.Size
	local ShadowColor3 = p1.Color.Common.Shadow.Color3
	local List = {}
	
	for _, value in list do
		local ShadowName: string = `shadow-{value.name}`
		local Layers = value.layers
		local LayerRuleResult = layerRule(ShadowName, Layers[1], 1, Size, ShadowColor3)
		
		if #Layers > 1 then
			local Children = {}
			
			for i = 2, #Layers do
				table.insert(Children, (layerRule(ShadowName, Layers[i], i, Size, ShadowColor3)))
			end
			LayerRuleResult.children = Children
		end
		table.insert(List, LayerRuleResult)
	end
	return List
end