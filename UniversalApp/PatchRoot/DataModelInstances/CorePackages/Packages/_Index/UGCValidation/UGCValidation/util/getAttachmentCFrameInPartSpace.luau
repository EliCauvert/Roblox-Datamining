local r15plusUtilsModule = require(script.Parent.Parent.util.R15plusUtils)

return function(p1)
	-- upvalues: r15plusUtilsModule (ref)
	if not r15plusUtilsModule.checkFlagEnabledForAllowHrd() then
		return p1.CFrame
	end
	local cFrame = p1.CFrame
	local parent = p1.Parent
	while parent and parent:IsA("Attachment") do
		cFrame = parent.CFrame * cFrame
		parent = parent.Parent
	end
	return cFrame
end