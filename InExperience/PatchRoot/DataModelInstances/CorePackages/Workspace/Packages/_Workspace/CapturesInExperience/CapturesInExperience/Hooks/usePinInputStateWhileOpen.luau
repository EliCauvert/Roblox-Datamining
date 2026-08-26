local userInputService = game:GetService("UserInputService")
local reactModule = require(script.Parent.Parent.Parent.React)
local default = Enum.MouseBehavior.Default

return function(p1, p2)
	-- upvalues: reactModule (ref), userInputService (ref), default (ref)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p2 (ref), userInputService (copy), default (copy)
		if p1 then
			local var1 = if p2 ~= nil then userInputService else p2
			local t = {
				MouseBehavior = var1.MouseBehavior,
				MouseIconEnabled = var1.MouseIconEnabled,
				MouseIcon = var1.MouseIcon
			}
			
			local function _(p3, p4)
				-- upvalues: var1 (ref)
				var1[p3] = p4
			end
			
			var1.MouseBehavior = default
			var1.MouseIconEnabled = true
			var1.MouseIcon = ""
			
			local function watch(p3, p4)
				-- upvalues: var1 (ref), t (ref)
				return var1:GetPropertyChangedSignal(p3):Connect(function()
					-- upvalues: var1 (copy), p3 (ref), p4 (ref), t (copy)
					local var2 = var1[p3]
					
					if var2 ~= p4 then
						t[p3] = var2
						var1[p3] = p4
					end
				end)
			end
			
			local t_1 = {}
			local var2 = "MouseBehavior"
			local var3 = var1:GetPropertyChangedSignal("MouseBehavior"):Connect(function()
				-- upvalues: var1 (ref), var2 (ref), default (ref), t (ref)
				local var4 = var1[var2]
				
				if var4 ~= default then
					t[var2] = var4
					var1[var2] = default
				end
			end)
			local mouseIconEnabledPropertyChangedSignal = var1:GetPropertyChangedSignal("MouseIconEnabled")
			local var4 = "MouseIconEnabled"
			local var5 = true
			-- Unknown statement at pc 13: <SetList>
			
			return function()
				-- upvalues: t_1 (ref), var1 (ref), t (ref)
				for i, v in t_1 do
					v:Disconnect()
				end
				var1.MouseBehavior = t.MouseBehavior
				var1.MouseIconEnabled = t.MouseIconEnabled
				var1.MouseIcon = t.MouseIcon
			end
		end
	end, { p1, p2 })
end