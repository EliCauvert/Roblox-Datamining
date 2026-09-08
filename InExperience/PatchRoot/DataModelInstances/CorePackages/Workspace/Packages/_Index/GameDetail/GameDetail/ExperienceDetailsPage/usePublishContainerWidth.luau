local parent = script:FindFirstAncestor("GameDetail").Parent
local reactModule = require(parent.React)
local getSduiClientPageScope = require(parent.SduiSharedUtilities).getSduiClientPageScope
local containerWidth = require(script.Parent.ExperienceDetailsPageScopeFields).ContainerWidth

return function(p1, p2)
	-- upvalues: reactModule (ref), getSduiClientPageScope (ref), containerWidth (ref)
	local var1 = reactModule.useRef(nil)
	
	return reactModule.useCallback(function(p3)
		-- upvalues: p2 (ref), var1 (ref), getSduiClientPageScope (copy), p1 (ref), containerWidth (copy)
		p2(p3)
		
		if var1.current then
			var1.current:Disconnect()
			var1.current = nil
		end
		if p3 then
			local var2 = getSduiClientPageScope(p1)
			local var3 = nil
			
			local function publishAbsoluteSize()
				-- upvalues: p3 (ref), var3 (write), var2 (ref), containerWidth (copy)
				local x = p3.AbsoluteSize.X
				
				if x ~= var3 then
					var3 = x
					var2.set(containerWidth, x)
				end
			end
			
			local x = p3.AbsoluteSize.X
			
			if x ~= var3 then
				var3 = x
				var2.set(containerWidth, x)
			end
			var1.current = p3:GetPropertyChangedSignal("AbsoluteSize"):Connect(publishAbsoluteSize)
		end
	end, { p2, p1 })
end