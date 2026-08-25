local coreGuiService = game:GetService("CoreGui")
local parent = script:FindFirstAncestor("FocusNavigationUtils").Parent
local reactModule = require(parent.React)
local useCursor = require(parent.UIBlox).App.SelectionCursor.useCursor
local useDesignTokens = require(parent.Style).useDesignTokens

return function()
	-- upvalues: useDesignTokens (ref), useCursor (ref), reactModule (ref), coreGuiService (ref)
	local var2 = useDesignTokens(function(p0)
		return {
			width = p0.Size.Size_50,
			radius = UDim.new(0, p0.Radius.Medium),
			offset = p0.Size.Size_50
		}
	end)
	local var3 = useCursor(var2.radius, var2.offset, var2.width)
	local var4 = if var3 then var3.current else nil
	reactModule.useEffect(function()
		-- upvalues: coreGuiService (copy), var4 (ref)
		if coreGuiService.SelectionImageObject == nil and var4 ~= nil then
			coreGuiService.SelectionImageObject = var4
			
			return function()
				-- upvalues: coreGuiService (copy)
				coreGuiService.SelectionImageObject = nil
			end
		end
		return nil
	end, { var4 })
end