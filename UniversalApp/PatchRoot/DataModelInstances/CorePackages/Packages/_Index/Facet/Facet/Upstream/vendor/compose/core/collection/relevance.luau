local _ = require("../types")
local DiagnosticsModule = require("../diagnostics")

local function tierFor(p1, p2, p3, Amount, p4): number?
	for i = 1, #p3 do
		local ScaledRadius = p3[i].radius * p4
		
		if p2 ~= nil and p2 <= i then
			ScaledRadius += Amount
		end
		if p1 <= ScaledRadius then
			return i
		end
	end
	return nil
end

return {
	checkTiers = function(List, Primitive)
		-- upvalues: DiagnosticsModule (copy)
		if #List == 0 then
			return DiagnosticsModule.raise("collection/no-tiers", ("%s was given an empty tier list"):format(Primitive), {
				contract = "a spatial collection needs at least one representation tier",
				fix = "pass tiers = { { name = \"full\", radius = 100 } }",
				primitive = Primitive
			})
		end
		local Radius = -1e999
		
		for Index, value in List do
			if type(value.name) ~= "string" then
				return DiagnosticsModule.raise("collection/tier-unnamed", ("%s was given a tier with no name"):format(Primitive), {
					expected = "name = a string, e.g. \"full\"",
					primitive = Primitive,
					index = Index,
					actual = DiagnosticsModule.describe(value.name)
				})
			end
			if type(value.radius) ~= "number" or value.radius ~= value.radius then
				return DiagnosticsModule.raise("collection/tier-radius", ("%s was given a tier with no usable radius"):format(Primitive), {
					expected = "radius = a number",
					primitive = Primitive,
					index = Index,
					detail = ("tier %q"):format(value.name),
					actual = DiagnosticsModule.describe(value.radius)
				})
			end
			if value.radius < Radius then
				return DiagnosticsModule.raise("collection/tiers-unordered", ("%s was given tiers out of order"):format(Primitive), {
					contract = "tiers are listed nearest first, by ascending radius",
					fix = "order the list so each radius is at least the one before it",
					primitive = Primitive,
					index = Index,
					detail = ("tier %q has radius %s, inside the tier before it"):format(value.name, (tostring(value.radius)))
				})
			end
			Radius = value.radius
		end
	end,
	tierFor = tierFor,
	pinnedTier = function(p5, p6, p7, p8, p9)
		-- upvalues: tierFor (copy)
		local TierForResult = tierFor(p5, p6, p7, p8, p9)
		
		return if TierForResult == nil then #p7 else TierForResult
	end
}