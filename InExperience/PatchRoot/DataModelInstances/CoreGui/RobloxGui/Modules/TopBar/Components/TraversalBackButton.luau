local corePackagesService = game:GetService("CorePackages")
local teleportService = game:GetService("TeleportService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local foundationModule = require(corePackagesService.Packages.Foundation)
local reactModule = require(corePackagesService.Packages.React)
local reactOtterModule = require(corePackagesService.Packages.ReactOtter)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local coreScriptsCommonModule = require(corePackagesService.Workspace.Packages.CoreScriptsCommon)
local coreScriptsRoactCommonModule = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon)
local dataHydrationModule = require(corePackagesService.Workspace.Packages.DataHydration)
local localizationModule = require(corePackagesService.Workspace.Packages.Localization)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local settingsShowSignal = coreScriptsCommonModule.SettingsShowSignal
local traversal = coreScriptsRoactCommonModule.Traversal
local dataHydrationTypes = dataHydrationModule.DataHydrationTypes
local getGameInfoStore = dataHydrationModule.Game.getGameInfoStore
local constants = traversal.Constants
local teleportBackButton = traversal.TeleportBackButton
local traversalTelemetry = traversal.TraversalTelemetry
local _ = traversal.useHistoryItems
local useLocalization = localizationModule.Hooks.useLocalization
local _ = traversal.Flags.FFlagUseTeleportTraversalHistory
local _ = traversal.Flags.FFlagUseLocalTraversalHistory
local fFlagAddTraversalBackButtonAnimation = traversal.Flags.FFlagAddTraversalBackButtonAnimation
local fixTraversalBackButtonAnimation = game:DefineFastFlag("FixTraversalBackButtonAnimation", false)

