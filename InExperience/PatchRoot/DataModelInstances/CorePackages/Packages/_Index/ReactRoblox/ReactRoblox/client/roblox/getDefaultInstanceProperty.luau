local _nil = require(script.Parent.Parent.Parent.Parent.Shared).Symbol.named("Nil")
local t = {}

local function tryPropertyName(p1, p2)
	return p1[p2]
end

return function(p1, p2)
	-- upvalues: t (ref), _nil (ref), tryPropertyName (ref)
	local var1 = t[p1]
	
	if var1 then
		local var2 = var1[p2]
		
		if var2 == _nil then
			return true, nil
		elseif var2 ~= nil then
			return true, var2
		end
	else
		var1 = {}
		t[p1] = var1
	end
	local var3 = Instance.new(p1)
	local ok, status = pcall(tryPropertyName, var3, p2)
	var3:Destroy()
	
	if ok then
		if status == nil then
			var1[p2] = _nil
			
			return ok, status
		end
		var1[p2] = status
	end
	return ok, status
end