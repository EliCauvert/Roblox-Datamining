local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Components.Types)

return function(p1)
	-- upvalues: reactModule (ref)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref)
		if p1.itemRef.current == nil then return end
		if typeof(p1.itemRef.current) == "Instance" then
			local var1 = p1.itemRef.current:GetPropertyChangedSignal("GuiState"):Connect(function()
				-- upvalues: p1 (copy)
				if p1.isSubmenu then
					if p1.isDisabled then return end
					if p1.itemRef.current.GuiState == Enum.GuiState.Hover then
						if p1.hoverOpenAtDepth then
							p1.hoverOpenAtDepth(p1.depth, p1.id)
							
							return
						end
					elseif p1.hoverCloseAtDepth then
						p1.hoverCloseAtDepth(p1.depth)
						
						return
					end
				elseif p1.itemRef.current.GuiState == Enum.GuiState.Hover and p1.hoverCloseAtDepth then
					p1.hoverCloseAtDepth(p1.depth)
				end
			end)
			
			return function()
				-- upvalues: var1 (ref)
				var1:Disconnect()
			end
		end
	end, {
		p1.isSubmenu, p1.isDisabled, p1.id, p1.depth, p1.hoverCloseAtDepth,
		p1.hoverOpenAtDepth, p1.itemRef
	})
end