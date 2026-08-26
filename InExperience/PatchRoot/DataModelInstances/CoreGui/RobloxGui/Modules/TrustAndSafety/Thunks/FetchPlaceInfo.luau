local getGameNameAndDescription = require(game:GetService("CorePackages").Workspace.Packages.GameDetailRodux).GetGameNameAndDescription
local var1 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.httpRequest)(game:GetService("HttpRbxApiService"))
local setPlaceInfoModule = require(script.Parent.Parent.Actions.SetPlaceInfo)

return function(p1)
	-- upvalues: getGameNameAndDescription (ref), var1 (ref), setPlaceInfoModule (ref)
	return function(p2)
		-- upvalues: p1 (ref), getGameNameAndDescription (copy), var1 (copy), setPlaceInfoModule (copy)
		if p1 == 0 then
			return
		end
		getGameNameAndDescription(var1, p1):andThen(function(p3)
			-- upvalues: p2 (ref), setPlaceInfoModule (copy)
			p2:dispatch(setPlaceInfoModule(p3.Name, p3.Description))
		end):catch(function()
			warn("Unable to fetch place info for TrustAndSafety.")
		end)
	end
end