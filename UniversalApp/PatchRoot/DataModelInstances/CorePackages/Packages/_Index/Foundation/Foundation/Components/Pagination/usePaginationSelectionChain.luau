local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local UseRefCacheFunction = require(Parent.ReactUtils).useRefCache
local _ = require(Foundation.Components.Types)

return function(List, Gui, Callback)
	-- upvalues: UseRefCacheFunction (copy), ReactModule (copy)
	local UseRefCacheResult = UseRefCacheFunction()
	local Entry = List[1]
	local UseResult = ReactModule.useCallback(function(FirstSlotId)
		-- upvalues: UseRefCacheResult (copy), Entry (copy), Callback (copy)
		local UseRefCacheResultEntry = UseRefCacheResult[FirstSlotId]
		
		return if Entry == FirstSlotId and Callback ~= nil then function(Current)
			-- upvalues: UseRefCacheResultEntry (copy), Callback (upval)
			UseRefCacheResultEntry.current = Current
			Callback(Current)
		end else UseRefCacheResultEntry
	end, { Entry, Callback, UseRefCacheResult })
	local UseResult1 = ReactModule.useCallback(function(Value)
		-- upvalues: List (copy), UseRefCacheResult (copy), Gui (copy)
		local FoundIndex: number? = table.find(List, Value)
		
		return if FoundIndex == nil then { Selectable = false, ref = UseRefCacheResult[Value] } else {
			Selectable = true,
			ref = UseRefCacheResult[Value],
			NextSelectionLeft = if FoundIndex > 1 then UseRefCacheResult[List[FoundIndex - 1]] else nil,
			NextSelectionRight = if FoundIndex < #List then UseRefCacheResult[List[FoundIndex + 1]] else nil,
			NextSelectionUp = Gui and Gui.NextSelectionUp,
			NextSelectionDown = Gui and Gui.NextSelectionDown
		}
	end, { List, UseRefCacheResult, Gui })
	
	return ReactModule.useMemo(function()
		-- upvalues: Entry (copy), UseResult1 (copy), UseResult (copy)
		return {
			firstSlotId = Entry,
			getSlotBindings = UseResult1,
			getSlotRef = UseResult
		}
	end, { Entry, UseResult1, UseResult })
end