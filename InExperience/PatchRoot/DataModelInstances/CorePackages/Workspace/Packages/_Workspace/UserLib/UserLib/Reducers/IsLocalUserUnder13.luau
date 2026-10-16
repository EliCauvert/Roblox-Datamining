local SetLocalUserUnder13Module = require(script:FindFirstAncestor("UserLib").Actions.SetLocalUserUnder13)

return function(Enabled, p1) --[[ Line: 4 ]]
	-- upvalues: SetLocalUserUnder13Module (copy)
	local IsEnabled = Enabled == true
	
	return if p1.type == SetLocalUserUnder13Module.name then p1.isUnder13 else IsEnabled
end