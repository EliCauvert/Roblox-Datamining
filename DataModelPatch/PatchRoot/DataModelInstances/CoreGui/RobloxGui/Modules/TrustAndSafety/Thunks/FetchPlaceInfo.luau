local GetGameNameAndDescriptionFunction = require(game:GetService("CorePackages").Workspace.Packages.GameDetailRodux).GetGameNameAndDescription
local v1 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.httpRequest)((game:GetService("HttpRbxApiService")))
local SetPlaceInfoModule = require(script.Parent.Parent.Actions.SetPlaceInfo)

return function(p1)
	-- upvalues: GetGameNameAndDescriptionFunction (copy), v1 (copy), SetPlaceInfoModule (copy)
	return function(p2)
		-- upvalues: p1 (copy), GetGameNameAndDescriptionFunction (upval), v1 (upval), SetPlaceInfoModule (upval)
		if p1 ~= 0 then
			GetGameNameAndDescriptionFunction(v1, p1):andThen(function(Result)
				-- upvalues: p2 (copy), SetPlaceInfoModule (upval)
				p2:dispatch(SetPlaceInfoModule(Result.Name, Result.Description))
			end):catch(function()
				warn("Unable to fetch place info for TrustAndSafety.")
			end)
			
			return
		end
	end
end