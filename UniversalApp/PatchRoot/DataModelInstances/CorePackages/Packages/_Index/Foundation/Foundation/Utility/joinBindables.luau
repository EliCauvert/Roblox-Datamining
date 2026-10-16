local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local _ = require(Foundation.Components.Types)

return function(List, Callback) --[[ Line: 9 | Named "joinBindables" ]]
	-- upvalues: ReactIsModule (copy), ReactModule (copy)
	local t = {}
	local Tbl = {}
	local Flag = false
	
	for i, value in List do
		if ReactIsModule.isBinding(value) then
			t[i] = value
			Flag = true
		else
			Tbl[i] = value
		end
	end
	return if Flag then ReactModule.joinBindings(t):map(function(List) --[[ Line: 30 ]]
		-- upvalues: Tbl (copy), Callback (copy)
		local Copy = table.clone(Tbl)
		
		for i, value in List do
			Copy[i] = value
		end
		return Callback(Copy)
	end) else Callback(Tbl)
end