local SetSelectedAvatarsModule = require(script.Parent.Parent.Actions.SetSelectedAvatars)
local GetAvatarsForPointFunction = require(game:GetService("CorePackages").Workspace.Packages.TnSAvatarIdentification).AvatarIdentification.getAvatarsForPoint

return function(p1)
	-- upvalues: GetAvatarsForPointFunction (copy), SetSelectedAvatarsModule (copy)
	return function(p2)
		-- upvalues: p1 (copy), GetAvatarsForPointFunction (upval), SetSelectedAvatarsModule (upval)
		coroutine.wrap(function()
			-- upvalues: p2 (copy), p1 (upval), GetAvatarsForPointFunction (upval), SetSelectedAvatarsModule (upval)
			local IdentifiedAvatars = p2:getState().report.identifiedAvatars
			local t = {}
			
			for _, value in ipairs(p1) do
				for i, value1 in pairs((GetAvatarsForPointFunction(IdentifiedAvatars, value))) do
					t[i] = value1
					print("Selected avatar", i, value1)
				end
			end
			p2:dispatch(SetSelectedAvatarsModule(t))
		end)()
	end
end