local Parent = script:FindFirstAncestor("GameDetail").Parent
local ReactModule = require(Parent.React)
local GetSduiClientPageScopeFunction = require(Parent.SduiSharedUtilities).getSduiClientPageScope
local ContainerWidth = require(script.Parent.ExperienceDetailsPageScopeFields).ContainerWidth

return function(p1, Callback)
	-- upvalues: ReactModule (copy), GetSduiClientPageScopeFunction (copy), ContainerWidth (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	return ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: Callback (copy), UseRefResult (copy), GetSduiClientPageScopeFunction (upval), p1 (copy), ContainerWidth (upval)
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
			
			local function publishAbsoluteSize()
				-- upvalues: Frame (copy), X (ref), SduiClientPageScope (copy), ContainerWidth (upval)
				local X1 = Frame.AbsoluteSize.X
				
				if X1 ~= X then
					X = X1
					SduiClientPageScope.set(ContainerWidth, X1)
				end
			end
			
			local X1 = Frame.AbsoluteSize.X
			
			if X1 ~= X then
				X = X1
				SduiClientPageScope.set(ContainerWidth, X1)
			end
			UseRefResult.current = Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(publishAbsoluteSize)
		end
	end, { p1, Callback })
end