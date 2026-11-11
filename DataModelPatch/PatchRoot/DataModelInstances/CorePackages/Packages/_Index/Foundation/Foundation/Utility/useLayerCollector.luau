local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local WrappersModule = require(Foundation.Utility.Wrappers)
local Signal = WrappersModule.Signal
local Connection = WrappersModule.Connection

local function findLayerCollector(p1)
	return if p1 then p1:FindFirstAncestorWhichIsA("LayerCollector") else nil
end

return function(p1)
	-- upvalues: ReactModule (copy), findLayerCollector (copy), Signal (copy), Connection (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), findLayerCollector (upval), p1 (copy)
		UseStateResult2(findLayerCollector(p1))
	end, { p1 })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseResult (copy), Signal (upval), Connection (upval)
		if p1 then
			UseResult()
			local ConnectResult = Signal.Connect(p1.AncestryChanged, UseResult)
			
			return function()
				-- upvalues: Connection (upval), ConnectResult (copy)
				Connection.Disconnect(ConnectResult)
			end
		else
			return nil
		end
	end, { p1 })
	
	return UseStateResult
end