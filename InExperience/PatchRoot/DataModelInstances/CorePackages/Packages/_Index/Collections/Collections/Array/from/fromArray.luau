local _ = require(script.Parent.Parent.Parent.Parent.ES7Types)

return function(Tbl, Callback, p1) --[[ Line: 25 ]]
	local Buffer = nil
	if not Callback then
		Buffer = table.clone(Tbl)
		
		return Buffer
	end
	local CountTbl = #Tbl
	Buffer = table.create(CountTbl)
	
	for i = 1, CountTbl do
		if p1 == nil then
			Buffer[i] = Callback(Tbl[i], i)
		else
			Buffer[i] = Callback(p1, Tbl[i], i)
		end
	end
	return Buffer
end