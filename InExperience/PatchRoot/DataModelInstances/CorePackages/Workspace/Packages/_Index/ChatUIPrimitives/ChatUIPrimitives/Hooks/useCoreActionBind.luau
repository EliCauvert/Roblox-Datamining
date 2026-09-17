local contextActionService = game:GetService("ContextActionService")
local reactModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.React)
local var1 = 0

return function(p1)
	-- upvalues: contextActionService (ref), reactModule (ref), var1 (write)
	local contextActionService_1 = p1.contextActionService or contextActionService
	local var2 = reactModule.useRef(nil)
	
	if var2.current == nil then
		var1 += 1
		var2.current = var1
	end
	local text = p1.actionNamePrefix .. "_" .. tostring(var2.current)
	local enabled = p1.enabled
	local active = p1.active
	local keyCode = p1.keyCode
	local onAction = p1.onAction
	local shouldBind = p1.shouldBind
	local rebindSignal = p1.rebindSignal
	reactModule.useEffect(function()
		-- upvalues: enabled (ref), active (ref), onAction (ref), shouldBind (ref), contextActionService_1 (ref), text (ref), keyCode (ref), rebindSignal (ref)
		if not enabled or not active then return end
		local function handler(_, p2)
			-- upvalues: onAction (copy)
			return onAction(p2)
		end
		
		local var3 = nil
		
		if shouldBind then
			local function refresh()
				-- upvalues: shouldBind (copy), contextActionService_1 (copy), text (copy), handler (ref), keyCode (copy)
				if shouldBind() then
					contextActionService_1:BindCoreAction(text, handler, false, keyCode)
					
					return
				end
				contextActionService_1:UnbindCoreAction(text)
			end
			
			if shouldBind() then
				contextActionService_1:BindCoreAction(text, handler, false, keyCode)
			else
				contextActionService_1:UnbindCoreAction(text)
			end
			if rebindSignal then
				var3 = rebindSignal:Connect(refresh)
			end
		else
			contextActionService_1:BindCoreAction(text, handler, false, keyCode)
		end
		return function()
			-- upvalues: var3 (write), contextActionService_1 (copy), text (copy)
			if var3 then
				var3:Disconnect()
			end
			contextActionService_1:UnbindCoreAction(text)
		end
	end, {
		enabled, active, keyCode, onAction, shouldBind, rebindSignal,
		contextActionService_1, text
	})
end