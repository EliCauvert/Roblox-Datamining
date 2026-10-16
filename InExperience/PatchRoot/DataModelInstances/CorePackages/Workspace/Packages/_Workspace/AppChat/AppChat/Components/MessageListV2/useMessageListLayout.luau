local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local ViewRecyclerModule = require(Parent.ViewRecycler)
local FIntAppChatMessageListV2EstimatedRowHeightModule = require(AppChat.Flags.FIntAppChatMessageListV2EstimatedRowHeight)
local Frozen = table.freeze({ accepted = false, geometryChanged = false })

local function _(Tbl, p1) --[[ Line: 14 | Named "rejectEmptyMeasurements" ]]
	-- upvalues: Frozen (copy)
	local Copy = table.clone(Tbl)
	
	function Copy.updateItemMeasurement(p2) --[[ Line: 16 ]]
		-- upvalues: Frozen (upval), Tbl (copy), p1 (copy)
		if p2.length <= 0 then
			return Frozen
		else
			local UpdateItemMeasurementResult = Tbl.updateItemMeasurement(p2)
			p1()
			
			return UpdateItemMeasurementResult
		end
	end
	
	return Copy
end

return function(Current) --[[ Line: 29 | Named "useMessageListLayout" ]]
	-- upvalues: ReactModule (copy), ViewRecyclerModule (copy), FIntAppChatMessageListV2EstimatedRowHeightModule (copy), Frozen (copy)
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	local UseStateResult = ReactModule.useState(function() --[[ Line: 32 ]]
		-- upvalues: ViewRecyclerModule (upval), FIntAppChatMessageListV2EstimatedRowHeightModule (upval), UseRefResult (copy), Frozen (upval)
		local Flag = false
		local MeasuredResult = ViewRecyclerModule.Layout.measured({
			estimatedItemLength = FIntAppChatMessageListV2EstimatedRowHeightModule
		})
		
		local function v13() --[[ Line: 38 ]]
			-- upvalues: Flag (ref), UseRefResult (upval)
			if not Flag then
				Flag = true
				task.defer(function() --[[ Line: 45 ]]
					-- upvalues: UseRefResult (upval)
					local CurrentFunction: () -> () = UseRefResult.current
					
					if CurrentFunction ~= nil then
						CurrentFunction()
					end
				end)
				
				return
			end
		end
		
		local Copy = table.clone(MeasuredResult)
		
		function Copy.updateItemMeasurement(p1) --[[ Line: 16 ]]
			-- upvalues: Frozen (upval), MeasuredResult (copy), v13 (copy)
			if p1.length <= 0 then
				return Frozen
			else
				local UpdateItemMeasurementResult = MeasuredResult.updateItemMeasurement(p1)
				v13()
				
				return UpdateItemMeasurementResult
			end
		end
		
		return Copy
	end)
	ReactModule.useEffect(function() --[[ Line: 54 ]]
		-- upvalues: UseRefResult (copy), UseStateResult (copy)
		return function() --[[ Line: 55 ]]
			-- upvalues: UseRefResult (upval), UseStateResult (upval)
			UseRefResult.current = nil
			UseStateResult.destroy()
		end
	end, { UseStateResult })
	
	return UseStateResult
end