local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local _ = require(momentsCommon.Media.MediaTypes)

return function(p0, p1)
	-- upvalues: reactModule (ref), signalsModule (ref)
	local var3, var4 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p0 (ref), var4 (ref), signalsModule (copy)
		if p1 and p0 ~= nil then
			var4(false)
			local var5 = false
			local var6 = nil
			var6 = signalsModule.createEffect(function(p2)
				-- upvalues: p0 (copy), var5 (write), var4 (copy), var6 (write)
				if p0.getPosition(p2) > 0 and not var5 then
					var5 = true
					var4(true)
					task.defer(function()
						-- upvalues: var6 (copy)
						if var6 ~= nil then
							var6()
						end
					end)
				end
			end)
			
			return function()
				-- upvalues: var5 (write), var6 (write)
				var5 = true
				
				if var6 ~= nil then
					var6()
				end
			end
		end
	end, { p0, p1 })
	
	return var3
end