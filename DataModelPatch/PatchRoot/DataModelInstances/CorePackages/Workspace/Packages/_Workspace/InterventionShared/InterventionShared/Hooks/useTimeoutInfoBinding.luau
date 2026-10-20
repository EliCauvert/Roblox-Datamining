local InterventionShared = script:FindFirstAncestor("InterventionShared")
local RunService = game:GetService("RunService")
local ReactModule = require(InterventionShared.Parent.React)
local UseBindingFunction = ReactModule.useBinding
local UseEffectFunction = ReactModule.useEffect
local DetermineChatTimeoutInfoModule = require(InterventionShared.Utils.determineChatTimeoutInfo)

return function(p1, p2)
	-- upvalues: UseBindingFunction (copy), UseEffectFunction (copy), DetermineChatTimeoutInfoModule (copy), RunService (copy)
	local UseBindingResult, UseBindingResult2 = UseBindingFunction("")
	local UseBindingResult1, UseBindingResult2_1 = UseBindingFunction("")
	local _DateTime = if p1 and p1 ~= "" then DateTime.fromIsoDate(p1) else nil
	UseEffectFunction(function()
		-- upvalues: DetermineChatTimeoutInfoModule (upval), _DateTime (copy), p2 (copy), UseBindingResult2 (copy), UseBindingResult2_1 (copy)
		local _, DetermineChatTimeoutInfoModuleResult2, DetermineChatTimeoutInfoModuleResult3 = DetermineChatTimeoutInfoModule(_DateTime, p2)
		UseBindingResult2(DetermineChatTimeoutInfoModuleResult2)
		UseBindingResult2_1(DetermineChatTimeoutInfoModuleResult3)
	end, { _DateTime, p2 })
	UseEffectFunction(function()
		-- upvalues: _DateTime (copy), RunService (upval), DetermineChatTimeoutInfoModule (upval), p2 (copy), UseBindingResult2 (copy), UseBindingResult2_1 (copy)
		local Connection = nil
		
		if _DateTime == nil then return end
		if _DateTime.UnixTimestamp - DateTime.now().UnixTimestamp <= 0 then return end
		local v1 = 0
		Connection = RunService.Heartbeat:Connect(function()
			-- upvalues: v1 (ref), DetermineChatTimeoutInfoModule (upval), _DateTime (upval), p2 (upval), UseBindingResult2 (upval), UseBindingResult2_1 (upval), Connection (ref)
			local ClockTime = os.clock()
			
			if ClockTime - v1 < 1 then return end
			v1 = ClockTime
			local DetermineChatTimeoutInfoModuleResult, DetermineChatTimeoutInfoModuleResult2, DetermineChatTimeoutInfoModuleResult3 = DetermineChatTimeoutInfoModule(_DateTime, p2)
			UseBindingResult2(DetermineChatTimeoutInfoModuleResult2)
			UseBindingResult2_1(DetermineChatTimeoutInfoModuleResult3)
			
			if DetermineChatTimeoutInfoModuleResult <= 0 and Connection then
				Connection:Disconnect()
			end
		end)
		
		return function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, { _DateTime })
	
	return {
		heading = UseBindingResult,
		description = UseBindingResult1
	}
end