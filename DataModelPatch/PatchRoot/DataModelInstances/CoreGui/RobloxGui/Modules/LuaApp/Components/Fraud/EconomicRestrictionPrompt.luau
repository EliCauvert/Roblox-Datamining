local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local Localization = require(CorePackages.Workspace.Packages.RobloxAppLocales).Localization
local ReactModule = require(CorePackages.Packages.React)
local UseEffectFunction = ReactModule.useEffect
local UseMemoFunction = ReactModule.useMemo
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseCallbackFunction = ReactModule.useCallback
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local IAPExperienceModule = require(CorePackages.Workspace.Packages.IAPExperience)
local AddEconomicRestrictionKeysToLocalizationFunction = IAPExperienceModule.Utility.addEconomicRestrictionKeysToLocalization
local FormatEconomicRestrictionTextFunction = IAPExperienceModule.Utility.formatEconomicRestrictionText
local EconomicRestrictionsCounter = IAPExperienceModule.Counters.EconomicRestrictionsCounter
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local AlertWindowModule = require(Modules.LuaApp.Components.AlertWindow)

local function v11(p1)
	-- upvalues: UseMemoFunction (copy), FormatEconomicRestrictionTextFunction (copy), UseDispatchFunction (copy), UseCallbackFunction (copy), CloseCentralOverlayModule (copy), ReactModule (copy), AlertWindowModule (copy)
	local UseMemoResult = UseMemoFunction(function()
		-- upvalues: FormatEconomicRestrictionTextFunction (upval), p1 (copy)
		return FormatEconomicRestrictionTextFunction(p1.locMap, {
			violationType = p1.failureReason,
			timeoutMinutes = p1.expirationTimeInMinutes
		}, true)
	end, { p1.failureReason, p1.expirationTimeInMinutes })
	local UseDispatchResult = UseDispatchFunction()
	
	return ReactModule.createElement(AlertWindowModule, {
		hasCancelButton = false,
		containerWidth = p1.containerWidth,
		titleText = p1.locMap.titleText,
		titleFont = p1.style.Font.Header1.Font,
		messageText = UseMemoResult,
		messageFont = p1.style.Font.Body.Font,
		buttonFont = p1.style.Font.Header2.Font,
		confirmButtonText = p1.locMap.okButtonText,
		onConfirm = UseCallbackFunction(function()
			-- upvalues: UseDispatchResult (copy), CloseCentralOverlayModule (upval)
			UseDispatchResult(CloseCentralOverlayModule())
		end, {})
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: UseMemoFunction (copy), AddEconomicRestrictionKeysToLocalizationFunction (copy), UseEffectFunction (copy), Default (copy), EconomicRestrictionsCounter (copy), ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), WithLocalizationFunction (copy), WithStyleFunction (copy), v11 (copy)
	local UseMemoResult = UseMemoFunction(function()
		-- upvalues: AddEconomicRestrictionKeysToLocalizationFunction (upval)
		local config = {
			titleText = "IAPExperience.PurchaseError.Text.EconomicRestrictionPromptTitle"
		}
		AddEconomicRestrictionKeysToLocalizationFunction(config)
		
		return config
	end, { p1.failureReason, p1.expirationTimeInMinutes })
	UseEffectFunction(function()
		-- upvalues: Default (upval), EconomicRestrictionsCounter (upval), p1 (copy)
		Default:logRobloxTelemetryCounter(EconomicRestrictionsCounter.EconomicRestrictionsPromptCounter, 1, { failureReason = p1.failureReason })
	end, { p1.failureReason, p1.expirationTimeInMinutes })
	
	return ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		Alert = WithLocalizationFunction(UseMemoResult)(function(LocMap)
			-- upvalues: WithStyleFunction (upval), ReactModule (upval), v11 (upval), p1 (copy)
			return WithStyleFunction(function(Style)
				-- upvalues: ReactModule (upval), v11 (upval), LocMap (copy), p1 (upval)
				return ReactModule.createElement(v11, {
					style = Style,
					locMap = LocMap,
					failureReason = p1.failureReason,
					expirationTimeInMinutes = p1.expirationTimeInMinutes,
					containerWidth = p1.containerWidth,
					defaultChildRef = p1.defaultChildRef,
					focusController = p1.focusController
				})
			end)
		end)
	})
end)