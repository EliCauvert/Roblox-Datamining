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

return function(p0) --[[ line: 38 ]]
	-- upvalues: t (ref), useNavigation (ref), useRealNamesInDisplayNamesEnabledModule (ref), reactModule (ref), profileRefreshSignal (ref), promiseModule (ref), enumsModule (ref), textKeysModule (ref)
	local var9 = t[p0]
	local var10 = useNavigation()
	local var11 = useRealNamesInDisplayNamesEnabledModule()
	local var12 = reactModule.useRef(nil)
	local var13, var14 = reactModule.useState(false)
	local var15, var16 = reactModule.useState(false)
	local var17 = reactModule.useCallback(function() --[[ line: 51 ]]
		-- upvalues: profileRefreshSignal (copy), var10 (ref)
		profileRefreshSignal.notifyProfileRefresh()
		var10.goBack()
	end, { var10 })
	
	return {
		component = var9.component,
		titleKey = if p0 == enumsModule.Screens.EditDisplayName then if var11 then textKeysModule.EditAgedUpDisplayName else textKeysModule.EditDisplayName else var9.titleKey,
		saveKey = textKeysModule.SaveButtonText,
		onClose = var17,
		onSave = reactModule.useCallback(function() --[[ line: 60 ]]
			-- upvalues: var12 (ref), var15 (ref), var14 (ref), promiseModule (copy), var17 (ref)
			if var12.current and not var15 then
				var14(true)
				promiseModule.resolve(var12.current()):andThen(function() --[[ line: 64 ]]
					-- upvalues: var14 (copy), var17 (copy)
					var14(false)
					var17()
				end):catch(function(_) --[[ line: 68 ]]
					-- upvalues: var14 (copy)
					var14(false)
				end)
			end
		end, { var15 }),
		isLoading = var13,
		registerSaveHandler = reactModule.useCallback(function(p1) --[[ line: 56 ]]
			-- upvalues: var12 (ref)
			var12.current = p1
		end, {}),
		updateErrorState = reactModule.useCallback(function(p2) --[[ line: 47 ]]
			-- upvalues: var16 (ref)
			var16(p2)
		end, {}),
		hasError = var15
	}
end