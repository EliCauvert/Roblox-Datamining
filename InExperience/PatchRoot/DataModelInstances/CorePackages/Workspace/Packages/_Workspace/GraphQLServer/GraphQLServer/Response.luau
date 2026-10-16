local Parent = script:FindFirstAncestor("GraphQLServer").Parent
local PromiseModule = require(Parent.Promise)
local Error = require(Parent.LuauPolyfill).Error
local StringifyFunction = require(Parent.GraphQL).stringify
local ResponseModule = {}
ResponseModule.__index = ResponseModule

function ResponseModule.new(Body) --[[ Line: 19 ]]
	-- upvalues: ResponseModule (copy)
	local config = { body = Body }
	setmetatable(config, ResponseModule)
	
	return config
end

function ResponseModule.text(p1) --[[ Line: 28 ]]
	-- upvalues: PromiseModule (copy), StringifyFunction (copy), Error (copy)
	return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ()) --[[ Line: 29 ]]
		-- upvalues: p1 (copy), StringifyFunction (upval), Error (upval)
		local Success, Result = pcall(function() --[[ Line: 30 ]]
			-- upvalues: p1 (upval), StringifyFunction (upval)
			if p1.body.errors then
				for i, _error in p1.body.errors do
					if type(_error) == "table" and _error.name == "GraphQLError" then
						p1.body.errors[i] = {
							message = _error.message,
							locations = _error.locations,
							extensions = _error.extensions,
							path = _error.path
						}
					end
				end
			end
			return StringifyFunction(p1.body)
		end)
		
		if Success then
			Callback(Result)
			
			return
		else
			Callback1(Error.new(Result))
		end
	end)
end

return ResponseModule