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

return reactModule.memo(function(_)
	-- upvalues: useTokens (ref), reactModule (ref), teleportService (ref), constants (ref), settingsShowSignal (ref), traversalTelemetry (ref), useLocalization (ref), getGameInfoStore (ref), dataHydrationTypes (ref), signalsReactModule (ref), fixTraversalBackButtonAnimation (ref), fFlagAddTraversalBackButtonAnimation (ref), reactOtterModule (ref), userGameSettingsService (ref), view (ref), teleportBackButton (ref)
	local var1 = useTokens()
	local var2 = reactModule.useRef(nil)
	local var3, var4 = teleportService:GetThirdPartyTeleportInfo(false)
	
	if var3 <= constants.NO_UNIVERSE_ID or var4 <= constants.NO_PLACE_ID then
		return nil
	end
	local var5, var6 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: settingsShowSignal (copy), var6 (ref)
		local var7 = settingsShowSignal:connect(function(p1)
			-- upvalues: var6 (copy)
			var6(p1)
		end)
		
		return function()
			-- upvalues: var7 (ref)
			var7:Disconnect()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), traversalTelemetry (copy), var3 (ref)
		if var5 then
			traversalTelemetry.sendBackButtonActionEvent({
				integration_id = "back_button",
				event_type = "impression",
				destination_universe_id = var3
			})
		end
	end, { var5, var3 })
	local var7 = useLocalization({
		defaultBackButtonText = "CoreScripts.TopBar.Traversal.BackButtonDefault"
	})
	local var8 = signalsReactModule.useSignalState(reactModule.useCallback(function(p1)
		-- upvalues: getGameInfoStore (copy), var3 (ref), dataHydrationTypes (copy), var7 (ref)
		local andFetchGameInfo = getGameInfoStore(p1).getAndFetchGameInfo(tostring(var3))
		local var9 = andFetchGameInfo.data(p1)
		
		return if var9 and andFetchGameInfo.status(p1) == dataHydrationTypes.DataStatus.Ready then var9.name else var7.defaultBackButtonText
	end, { var3, getGameInfoStore }))
	local var9 = if fixTraversalBackButtonAnimation then reactModule.useRef(nil) else nil
	local var10 = var1.Size.Size_2500 * 2
	local _ = nil
	local _ = nil
	local var11 = nil
	local var12 = nil
	local _ = nil
	local var13 = nil
	local var14 = nil
	
	if fFlagAddTraversalBackButtonAnimation then
		local var15 = reactModule.useRef(nil)
		local var16 = reactModule.useRef(nil)
		
		if fixTraversalBackButtonAnimation then
			var11 = reactModule.useRef(nil)
		end
		local var17 = reactModule.useMemo(function()
			-- upvalues: var1 (ref)
			return {
				duration = var1.Time.Time_300,
				easingStyle = var1.Ease.StandardOut
			}
		end, { var1 })
		local var18, var19 = reactOtterModule.useAnimatedBinding(0, function(p1)
			-- upvalues: var15 (write), fixTraversalBackButtonAnimation (copy), var11 (write), var16 (write)
			var15.current = nil
			
			if fixTraversalBackButtonAnimation then
				if not var11.current and var16.current and p1 == 1 then
					var11.current = var16.current
				end
				if p1 == 0 then
					var16.current = 0
					
					return
				end
			else
				var16.current = nil
			end
		end)
		var12 = var18
		local var20 = var19
		reactModule.useEffect(function()
			-- upvalues: var5 (ref), fixTraversalBackButtonAnimation (copy), var9 (write), var8 (ref), var11 (write), var2 (ref), var20 (write), reactOtterModule (copy), var17 (ref)
			if not var5 then
				var20(reactOtterModule.ease(0, var17))
			elseif not fixTraversalBackButtonAnimation then
				var20(reactOtterModule.ease(1, var17))
			elseif var9.current == var8 then
				var20(reactOtterModule.ease(1, var17))
			else
				var11.current = nil
				var9.current = var8
				
				if var2.current then
					var20(reactOtterModule.ease(0.99, var17))
				end
			end
			if fixTraversalBackButtonAnimation and var9.current == nil then
				var9.current = var8
			end
		end, { var5, var17, var8 })
		var13 = reactModule.useCallback(function(p1)
			-- upvalues: fixTraversalBackButtonAnimation (copy), var11 (write), var5 (ref), var2 (ref), var15 (write), var16 (write), var10 (ref)
			if fixTraversalBackButtonAnimation then
				if var11.current then
					return UDim2.new(0, p1 * var11.current, 0, 0)
				end
				local var21
				local _ = nil
				
				if var5 and var2.current then
					local x = var2.current.AbsoluteSize.X
					
					if not var15.current then
						var15.current = var2.current.AbsoluteSize.X
					end
					if var16.current and x <= var16.current then
						return UDim2.new(0, if fixTraversalBackButtonAnimation then x else var16.current, 0, 0)
					elseif var15.current and var15.current ~= x then
						var16.current = x
					end
					var21 = p1 * var10
				else
					var21 = p1 * (var16.current or var10)
				end
				return UDim2.new(0, var21, 0, 0)
			elseif var5 and var2.current then
				local x = var2.current.AbsoluteSize.X
				
				if not var15.current then
					var15.current = var2.current.AbsoluteSize.X
				end
				if var16.current and x <= var16.current then
					return UDim2.new(0, var16.current, 0, 0)
				elseif var15.current and var15.current ~= x then
					var16.current = x
				end
			end
			return UDim2.new(0, p1 * var10, 0, 0)
		end, { var5 })
		var14 = reactModule.useCallback(function(p1)
			-- upvalues: var5 (ref)
			return if p1 <= 0 then var5 else true
		end, { var5 })
	end
	return if fFlagAddTraversalBackButtonAnimation and not userGameSettingsService.ReducedMotion then reactModule.createElement(view, {
		tag = "auto-y",
		ZIndex = -1,
		Visible = var12:map(var14),
		Size = var12:map(var13)
	}, {
		TraversalBackButton = reactModule.createElement(teleportBackButton, { text = var8, textLimitWidth = var10, ref = var2 })
	}) else var5 and reactModule.createElement(view, { tag = "auto-xy shrink" }, {
		TraversalBackButton = reactModule.createElement(teleportBackButton, { text = var8, textLimitWidth = var10, ref = var2 })
	})
end)