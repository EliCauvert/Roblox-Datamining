local parent = script:FindFirstAncestor("GameJoinCard").Parent
local _ = require(parent.DataHydration)
local buttonVariant = require(parent.Foundation).Enums.ButtonVariant
local _ = require(script.Parent.Types)
local actionFactoriesModule = require(script.Parent.actionFactories)

return function(p1, p2)
	-- upvalues: actionFactoriesModule (ref), buttonVariant (ref)
	local t = {}
	
	if p1 == nil or p1.actions == nil then
		return t
	end
	local var1 = false
	
	for i, v in p1.actions do
		local type = actionFactoriesModule[v.type]
		
		if type ~= nil then
			local var2 = type(p2)
			
			if var2 ~= nil then
				if var2.render == nil then
					if not var1 then
						var2.variant = var2.variant or buttonVariant.Emphasis
					elseif var2.variant ~= buttonVariant.Utility then
						var2.variant = buttonVariant.Standard
					end
					var1 = true
				end
				table.insert(t, var2)
			end
		end
	end
	return t
end