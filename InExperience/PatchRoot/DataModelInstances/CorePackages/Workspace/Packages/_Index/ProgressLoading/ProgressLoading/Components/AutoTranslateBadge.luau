local ProgressLoading = script:FindFirstAncestor("ProgressLoading")
local Parent = ProgressLoading.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Badge = FoundationModule.Badge
local View = FoundationModule.View
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local IconPosition = FoundationModule.Enums.IconPosition
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SignalsReactModule = require(Parent.SignalsReact)
local GetLoadingScreenStoreModule = require(ProgressLoading.Stores.getLoadingScreenStore)
local LoadingScreenTelemetryModule = require(ProgressLoading.LoadingScreenTelemetry)

return function(p1) --[[ Line: 27 | Named "AutoTranslateBadge" ]]
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), GetLoadingScreenStoreModule (copy), SignalsReactModule (copy), LoadingScreenTelemetryModule (copy), View (copy), Badge (copy), BadgeVariant (copy), IconName (copy), IconSize (copy), IconPosition (copy)
	local UniverseId = p1.universeId
	local UseLocalizationResult = UseLocalizationFunction({
		autoTranslate = "CoreScripts.TopBar.LoadingScreen.AutoTranslate"
	})
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useCallback(function(p2) --[[ Line: 33 ]]
		-- upvalues: GetLoadingScreenStoreModule (upval), UniverseId (copy)
		local DataResult = GetLoadingScreenStoreModule(p2).getAndFetchPlayerLocalizationChoice((tostring(UniverseId))).data(p2)
		
		return if DataResult then DataResult.IsPlayerChoiceEnabled else nil
	end, { UniverseId, GetLoadingScreenStoreModule })))
	local UseRefResult = ReactModule.useRef(UseSignalStateResult)
	UseRefResult.current = UseSignalStateResult
	ReactModule.useEffect(function() --[[ Line: 43 ]]
		-- upvalues: UseRefResult (copy), LoadingScreenTelemetryModule (upval)
		return function() --[[ Line: 44 ]]
			-- upvalues: UseRefResult (upval), LoadingScreenTelemetryModule (upval)
			if UseRefResult.current == nil then
				LoadingScreenTelemetryModule.countPlayerLocalizationChoiceNotReady()
			end
		end
	end, {})
	
	return if UseSignalStateResult then ReactModule.createElement(View, {
		tag = "auto-xy padding-y-xlarge",
		testId = "--auto-translate-badge",
		GroupTransparency = p1.transparencyBinding,
		AnchorPoint = Vector2.new(0.5, 0),
		Position = p1.positionBinding:map(function(p2): UDim2 --[[ Line: 60 ]]
			return UDim2.new(0.5, 0, 0.5, p2.Y / 2)
		end),
		Size = UDim2.fromScale(0, 0)
	}, {
		Badge = ReactModule.createElement(Badge, {
			text = UseLocalizationResult.autoTranslate,
			variant = BadgeVariant.OverMedia,
			icon = {
				name = IconName.LanguageCharacters,
				size = IconSize.XSmall,
				position = IconPosition.Left
			}
		})
	}) else nil
end