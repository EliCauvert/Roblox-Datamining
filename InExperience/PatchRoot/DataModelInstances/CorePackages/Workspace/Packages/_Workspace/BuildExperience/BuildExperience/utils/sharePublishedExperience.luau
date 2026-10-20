local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local Default = require(Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local UniversalShareSheet = require(Parent.ShareSheet).UniversalShareSheet
local SharedFlagsModule = require(Parent.SharedFlags)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local CreateExperienceShareLinkModule = require(BuildExperience.utils.createExperienceShareLink)
local FFlagEnableShareSheet = SharedFlagsModule.FFlagEnableShareSheet
local IsSubjectToDesktopPoliciesFunction = SharedFlagsModule.isSubjectToDesktopPolicies
local DataHydrationModule = if FFlagEnableShareSheet then require(Parent.DataHydration) else nil
local SignalsModule = if FFlagEnableShareSheet then require(Parent.Signals) else nil
local SignalsReactModule = if FFlagEnableShareSheet then require(Parent.SignalsReact) else nil

local function formatSuccessSnackbarText(Entry)
	-- upvalues: LocalizationStringsModule (copy)
	local Entry1 = Entry[1]
	
	return LocalizationStringsModule.formatGameSharedWithTarget(if Entry1 then Entry1.displayName else "")
end

local function sharePublishedExperience(p1, p2)
	-- upvalues: FFlagEnableShareSheet (copy), UniversalShareSheet (copy), formatSuccessSnackbarText (copy), LocalizationStringsModule (copy), IsSubjectToDesktopPoliciesFunction (copy), Default (copy)
	local Url: string = `https://www.roblox.com/games/{p1}`
	
	if FFlagEnableShareSheet then
		UniversalShareSheet.show({
			context = "BuildExperienceGameShare",
			telemetryId = tostring(p1),
			formatSuccessSnackbarText = formatSuccessSnackbarText,
			messagePlaceholder = if p2 then LocalizationStringsModule.formatShareExperience(p2) else nil,
			url = Url
		})
		
		return nil
	elseif IsSubjectToDesktopPoliciesFunction() then
		Default:setClipboardText({ context = "BuildExperienceGameShare", text = Url })
		
		return { copiedToClipboard = true, url = Url }
	else
		Default:shareUrl({ context = "BuildExperienceGameShare", url = Url })
		
		return { copiedToClipboard = false, url = Url }
	end
end

return {
	getGameShareUrl = function(p1): string
		return `https://www.roblox.com/games/{p1}`
	end,
	sharePublishedExperience = sharePublishedExperience,
	useSharePublishedExperience = if FFlagEnableShareSheet then function(p1)
		-- upvalues: ReactModule (copy), SignalsModule (copy), DataHydrationModule (copy), SignalsReactModule (copy), LocalizationModule (copy), LocalizationStringsModule (copy), UniversalShareSheet (copy), CreateExperienceShareLinkModule (copy)
		local Text = if p1 then tostring(p1) else nil
		local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), Text (copy), DataHydrationModule (upval)
			return SignalsModule.createComputed(function(p2)
				-- upvalues: Text (upval), DataHydrationModule (upval)
				return if Text == nil then nil else DataHydrationModule.Game.getGameInfoStore(p2).getAndFetchGameInfo(Text).data(p2)
			end)
		end, { Text })))
		local Name = if UseSignalStateResult and not UseSignalStateResult.isUnavailable and UseSignalStateResult.name ~= "" then UseSignalStateResult.name else nil
		local UseLocalizationResult = LocalizationModule.Hooks.useLocalization({
			gameShared = LocalizationStringsModule.SHARE_GAME_SHARED,
			messagePlaceholder = if Name == nil then nil else {
				LocalizationStringsModule.SHARE_EXPERIENCE,
				EXPERIENCE_NAME = Name
			}
		})
		local UseContextResult = ReactModule.useContext(LocalizationModule.LocalizationRoactContext)
		local UseResult = ReactModule.useCallback(function(Entry)
			-- upvalues: UseLocalizationResult (copy), UseContextResult (copy), LocalizationStringsModule (upval)
			local Entry1 = Entry[1]
			
			return if Entry1 == nil or Entry1.displayName == "" then UseLocalizationResult.gameShared else UseContextResult:Format(LocalizationStringsModule.SHARE_GAME_SHARED_WITH_TARGET, { DISPLAY_NAME = Entry1.displayName })
		end, { UseLocalizationResult.gameShared, UseContextResult })
		local MessagePlaceholder = UseLocalizationResult.messagePlaceholder
		
		return ReactModule.useCallback(function(p2, RecipientSource)
			-- upvalues: UniversalShareSheet (upval), UseResult (copy), MessagePlaceholder (copy), p1 (copy), CreateExperienceShareLinkModule (upval)
			local function showShareSheet(Result)
				-- upvalues: UniversalShareSheet (upval), RecipientSource (copy), p2 (copy), UseResult (upval), MessagePlaceholder (upval)
				UniversalShareSheet.show({
					context = "BuildExperienceGameShare",
					recipientSource = RecipientSource,
					telemetryId = tostring(p2),
					formatSuccessSnackbarText = UseResult,
					messagePlaceholder = MessagePlaceholder,
					url = Result or `https://www.roblox.com/games/{p2}`
				})
			end
			
			if p1 == nil then
				UniversalShareSheet.show({
					context = "BuildExperienceGameShare",
					recipientSource = RecipientSource,
					telemetryId = tostring(p2),
					formatSuccessSnackbarText = UseResult,
					messagePlaceholder = MessagePlaceholder,
					url = `https://www.roblox.com/games/{p2}`
				})
				
				return
			else
				CreateExperienceShareLinkModule(p1, false):andThen(showShareSheet, function()
					-- upvalues: UniversalShareSheet (upval), RecipientSource (copy), p2 (copy), UseResult (upval), MessagePlaceholder (upval)
					UniversalShareSheet.show({
						context = "BuildExperienceGameShare",
						recipientSource = RecipientSource,
						telemetryId = tostring(p2),
						formatSuccessSnackbarText = UseResult,
						messagePlaceholder = MessagePlaceholder,
						url = `https://www.roblox.com/games/{p2}`
					})
				end)
			end
		end, { UseResult, MessagePlaceholder, p1 })
	end else function()
		-- upvalues: ReactModule (copy), sharePublishedExperience (copy)
		return ReactModule.useCallback(function(p1, _)
			-- upvalues: sharePublishedExperience (upval)
			sharePublishedExperience(p1, nil)
		end, {})
	end
}