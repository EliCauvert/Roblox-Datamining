local CorePackages = game:GetService("CorePackages")
local TeleportService = game:GetService("TeleportService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local FoundationModule = require(CorePackages.Packages.Foundation)
local ReactModule = require(CorePackages.Packages.React)
local ReactOtterModule = require(CorePackages.Packages.ReactOtter)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local DataHydrationModule = require(CorePackages.Workspace.Packages.DataHydration)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local SettingsShowSignal = require(CorePackages.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local Traversal = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).Traversal
local DataHydrationTypes = DataHydrationModule.DataHydrationTypes
local GetGameInfoStoreFunction = DataHydrationModule.Game.getGameInfoStore
local Constants = Traversal.Constants
local TeleportBackButton = Traversal.TeleportBackButton
local TraversalTelemetry = Traversal.TraversalTelemetry
local _ = Traversal.useHistoryItems
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local _ = Traversal.Flags.FFlagUseTeleportTraversalHistory
local _ = Traversal.Flags.FFlagUseLocalTraversalHistory
local FFlagAddTraversalBackButtonAnimation = Traversal.Flags.FFlagAddTraversalBackButtonAnimation
local FixTraversalBackButtonAnimation = game:DefineFastFlag("FixTraversalBackButtonAnimation", false)

return ReactModule.memo(function(_)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), TeleportService (copy), Constants (copy), SettingsShowSignal (copy), TraversalTelemetry (copy), UseLocalizationFunction (copy), GetGameInfoStoreFunction (copy), DataHydrationTypes (copy), SignalsReactModule (copy), FixTraversalBackButtonAnimation (copy), FFlagAddTraversalBackButtonAnimation (copy), ReactOtterModule (copy), UserGameSettings (copy), View (copy), TeleportBackButton (copy)
	local UseTokensResult = UseTokensFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local ThirdPartyTeleportInfo, ThirdPartyTeleportInfo2 = TeleportService:GetThirdPartyTeleportInfo(false)
	
	if ThirdPartyTeleportInfo <= Constants.NO_UNIVERSE_ID or ThirdPartyTeleportInfo2 <= Constants.NO_PLACE_ID then
		return nil
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: SettingsShowSignal (upval), UseStateResult2 (copy)
		local Connection = SettingsShowSignal:connect(function(p1)
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(p1)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), TraversalTelemetry (upval), ThirdPartyTeleportInfo (copy)
		if UseStateResult then
			TraversalTelemetry.sendBackButtonActionEvent({
				integration_id = "back_button",
				event_type = "impression",
				destination_universe_id = ThirdPartyTeleportInfo
			})
		end
	end, { UseStateResult, ThirdPartyTeleportInfo })
	local UseLocalizationResult = UseLocalizationFunction({
		defaultBackButtonText = "CoreScripts.TopBar.Traversal.BackButtonDefault"
	})
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useCallback(function(p1)
		-- upvalues: GetGameInfoStoreFunction (upval), ThirdPartyTeleportInfo (copy), DataHydrationTypes (upval), UseLocalizationResult (copy)
		local AndFetchGameInfo = GetGameInfoStoreFunction(p1).getAndFetchGameInfo((tostring(ThirdPartyTeleportInfo)))
		local DataResult = AndFetchGameInfo.data(p1)
		local StatusResult = AndFetchGameInfo.status(p1)
		
		return if DataResult and StatusResult == DataHydrationTypes.DataStatus.Ready then DataResult.name else UseLocalizationResult.defaultBackButtonText
	end, { ThirdPartyTeleportInfo, GetGameInfoStoreFunction })))
	local UseRefResult1 = if FixTraversalBackButtonAnimation then ReactModule.useRef(nil) else nil
	local ScaledSize = UseTokensResult.Size.Size_2500 * 2
	local UseRefResult3 = nil
	local UseRefResult4 = nil
	local UseRefResult2 = nil
	local v1 = nil
	local UseAnimatedBindingResult2 = nil
	local UseResult = nil
	local UseResult1 = nil
	
	if FFlagAddTraversalBackButtonAnimation then
		UseRefResult3 = ReactModule.useRef(nil)
		UseRefResult4 = ReactModule.useRef(nil)
		
		if FixTraversalBackButtonAnimation then
			UseRefResult2 = ReactModule.useRef(nil)
		end
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: UseTokensResult (copy)
			return {
				duration = UseTokensResult.Time.Time_300,
				easingStyle = UseTokensResult.Ease.StandardOut
			}
		end, { UseTokensResult })
		v1, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0, function(p1)
			-- upvalues: UseRefResult3 (ref), FixTraversalBackButtonAnimation (upval), UseRefResult2 (ref), UseRefResult4 (ref)
			UseRefResult3.current = nil
			
			if FixTraversalBackButtonAnimation then
				if not UseRefResult2.current and UseRefResult4.current and p1 == 1 then
					UseRefResult2.current = UseRefResult4.current
				end
				if p1 == 0 then
					UseRefResult4.current = 0
					
					return
				end
			else
				UseRefResult4.current = nil
			end
		end)
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult (copy), FixTraversalBackButtonAnimation (upval), UseRefResult1 (ref), UseSignalStateResult (copy), UseRefResult2 (ref), UseRefResult (copy), UseAnimatedBindingResult2 (ref), ReactOtterModule (upval), UseMemoResult (copy)
			if UseStateResult then
				if FixTraversalBackButtonAnimation then
					if UseRefResult1.current == UseSignalStateResult then
						UseAnimatedBindingResult2(ReactOtterModule.ease(1, UseMemoResult))
					else
						UseRefResult2.current = nil
						UseRefResult1.current = UseSignalStateResult
						
						if UseRefResult.current then
							UseAnimatedBindingResult2(ReactOtterModule.ease(0.99, UseMemoResult))
						end
					end
				else
					UseAnimatedBindingResult2(ReactOtterModule.ease(1, UseMemoResult))
				end
			else
				UseAnimatedBindingResult2(ReactOtterModule.ease(0, UseMemoResult))
			end
			if FixTraversalBackButtonAnimation and UseRefResult1.current == nil then
				UseRefResult1.current = UseSignalStateResult
			end
		end, { UseStateResult, UseMemoResult, UseSignalStateResult })
		UseResult = ReactModule.useCallback(function(p1): UDim2
			-- upvalues: FixTraversalBackButtonAnimation (upval), UseRefResult2 (ref), UseStateResult (copy), UseRefResult (copy), UseRefResult3 (ref), UseRefResult4 (ref), ScaledSize (copy)
			if FixTraversalBackButtonAnimation then
				if UseRefResult2.current then
					return UDim2.new(0, p1 * UseRefResult2.current, 0, 0)
				end
				local XOffset = nil
				if UseStateResult and UseRefResult.current then
					local X = UseRefResult.current.AbsoluteSize.X
					
					if not UseRefResult3.current then
						UseRefResult3.current = UseRefResult.current.AbsoluteSize.X
					end
					if UseRefResult4.current and X <= UseRefResult4.current then
						return UDim2.new(0, if FixTraversalBackButtonAnimation then X else UseRefResult4.current, 0, 0)
					end
					if UseRefResult3.current and UseRefResult3.current ~= X then
						UseRefResult4.current = X
					end
					XOffset = p1 * ScaledSize
				else
					XOffset = p1 * (UseRefResult4.current or ScaledSize)
				end
				return UDim2.new(0, XOffset, 0, 0)
			else
				if UseStateResult and UseRefResult.current then
					local X = UseRefResult.current.AbsoluteSize.X
					
					if not UseRefResult3.current then
						UseRefResult3.current = UseRefResult.current.AbsoluteSize.X
					end
					if UseRefResult4.current and X <= UseRefResult4.current then
						return UDim2.new(0, UseRefResult4.current, 0, 0)
					end
					if UseRefResult3.current and UseRefResult3.current ~= X then
						UseRefResult4.current = X
					end
				end
				return UDim2.new(0, p1 * ScaledSize, 0, 0)
			end
		end, { UseStateResult })
		UseResult1 = ReactModule.useCallback(function(p1: number)
			-- upvalues: UseStateResult (copy)
			return p1 > 0 or UseStateResult
		end, { UseStateResult })
	end
	return if FFlagAddTraversalBackButtonAnimation and not UserGameSettings.ReducedMotion then ReactModule.createElement(View, {
		tag = "auto-y",
		ZIndex = -1,
		Visible = v1:map(UseResult1),
		Size = v1:map(UseResult)
	}, {
		TraversalBackButton = ReactModule.createElement(TeleportBackButton, {
			text = UseSignalStateResult,
			textLimitWidth = ScaledSize,
			ref = UseRefResult
		})
	}) else UseStateResult and ReactModule.createElement(View, { tag = "auto-xy shrink" }, {
		TraversalBackButton = ReactModule.createElement(TeleportBackButton, {
			text = UseSignalStateResult,
			textLimitWidth = ScaledSize,
			ref = UseRefResult
		})
	})
end)