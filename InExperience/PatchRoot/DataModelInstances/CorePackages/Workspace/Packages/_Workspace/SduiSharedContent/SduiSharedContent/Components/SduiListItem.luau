local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local IconName = FoundationModule.Enums.IconName
local List = FoundationModule.List

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), IconName (copy), List (copy)
	return ReactModule.createElement(List.Item, {
		leading = ReactModule.useMemo(function()
			-- upvalues: p1 (copy), IconName (upval)
			return if p1.leadingIcon then IconName[p1.leadingIcon] or { iconName = p1.leadingIcon } else nil
		end, { p1.leadingIcon }),
		title = ReactModule.useMemo(function()
			-- upvalues: p1 (copy)
			return if p1.titleMetadata then { title = p1.title or "", metadata = p1.titleMetadata } else p1.title or ""
		end, { p1.title, p1.titleMetadata }),
		description = p1.description,
		trailing = p1.trailing,
		onActivated = p1.onActivated,
		input = ReactModule.useMemo(function()
			-- upvalues: p1 (copy)
			local Input = p1.input
			
			if typeof(Input) ~= "table" then
				return Input
			end
			local OnActivatedFunction = Input.onActivated
			
			if typeof(OnActivatedFunction) == "function" then
				local Copy = table.clone(Input)
				
				function Copy.onActivated(IsChecked)
					-- upvalues: OnActivatedFunction (copy)
					OnActivatedFunction(nil, nil, { isChecked = IsChecked })
				end
				
				return Copy
			else
				return Input
			end
		end, { p1.input }),
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId
	})
end)