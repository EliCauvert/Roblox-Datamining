local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local WrappersModule = require(Foundation.Utility.Wrappers)
local Signal = WrappersModule.Signal
local Connection = WrappersModule.Connection

local function findLayerCollector(p1) --[[ Line: 10 ]]
	return if p1 then p1:FindFirstAncestorWhichIsA("LayerCollector") else nil
end

return function(p1) --[[ Line: 18 | Named "useLayerCollector" ]]
	-- upvalues: ReactModule (copy), findLayerCollector (copy), Signal (copy), Connection (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 21 ]]
		-- upvalues: UseStateResult2 (copy), findLayerCollector (upval), p1 (copy)
		UseStateResult2(findLayerCollector(p1))
	end, { p1 })
	ReactModule.useEffect(function() --[[ Line: 25 ]]
		-- upvalues: p1 (copy), UseResult (copy), Signal (upval), Connection (upval)
		if p1 then
			UseResult()
			local ConnectResult = Signal.Connect(p1.AncestryChanged, UseResult)
			
			return function() --[[ Line: 31 ]]
				-- upvalues: Connection (upval), ConnectResult (copy)
				Connection.Disconnect(ConnectResult)
			end
		else
			return nil
		end
	end, { p1 })
	
	return UseStateResult
end