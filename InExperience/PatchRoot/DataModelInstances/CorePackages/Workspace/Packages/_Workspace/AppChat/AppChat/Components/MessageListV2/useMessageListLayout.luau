local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local viewRecyclerModule = require(parent.ViewRecycler)
local fIntAppChatMessageListV2EstimatedRowHeightModule = require(appChat.Flags.FIntAppChatMessageListV2EstimatedRowHeight)
local frozen = table.freeze({ accepted = false, geometryChanged = false })

local function _(p1, p2)
	-- upvalues: frozen (ref)
	local cloned = table.clone(p1)
	
	function cloned.updateItemMeasurement(p3)
		-- upvalues: frozen (copy), p1 (ref), p2 (ref)
		if p3.length <= 0 then
			return frozen
		end
		local var1 = p1.updateItemMeasurement(p3)
		p2()
		
		return var1
	end
	
	return cloned
end

return function(p1)
	-- upvalues: reactModule (ref), viewRecyclerModule (ref), fIntAppChatMessageListV2EstimatedRowHeightModule (ref), frozen (ref)
	local var1 = reactModule.useRef(p1)
	var1.current = p1
	local var2 = reactModule.useState(function()
		-- upvalues: viewRecyclerModule (copy), fIntAppChatMessageListV2EstimatedRowHeightModule (copy), var1 (ref), frozen (copy)
		local var3 = false
		local var4 = viewRecyclerModule.Layout.measured({
			estimatedItemLength = fIntAppChatMessageListV2EstimatedRowHeightModule
		})
		
		local var5 = function()
			-- upvalues: var3 (write), var1 (copy)
			if var3 then
				return
			end
			var3 = true
			task.defer(function()
				-- upvalues: var1 (copy)
				local current = var1.current
				
				if current ~= nil then
					current()
				end
			end)
		end
		
		local cloned = table.clone(var4)
		
		function cloned.updateItemMeasurement(p2)
			-- upvalues: frozen (copy), var4 (ref), var5 (ref)
			if p2.length <= 0 then
				return frozen
			end
			local var6 = var4.updateItemMeasurement(p2)
			var5()
			
			return var6
		end
		
		return cloned
	end)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var2 (ref)
		return function()
			-- upvalues: var1 (copy), var2 (copy)
			var1.current = nil
			var2.destroy()
		end
	end, { var2 })
	
	return var2
end