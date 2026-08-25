local getGameNameAndDescription = require(game:GetService("CorePackages").Workspace.Packages.GameDetailRodux).GetGameNameAndDescription
local var0 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.httpRequest)(game:GetService("HttpRbxApiService"))
local setPlaceInfoModule = require(script.Parent.Parent.Actions.SetPlaceInfo)

return function(p0)
	-- upvalues: getGameNameAndDescription (ref), var0 (ref), setPlaceInfoModule (ref)
	return function(p1)
		-- upvalues: p0 (ref), getGameNameAndDescription (copy), var0 (copy), setPlaceInfoModule (copy)
		if p0 == 0 then
			return
		end
		getGameNameAndDescription(var0, p0):andThen(function(p2)
			-- upvalues: p1 (ref), setPlaceInfoModule (copy)
			p1:dispatch(setPlaceInfoModule(p2.Name, p2.Description))
		end):catch(function()
			warn("Unable to fetch place info for TrustAndSafety.")
		end)
	end
end