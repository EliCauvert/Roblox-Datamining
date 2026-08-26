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
	local var1 = reactModule.useRef(faceChatUtilsModule.getTrackerMode())
	local var2 = useTrackerModeModule()
	local var3 = useLocalization({
		controlMessageSound = "CoreScripts.TopBar.ControlMessageSound",
		controlMessageMotion = "CoreScripts.TopBar.ControlMessageMotion",
		controlMessageOn = "CoreScripts.TopBar.ControlMessageOn",
		controlMessageOff = "CoreScripts.TopBar.ControlMessageOff"
	})
	local var4, var5 = reactModule.useState({
		visible = false,
		text = var3.controlMessageMotion,
		status = var3.controlMessageOff
	})
	local var6 = reactModule.useRef(nil)
	
	local var7 = function()
		-- upvalues: var3 (ref), var2 (ref), trackerMode (copy), var1 (ref)
		local controlMessageOn, var8
		local _ = var3.controlMessageMotion
		local _ = var3.controlMessageOff
		
		if var2 == trackerMode.None then
			controlMessageOn = var3.controlMessageOff
			var8 = if var1.current == trackerMode.Audio then var3.controlMessageSound else var3.controlMessageMotion
		else
			controlMessageOn = var3.controlMessageOn
			var8 = if var2 == trackerMode.AudioVideo or var2 == trackerMode.Video then var3.controlMessageMotion else var3.controlMessageSound
		end
		var1.current = var2
		
		return { visible = true, text = var8, status = controlMessageOn }
	end
	
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), clearTimeout (copy), var5 (ref), var7 (ref), setTimeout (copy), var4 (ref)
		if var6.current then
			clearTimeout(var6.current)
		end
		var5(var7())
		var6.current = setTimeout(function()
			-- upvalues: var5 (copy), var4 (copy)
			var5({ visible = false, text = var4.text, status = var4.status })
		end, 2000)
	end, { var2 })
	
	return var4
end