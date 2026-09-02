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
local var1 = if fFlagEnableShareSheet then require(parent.DataHydration) else nil
local var2 = if fFlagEnableShareSheet then require(parent.Signals) else nil
local var3 = if fFlagEnableShareSheet then require(parent.SignalsReact) else nil

local function getGameShareUrl(p1)
	return `https://www.roblox.com/games/{p1}`
end

local function formatSuccessSnackbarText(p1)
	-- upvalues: localizationStringsModule (ref)
	local var4 = p1[1]
	
	return localizationStringsModule.formatGameSharedWithTarget(if var4 then var4.displayName else "")
end

local function sharePublishedExperience(p1, p2)
	-- upvalues: fFlagEnableShareSheet (ref), universalShareSheet (ref), formatSuccessSnackbarText (ref), localizationStringsModule (ref), isSubjectToDesktopPolicies (ref), default (ref)
	local var4 = `https://www.roblox.com/games/{p1}`
	
	if fFlagEnableShareSheet then
		universalShareSheet.show({
			context = "BuildExperienceGameShare",
			telemetryId = tostring(p1),
			formatSuccessSnackbarText = formatSuccessSnackbarText,
			messagePlaceholder = if p2 then localizationStringsModule.formatShareExperience(p2) else nil,
			url = var4
		})
		
		return nil
	elseif isSubjectToDesktopPolicies() then
		default:setClipboardText({ context = "BuildExperienceGameShare", text = var4 })
		
		return { copiedToClipboard = true, url = var4 }
	end
	default:shareUrl({ context = "BuildExperienceGameShare", url = var4 })
	
	return { copiedToClipboard = false, url = var4 }
end

return {
	getGameShareUrl = getGameShareUrl,
	sharePublishedExperience = sharePublishedExperience,
	useSharePublishedExperience = if fFlagEnableShareSheet then function(p1)
		-- upvalues: reactModule (ref), var2 (ref), var1 (ref), var3 (ref), fFlagBuildLocalization (ref), localizationModule (ref), localizationStringsModule (ref), universalShareSheet (ref), sharePublishedExperience (ref)
		local var4 = if p1 then tostring(p1) else nil
		local var5 = var3.useSignalState(reactModule.useMemo(function()
			-- upvalues: var2 (copy), var4 (ref), var1 (copy)
			return var2.createComputed(function(p2)
				-- upvalues: var4 (copy), var1 (copy)
				return if var4 == nil then nil else var1.Game.getGameInfoStore(p2).getAndFetchGameInfo(var4).data(p2)
			end)
		end, { var4 }))
		local var6 = if var5 and not var5.isUnavailable and var5.name ~= "" then var5.name else nil
		
		if fFlagBuildLocalization then
			local var7 = localizationModule.Hooks.useLocalization({
				gameShared = localizationStringsModule.SHARE_GAME_SHARED,
				messagePlaceholder = if var6 ~= nil then nil else {
					localizationStringsModule.SHARE_EXPERIENCE,
					EXPERIENCE_NAME = var6
				}
			})
			local var8 = reactModule.useContext(localizationModule.LocalizationRoactContext)
			local var9 = reactModule.useCallback(function(p2)
				-- upvalues: var7 (ref), var8 (ref), localizationStringsModule (copy)
				local var10 = p2[1]
				
				return if var10 == nil or var10.displayName == "" then var7.gameShared else var8:Format(localizationStringsModule.SHARE_GAME_SHARED_WITH_TARGET, { DISPLAY_NAME = var10.displayName })
			end, { var7.gameShared, var8 })
			local messagePlaceholder = var7.messagePlaceholder
			
			return reactModule.useCallback(function(p2)
				-- upvalues: universalShareSheet (copy), var9 (ref), messagePlaceholder (ref)
				universalShareSheet.show({
					context = "BuildExperienceGameShare",
					telemetryId = tostring(p2),
					formatSuccessSnackbarText = var9,
					messagePlaceholder = messagePlaceholder,
					url = `https://www.roblox.com/games/{p2}`
				})
			end, { var9, messagePlaceholder })
		end
		return reactModule.useCallback(function(p2)
			-- upvalues: sharePublishedExperience (copy), var6 (ref)
			sharePublishedExperience(p2, var6)
		end, { var6 })
	end else function()
		-- upvalues: reactModule (ref), sharePublishedExperience (ref)
		return reactModule.useCallback(function(p1)
			-- upvalues: sharePublishedExperience (copy)
			sharePublishedExperience(p1, nil)
		end, {})
	end
}