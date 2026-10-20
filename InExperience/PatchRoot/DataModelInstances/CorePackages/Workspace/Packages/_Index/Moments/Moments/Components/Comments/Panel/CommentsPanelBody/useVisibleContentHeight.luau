local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)

return function(p1, Frame: Frame)
	-- upvalues: ReactModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), Frame (copy), UseBindingResult2 (copy)
		local Current = p1.current
		
		if Current == nil then return end
		local function update()
			-- upvalues: Current (copy), Frame (upval), UseBindingResult2 (upval)
			local Y: number = Current.AbsolutePosition.Y
			local NewY = Y + Current.AbsoluteWindowSize.Y
			
			if Frame ~= nil then
				NewY = math.min(NewY, Frame.AbsolutePosition.Y)
			end
			UseBindingResult2((math.max(0, NewY - Y)))
		end
		
		local Y: number = Current.AbsolutePosition.Y
		local NewY = Y + Current.AbsoluteWindowSize.Y
		
		if Frame ~= nil then
			NewY = math.min(NewY, Frame.AbsolutePosition.Y)
		end
		UseBindingResult2((math.max(0, NewY - Y)))
		local List = {
			Current:GetPropertyChangedSignal("AbsolutePosition"):Connect(update),
			Current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(update)
		}
		
		if Frame ~= nil then
			table.insert(List, Frame:GetPropertyChangedSignal("AbsolutePosition"):Connect(update))
		end
		return function()
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, { p1, Frame })
	
	return UseBindingResult
end