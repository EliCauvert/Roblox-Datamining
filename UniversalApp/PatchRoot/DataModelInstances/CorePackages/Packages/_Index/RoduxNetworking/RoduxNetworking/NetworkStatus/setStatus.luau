local EnumNetworkStatusModule = require(script.Parent.EnumNetworkStatus)
local BuildActionNameModule = require(script.Parent.buildActionName)
local PromiseModule = require(script.Parent.Promise)

return function(p1) --[[ Line: 5 ]]
	-- upvalues: BuildActionNameModule (copy), EnumNetworkStatusModule (copy), PromiseModule (copy)
	local Callback = require(script.Parent.getStatus)(p1)
	
	local function _(Ids, Keymapper, Status) --[[ Line: 8 | Named "actionCreator" ]]
		-- upvalues: BuildActionNameModule (upval), p1 (copy)
		return {
			ids = Ids,
			keymapper = Keymapper,
			status = Status,
			type = BuildActionNameModule(p1)
		}
	end
	
	local function filter(State, List, Callback1) --[[ Line: 17 ]]
		-- upvalues: Callback (copy), EnumNetworkStatusModule (upval)
		local List1 = {}
		
		for _, value in ipairs(List) do
			if Callback(State, Callback1(value)) ~= EnumNetworkStatusModule.Fetching then
				table.insert(List1, value)
			end
		end
		return List1
	end
	
	return function(p2, p3, Keymapper, Callback) --[[ Line: 28 ]]
		-- upvalues: filter (copy), p1 (copy), PromiseModule (upval), EnumNetworkStatusModule (upval), BuildActionNameModule (upval)
		local FilterResult = filter(p2:getState(), p3, Keymapper)
		
		if p1.killRequestWithFilteredIds and #p3 > 0 and #FilterResult == 0 then
			return PromiseModule.reject("Request with provided IDs already fetching.")
		else
			p2:dispatch({
				ids = FilterResult,
				keymapper = Keymapper,
				status = EnumNetworkStatusModule.Fetching,
				type = BuildActionNameModule(p1)
			})
			
			return Callback(p2, FilterResult):andThen(function(Result) --[[ Line: 38 ]]
				-- upvalues: p2 (copy), FilterResult (copy), Keymapper (copy), EnumNetworkStatusModule (upval), BuildActionNameModule (upval), p1 (upval)
				p2:dispatch({
					ids = FilterResult,
					keymapper = Keymapper,
					status = EnumNetworkStatusModule.Done,
					type = BuildActionNameModule(p1)
				})
				
				return Result
			end, function(p4) --[[ Line: 41 ]]
				-- upvalues: p2 (copy), FilterResult (copy), Keymapper (copy), EnumNetworkStatusModule (upval), BuildActionNameModule (upval), p1 (upval), PromiseModule (upval)
				p2:dispatch({
					ids = FilterResult,
					keymapper = Keymapper,
					status = EnumNetworkStatusModule.Failed,
					type = BuildActionNameModule(p1)
				})
				
				return PromiseModule.reject(p4)
			end)
		end
	end
end