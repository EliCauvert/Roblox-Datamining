local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local iconName = foundationModule.Enums.IconName
local list = foundationModule.List

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), iconName (ref), list (ref)
	return reactModule.createElement(list.Item, {
		leading = reactModule.useMemo(function()
			-- upvalues: p1 (ref), iconName (copy)
			return if p1.leadingIcon then iconName[p1.leadingIcon] or { iconName = p1.leadingIcon } else nil
		end, { p1.leadingIcon }),
		title = reactModule.useMemo(function()
			-- upvalues: p1 (ref)
			return if p1.titleMetadata then { title = p1.title or "", metadata = p1.titleMetadata } else p1.title or ""
		end, { p1.title, p1.titleMetadata }),
		description = p1.description,
		trailing = p1.trailing,
		onActivated = p1.onActivated,
		input = reactModule.useMemo(function()
			-- upvalues: p1 (ref)
			local input = p1.input
			
			if typeof(input) ~= "table" then
				return input
			end
			local onActivated = input.onActivated
			
			if typeof(onActivated) == "function" then
				local cloned = table.clone(input)
				
				function cloned.onActivated(p2)
					-- upvalues: onActivated (ref)
					onActivated(nil, nil, { isChecked = p2 })
				end
				
				return cloned
			end
			return input
		end, { p1.input }),
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId
	})
end)