return reactModule.memo(function(_) --[[ line: 36 | named "TraversalBackButton" ]]
	-- upvalues: useTokens (ref), reactModule (ref), teleportService (ref), constants (ref), settingsShowSignal (ref), traversalTelemetry (ref), useLocalization (ref), getGameInfoStore (ref), dataHydrationTypes (ref), signalsReactModule (ref), fixTraversalBackButtonAnimation (ref), fFlagAddTraversalBackButtonAnimation (ref), reactOtterModule (ref), userGameSettingsService (ref), view (ref), teleportBackButton (ref)
	local var12 = useTokens()
	local var13 = reactModule.useRef(nil)
	local var14, var15 = teleportService:GetThirdPartyTeleportInfo(false)
	
	if var14 <= constants.NO_UNIVERSE_ID or var15 <= constants.NO_PLACE_ID then
		return nil
	end
	local var16, var17 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 46 ]]
		-- upvalues: settingsShowSignal (copy), var17 (ref)
		local var32 = settingsShowSignal:connect(function(p0) --[[ line: 47 ]]
			-- upvalues: var17 (copy)
			var17(p0)
		end)
		
		return function() --[[ line: 50 ]]
			-- upvalues: var32 (ref)
			var32:Disconnect()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 55 ]]
		-- upvalues: var16 (ref), traversalTelemetry (copy), var14 (ref)
		if var16 then
			traversalTelemetry.sendBackButtonActionEvent({
				integration_id = "back_button",
				event_type = "impression",
				destination_universe_id = var14
			})
		end
	end, { var16, var14 })
	local var18 = useLocalization({
		defaultBackButtonText = "CoreScripts.TopBar.Traversal.BackButtonDefault"
	})
	local var19 = signalsReactModule.useSignalState(reactModule.useCallback(function(p1) --[[ line: 69 ]]
		-- upvalues: getGameInfoStore (copy), var14 (ref), dataHydrationTypes (copy), var18 (ref)
		local andFetchGameInfo = getGameInfoStore(p1).getAndFetchGameInfo(tostring(var14))
		local var34 = andFetchGameInfo.data(p1)
		
		return if var34 and andFetchGameInfo.status(p1) == dataHydrationTypes.DataStatus.Ready then var34.name else var18.defaultBackButtonText
	end, { var14, getGameInfoStore }))
	local var20 = if fixTraversalBackButtonAnimation then reactModule.useRef(nil) else nil
	local var21 = var12.Size.Size_2500 * 2
	local _ = nil
	local _ = nil
	local var22 = nil
	local var23 = nil
	local _ = nil
	local var24 = nil
	local var25 = nil
	
	if fFlagAddTraversalBackButtonAnimation then
		local var26 = reactModule.useRef(nil)
		local var27 = reactModule.useRef(nil)
		
		if fixTraversalBackButtonAnimation then
			var22 = reactModule.useRef(nil)
		end
		local var28 = reactModule.useMemo(function() --[[ line: 100 ]]
			-- upvalues: var12 (ref)
			return {
				duration = var12.Time.Time_300,
				easingStyle = var12.Ease.StandardOut
			}
		end, { var12 })
		local var29, var30 = reactOtterModule.useAnimatedBinding(0, function(p2) --[[ line: 106 ]]
			-- upvalues: var26 (write), fixTraversalBackButtonAnimation (copy), var22 (write), var27 (write)
			var26.current = nil
			
			if fixTraversalBackButtonAnimation then
				if not var22.current and var27.current and p2 == 1 then
					var22.current = var27.current
				end
				if p2 == 0 then
					var27.current = 0
					
					return
				end
			else
				var27.current = nil
			end
		end)
		var23 = var29
		local var31 = var30
		reactModule.useEffect(function() --[[ line: 119 ]]
			-- upvalues: var16 (ref), fixTraversalBackButtonAnimation (copy), var20 (write), var19 (ref), var22 (write), var13 (ref), var31 (write), reactOtterModule (copy), var28 (ref)
			if not var16 then
				var31(reactOtterModule.ease(0, var28))
			elseif not fixTraversalBackButtonAnimation then
				var31(reactOtterModule.ease(1, var28))
			elseif var20.current == var19 then
				var31(reactOtterModule.ease(1, var28))
			else
				var22.current = nil
				var20.current = var19
				
				if var13.current then
					var31(reactOtterModule.ease(0.99, var28))
				end
			end
			if fixTraversalBackButtonAnimation and var20.current == nil then
				var20.current = var19
			end
		end, { var16, var28, var19 })
		var24 = reactModule.useCallback(function(p3) --[[ line: 142 ]]
			-- upvalues: fixTraversalBackButtonAnimation (copy), var22 (write), var16 (ref), var13 (ref), var26 (write), var27 (write), var21 (ref)
			if fixTraversalBackButtonAnimation then
				if var22.current then
					return UDim2.new(0, p3 * var22.current, 0, 0)
				end
				local var35
				local _ = nil
				
				if var16 and var13.current then
					local x = var13.current.AbsoluteSize.X
					
					if not var26.current then
						var26.current = var13.current.AbsoluteSize.X
					end
					if var27.current and x <= var27.current then
						return UDim2.new(0, if fixTraversalBackButtonAnimation then x else var27.current, 0, 0)
					elseif var26.current and var26.current ~= x then
						var27.current = x
					end
					var35 = p3 * var21
				else
					var35 = p3 * (var27.current or var21)
				end
				return UDim2.new(0, var35, 0, 0)
			elseif var16 and var13.current then
				local x = var13.current.AbsoluteSize.X
				
				if not var26.current then
					var26.current = var13.current.AbsoluteSize.X
				end
				if var27.current and x <= var27.current then
					return UDim2.new(0, var27.current, 0, 0)
				elseif var26.current and var26.current ~= x then
					var27.current = x
				end
			end
			return UDim2.new(0, p3 * var21, 0, 0)
		end, { var16 })
		var25 = reactModule.useCallback(function(p4) --[[ line: 182 ]]
			-- upvalues: var16 (ref)
			return if p4 <= 0 then var16 else true
		end, { var16 })
	end
	return if fFlagAddTraversalBackButtonAnimation and not userGameSettingsService.ReducedMotion then reactModule.createElement(view, {
		tag = "auto-y",
		ZIndex = -1,
		Visible = var23:map(var25),
		Size = var23:map(var24)
	}, {
		TraversalBackButton = reactModule.createElement(teleportBackButton, { text = var19, textLimitWidth = var21, ref = var13 })
	}) else var16 and reactModule.createElement(view, { tag = "auto-xy shrink" }, {
		TraversalBackButton = reactModule.createElement(teleportBackButton, { text = var19, textLimitWidth = var21, ref = var13 })
	})
end)