local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Components.Types)

return function(p0)
	-- upvalues: reactModule (ref)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref)
		if p0.itemRef.current == nil then return end
		if typeof(p0.itemRef.current) == "Instance" then
			local var2 = p0.itemRef.current:GetPropertyChangedSignal("GuiState"):Connect(function()
				-- upvalues: p0 (copy)
				if p0.isSubmenu then
					if p0.isDisabled then return end
					if p0.itemRef.current.GuiState == Enum.GuiState.Hover then
						if p0.hoverOpenAtDepth then
							p0.hoverOpenAtDepth(p0.depth, p0.id)
							
							return
						end
					elseif p0.hoverCloseAtDepth then
						p0.hoverCloseAtDepth(p0.depth)
						
						return
					end
				elseif p0.itemRef.current.GuiState == Enum.GuiState.Hover and p0.hoverCloseAtDepth then
					p0.hoverCloseAtDepth(p0.depth)
				end
			end)
			
			return function()
				-- upvalues: var2 (ref)
				var2:Disconnect()
			end
		end
	end, {
		p0.isSubmenu, p0.isDisabled, p0.id, p0.depth, p0.hoverCloseAtDepth,
		p0.hoverOpenAtDepth, p0.itemRef
	})
end