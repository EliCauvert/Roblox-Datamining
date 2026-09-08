local parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(parent.LuauPolyfill)
local promiseModule = require(parent.Promise)
local t = {}
local var1 = false
local var2 = 0
local var3 = nil

local function _()
	-- upvalues: var1 (write), var3 (write)
	var1 = false
	var3()
end

var3 = function()
	-- upvalues: var1 (write), t (ref), var3 (write), promiseModule (ref)
	if var1 then return end
	local removed = table.remove(t, 1)
	while removed and removed.owner.cancelled do
		removed.resolve(nil)
		removed = table.remove(t, 1)
	end
	if removed then
		var1 = true
		promiseModule.try(removed.request):andThen(function(p1)
			-- upvalues: removed (ref), var1 (copy), var3 (copy)
			removed.resolve(p1)
			var1 = false
			var3()
		end, function(p1)
			-- upvalues: removed (ref), var1 (copy), var3 (copy)
			removed.reject(p1)
			var1 = false
			var3()
		end)
		
		return
	end
end

return {
	createOwner = function()
		return { cancelled = false }
	end,
	cancelOwner = function(p1)
		p1.cancelled = true
	end,
	enqueue = function(p1, p2)
		-- upvalues: var2 (write), promiseModule (ref), t (ref), var3 (write)
		var2 += 1
		
		return {
			generation = var2,
			promise = promiseModule.new(function(p3, p4)
				-- upvalues: t (copy), p1 (ref), p2 (ref), var3 (copy)
				table.insert(t, { owner = p1, request = p2, resolve = p3, reject = p4 })
				var3()
			end)
		}
	end,
	isLatestGeneration = function(p1)
		-- upvalues: var2 (write)
		return p1 == var2
	end
}