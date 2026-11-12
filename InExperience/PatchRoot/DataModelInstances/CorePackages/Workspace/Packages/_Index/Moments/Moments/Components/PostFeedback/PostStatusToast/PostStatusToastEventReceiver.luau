local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local SendrPostStatusToastModule = require(script.Parent.sendrPostStatusToast)

return function()
	-- upvalues: ReactModule (copy), SendrPostStatusToastModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: SendrPostStatusToastModule (upval)
		return SendrPostStatusToastModule.listen(function(p1)
			-- upvalues: SendrPostStatusToastModule (upval)
			if not SendrPostStatusToastModule.isFailure(p1) then
				SendrPostStatusToastModule.dismiss(p1)
			end
		end)
	end, {})
	
	return nil
end