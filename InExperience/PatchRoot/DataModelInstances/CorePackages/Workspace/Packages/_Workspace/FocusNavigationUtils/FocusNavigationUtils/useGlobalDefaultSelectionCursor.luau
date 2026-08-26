local coreGuiService = game:GetService("CoreGui")
local parent = script:FindFirstAncestor("FocusNavigationUtils").Parent
local reactModule = require(parent.React)
local useCursor = require(parent.UIBlox).App.SelectionCursor.useCursor
local useDesignTokens = require(parent.Style).useDesignTokens

return function()
	-- upvalues: useDesignTokens (ref), useCursor (ref), reactModule (ref), coreGuiService (ref)
	local var1 = useDesignTokens(function(p1)
		return {
			width = p1.Size.Size_50,
			radius = UDim.new(0, p1.Radius.Medium),
			offset = p1.Size.Size_50
		}
	end)
	local var2 = useCursor(var1.radius, var1.offset, var1.width)
	local var3 = if var2 then var2.current else nil
	reactModule.useEffect(function()
		-- upvalues: coreGuiService (copy), var3 (ref)
		if coreGuiService.SelectionImageObject == nil and var3 ~= nil then
			coreGuiService.SelectionImageObject = var3
			
			return function()
				-- upvalues: coreGuiService (copy)
				coreGuiService.SelectionImageObject = nil
			end
		end
		return nil
	end, { var3 })
end