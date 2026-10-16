local Players = game:GetService("Players")
local IsSubjectToChinaPolicies = true
local IsContentSharingAllowed = false
local PolicyInfoForPlayerAsync = nil
local Flag = false
local Flag1 = false
local BindableEvent = Instance.new("BindableEvent")

return {
	InitAsync = function(_) --[[ Line: 21 ]]
		-- upvalues: IsSubjectToChinaPolicies (ref), IsContentSharingAllowed (ref), Flag (ref), Flag1 (ref), BindableEvent (copy), Players (copy), PolicyInfoForPlayerAsync (ref)
		if _G.__TESTEZ_RUNNING_TEST__ then
			IsSubjectToChinaPolicies = false
			IsContentSharingAllowed = true
			
			return
		end
		if Flag then return end
		if Flag1 then
			BindableEvent.Event:Wait()
			
			return
		end
		Flag1 = true
		local LocalPlayer = Players.LocalPlayer
		while not LocalPlayer do
			Players.PlayerAdded:Wait()
			LocalPlayer = Players.LocalPlayer
		end
		assert(LocalPlayer, "")
		pcall(function() --[[ Line: 45 ]]
			-- upvalues: PolicyInfoForPlayerAsync (upval), LocalPlayer (ref)
			PolicyInfoForPlayerAsync = game:GetService("PolicyService"):GetPolicyInfoForPlayerAsync(LocalPlayer)
		end)
		
		if PolicyInfoForPlayerAsync then
			IsSubjectToChinaPolicies = PolicyInfoForPlayerAsync.IsSubjectToChinaPolicies
			IsContentSharingAllowed = PolicyInfoForPlayerAsync.IsContentSharingAllowed
		end
		Flag = true
		BindableEvent:Fire()
	end,
	IsSubjectToChinaPolicies = function(p1) --[[ Line: 57 ]]
		-- upvalues: IsSubjectToChinaPolicies (ref)
		p1:InitAsync()
		
		return IsSubjectToChinaPolicies
	end,
	IsContentSharingAllowed = function(p1) --[[ Line: 63 ]]
		-- upvalues: IsContentSharingAllowed (ref)
		p1:InitAsync()
		
		return IsContentSharingAllowed
	end
}