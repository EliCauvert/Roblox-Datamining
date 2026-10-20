local Parent = script:FindFirstAncestor("SocialCommon").Parent
local PromiseModule = require(Parent.Promise)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.LuauPolyfill)

return function(p1)
	-- upvalues: PromiseModule (copy), CryoModule (copy)
	local Ids = p1.ids
	local SelectorFunction = p1.selector
	local HydrateFunction = p1.hydrate
	
	if Ids then
		local FilterResult = CryoModule.List.filter(Ids, function(p2): boolean
			-- upvalues: SelectorFunction (copy)
			return SelectorFunction(p2) == nil
		end)
		
		return if #FilterResult > 0 then HydrateFunction(FilterResult) else PromiseModule.resolve()
	else
		return PromiseModule.resolve()
	end
end