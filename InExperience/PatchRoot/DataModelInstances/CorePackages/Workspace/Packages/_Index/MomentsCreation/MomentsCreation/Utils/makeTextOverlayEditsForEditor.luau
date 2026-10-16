local Parent = script:FindFirstAncestor("MomentsCreation").Parent
local DashModule = require(Parent.Dash)
local _ = require(Parent.MomentsTypes)

return function(p1, p2, p3: number) --[[ Line: 21 | Named "makeTextOverlayEditsForEditor" ]]
	-- upvalues: DashModule (copy)
	local v1 = if p3 > 0 then p3 else 1
	
	return if p1 and #p1 ~= 0 then DashModule.map(p1, function(p4) --[[ Line: 34 ]]
		-- upvalues: v1 (copy), DashModule (upval)
		return DashModule.joinDeep(p4, {
			scale = 1 / v1,
			textOverlayStyle = {
				fontSize = p4.textOverlayStyle.fontSize * (p4.scale * v1)
			}
		})
	end) else { DashModule.joinDeep(p2, { scale = 1 / v1 }) }
end