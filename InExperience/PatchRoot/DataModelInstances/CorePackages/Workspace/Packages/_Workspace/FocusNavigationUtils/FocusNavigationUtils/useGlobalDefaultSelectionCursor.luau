local CoreGui = game:GetService("CoreGui")
local Parent = script:FindFirstAncestor("FocusNavigationUtils").Parent
local ReactModule = require(Parent.React)
local UseCursorFunction = require(Parent.UIBlox).App.SelectionCursor.useCursor
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens

return function() --[[ Line: 10 | Named "useGlobalDefaultSelectionCursor" ]]
	-- upvalues: UseDesignTokensFunction (copy), UseCursorFunction (copy), ReactModule (copy), CoreGui (copy)
	local UseDesignTokensResult = UseDesignTokensFunction(function(p1) --[[ Line: 11 ]]
		return {
			width = p1.Size.Size_50,
			radius = UDim.new(0, p1.Radius.Medium),
			offset = p1.Size.Size_50
		}
	end)
	local UseCursorResult = UseCursorFunction(UseDesignTokensResult.radius, UseDesignTokensResult.offset, UseDesignTokensResult.width)
	local Current = if UseCursorResult then UseCursorResult.current else nil
	ReactModule.useEffect(function() --[[ Line: 22 ]]
		-- upvalues: CoreGui (upval), Current (copy)
		if CoreGui.SelectionImageObject == nil and Current ~= nil then
			CoreGui.SelectionImageObject = Current
			
			return function() --[[ Line: 26 ]]
				-- upvalues: CoreGui (upval)
				CoreGui.SelectionImageObject = nil
			end
		else
			return nil
		end
	end, { Current })
end