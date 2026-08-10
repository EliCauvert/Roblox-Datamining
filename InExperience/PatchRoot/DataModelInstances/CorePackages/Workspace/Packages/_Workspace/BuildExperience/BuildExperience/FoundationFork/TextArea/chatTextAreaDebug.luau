local var0 = false

return {
	setEnabled = function(value) --[[ line: 6 ]]
		-- upvalues: var0 (write)
		var0 = value
	end,
	isEnabled = function() --[[ line: 10 ]]
		-- upvalues: var0 (write)
		return var0
	end,
	log = function(p0, p1) --[[ line: 14 ]]
		-- upvalues: var0 (write)
		if not var0 then return end
		if p1 then
			print(`[ChatTextArea] {p0} | {p1}`)
			
			return
		end
		print(`[ChatTextArea] {p0}`)
	end
}