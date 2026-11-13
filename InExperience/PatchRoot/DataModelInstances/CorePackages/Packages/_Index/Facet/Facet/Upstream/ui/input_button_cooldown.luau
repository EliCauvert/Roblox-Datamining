local _ = require("./types")
local _ = require("./input_types")
local ReducedFunction = require("./motion").reduced

return function(p1, p2, p3, p4)
	-- upvalues: ReducedFunction (copy)
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local Host = p1.Host
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesEnum = p1.types.Enum
	local ReadFunction = p1.read
	Runtime.mountFragment(function()
		-- upvalues: p3 (copy), ReadFunction (copy), Runtime (copy), Compose (copy), p1 (copy), ReducedFunction (upval), Host (copy), TypesVector2 (copy), TypesUDim2 (copy), p2 (copy), p4 (copy), TypesEnum (copy)
		local List = {}
		
		if p3 then
			local TweenResult = Runtime.motion(Compose.numberCodec).tween(function(p5): number
				-- upvalues: ReadFunction (upval), p3 (copy)
				local ReadResult: number = ReadFunction(p3.remaining, p5)
				local ReadResult1: number = ReadFunction(p3.total, p5)
				assert(ReadResult == ReadResult and math.abs(ReadResult) < 1e999, "Facet Button cooldown.remaining must be finite")
				assert(ReadResult1 > 0 and ReadResult1 < 1e999, "Facet Button cooldown.total must be finite and positive")
				
				return (math.clamp(ReadResult / ReadResult1, 0, 1))
			end, {
				seconds = function(p5)
					-- upvalues: p1 (upval)
					return p1.metric("motion.fast", p5)
				end,
				ease = p1.motionEase("trail"),
				reducedMotion = Compose.formula(ReducedFunction(p1))
			})
			local Object = Host.Frame("CooldownSweep")({
				BorderSizePixel = 0,
				Active = false,
				Selectable = false,
				AnchorPoint = TypesVector2.new(0, 1),
				Position = TypesUDim2.fromScale(0, 1),
				Size = function(Callback)
					-- upvalues: TypesUDim2 (upval), TweenResult (copy)
					return TypesUDim2.fromScale(1, Callback(TweenResult))
				end,
				Visible = function(Callback): boolean
					-- upvalues: TweenResult (copy)
					return Callback(TweenResult) > 0
				end,
				ZIndex = p2.ZIndex + 1
			})
			Object:AddTag("facet-cooldown")
			Object:AddTag("facet-scrim")
			table.insert(List, Object)
		end
		if p4 ~= nil then
			local Charges = p1.text({
				Name = "Charges",
				AnchorPoint = TypesVector2.new(1, 1),
				Position = TypesUDim2.new(1, -4, 1, -4),
				AutomaticSize = TypesEnum.AutomaticSize.XY,
				Text = function(p5): string
					-- upvalues: ReadFunction (upval), p4 (copy)
					local ReadResult: number = ReadFunction(p4, p5)
					assert(ReadResult >= 0 and ReadResult < 1e999 and ReadResult % 1 == 0, "Facet Button charges must be a nonnegative integer")
					
					return (tostring(ReadResult))
				end,
				ZIndex = p2.ZIndex + 2
			})
			p1.textRole(Charges, "caption")
			Charges:AddTag("facet-charges")
			table.insert(List, Charges)
		end
		return List
	end, p2)
end