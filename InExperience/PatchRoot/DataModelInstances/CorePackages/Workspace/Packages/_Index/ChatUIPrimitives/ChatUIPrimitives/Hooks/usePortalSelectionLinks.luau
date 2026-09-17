local guiService = game:GetService("GuiService")
local reactModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.React)
local restoreSelectionIfStrandedModule = require(script.Parent.restoreSelectionIfStranded)

local function _(p1)
	return if type(p1) == "function" then p1() else p1.current
end

return function(p1)
	-- upvalues: guiService (ref), reactModule (ref), restoreSelectionIfStrandedModule (ref)
	local guiService_1 = p1.guiService or guiService
	local enabled = p1.enabled
	local active = p1.active
	local rearmKey = p1.rearmKey
	local restoreHome = p1.restoreHome
	local var1 = reactModule.useRef(p1.edges)
	var1.current = p1.edges
	reactModule.useEffect(function()
		-- upvalues: enabled (ref), active (ref), var1 (ref)
		if enabled and active then
			local var2 = false
			local t = {}
			task.delay(0, function()
				-- upvalues: var2 (write), var1 (copy), t (ref)
				if var2 then return end
				for i, v in var1.current do
					local from = v.from
					local var3 = if type(from) == "function" then from() else from.current
					local to = v.to
					local var4 = if type(to) == "function" then to() else to.current
					
					if var3 and var4 then
						local text = "NextSelection" .. v.direction
						var3[text] = var4
						table.insert(t, { from = var3, prop = text })
					end
				end
			end)
			
			return function()
				-- upvalues: var2 (write), t (ref)
				var2 = true
				
				for i, v in t do
					pcall(function()
						-- upvalues: v (ref)
						v.from[v.prop] = nil
					end)
				end
			end
		end
	end, { enabled, active, rearmKey or "", guiService_1 })
	local var3 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: enabled (ref), var3 (ref), active (ref), restoreSelectionIfStrandedModule (copy), guiService_1 (ref), restoreHome (ref)
		if enabled and var3.current and not active then
			restoreSelectionIfStrandedModule(guiService_1, if restoreHome then restoreHome.current else nil)
		end
		var3.current = active
		
		return nil
	end, { enabled, active, restoreHome, guiService_1 })
end