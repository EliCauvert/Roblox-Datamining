local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local enumsModule = require(editProfile.Common.Enums)
local editDisplayNameModule = require(editProfile.Components.EditDisplayName)
local editBioModule = require(editProfile.Components.EditBio)
local textKeysModule = require(editProfile.Common.TextKeys)
local useRealNamesInDisplayNamesEnabledModule = require(editProfile.Hooks.useRealNamesInDisplayNamesEnabled)
local useNavigation = require(parent.Navigation).useNavigation
local promiseModule = require(parent.Promise)
local profileRefreshSignal = require(parent.ProfilePlatformCommon).Signals.ProfileRefreshSignal
local t = {
	[enumsModule.Screens.EditDisplayName] = {
		component = editDisplayNameModule,
		titleKey = textKeysModule.EditDisplayName
	},
	[enumsModule.Screens.EditBio] = {
		component = editBioModule,
		titleKey = textKeysModule.About
	}
}

return function(p1)
	-- upvalues: t (ref), useNavigation (ref), useRealNamesInDisplayNamesEnabledModule (ref), reactModule (ref), profileRefreshSignal (ref), promiseModule (ref), enumsModule (ref), textKeysModule (ref)
	local var1 = t[p1]
	local var2 = useNavigation()
	local var3 = useRealNamesInDisplayNamesEnabledModule()
	local var4 = reactModule.useRef(nil)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(false)
	local var9 = reactModule.useCallback(function()
		-- upvalues: profileRefreshSignal (copy), var2 (ref)
		profileRefreshSignal.notifyProfileRefresh()
		var2.goBack()
	end, { var2 })
	
	return {
		component = var1.component,
		titleKey = if p1 == enumsModule.Screens.EditDisplayName then if var3 then textKeysModule.EditAgedUpDisplayName else textKeysModule.EditDisplayName else var1.titleKey,
		saveKey = textKeysModule.SaveButtonText,
		onClose = var9,
		onSave = reactModule.useCallback(function()
			-- upvalues: var4 (ref), var7 (ref), var6 (ref), promiseModule (copy), var9 (ref)
			if var4.current and not var7 then
				var6(true)
				promiseModule.resolve(var4.current()):andThen(function()
					-- upvalues: var6 (copy), var9 (copy)
					var6(false)
					var9()
				end):catch(function(_)
					-- upvalues: var6 (copy)
					var6(false)
				end)
			end
		end, { var7 }),
		isLoading = var5,
		registerSaveHandler = reactModule.useCallback(function(p2)
			-- upvalues: var4 (ref)
			var4.current = p2
		end, {}),
		updateErrorState = reactModule.useCallback(function(p2)
			-- upvalues: var8 (ref)
			var8(p2)
		end, {}),
		hasError = var7
	}
end