local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local reactModule = require(chatUIPrimitives.Parent.React)
local _ = require(chatUIPrimitives.UniversalMessage.Types)

return function(p1)
	-- upvalues: reactModule (ref)
	local categoryGroups = p1.categoryGroups
	local var1, var2 = reactModule.useState(false)
	local var3, var4 = reactModule.useState("")
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), categoryGroups (ref)
		var4(function(p2)
			-- upvalues: categoryGroups (copy)
			for i, v in categoryGroups do
				if v.categoryGroupId == p2 then
					return p2
				end
			end
			return if #categoryGroups > 0 then categoryGroups[1].categoryGroupId else ""
		end)
	end, { categoryGroups })
	
	return {
		isOpen = var1,
		activeGroupId = var3,
		onEntryActivated = reactModule.useCallback(function()
			-- upvalues: var2 (ref)
			var2(function(p2)
				return not p2
			end)
		end, {}),
		onGroupActivated = var4,
		close = reactModule.useCallback(function()
			-- upvalues: var2 (ref)
			var2(false)
		end, {})
	}
end