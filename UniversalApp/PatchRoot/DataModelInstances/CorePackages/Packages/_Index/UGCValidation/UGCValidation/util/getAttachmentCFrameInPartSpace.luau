local r15plusUtilsModule = require(script.Parent.Parent.util.R15plusUtils)

return function(p0)
	-- upvalues: r15plusUtilsModule (ref)
	if not r15plusUtilsModule.checkFlagEnabledForAllowHrd() then
		return p0.CFrame
	end
	local cFrame = p0.CFrame
	local parent = p0.Parent
	while parent and parent:IsA("Attachment") do
		cFrame = parent.CFrame * cFrame
		parent = parent.Parent
	end
	return cFrame
end