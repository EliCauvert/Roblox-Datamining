local var1 = false

return {
	setEnabled = function(value)
		-- upvalues: var1 (write)
		var1 = value
	end,
	isEnabled = function()
		-- upvalues: var1 (write)
		return var1
	end,
	log = function(p1, p2)
		-- upvalues: var1 (write)
		if not var1 then return end
		if p2 then
			print(`[ChatTextArea] {p1} | {p2}`)
			
			return
		end
		print(`[ChatTextArea] {p1}`)
	end
}