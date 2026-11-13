local _ = require("./types")
local _ = require("../vendor/compose/core")

return function(p1, p2)
	local Compose = p1.Compose
	local _ = p2.gui
	local Held = p2.held
	local CellResult = Compose.cell(0)
	local ObserveResult = p1.selection.observe()
	p1.runtime.connect(p2.panel, "DescendantAdded", function()
		-- upvalues: CellResult (copy)
		CellResult:set(CellResult:peek() + 1)
	end)
	Compose.watch(function(Callback)
		-- upvalues: CellResult (copy), ObserveResult (copy), Held (copy), p1 (copy), p2 (copy)
		Callback(CellResult)
		Callback(ObserveResult)
		local CallbackResult = Callback(Held)
		
		if CallbackResult == nil then return end
		if p1.selection.get() ~= CallbackResult then
			Held:set(nil)
			
			return
		end
		if not p2.ready(Callback) then return end
		local EntryResult = p2.entry()
		
		if EntryResult and EntryResult ~= CallbackResult then
			local CallbackResult1 = Callback(p1.observe.AbsoluteSize(EntryResult))
			
			if Callback(p1.observe.Parent(EntryResult)) and CallbackResult1.X > 0 and CallbackResult1.Y > 0 and p2.displayed(EntryResult) then
				p1.selection.set(EntryResult)
				
				if p1.selection.get() == EntryResult then
					Held:set(nil)
				end
			end
		end
	end)
end