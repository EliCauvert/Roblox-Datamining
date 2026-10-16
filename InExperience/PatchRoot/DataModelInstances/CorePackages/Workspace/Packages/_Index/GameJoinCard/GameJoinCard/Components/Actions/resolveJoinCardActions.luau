local Parent = script:FindFirstAncestor("GameJoinCard").Parent
local _ = require(Parent.DataHydration)
local ButtonVariant = require(Parent.Foundation).Enums.ButtonVariant
local _ = require(script.Parent.Types)
local ActionFactoriesModule = require(script.Parent.actionFactories)

return function(p1, p2) --[[ Line: 13 | Named "resolveJoinCardActions" ]]
	-- upvalues: ActionFactoriesModule (copy), ButtonVariant (copy)
	local List = {}
	
	if p1 == nil or p1.actions == nil then
		return List
	end
	local Flag = false
	
	for _, action in p1.actions do
		local ActionFactoriesModuleEntry = ActionFactoriesModule[action.type]
		local NoActionFactoriesModuleEntry = ActionFactoriesModuleEntry == nil
		local ActionFactoriesModuleEntryResult = nil
		
		if not NoActionFactoriesModuleEntry then
			ActionFactoriesModuleEntryResult = ActionFactoriesModuleEntry(p2)
			NoActionFactoriesModuleEntry = ActionFactoriesModuleEntryResult == nil
		end
		if not NoActionFactoriesModuleEntry then
			if ActionFactoriesModuleEntryResult.render == nil then
				if Flag then
					if ActionFactoriesModuleEntryResult.variant ~= ButtonVariant.Utility then
						ActionFactoriesModuleEntryResult.variant = ButtonVariant.Standard
					end
				else
					ActionFactoriesModuleEntryResult.variant = ActionFactoriesModuleEntryResult.variant or ButtonVariant.Emphasis
				end
				Flag = true
			end
			table.insert(List, ActionFactoriesModuleEntryResult)
		end
	end
	return List
end