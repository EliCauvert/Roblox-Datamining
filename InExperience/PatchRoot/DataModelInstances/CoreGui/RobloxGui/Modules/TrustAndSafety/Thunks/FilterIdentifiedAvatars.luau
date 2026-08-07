local setSelectedAvatarsModule = require(script.Parent.Parent.Actions.SetSelectedAvatars)
local getAvatarsForPoint = require(game:GetService("CorePackages").Workspace.Packages.TnSAvatarIdentification).AvatarIdentification.getAvatarsForPoint

return function(p0) --[[ line: 10 ]]
	-- upvalues: getAvatarsForPoint (ref), setSelectedAvatarsModule (ref)
	return function(p1) --[[ line: 11 ]]
		-- upvalues: p0 (ref), getAvatarsForPoint (copy), setSelectedAvatarsModule (copy)
		coroutine.wrap(function() --[[ line: 13 ]]
			-- upvalues: p1 (ref), p0 (copy), getAvatarsForPoint (copy), setSelectedAvatarsModule (copy)
			local identifiedAvatars = p1:getState().report.identifiedAvatars
			local t = {}
			
			for i, v in ipairs(p0) do
				for i_1, v_1 in pairs(getAvatarsForPoint(identifiedAvatars, v)) do
					t[i_1] = v_1
					print("Selected avatar", i_1, v_1)
				end
			end
			p1:dispatch(setSelectedAvatarsModule(t))
		end)()
	end
end