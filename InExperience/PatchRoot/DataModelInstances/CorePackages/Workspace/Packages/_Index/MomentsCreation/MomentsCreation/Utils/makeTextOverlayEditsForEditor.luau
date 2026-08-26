local parent = script:FindFirstAncestor("MomentsCreation").Parent
local dashModule = require(parent.Dash)
local _ = require(parent.MomentsTypes)

return function(p1, p2, p3)
	-- upvalues: dashModule (ref)
	local var1 = if p3 > 0 then p3 else 1
	
	return if p1 and #p1 ~= 0 then dashModule.map(p1, function(p4)
		-- upvalues: var1 (ref), dashModule (copy)
		return dashModule.joinDeep(p4, {
			scale = 1 / var1,
			textOverlayStyle = {
				fontSize = p4.textOverlayStyle.fontSize * (p4.scale * var1)
			}
		})
	end) else { dashModule.joinDeep(p2, { scale = 1 / var1 }) }
end