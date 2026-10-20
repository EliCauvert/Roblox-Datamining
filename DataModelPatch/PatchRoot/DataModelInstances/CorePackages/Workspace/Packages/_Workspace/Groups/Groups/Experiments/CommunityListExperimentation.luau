local IXPService = game:GetService("IXPService")
local Groups = script:FindFirstAncestor("Groups")
local FlagsModule = require(Groups.Flags)
local GetFStringSocialCommunityAppLayerFunction = FlagsModule.GetFStringSocialCommunityAppLayer
local GetFStringLuaCommunityListVariantFunction = FlagsModule.GetFStringLuaCommunityListVariant
local GetFFlagForceEnableLuaCommunityListFunction = FlagsModule.GetFFlagForceEnableLuaCommunityList
local GetFFlagEnableCommunityListExperimentationFunction = require(Groups.Parent.SharedFlags).GetFFlagEnableCommunityListExperimentation

local function _(p1)
	-- upvalues: IXPService (copy), GetFStringSocialCommunityAppLayerFunction (copy)
	local UserLayerVariables = IXPService:GetUserLayerVariables(GetFStringSocialCommunityAppLayerFunction())
	
	return if UserLayerVariables and UserLayerVariables[p1] ~= nil then UserLayerVariables[p1] else false
end

return {
	getCommunityListEnabled = function()
		-- upvalues: GetFFlagForceEnableLuaCommunityListFunction (copy), GetFFlagEnableCommunityListExperimentationFunction (copy), GetFStringLuaCommunityListVariantFunction (copy), IXPService (copy), GetFStringSocialCommunityAppLayerFunction (copy)
		local FFlagForceEnableLuaCommunityList = GetFFlagForceEnableLuaCommunityListFunction()
		
		if not FFlagForceEnableLuaCommunityList then
			FFlagForceEnableLuaCommunityList = GetFFlagEnableCommunityListExperimentationFunction()
			
			if FFlagForceEnableLuaCommunityList then
				local FStringLuaCommunityListVariant = GetFStringLuaCommunityListVariantFunction()
				local UserLayerVariables = IXPService:GetUserLayerVariables(GetFStringSocialCommunityAppLayerFunction())
				
				if UserLayerVariables and UserLayerVariables[FStringLuaCommunityListVariant] ~= nil then
					return UserLayerVariables[FStringLuaCommunityListVariant]
				end
				FFlagForceEnableLuaCommunityList = false
			end
		end
		return FFlagForceEnableLuaCommunityList
	end,
	logExposure = function()
		-- upvalues: GetFFlagEnableCommunityListExperimentationFunction (copy), IXPService (copy), GetFStringSocialCommunityAppLayerFunction (copy)
		if GetFFlagEnableCommunityListExperimentationFunction() then
			IXPService:LogUserLayerExposure(GetFStringSocialCommunityAppLayerFunction())
		end
	end
}