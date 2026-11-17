local Parent = script:FindFirstAncestor("SocialCommon").Parent
local ReactModule = require(Parent.React)
local UseToggleStateFunction = require(Parent.ReactUtils).useToggleState
local _ = require(Parent.Foundation)

return function(p1)
	-- upvalues: UseToggleStateFunction (copy), ReactModule (copy)
	local UseToggleStateResult = UseToggleStateFunction(false)
	local Enabled = UseToggleStateResult.enabled
	local EnableFunction = UseToggleStateResult.enable
	local DisableFunction = UseToggleStateResult.disable
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Enabled (copy), DisableFunction (copy), EnableFunction (copy)
		if Enabled then
			DisableFunction()
			
			return
		else
			EnableFunction()
		end
	end, { Enabled, EnableFunction, DisableFunction })
	local Toggle = UseToggleStateResult.toggle or UseResult
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		local List = {}
		
		for _, menuItem in p1.menuItems do
			if menuItem then
				table.insert(List, menuItem)
			end
		end
		return List
	end, p1.menuItems)
	
	return {
		isOpen = Enabled,
		open = EnableFunction,
		close = DisableFunction,
		toggle = Toggle,
		anchorRef = ReactModule.useRef(nil),
		items = UseMemoResult,
		iconVisible = #UseMemoResult > 0
	}
end