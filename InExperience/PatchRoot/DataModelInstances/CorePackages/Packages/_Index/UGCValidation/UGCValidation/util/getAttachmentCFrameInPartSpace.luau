local R15plusUtilsModule = require(script.Parent.Parent.util.R15plusUtils)

return function(p1) --[[ Line: 12 ]]
	-- upvalues: R15plusUtilsModule (copy)
	if not R15plusUtilsModule.checkFlagEnabledForAllowHrd() then
		return p1.CFrame
	end
	local _CFrame = p1.CFrame
	local Parent = p1.Parent
	while Parent and Parent:IsA("Attachment") do
		_CFrame = Parent.CFrame * _CFrame
		Parent = Parent.Parent
	end
	return _CFrame
end