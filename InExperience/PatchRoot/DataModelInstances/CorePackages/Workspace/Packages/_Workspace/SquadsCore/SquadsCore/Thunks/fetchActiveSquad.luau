local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local NetworkingSquadsModule = require(SquadsCore.Http.NetworkingSquads)
local Logger = require(Parent.Loggers).Logger
local PromiseModule = require(Parent.Promise)
local SquadsCore1 = Logger.new(Logger, "SquadsCore")

return function() --[[ Line: 11 ]]
	-- upvalues: NetworkingSquadsModule (copy), SquadsCore1 (copy), PromiseModule (copy)
	return function(p1) --[[ Line: 12 ]]
		-- upvalues: NetworkingSquadsModule (upval), SquadsCore1 (upval), PromiseModule (upval)
		return p1:dispatch(NetworkingSquadsModule.GetSquadActive.API({})):catch(function(Err) --[[ Line: 13 ]]
			-- upvalues: SquadsCore1 (upval), PromiseModule (upval)
			SquadsCore1:warning("Error fetching active squad: {}", if Err.StatusCode then Err.StatusCode else -1)
			
			return PromiseModule.reject(Err)
		end)
	end
end