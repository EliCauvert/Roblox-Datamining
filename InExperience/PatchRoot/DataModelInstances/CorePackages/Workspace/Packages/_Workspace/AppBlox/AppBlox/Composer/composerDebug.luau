local var0 = false

return {
	setEnabled = function(value)
		-- upvalues: var0 (write)
		var0 = value
	end,
	isEnabled = function()
		-- upvalues: var0 (write)
		return var0
	end,
	log = function(p0, p1)
		-- upvalues: var0 (write)
		if not var0 then return end
		if p1 then
			print(`[Composer] {p0} | {p1}`)
			
			return
		end
		print(`[Composer] {p0}`)
	end
}