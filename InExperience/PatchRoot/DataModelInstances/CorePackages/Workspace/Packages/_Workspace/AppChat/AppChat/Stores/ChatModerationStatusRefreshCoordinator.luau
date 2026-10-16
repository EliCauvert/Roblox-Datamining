local Parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(Parent.LuauPolyfill)
local PromiseModule = require(Parent.Promise)
local List = {}
local Flag = false
local Generation = 0
local Callback = nil

local function _() --[[ Line: 30 | Named "completeRequest" ]]
	-- upvalues: Flag (ref), Callback (ref)
	Flag = false
	Callback()
end

Callback = function() --[[ Line: 40 ]]
	-- upvalues: Flag (ref), List (copy), Callback (ref), PromiseModule (copy)
	if Flag then return end
	local Removed = table.remove(List, 1)
	while Removed and Removed.owner.cancelled do
		Removed.resolve(nil)
		Removed = table.remove(List, 1)
	end
	if Removed then
		Flag = true
		PromiseModule.try(Removed.request):andThen(function(Result) --[[ Line: 58 ]]
			-- upvalues: Removed (copy), Flag (upval), Callback (upval)
			Removed.resolve(Result)
			Flag = false
			Callback()
		end, function(p1) --[[ Line: 63 ]]
			-- upvalues: Removed (copy), Flag (upval), Callback (upval)
			Removed.reject(p1)
			Flag = false
			Callback()
		end)
		
		return
	end
end

return {
	createOwner = function() --[[ Line: 77 ]]
		return { cancelled = false }
	end,
	cancelOwner = function(p1) --[[ Line: 82 ]]
		p1.cancelled = true
	end,
	enqueue = function(Owner, Request) --[[ Line: 85 ]]
		-- upvalues: Generation (ref), PromiseModule (copy), List (copy), Callback (ref)
		Generation += 1
		
		return {
			generation = Generation,
			promise = PromiseModule.new(function(Resolve, Reject) --[[ Line: 89 ]]
				-- upvalues: List (upval), Owner (copy), Request (copy), Callback (upval)
				table.insert(List, {
					owner = Owner,
					request = Request,
					resolve = Resolve,
					reject = Reject
				})
				Callback()
			end)
		}
	end,
	isLatestGeneration = function(Generation1): boolean --[[ Line: 105 ]]
		-- upvalues: Generation (ref)
		return Generation1 == Generation
	end
}