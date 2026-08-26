local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local _ = require(momentsCommon.Media.MediaTypes)

return function(p1, p2)
	-- upvalues: reactModule (ref), signalsModule (ref)
	local var1, var2 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), p1 (ref), var2 (ref), signalsModule (copy)
		if p2 and p1 ~= nil then
			var2(false)
			local var3 = false
			local var4 = nil
			var4 = signalsModule.createEffect(function(p3)
				-- upvalues: p1 (copy), var3 (write), var2 (copy), var4 (write)
				if p1.getPosition(p3) > 0 and not var3 then
					var3 = true
					var2(true)
					task.defer(function()
						-- upvalues: var4 (copy)
						if var4 ~= nil then
							var4()
						end
					end)
				end
			end)
			
			return function()
				-- upvalues: var3 (write), var4 (write)
				var3 = true
				
				if var4 ~= nil then
					var4()
				end
			end
		end
	end, { p1, p2 })
	
	return var1
end