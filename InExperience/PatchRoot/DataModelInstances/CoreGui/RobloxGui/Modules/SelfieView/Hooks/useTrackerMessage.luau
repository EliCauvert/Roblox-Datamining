local corePackagesService = game:GetService("CorePackages")
local packages = corePackagesService.Packages
local reactModule = require(packages.React)
local luauPolyfillModule = require(packages.LuauPolyfill)
local setTimeout = luauPolyfillModule.setTimeout
local clearTimeout = luauPolyfillModule.clearTimeout
local useTrackerModeModule = require(script.Parent.useTrackerMode)
local faceChatUtilsModule = require(script.Parent.Parent.Utils.FaceChatUtils)
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local trackerMode = Enum.TrackerMode

return function()
	-- upvalues: reactModule (ref), faceChatUtilsModule (ref), useTrackerModeModule (ref), useLocalization (ref), trackerMode (ref), clearTimeout (ref), setTimeout (ref)
	local var5 = reactModule.useRef(faceChatUtilsModule.getTrackerMode())
	local var6 = useTrackerModeModule()
	local var7 = useLocalization({
		controlMessageSound = "CoreScripts.TopBar.ControlMessageSound",
		controlMessageMotion = "CoreScripts.TopBar.ControlMessageMotion",
		controlMessageOn = "CoreScripts.TopBar.ControlMessageOn",
		controlMessageOff = "CoreScripts.TopBar.ControlMessageOff"
	})
	local var8, var9 = reactModule.useState({
		visible = false,
		text = var7.controlMessageMotion,
		status = var7.controlMessageOff
	})
	local var10 = reactModule.useRef(nil)
	
	local var11 = function()
		-- upvalues: var7 (ref), var6 (ref), trackerMode (copy), var5 (ref)
		local controlMessageOn, var12
		local _ = var7.controlMessageMotion
		local _ = var7.controlMessageOff
		
		if var6 == trackerMode.None then
			controlMessageOn = var7.controlMessageOff
			var12 = if var5.current == trackerMode.Audio then var7.controlMessageSound else var7.controlMessageMotion
		else
			controlMessageOn = var7.controlMessageOn
			var12 = if var6 == trackerMode.AudioVideo or var6 == trackerMode.Video then var7.controlMessageMotion else var7.controlMessageSound
		end
		var5.current = var6
		
		return { visible = true, text = var12, status = controlMessageOn }
	end
	
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), clearTimeout (copy), var9 (ref), var11 (ref), setTimeout (copy), var8 (ref)
		if var10.current then
			clearTimeout(var10.current)
		end
		var9(var11())
		var10.current = setTimeout(function()
			-- upvalues: var9 (copy), var8 (copy)
			var9({ visible = false, text = var8.text, status = var8.status })
		end, 2000)
	end, { var6 })
	
	return var8
end