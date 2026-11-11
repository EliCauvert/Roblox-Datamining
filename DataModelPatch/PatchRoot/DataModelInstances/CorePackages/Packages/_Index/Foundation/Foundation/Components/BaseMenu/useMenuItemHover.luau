local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Components.Types)

return function(p1)
	-- upvalues: ReactModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy)
		if p1.itemRef.current == nil then return end
		if typeof(p1.itemRef.current) ~= "Instance" then return end
		local Connection = p1.itemRef.current:GetPropertyChangedSignal("GuiState"):Connect(function()
			-- upvalues: p1 (upval)
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
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {
		p1.isSubmenu, p1.isDisabled, p1.id, p1.depth, p1.hoverCloseAtDepth,
		p1.hoverOpenAtDepth, p1.itemRef
	})
end