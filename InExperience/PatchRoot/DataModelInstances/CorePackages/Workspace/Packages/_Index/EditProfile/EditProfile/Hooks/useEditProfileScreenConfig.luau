local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local EnumsModule = require(EditProfile.Common.Enums)
local TextKeysModule = require(EditProfile.Common.TextKeys)
local UseRealNamesInDisplayNamesEnabledModule = require(EditProfile.Hooks.useRealNamesInDisplayNamesEnabled)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local PromiseModule = require(Parent.Promise)
local ProfileRefreshSignal = require(Parent.ProfilePlatformCommon).Signals.ProfileRefreshSignal
local config = {
	[EnumsModule.Screens.EditDisplayName] = {
		component = require(EditProfile.Components.EditDisplayName),
		titleKey = TextKeysModule.EditDisplayName
	},
	[EnumsModule.Screens.EditBio] = {
		component = require(EditProfile.Components.EditBio),
		titleKey = TextKeysModule.About
	}
}

return function(EditDisplayName) --[[ Line: 38 ]]
	-- upvalues: config (copy), UseNavigationFunction (copy), UseRealNamesInDisplayNamesEnabledModule (copy), ReactModule (copy), ProfileRefreshSignal (copy), PromiseModule (copy), EnumsModule (copy), TextKeysModule (copy)
	local Entry = config[EditDisplayName]
	local UseNavigationResult = UseNavigationFunction()
	local UseRealNamesInDisplayNamesEnabledModuleResult = UseRealNamesInDisplayNamesEnabledModule()
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 51 ]]
		-- upvalues: ProfileRefreshSignal (upval), UseNavigationResult (copy)
		ProfileRefreshSignal.notifyProfileRefresh()
		UseNavigationResult.goBack()
	end, { UseNavigationResult })
	
	return {
		component = Entry.component,
		titleKey = if EditDisplayName == EnumsModule.Screens.EditDisplayName then if UseRealNamesInDisplayNamesEnabledModuleResult then TextKeysModule.EditAgedUpDisplayName else TextKeysModule.EditDisplayName else Entry.titleKey,
		saveKey = TextKeysModule.SaveButtonText,
		onClose = UseResult,
		onSave = ReactModule.useCallback(function() --[[ Line: 60 ]]
			-- upvalues: UseRefResult (copy), UseStateResult1 (copy), UseStateResult2 (copy), PromiseModule (upval), UseResult (copy)
			if UseRefResult.current and not UseStateResult1 then
				UseStateResult2(true)
				PromiseModule.resolve(UseRefResult.current()):andThen(function() --[[ Line: 64 ]]
					-- upvalues: UseStateResult2 (upval), UseResult (upval)
					UseStateResult2(false)
					UseResult()
				end):catch(function(_) --[[ Line: 68 ]]
					-- upvalues: UseStateResult2 (upval)
					UseStateResult2(false)
				end)
			end
		end, { UseStateResult1 }),
		isLoading = UseStateResult,
		registerSaveHandler = ReactModule.useCallback(function(Current) --[[ Line: 56 ]]
			-- upvalues: UseRefResult (copy)
			UseRefResult.current = Current
		end, {}),
		updateErrorState = ReactModule.useCallback(function(p1) --[[ Line: 47 ]]
			-- upvalues: UseStateResult2_1 (copy)
			UseStateResult2_1(p1)
		end, {}),
		hasError = UseStateResult1
	}
end