local setSelectedAvatarsModule = require(script.Parent.Parent.Actions.SetSelectedAvatars)
local getAvatarsForPoint = require(game:GetService("CorePackages").Workspace.Packages.TnSAvatarIdentification).AvatarIdentification.getAvatarsForPoint

return function(p1)
	-- upvalues: getAvatarsForPoint (ref), setSelectedAvatarsModule (ref)
	return function(p2)
		-- upvalues: p1 (ref), getAvatarsForPoint (copy), setSelectedAvatarsModule (copy)
		coroutine.wrap(function()
			-- upvalues: p2 (ref), p1 (copy), getAvatarsForPoint (copy), setSelectedAvatarsModule (copy)
			local identifiedAvatars = p2:getState().report.identifiedAvatars
			local t = {}
			
			for i, v in ipairs(p1) do
				for i_1, v_1 in pairs(getAvatarsForPoint(identifiedAvatars, v)) do
					t[i_1] = v_1
					print("Selected avatar", i_1, v_1)
				end
			end
			p2:dispatch(setSelectedAvatarsModule(t))
		end)()
	end
end