local Parent = script:FindFirstAncestor("GameJoinCard").Parent
local _ = require(Parent.React)
local UserCtaAction = require(Parent.UserCtaCommon).Enums.UserCtaAction
local _ = require(script.Parent.Types)

return function(List, p1, Callback1, Callback)
	-- upvalues: UserCtaAction (copy)
	local RenderResults = {}
	local Config = nil
	
	for i, value in List do
		if Config == nil then
			if value.id == UserCtaAction.JoinExperience then
				Config = { title = p1.playTogether }
			elseif value.id == UserCtaAction.PlayExperience then
				Config = {
					title = p1.playTogetherSoon,
					subtitle = p1.differentServer
				}
			end
		end
		local value1 = value
		
		if not value.keepOpenOnActivate then
			value1 = table.clone(value)
			
			function value1.onActivated(...)
				-- upvalues: value (copy), Callback1 (copy)
				value.onActivated(...)
				Callback1()
			end
		end
		RenderResults[`Action_{i}`] = if value1.render == nil then Callback(value1, i) else value1.render(value1, i)
	end
	return RenderResults, Config
end