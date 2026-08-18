local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local createMakeupLookModule = require(avatarExperienceCatalog.Api.CreateMakeupLook.createMakeupLook)
local parent = avatarExperienceCatalog.Parent
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local performFetch = require(parent.Http).PerformFetch
local promiseModule = require(parent.Promise)
local toastRoduxModule = require(parent.ToastRodux)
local mutedError = require(parent.Loggers).mutedError
local constants = avatarExperienceCommonModule.Constants
local AVATAR_EDITOR_CONSTANTS = avatarExperienceCommonModule.Constants.AVATAR_EDITOR_CONSTANTS
local toastType = toastRoduxModule.Enums.ToastType
local setCurrentToastMessage = toastRoduxModule.Actions.SetCurrentToastMessage
local isMakeupOrEyebrowEyelashAssetType = avatarExperienceCommonModule.Utils.isMakeupOrEyebrowEyelashAssetType
local constants_1 = avatarExperienceAnalyticsModule.Constants
local reportAvatarEventCounterNoAnalyticsArgument = avatarExperienceAnalyticsModule.reportAvatarEventCounterNoAnalyticsArgument
local reportAvatarEventCounterV1 = avatarExperienceAnalyticsModule.reportAvatarEventCounterV1
local fIntAXLookOutfitCreationDelayMs = avatarExperienceFlagsModule.FIntAXLookOutfitCreationDelayMs
local fFlagAXMISSaveWearFix = avatarExperienceFlagsModule.FFlagAXMISSaveWearFix
local t = {
	toastMessage = "Feature.Avatar.Message.UnknownErrorCreatingMakeupLook",
	isLocalized = false,
	toastType = toastType.InformationMessage
}

return function(p0, p1, p2, p3, p4) --[[ line: 35 ]]
	-- upvalues: performFetch (ref), AVATAR_EDITOR_CONSTANTS (ref), fFlagAXMISSaveWearFix (ref), isMakeupOrEyebrowEyelashAssetType (ref), mutedError (ref), promiseModule (ref), constants (ref), fIntAXLookOutfitCreationDelayMs (ref), createMakeupLookModule (ref), reportAvatarEventCounterV1 (ref), constants_1 (ref), setCurrentToastMessage (ref), t (ref), reportAvatarEventCounterNoAnalyticsArgument (ref)
	return performFetch.Single(AVATAR_EDITOR_CONSTANTS.CreateMakeupLookKey, function(p5) --[[ line: 42 ]]
		-- upvalues: fFlagAXMISSaveWearFix (copy), p2 (ref), isMakeupOrEyebrowEyelashAssetType (copy), mutedError (copy), promiseModule (copy), p4 (ref), constants (copy), p1 (ref), fIntAXLookOutfitCreationDelayMs (copy), createMakeupLookModule (copy), p0 (ref), p3 (ref), reportAvatarEventCounterV1 (copy), constants_1 (copy), setCurrentToastMessage (copy), t (copy), reportAvatarEventCounterNoAnalyticsArgument (copy)
		local state = p5:getState()
		local bodyColor3s = state.AvatarExperience.AvatarEditor.Character.BodyColor3s
		local avatarScales = state.AvatarExperience.AvatarEditor.Character.AvatarScales
		local avatarType = state.AvatarExperience.AvatarEditor.Character.AvatarType
		local var9 = if fFlagAXMISSaveWearFix then state.AvatarExperience.AvatarEditor.Character.EquippedAssets else nil
		local t_1 = {}
		
		for i, v in bodyColor3s do
			t_1[i] = v:ToHex()
		end
		local t_2 = {}
		
		for i_1, v_1 in p2 do
			if v_1.itemSubType and isMakeupOrEyebrowEyelashAssetType(v_1.itemSubType) and v_1.selectedInTryOnManager then
				table.insert(t_2, {
					id = tonumber(v_1.itemId),
					meta = { order = v_1.order, version = tonumber(v_1.version) }
				})
			end
		end
		if #t_2 == 0 then
			mutedError("SaveAsMakeupLookThunk: No valid makeup assets to save")
			
			return promiseModule.resolve()
		elseif fFlagAXMISSaveWearFix and p4 then
			local var12 = p4(state, p2)
			local t_3 = {}
			
			if var12 then
				for i_2, v_2 in var12:GetChildren() do
					if v_2:IsA("MakeupDescription") then
						t_3[tostring(v_2.assetId)] = v_2.order
					end
				end
			end
			for i_2, v_2 in constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE do
				if var9 and var9[i_2] then
					for i_3, v_3 in var9[i_2] do
						if t_3[i_3] ~= nil then
							table.insert(t_2, {
								id = i_3,
								meta = { order = t_3[i_3], version = tonumber(v_3.version) }
							})
						end
					end
				end
			end
		end
		local t_3 = {
			outfitType = "Makeup",
			name = p1,
			bodyColor3s = t_1,
			assets = t_2,
			scale = avatarScales,
			playerAvatarType = avatarType
		}
		task.spawn(function() --[[ line: 117 ]]
			-- upvalues: fIntAXLookOutfitCreationDelayMs (copy), createMakeupLookModule (copy), p0 (copy), t_3 (ref), p3 (copy), reportAvatarEventCounterV1 (copy), constants_1 (copy), p5 (ref), setCurrentToastMessage (copy), t (copy), reportAvatarEventCounterNoAnalyticsArgument (copy)
			task.wait(fIntAXLookOutfitCreationDelayMs / 1000)
			local var15, _ = createMakeupLookModule(p0, t_3)
			
			return var15:andThen(function(_) --[[ line: 122 ]]
				-- upvalues: p3 (copy), reportAvatarEventCounterV1 (copy), constants_1 (copy)
				if p3 then
					p3()
				end
				reportAvatarEventCounterV1(constants_1.AVATAR_EVENT_COUNTER_NAME.AXCreateMakeupLook)
			end):catch(function(p6) --[[ line: 129 ]]
				-- upvalues: p5 (copy), setCurrentToastMessage (copy), t (copy), reportAvatarEventCounterNoAnalyticsArgument (copy), constants_1 (copy)
				warn("Failed to create makeup look", p6)
				p5:dispatch(setCurrentToastMessage(t))
				reportAvatarEventCounterNoAnalyticsArgument(constants_1.AVATAR_EDITOR_SERVICE_ERRORS.CreateOutfit)
			end)
		end)
		
		return promiseModule.resolve()
	end)
end