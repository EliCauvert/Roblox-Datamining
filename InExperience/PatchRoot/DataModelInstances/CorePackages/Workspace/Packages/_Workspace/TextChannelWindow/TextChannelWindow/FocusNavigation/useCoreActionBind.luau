local ContextActionService = game:GetService("ContextActionService")
local ReactModule = require(script:FindFirstAncestor("TextChannelWindow").Parent.React)
local _ = require(script.Parent.SelectionInputs)
local Current = 0

return function(p1) --[[ Line: 36 | Named "useCoreActionBind" ]]
	-- upvalues: ContextActionService (copy), ReactModule (copy), Current (ref)
	local ContextActionService1 = p1.contextActionService or ContextActionService
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		Current += 1
		UseRefResult.current = Current
	end
	local Text = p1.actionNamePrefix .. "_" .. tostring(UseRefResult.current)
	local Enabled = p1.enabled
	local Active = p1.active
	local Inputs = p1.inputs
	local OnActionFunction = p1.onAction
	local ShouldBindFunction = p1.shouldBind
	local RebindSignal = p1.rebindSignal
	ReactModule.useEffect(function() --[[ Line: 54 ]]
		-- upvalues: Enabled (copy), Active (copy), OnActionFunction (copy), ShouldBindFunction (copy), ContextActionService1 (copy), Text (copy), Inputs (copy), RebindSignal (copy)
		if not Enabled or not Active then return end
		local function handler(_, p2) --[[ Line: 59 ]]
			-- upvalues: OnActionFunction (upval)
			return OnActionFunction(p2)
		end
		
		local Connection = nil
		
		if ShouldBindFunction then
			local function refresh() --[[ Line: 65 ]]
				-- upvalues: ShouldBindFunction (upval), ContextActionService1 (upval), Text (upval), handler (copy), Inputs (upval)
				if ShouldBindFunction() then
					ContextActionService1:BindCoreAction(Text, handler, false, table.unpack(Inputs))
					
					return
				else
					ContextActionService1:UnbindCoreAction(Text)
				end
			end
			
			if ShouldBindFunction() then
				ContextActionService1:BindCoreAction(Text, handler, false, table.unpack(Inputs))
			else
				ContextActionService1:UnbindCoreAction(Text)
			end
			if RebindSignal then
				Connection = RebindSignal:Connect(refresh)
			end
		else
			ContextActionService1:BindCoreAction(Text, handler, false, table.unpack(Inputs))
		end
		return function() --[[ Line: 80 ]]
			-- upvalues: Connection (ref), ContextActionService1 (upval), Text (upval)
			if Connection then
				Connection:Disconnect()
			end
			ContextActionService1:UnbindCoreAction(Text)
		end
	end, {
		Enabled, Active, Inputs, OnActionFunction, ShouldBindFunction, RebindSignal,
		ContextActionService1, Text
	})
end