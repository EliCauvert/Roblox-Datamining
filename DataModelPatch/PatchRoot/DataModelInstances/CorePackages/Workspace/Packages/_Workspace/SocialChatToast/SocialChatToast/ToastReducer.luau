local ShowToastModule = require(script.Parent.Actions.ShowToast)
local ToastCompleteModule = require(script.Parent.Actions.ToastComplete)

return function(p1, p2)
	-- upvalues: ShowToastModule (copy), ToastCompleteModule (copy)
	local P0 = p1 or nil
	
	if p2.type == ShowToastModule.name then
		P0 = p2.toast
		
		return P0
	end
	if p2.type == ToastCompleteModule.name then
		P0 = nil
	end
	return P0
end