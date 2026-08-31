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

return function(p1, p2, p3, p4, p5)
	-- upvalues: performFetch (ref), AVATAR_EDITOR_CONSTANTS (ref), fFlagAXMISSaveWearFix (ref), isMakeupOrEyebrowEyelashAssetType (ref), mutedError (ref), promiseModule (ref), constants (ref), fIntAXLookOutfitCreationDelayMs (ref), createMakeupLookModule (ref), reportAvatarEventCounterV1 (ref), constants_1 (ref), setCurrentToastMessage (ref), t (ref), reportAvatarEventCounterNoAnalyticsArgument (ref)
	return performFetch.Single(AVATAR_EDITOR_CONSTANTS.CreateMakeupLookKey, function(p6)
		-- upvalues: fFlagAXMISSaveWearFix (copy), p3 (ref), isMakeupOrEyebrowEyelashAssetType (copy), mutedError (copy), promiseModule (copy), p5 (ref), constants (copy), p2 (ref), fIntAXLookOutfitCreationDelayMs (copy), createMakeupLookModule (copy), p1 (ref), p4 (ref), reportAvatarEventCounterV1 (copy), constants_1 (copy), setCurrentToastMessage (copy), t (copy), reportAvatarEventCounterNoAnalyticsArgument (copy)
		local state = p6:getState()
		local bodyColor3s = state.AvatarExperience.AvatarEditor.Character.BodyColor3s
		local avatarScales = state.AvatarExperience.AvatarEditor.Character.AvatarScales
		local avatarType = state.AvatarExperience.AvatarEditor.Character.AvatarType
		local var1 = if fFlagAXMISSaveWearFix then state.AvatarExperience.AvatarEditor.Character.EquippedAssets else nil
		local t_1 = {}
		
		for i, v in bodyColor3s do
			t_1[i] = v:ToHex()
		end
		local t_2 = {}
		
		for i_1, v_1 in p3 do
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
		elseif fFlagAXMISSaveWearFix and p5 then
			local var2 = p5(state, p3)
			local t_3 = {}
			
			if var2 then
				for i_2, v_2 in var2:GetChildren() do
					if v_2:IsA("MakeupDescription") then
						t_3[tostring(v_2.assetId)] = v_2.order
					end
				end
			end
			for i_2, v_2 in constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE do
				if var1 and var1[i_2] then
					for i_3, v_3 in var1[i_2] do
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
			name = p2,
			bodyColor3s = t_1,
			assets = t_2,
			scale = avatarScales,
			playerAvatarType = avatarType
		}
		task.spawn(function()
			-- upvalues: fIntAXLookOutfitCreationDelayMs (copy), createMakeupLookModule (copy), p1 (copy), t_3 (ref), p4 (copy), reportAvatarEventCounterV1 (copy), constants_1 (copy), p6 (ref), setCurrentToastMessage (copy), t (copy), reportAvatarEventCounterNoAnalyticsArgument (copy)
			task.wait(fIntAXLookOutfitCreationDelayMs / 1000)
			local var3, _ = createMakeupLookModule(p1, t_3)
			
			return var3:andThen(function(_)
				-- upvalues: p4 (copy), reportAvatarEventCounterV1 (copy), constants_1 (copy)
				if p4 then
					p4()
				end
				reportAvatarEventCounterV1(constants_1.AVATAR_EVENT_COUNTER_NAME.AXCreateMakeupLook)
			end):catch(function(p7)
				-- upvalues: p6 (copy), setCurrentToastMessage (copy), t (copy), reportAvatarEventCounterNoAnalyticsArgument (copy), constants_1 (copy)
				warn("Failed to create makeup look", p7)
				p6:dispatch(setCurrentToastMessage(t))
				reportAvatarEventCounterNoAnalyticsArgument(constants_1.AVATAR_EDITOR_SERVICE_ERRORS.CreateOutfit)
			end)
		end)
		
		return promiseModule.resolve()
	end)
end