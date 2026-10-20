local Enabled = false

return {
	setEnabled = function(Value)
		-- upvalues: Enabled (ref)
		Enabled = Value
	end,
	isEnabled = function()
		-- upvalues: Enabled (ref)
		return Enabled
	end,
	log = function(p1, p2)
		-- upvalues: Enabled (ref)
		if not Enabled then return end
		if p2 then
			print(`[Composer] {p1} | {p2}`)
			
			return
		else
			print(`[Composer] {p1}`)
		end
	end
}