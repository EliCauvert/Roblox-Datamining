local IXPService = game:GetService("IXPService")
local groups = script:FindFirstAncestor("Groups")
local sharedFlagsModule = require(groups.Parent.SharedFlags)
local flagsModule = require(groups.Flags)
local getFStringSocialCommunityAppLayer = flagsModule.GetFStringSocialCommunityAppLayer
local getFStringLuaCommunityListVariant = flagsModule.GetFStringLuaCommunityListVariant
local getFFlagForceEnableLuaCommunityList = flagsModule.GetFFlagForceEnableLuaCommunityList
local getFFlagEnableCommunityListExperimentation = sharedFlagsModule.GetFFlagEnableCommunityListExperimentation

local function _(p0) --[[ line: 14 | named "getIsUserInTreatment" ]]
	-- upvalues: IXPService (ref), getFStringSocialCommunityAppLayer (ref)
	local var4 = IXPService:GetUserLayerVariables(getFStringSocialCommunityAppLayer())
	
	return if var4 and var4[p0] ~= nil then var4[p0] else false
end

return {
	getCommunityListEnabled = function() --[[ line: 23 ]]
		-- upvalues: getFFlagForceEnableLuaCommunityList (ref), getFFlagEnableCommunityListExperimentation (ref), getFStringLuaCommunityListVariant (ref), IXPService (ref), getFStringSocialCommunityAppLayer (ref)
		local var5 = getFFlagForceEnableLuaCommunityList()
		
		if not var5 then
			var5 = getFFlagEnableCommunityListExperimentation()
			
			if var5 then
				local var6 = getFStringLuaCommunityListVariant()
				local var7 = IXPService:GetUserLayerVariables(getFStringSocialCommunityAppLayer())
				
				if var7 and var7[var6] ~= nil then
					return var7[var6]
				end
				var5 = false
			end
		end
		return var5
	end,
	logExposure = function() --[[ line: 28 ]]
		-- upvalues: getFFlagEnableCommunityListExperimentation (ref), IXPService (ref), getFStringSocialCommunityAppLayer (ref)
		if getFFlagEnableCommunityListExperimentation() then
			IXPService:LogUserLayerExposure(getFStringSocialCommunityAppLayer())
		end
	end
}