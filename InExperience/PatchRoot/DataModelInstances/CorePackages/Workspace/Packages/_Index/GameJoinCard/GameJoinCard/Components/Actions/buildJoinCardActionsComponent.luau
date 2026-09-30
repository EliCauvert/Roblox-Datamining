local parent = script:FindFirstAncestor("GameJoinCard").Parent
local _ = require(parent.React)
local userCtaAction = require(parent.UserCtaCommon).Enums.UserCtaAction
local _ = require(script.Parent.Types)

return function(p1, p2, p3, p4)
	-- upvalues: userCtaAction (ref)
	local t = {}
	local t_1 = nil
	
	for i, v in p1 do
		if t_1 == nil then
			if v.id == userCtaAction.JoinExperience then
				t_1 = { title = p2.playTogether }
			elseif v.id == userCtaAction.PlayExperience then
				t_1 = {
					title = p2.playTogetherSoon,
					subtitle = p2.differentServer
				}
			end
		end
		local var1 = v
		
		if not v.keepOpenOnActivate then
			var1 = table.clone(v)
			
			function var2.onActivated(...)
				-- upvalues: v (ref), p3 (ref)
				v.onActivated(...)
				p3()
			end
		end
		t[`Action_{i}`] = if var1.render ~= nil then p4(var1, i) else var1:render(i)
	end
	return t, t_1
end