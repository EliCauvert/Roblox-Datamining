local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("./overlay_types")
local _ = require("../vendor/compose/core")
local OverlayPartsModule = require("./overlay_parts")
local _ = require("./navigation_props")
local v1 = require("./freeze")({
	automatic = true,
	adaptive = true,
	bottom = true,
	side = true,
	center = true
})

return function(p1)
	-- upvalues: v1 (copy), OverlayPartsModule (copy)
	return {
		prepare = function(p2)
			-- upvalues: v1 (upval), OverlayPartsModule (upval), p1 (copy)
			assert(p2.detent == nil or (type(p2.detent) == "string" or type(p2.detent) == "table" and p2.detent.set), "Sheet.detent requires a detent id or a writable Compose cell")
			local Placement = p2.placement or "automatic"
			assert(v1[Placement], "Sheet.placement must be automatic, adaptive, bottom, side or center")
			assert(p2.edge == nil or (if Placement == "side" then p2.edge == "left" or p2.edge == "right" else Placement == "adaptive" and (p2.edge == "left" or p2.edge == "right")), "Sheet.edge is left or right, and only with placement side or adaptive")
			OverlayPartsModule.checkPreset(p1, "Sheet", "width", p2.width, OverlayPartsModule.WIDTH_PRESETS)
			assert(p2.closeButton == nil or (type(p2.closeButton) == "boolean" or OverlayPartsModule.bound(p1, p2.closeButton, "string")), "Sheet.closeButton must be a boolean or a label")
			local HeaderFunction = p2.header
			assert(HeaderFunction == nil or (HeaderFunction == false or (OverlayPartsModule.instance(HeaderFunction) or type(HeaderFunction) == "function")), "Sheet.header must be an Instance, a content factory or false")
			assert(p2.contentInset == nil or (p2.contentInset == "standard" or p2.contentInset == "none"), "Sheet.contentInset must be standard or none")
			assert(p2.actionLayout == nil or (p2.actionLayout == "automatic" or (p2.actionLayout == "row" or p2.actionLayout == "stacked")), "Sheet.actionLayout must be automatic, row or stacked")
			assert(p2.scrollPolicy == nil or (p2.scrollPolicy == "always" or p2.scrollPolicy == "atLargestDetent"), "Sheet.scrollPolicy must be always or atLargestDetent")
			assert(p2.dragIndicator == nil or (p2.dragIndicator == "automatic" or (p2.dragIndicator == "visible" or p2.dragIndicator == "hidden")), "Sheet.dragIndicator must be automatic, visible or hidden")
			OverlayPartsModule.checkHero("UI.Sheet", p2.hero)
			OverlayPartsModule.checkActions(p1, "UI.Sheet", p2.actions, 1e999)
			local Cancel = nil
			local Actions = p2.actions or {}
			for _, action in Actions do
				if action.role == "cancel" then
					Cancel = action
				end
			end
			local Detents = {}
			local ById = {}
			local Detents1 = p2.detents or { "medium", "large" }
			assert(#Detents1 > 0, "Invalid Sheet detent")
			
			for Index, value in Detents1 do
				local config = {
					id = "",
					fraction = nil,
					height = nil,
					hug = false,
					index = Index
				}
				
				if value == "medium" then
					config.id = "medium"
					config.fraction = 0.5
				elseif value == "large" then
					config.id = "large"
					config.fraction = 0.95
				elseif value == "hug" then
					config.id = "hug"
					config.hug = true
				else
					assert(type(value) == "table", "Invalid Sheet detent")
					
					for i in value do
						assert(i == "id" or (i == "fraction" or i == "height"), "Invalid Sheet detent")
					end
					assert(type(value.id) == "string" and value.id ~= "", "Invalid Sheet detent")
					assert(value.fraction == nil ~= (value.height == nil), "Sheet detent requires exactly one of fraction or height")
					local Fraction: number = value.fraction
					local Height: number = value.height
					assert(if Fraction == nil then type(Height) == "number" and Height > 0 and Height < 1e999 else type(Fraction) == "number" and Fraction > 0 and Fraction <= 1, "Invalid Sheet detent extent")
					config.id = value.id
					config.fraction = Fraction
					config.height = Height
				end
				assert(not ById[config.id], "Sheet detents require unique ids")
				ById[config.id] = config
				table.insert(Detents, config)
			end
			return { detents = Detents, byId = ById, cancel = Cancel }
		end,
		word = function(Text: string): string
			return if Text == "hug" then "Fit" else string.upper((string.sub(Text, 1, 1))) .. string.sub(Text, 2)
		end,
		writableDetent = function(p3, p4)
			-- upvalues: p1 (copy)
			local Detent = p3.detent
			
			return if type(Detent) == "table" then Detent else p1.Compose.cell(if type(Detent) == "string" and p4.byId[Detent] then Detent else p4.detents[1].id)
		end
	}
end