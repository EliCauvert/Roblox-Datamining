local Foundation = script:FindFirstAncestor("Foundation")
local ControlStateModule = require(Foundation.Enums.ControlState)
local _ = require(Foundation.Providers.Style.Tokens)
local _ = require(Foundation.Components.Types)
local BlendColorsModule = require(Foundation.Utility.blendColors)
local GetStateLayerStyleModule = require(Foundation.Components.Interactable.getStateLayerStyle)
local MapBindableModule = require(Foundation.Utility.mapBindable)

local function _(p1)
	-- upvalues: MapBindableModule (copy)
	return MapBindableModule(p1, function(p2)
		return { Transparency = 0, Color3 = p2.Color3 }
	end)
end

local function getStateOverlay(p1, Hover)
	-- upvalues: ControlStateModule (copy), GetStateLayerStyleModule (copy)
	if Hover == ControlStateModule.Hover or Hover == ControlStateModule.Pressed or Hover == ControlStateModule.SelectedPressed then
		local StateLayerStyleModule = GetStateLayerStyleModule(p1, nil, Hover)
		
		return if StateLayerStyleModule.Color3 == nil then nil else {
			Color3 = StateLayerStyleModule.Color3,
			Transparency = StateLayerStyleModule.Transparency or 0
		}
	else
		return nil
	end
end

local _ = function(p1, p2)
	-- upvalues: MapBindableModule (copy), BlendColorsModule (copy)
	return MapBindableModule(p1, function(p3)
		-- upvalues: BlendColorsModule (upval), p2 (copy)
		return BlendColorsModule(p3, p2)
	end)
end

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: getStateOverlay (copy), MapBindableModule (copy), BlendColorsModule (copy)
	if p3 == nil or p4 then
		local P11 = p3 ~= nil and p5
		local Shift200 = if P11 then p1.Color.Shift.Shift_200 else p2
		local StateOverlay = getStateOverlay(p1, p6)
		
		return if StateOverlay == nil then Shift200 else MapBindableModule(Shift200, function(p7)
			-- upvalues: BlendColorsModule (upval), StateOverlay (copy)
			return BlendColorsModule(p7, StateOverlay)
		end), if P11 then MapBindableModule(p2, function(p7)
			return { Transparency = 0, Color3 = p7.Color3 }
		end) else nil
	else
		return p2, nil
	end
end