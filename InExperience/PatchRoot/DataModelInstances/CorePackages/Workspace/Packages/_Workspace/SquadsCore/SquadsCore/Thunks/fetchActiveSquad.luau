local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local networkingSquadsModule = require(squadsCore.Http.NetworkingSquads)
local promiseModule = require(parent.Promise)
local squadsCore_1 = require(parent.Loggers).Logger:new("SquadsCore")

return function()
	-- upvalues: networkingSquadsModule (ref), squadsCore_1 (ref), promiseModule (ref)
	return function(p0)
		-- upvalues: networkingSquadsModule (copy), squadsCore_1 (copy), promiseModule (copy)
		return p0:dispatch(networkingSquadsModule.GetSquadActive.API({})):catch(function(p1)
			-- upvalues: squadsCore_1 (copy), promiseModule (copy)
			squadsCore_1:warning("Error fetching active squad: {}", if p1.StatusCode then p1.StatusCode else -1)
			
			return promiseModule.reject(p1)
		end)
	end
end