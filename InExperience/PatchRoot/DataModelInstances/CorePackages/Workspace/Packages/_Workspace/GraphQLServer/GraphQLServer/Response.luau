local parent = script:FindFirstAncestor("GraphQLServer").Parent
local promiseModule = require(parent.Promise)
local error = require(parent.LuauPolyfill).Error
local stringify = require(parent.GraphQL).stringify
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref)
	local t_1 = { body = p1 }
	setmetatable(t_1, t)
	
	return t_1
end

function t.text(p1)
	-- upvalues: promiseModule (ref), stringify (ref), error (ref)
	return promiseModule.new(function(p2, p3)
		-- upvalues: p1 (ref), stringify (copy), error (copy)
		local ok, status = pcall(function()
			-- upvalues: p1 (copy), stringify (copy)
			if p1.body.errors then
				for i, v in p1.body.errors do
					if type(v) == "table" and v.name == "GraphQLError" then
						p1.body.errors[i] = {
							message = v.message,
							locations = v.locations,
							extensions = v.extensions,
							path = v.path
						}
					end
				end
			end
			return stringify(p1.body)
		end)
		
		if ok then
			p2(status)
			
			return
		end
		p3(error.new(status))
	end)
end

return t