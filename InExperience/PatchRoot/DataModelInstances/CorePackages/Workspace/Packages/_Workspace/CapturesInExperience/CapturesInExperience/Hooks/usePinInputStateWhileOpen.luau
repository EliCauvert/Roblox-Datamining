local userInputService = game:GetService("UserInputService")
local reactModule = require(script.Parent.Parent.Parent.React)
local default = Enum.MouseBehavior.Default

return function(p0, p1) --[[ line: 30 ]]
	-- upvalues: reactModule (ref), userInputService (ref), default (ref)
	reactModule.useEffect(function() --[[ line: 31 ]]
		-- upvalues: p0 (ref), p1 (ref), userInputService (copy), default (copy)
		if p0 then
			local var2 = if p1 ~= nil then userInputService else p1
			local t = {
				MouseBehavior = var2.MouseBehavior,
				MouseIconEnabled = var2.MouseIconEnabled,
				MouseIcon = var2.MouseIcon
			}
			
			local function _(p2, p3) --[[ line: 44 | named "pin" ]]
				-- upvalues: var2 (ref)
				var2[p2] = p3
			end
			
			var2.MouseBehavior = default
			var2.MouseIconEnabled = true
			var2.MouseIcon = ""
			
			local function watch(p4, p5) --[[ line: 52 ]]
				-- upvalues: var2 (ref), t (ref)
				return var2:GetPropertyChangedSignal(p4):Connect(function() --[[ line: 53 ]]
					-- upvalues: var2 (copy), p4 (ref), p5 (ref), t (copy)
					local var11 = var2[p4]
					
					if var11 ~= p5 then
						t[p4] = var11
						var2[p4] = p5
					end
				end)
			end
			
			local t_1 = {}
			local var6 = "MouseBehavior"
			local var7 = var2:GetPropertyChangedSignal("MouseBehavior"):Connect(function() --[[ line: 53 ]]
				-- upvalues: var2 (ref), var6 (ref), default (ref), t (ref)
				local var11 = var2[var6]
				
				if var11 ~= default then
					t[var6] = var11
					var2[var6] = default
				end
			end)
			local mouseIconEnabledPropertyChangedSignal = var2:GetPropertyChangedSignal("MouseIconEnabled")
			local var9 = "MouseIconEnabled"
			local var10 = true
			-- Unknown statement at pc 13: <SetList>
			
			return function() --[[ line: 68 ]]
				-- upvalues: t_1 (ref), var2 (ref), t (ref)
				for i, v in t_1 do
					v:Disconnect()
				end
				var2.MouseBehavior = t.MouseBehavior
				var2.MouseIconEnabled = t.MouseIconEnabled
				var2.MouseIcon = t.MouseIcon
			end
		end
	end, { p0, p1 })
end