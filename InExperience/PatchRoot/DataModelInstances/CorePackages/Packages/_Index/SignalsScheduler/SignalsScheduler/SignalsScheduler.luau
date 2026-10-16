local Flag = false
local List = {}

local function batch(Callback: () -> ()) --[[ Line: 7 ]]
	-- upvalues: Flag (ref), List (copy)
	if Flag then
		Callback()
		
		return
	end
	Flag = true
	Callback()
	
	for _, value in List do
		value()
	end
	table.clear(List)
	Flag = false
end

return {
	batch = batch,
	flush = function() --[[ Line: 21 ]]
		-- upvalues: batch (copy)
		batch(function() --[[ Line: 22 ]] end)
	end,
	schedule = function(p1) --[[ Line: 25 ]]
		-- upvalues: List (copy)
		table.insert(List, p1)
	end
}