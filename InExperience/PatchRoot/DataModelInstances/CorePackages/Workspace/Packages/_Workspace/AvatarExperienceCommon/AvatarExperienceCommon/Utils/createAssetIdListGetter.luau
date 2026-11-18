local function _(Text: string): boolean
	return string.match(Text, "^%d+$") ~= nil
end

return function(Callback)
	local v1 = nil
	local Frozen = table.freeze({})
	local Flag = false
	
	return function()
		-- upvalues: Callback (copy), v1 (ref), Frozen (ref), Flag (ref)
		local CallbackResult: string = Callback()
		
		if CallbackResult == v1 then
			return Frozen, Flag
		end
		v1 = CallbackResult
		
		if string.gsub(CallbackResult, "^%s*(.-)%s*$", "%1") == "" then
			Flag = false
			Frozen = table.freeze({})
			
			return Frozen, Flag
		end
		local Tbl = {}
		
		for _, value in string.split(CallbackResult, ",") do
			local Replaced = string.gsub(value, "^%s*(.-)%s*$", "%1")
			
			if Replaced ~= "" then
				if string.match(Replaced, "^%d+$") == nil then
					Flag = true
					Frozen = table.freeze({})
					
					return Frozen, Flag
				end
				Tbl[Replaced] = true
			end
		end
		Flag = false
		Frozen = table.freeze(Tbl)
		
		return Frozen, Flag
	end
end