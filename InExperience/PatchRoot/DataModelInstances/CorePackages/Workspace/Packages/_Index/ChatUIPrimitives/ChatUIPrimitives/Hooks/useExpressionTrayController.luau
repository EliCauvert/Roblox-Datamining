local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local ReactModule = require(ChatUIPrimitives.Parent.React)
local _ = require(ChatUIPrimitives.UniversalMessage.Types)

return function(p1)
	-- upvalues: ReactModule (copy)
	local CategoryGroups = p1.categoryGroups
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_1 (copy), CategoryGroups (copy)
		UseStateResult2_1(function(CategoryGroupId)
			-- upvalues: CategoryGroups (upval)
			for _, categoryGroup in CategoryGroups do
				if categoryGroup.categoryGroupId == CategoryGroupId then
					return CategoryGroupId
				end
			end
			return if #CategoryGroups > 0 then CategoryGroups[1].categoryGroupId else ""
		end)
	end, { CategoryGroups })
	
	return {
		isOpen = UseStateResult,
		activeGroupId = UseStateResult1,
		onEntryActivated = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(function(p2): boolean
				return not p2
			end)
		end, {}),
		onGroupActivated = UseStateResult2_1,
		close = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(false)
		end, {})
	}
end