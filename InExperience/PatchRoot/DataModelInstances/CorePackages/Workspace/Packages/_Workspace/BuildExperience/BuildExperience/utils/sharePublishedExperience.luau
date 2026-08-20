local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local default = require(parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local universalShareSheet = require(parent.ShareSheet).UniversalShareSheet
local sharedFlagsModule = require(parent.SharedFlags)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local fFlagEnableShareSheet = sharedFlagsModule.FFlagEnableShareSheet
local isSubjectToDesktopPolicies = sharedFlagsModule.isSubjectToDesktopPolicies
local var5 = if fFlagEnableShareSheet then require(parent.DataHydration) else nil
local var6 = if fFlagEnableShareSheet then require(parent.Signals) else nil
local var7 = if fFlagEnableShareSheet then require(parent.SignalsReact) else nil

local function getGameShareUrl(p0) --[[ line: 27 ]]
	return `https://www.roblox.com/games/{p0}`
end

local function formatSuccessSnackbarText(p1) --[[ line: 31 ]]
	-- upvalues: localizationStringsModule (ref)
	local var11 = p1[1]
	
	return localizationStringsModule.formatGameSharedWithTarget(if var11 then var11.displayName else "")
end

local function sharePublishedExperience(p2, p3) --[[ line: 36 ]]
	-- upvalues: fFlagEnableShareSheet (ref), universalShareSheet (ref), formatSuccessSnackbarText (ref), localizationStringsModule (ref), isSubjectToDesktopPolicies (ref), default (ref)
	local var12 = `https://www.roblox.com/games/{p2}`
	
	if fFlagEnableShareSheet then
		universalShareSheet.show({
			context = "BuildExperienceGameShare",
			telemetryId = tostring(p2),
			formatSuccessSnackbarText = formatSuccessSnackbarText,
			messagePlaceholder = if p3 then localizationStringsModule.formatShareExperience(p3) else nil,
			url = var12
		})
		
		return nil
	elseif isSubjectToDesktopPolicies() then
		default:setClipboardText({ context = "BuildExperienceGameShare", text = var12 })
		
		return { copiedToClipboard = true, url = var12 }
	end
	default:shareUrl({ context = "BuildExperienceGameShare", url = var12 })
	
	return { copiedToClipboard = false, url = var12 }
end

return {
	getGameShareUrl = getGameShareUrl,
	sharePublishedExperience = sharePublishedExperience,
	useSharePublishedExperience = if fFlagEnableShareSheet then function(p5) --[[ line: 78 ]]
		-- upvalues: reactModule (ref), var6 (ref), var5 (ref), var7 (ref), fFlagBuildLocalization (ref), localizationModule (ref), localizationStringsModule (ref), universalShareSheet (ref), sharePublishedExperience (ref)
		local var13 = if p5 then tostring(p5) else nil
		local var14 = var7.useSignalState(reactModule.useMemo(function() --[[ line: 80 ]]
			-- upvalues: var6 (copy), var13 (ref), var5 (copy)
			return var6.createComputed(function(p6) --[[ line: 81 ]]
				-- upvalues: var13 (copy), var5 (copy)
				return if var13 == nil then nil else var5.Game.getGameInfoStore(p6).getAndFetchGameInfo(var13).data(p6)
			end)
		end, { var13 }))
		local var15 = if var14 and not var14.isUnavailable and var14.name ~= "" then var14.name else nil
		
		if fFlagBuildLocalization then
			local var16 = localizationModule.Hooks.useLocalization({
				gameShared = localizationStringsModule.SHARE_GAME_SHARED,
				messagePlaceholder = if var15 ~= nil then nil else {
					localizationStringsModule.SHARE_EXPERIENCE,
					EXPERIENCE_NAME = var15
				}
			})
			local var17 = reactModule.useContext(localizationModule.LocalizationRoactContext)
			local var18 = reactModule.useCallback(function(p7) --[[ line: 108 ]]
				-- upvalues: var16 (ref), var17 (ref), localizationStringsModule (copy)
				local var19 = p7[1]
				
				return if var19 == nil or var19.displayName == "" then var16.gameShared else var17:Format(localizationStringsModule.SHARE_GAME_SHARED_WITH_TARGET, { DISPLAY_NAME = var19.displayName })
			end, { var16.gameShared, var17 })
			local messagePlaceholder = var16.messagePlaceholder
			
			return reactModule.useCallback(function(p8) --[[ line: 121 ]]
				-- upvalues: universalShareSheet (copy), var18 (ref), messagePlaceholder (ref)
				universalShareSheet.show({
					context = "BuildExperienceGameShare",
					telemetryId = tostring(p8),
					formatSuccessSnackbarText = var18,
					messagePlaceholder = messagePlaceholder,
					url = `https://www.roblox.com/games/{p8}`
				})
			end, { var18, messagePlaceholder })
		end
		return reactModule.useCallback(function(p9) --[[ line: 131 ]]
			-- upvalues: sharePublishedExperience (copy), var15 (ref)
			sharePublishedExperience(p9, var15)
		end, { var15 })
	end else function() --[[ line: 137 ]]
		-- upvalues: reactModule (ref), sharePublishedExperience (ref)
		return reactModule.useCallback(function(p4) --[[ line: 138 ]]
			-- upvalues: sharePublishedExperience (copy)
			sharePublishedExperience(p4, nil)
		end, {})
	end
}