local progressLoading = script:FindFirstAncestor("ProgressLoading")
local parent = progressLoading.Parent
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
local getLoadingScreenStoreModule = require(progressLoading.Stores.getLoadingScreenStore)
local loadingScreenTelemetryModule = require(progressLoading.LoadingScreenTelemetry)

return function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), getLoadingScreenStoreModule (ref), signalsReactModule (ref), loadingScreenTelemetryModule (ref), view (ref), badge (ref), badgeVariant (ref), iconName (ref), iconSize (ref), iconPosition (ref)
	local universeId = p1.universeId
	local var1 = useLocalization({
		autoTranslate = "CoreScripts.TopBar.LoadingScreen.AutoTranslate"
	})
	local var2 = signalsReactModule.useSignalState(reactModule.useCallback(function(p2)
		-- upvalues: getLoadingScreenStoreModule (copy), universeId (ref)
		local var3 = getLoadingScreenStoreModule(p2).getAndFetchPlayerLocalizationChoice(tostring(universeId)).data(p2)
		
		return if var3 then var3.IsPlayerChoiceEnabled else nil
	end, { universeId, getLoadingScreenStoreModule }))
	local var3 = reactModule.useRef(var2)
	var3.current = var2
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), loadingScreenTelemetryModule (copy)
		return function()
			-- upvalues: var3 (copy), loadingScreenTelemetryModule (copy)
			if var3.current == nil then
				loadingScreenTelemetryModule.countPlayerLocalizationChoiceNotReady()
			end
		end
	end, {})
	
	return if var2 then reactModule.createElement(view, {
		tag = "auto-xy padding-y-xlarge",
		testId = "--auto-translate-badge",
		GroupTransparency = p1.transparencyBinding,
		AnchorPoint = Vector2.new(0.5, 0),
		Position = p1.positionBinding:map(function(p2)
			return UDim2.new(0.5, 0, 0.5, p2.Y / 2)
		end),
		Size = UDim2.fromScale(0, 0)
	}, {
		Badge = reactModule.createElement(badge, {
			text = var1.autoTranslate,
			variant = badgeVariant.OverMedia,
			icon = {
				name = iconName.LanguageCharacters,
				size = iconSize.XSmall,
				position = iconPosition.Left
			}
		})
	}) else nil
end