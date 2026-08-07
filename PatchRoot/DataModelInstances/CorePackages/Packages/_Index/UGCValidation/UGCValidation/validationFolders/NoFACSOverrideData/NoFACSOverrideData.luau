-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:48 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)

return {
	categories = { validationEnumsModule.UploadCategory.DYNAMIC_HEAD },
	requiredData = { validationEnumsModule.SharedDataMember.rootInstance },
	fflag = require(parent.flags.getEngineFeatureUGCValidateCheckFacsDisableOverride),
	run = function(p0, p1) --[[ line: 12 ]]
		-- upvalues: errorSourceStringsModule (ref)
		local faceControls = p1.rootInstance:FindFirstChildOfClass("FaceControls")
		
		if faceControls and faceControls:HasOverrideFACSData() then
			p0:fail(errorSourceStringsModule.Keys.FaceControlsOverrideFACSNotEmpty, nil, faceControls)
		end
	end
}