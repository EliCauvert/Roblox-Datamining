local experienceLoadingScript = script:FindFirstAncestor("ExperienceLoadingScript")
local parent = experienceLoadingScript.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local badge = foundationModule.Badge
local view = foundationModule.View
local badgeVariant = foundationModule.Enums.BadgeVariant
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local iconPosition = foundationModule.Enums.IconPosition
local useLocalization = require(parent.Localization).Hooks.useLocalization
local signalsReactModule = require(parent.SignalsReact)
local getLoadingScreenStoreModule = require(experienceLoadingScript.Store.getLoadingScreenStore)
local loadingScreenTelemetryModule = require(experienceLoadingScript.LoadingScreenTelemetry)

return function(p0) --[[ line: 27 | named "AutoTranslateBadge" ]]
	-- upvalues: useLocalization (ref), reactModule (ref), getLoadingScreenStoreModule (ref), signalsReactModule (ref), loadingScreenTelemetryModule (ref), view (ref), badge (ref), badgeVariant (ref), iconName (ref), iconSize (ref), iconPosition (ref)
	local universeId = p0.universeId
	local var6 = useLocalization({
		autoTranslate = "CoreScripts.TopBar.LoadingScreen.AutoTranslate"
	})
	local var7 = signalsReactModule.useSignalState(reactModule.useCallback(function(p1) --[[ line: 33 ]]
		-- upvalues: getLoadingScreenStoreModule (copy), universeId (ref)
		local var9 = getLoadingScreenStoreModule(p1).getAndFetchPlayerLocalizationChoice(tostring(universeId)).data(p1)
		
		return if var9 then var9.IsPlayerChoiceEnabled else nil
	end, { universeId, getLoadingScreenStoreModule }))
	local var8 = reactModule.useRef(var7)
	var8.current = var7
	reactModule.useEffect(function() --[[ line: 43 ]]
		-- upvalues: var8 (ref), loadingScreenTelemetryModule (copy)
		return function() --[[ line: 44 ]]
			-- upvalues: var8 (copy), loadingScreenTelemetryModule (copy)
			if var8.current == nil then
				loadingScreenTelemetryModule.countPlayerLocalizationChoiceNotReady()
			end
		end
	end, {})
	
	return if var7 then reactModule.createElement(view, {
		tag = "auto-xy padding-y-xlarge",
		testId = "--auto-translate-badge",
		GroupTransparency = p0.transparencyBinding,
		AnchorPoint = Vector2.new(0.5, 0),
		Position = p0.positionBinding:map(function(p2) --[[ line: 60 ]]
			return UDim2.new(0.5, 0, 0.5, p2.Y / 2)
		end),
		Size = UDim2.fromScale(0, 0)
	}, {
		Badge = reactModule.createElement(badge, {
			text = var6.autoTranslate,
			variant = badgeVariant.OverMedia,
			icon = {
				name = iconName.LanguageCharacters,
				size = iconSize.XSmall,
				position = iconPosition.Left
			}
		})
	}) else nil
end