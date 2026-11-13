local _ = require("../types")
local _ = require("../runtime/children")
local SupportModule = require("./support")
local KeyedRowsModule = require("./keyed-rows")
local CellResult = require("../reactive/cell").cell(0)
local config = { from = true, key = true, render = true }

local function _(p1, p2)
	for i = #p2 + 1, p1 do
		p2[i] = i
	end
	return p2
end

return function(p3)
	-- upvalues: SupportModule (copy), config (copy), CellResult (copy), KeyedRowsModule (copy)
	local Keyed = SupportModule.optionsOf(p3, "keyed", "from = ..., key = ..., render = ...")
	SupportModule.noUnknownFields(Keyed, "keyed", config)
	local Keyed1 = SupportModule.builderOf(Keyed.render, "keyed", "render")
	local DebugInfo, DebugInfo2 = debug.info(Keyed1, "a")
	local DebugInfo2_1 = DebugInfo2 or DebugInfo >= 2
	local CellResult1 = if DebugInfo2_1 then nil else CellResult
	
	if Keyed.key == nil then
		return KeyedRowsModule(Keyed.from, Keyed1, function(p4, p5, p6, p7)
			-- upvalues: DebugInfo2_1 (copy)
			table.move(p4, 1, p5, 1, p6)
			
			if not DebugInfo2_1 then
				return p7
			end
			for i = #p7 + 1, p5 do
				p7[i] = i
			end
			return p7
		end, CellResult1, nil)
	else
		local Keyed2 = SupportModule.builderOf(Keyed.key, "keyed", "key")
		
		return KeyedRowsModule(Keyed.from, Keyed1, function(p8, p9, p10, p11)
			-- upvalues: Keyed2 (copy), DebugInfo2_1 (copy)
			for i = 1, p9 do
				p10[i] = Keyed2(p8[i], i)
			end
			if not DebugInfo2_1 then
				return p11
			end
			for i1 = #p11 + 1, p9 do
				p11[i1] = i1
			end
			return p11
		end, CellResult1, nil)
	end
end