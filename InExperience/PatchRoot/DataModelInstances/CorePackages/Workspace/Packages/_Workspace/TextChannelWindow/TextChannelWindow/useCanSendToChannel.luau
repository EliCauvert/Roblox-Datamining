local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection
local FindLocalTextSourceModule = require(script.Parent.findLocalTextSource)

return {
	useCanSendToChannel = function(p1, p2) --[[ Line: 8 ]]
		-- upvalues: ReactModule (copy), FindLocalTextSourceModule (copy), UseEventConnectionFunction (copy)
		local UseStateResult, UseStateResult2 = ReactModule.useState(function() --[[ Line: 9 ]]
			-- upvalues: FindLocalTextSourceModule (upval), p1 (copy), p2 (copy)
			return FindLocalTextSourceModule(p1, p2)
		end)
		local UseResult = ReactModule.useCallback(function() --[[ Line: 13 ]]
			-- upvalues: UseStateResult2 (copy), FindLocalTextSourceModule (upval), p1 (copy), p2 (copy)
			UseStateResult2(FindLocalTextSourceModule(p1, p2))
		end, { p1, p2 })
		ReactModule.useEffect(UseResult, { UseResult })
		UseEventConnectionFunction(if p1 then p1.ChildAdded else nil, UseResult, { UseResult })
		UseEventConnectionFunction(if p1 then p1.ChildRemoved else nil, UseResult, { UseResult })
		local UseStateResult1, UseStateResult2_1 = ReactModule.useState(function() --[[ Line: 23 | Named "evaluateCanSend" ]]
			-- upvalues: p1 (copy), p2 (copy), UseStateResult (copy)
			return p1 == nil or p2 == nil or UseStateResult ~= nil and UseStateResult.CanSend
		end)
		ReactModule.useEffect(function() --[[ Line: 32 ]]
			-- upvalues: UseStateResult2_1 (copy), p1 (copy), p2 (copy), UseStateResult (copy)
			UseStateResult2_1(p1 == nil or p2 == nil or UseStateResult ~= nil and UseStateResult.CanSend)
		end, { p1, p2, UseStateResult })
		UseEventConnectionFunction(if UseStateResult then UseStateResult:GetPropertyChangedSignal("CanSend") else nil, function() --[[ Line: 36 ]]
			-- upvalues: UseStateResult2_1 (copy), p1 (copy), p2 (copy), UseStateResult (copy)
			UseStateResult2_1(p1 == nil or p2 == nil or UseStateResult ~= nil and UseStateResult.CanSend)
		end, { p1, p2, UseStateResult })
		
		return UseStateResult1
	end
}