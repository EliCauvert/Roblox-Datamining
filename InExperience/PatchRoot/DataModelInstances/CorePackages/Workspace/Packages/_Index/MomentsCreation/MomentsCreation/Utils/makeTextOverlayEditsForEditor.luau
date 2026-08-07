local parent = script:FindFirstAncestor("MomentsCreation").Parent
local dashModule = require(parent.Dash)
local _ = require(parent.MomentsTypes)

return function(p0, p1, p2) --[[ line: 21 | named "makeTextOverlayEditsForEditor" ]]
	-- upvalues: dashModule (ref)
	local var1 = if p2 > 0 then p2 else 1
	
	return if p0 and #p0 ~= 0 then dashModule.map(p0, function(p3) --[[ line: 34 ]]
		-- upvalues: var1 (ref), dashModule (copy)
		return dashModule.joinDeep(p3, {
			scale = 1 / var1,
			textOverlayStyle = {
				fontSize = p3.textOverlayStyle.fontSize * (p3.scale * var1)
			}
		})
	end) else { dashModule.joinDeep(p1, { scale = 1 / var1 }) }
end