local Parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local ReactModule = require(Parent.React)
local GetSduiClientPageScopeFunction = require(Parent.SduiCoreSystem).getSduiClientPageScope

return function(p1, Callback)
	-- upvalues: ReactModule (copy), GetSduiClientPageScopeFunction (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	return ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: Callback (copy), UseRefResult (copy), GetSduiClientPageScopeFunction (upval), p1 (copy)
		if Callback then
			Callback(Frame)
		end
		if UseRefResult.current then
			UseRefResult.current:Disconnect()
			UseRefResult.current = nil
		end
		if Frame then
			local SduiClientPageScope = GetSduiClientPageScopeFunction(p1)
			local X = nil
			
			local function publishWidth()
				-- upvalues: Frame (copy), X (ref), SduiClientPageScope (copy)
				local X1 = Frame.AbsoluteSize.X
				
				if X1 ~= X then
					X = X1
					SduiClientPageScope.set("containerWidth", X1)
				end
			end
			
			local X1 = Frame.AbsoluteSize.X
			
			if X1 ~= X then
				X = X1
				SduiClientPageScope.set("containerWidth", X1)
			end
			UseRefResult.current = Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(publishWidth)
		end
	end, { p1, Callback })
end