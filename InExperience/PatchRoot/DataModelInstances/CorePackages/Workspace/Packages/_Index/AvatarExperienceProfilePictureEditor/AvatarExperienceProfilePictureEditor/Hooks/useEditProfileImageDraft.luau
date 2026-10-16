local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local FFlagEditProfileFramesEnabled = require(Parent.SharedFlags).FFlagEditProfileFramesEnabled
local ReactModule = require(Parent.React)
local _ = require(AvatarExperienceProfilePictureEditor.Hooks.useUserAvatarConfigurations)
local ConstantsModule = require(AvatarExperienceProfilePictureEditor.Constants)

return function(p1) --[[ Line: 34 | Named "useEditProfileImageDraft" ]]
	-- upvalues: ReactModule (copy), FFlagEditProfileFramesEnabled (copy), ConstantsModule (copy)
	local SavedCloseupConfig = p1.savedCloseupConfig
	local SavedFrameAssetId = p1.savedFrameAssetId
	local IsSavedConfigLoading = p1.isSavedConfigLoading
	local ShowFrames = p1.showFrames
	local InitialFrameAssetId = p1.initialFrameAssetId
	local InitialFrameSelectionRequestId = p1.initialFrameSelectionRequestId
	local IsInitialFrameSelectionLoading = p1.isInitialFrameSelectionLoading
	local IsInitialFrameAvailable = p1.isInitialFrameAvailable
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(0)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(1)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 53 ]]
		-- upvalues: IsSavedConfigLoading (copy), UseStateResult2 (copy), SavedCloseupConfig (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy), FFlagEditProfileFramesEnabled (upval), ShowFrames (copy), UseStateResult2_1 (copy), SavedFrameAssetId (copy), ConstantsModule (upval)
		if IsSavedConfigLoading then return end
		UseStateResult2(SavedCloseupConfig.emoteAssetId)
		UseStateResult2_2(SavedCloseupConfig.yRotDeg)
		UseStateResult2_3(SavedCloseupConfig.distanceScale)
		
		if FFlagEditProfileFramesEnabled and ShowFrames then
			UseStateResult2_1(SavedFrameAssetId or ConstantsModule.ProfileFrameNoneId)
			
			return
		else
			UseStateResult2_1(nil)
		end
	end, {
		SavedCloseupConfig,
		SavedFrameAssetId,
		IsSavedConfigLoading,
		ShowFrames
	})
	ReactModule.useEffect(function() --[[ Line: 76 ]]
		-- upvalues: UseRefResult (copy), IsSavedConfigLoading (copy), SavedCloseupConfig (copy), UseStateResult2 (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy)
		if UseRefResult.current or IsSavedConfigLoading then return end
		UseRefResult.current = true
		
		if SavedCloseupConfig.emoteAssetId then
			UseStateResult2(SavedCloseupConfig.emoteAssetId)
		end
		UseStateResult2_2(SavedCloseupConfig.yRotDeg)
		UseStateResult2_3(SavedCloseupConfig.distanceScale)
	end, {
		SavedCloseupConfig.emoteAssetId,
		SavedCloseupConfig.yRotDeg,
		SavedCloseupConfig.distanceScale,
		IsSavedConfigLoading
	})
	ReactModule.useEffect(function() --[[ Line: 96 ]]
		-- upvalues: InitialFrameSelectionRequestId (copy), UseRefResult2 (copy), FFlagEditProfileFramesEnabled (upval), ShowFrames (copy), UseRefResult1 (copy), IsSavedConfigLoading (copy), IsInitialFrameSelectionLoading (copy), UseStateResult2_1 (copy), InitialFrameAssetId (copy), IsInitialFrameAvailable (copy), SavedFrameAssetId (copy), ConstantsModule (upval)
		local IsNotInitialFrameSelectionRequestIdMatch: boolean = InitialFrameSelectionRequestId ~= nil and InitialFrameSelectionRequestId ~= UseRefResult2.current
		
		if FFlagEditProfileFramesEnabled and ShowFrames and (not UseRefResult1.current or IsNotInitialFrameSelectionRequestIdMatch) and (not IsSavedConfigLoading and not IsInitialFrameSelectionLoading) then
			UseRefResult1.current = true
			UseRefResult2.current = InitialFrameSelectionRequestId
			UseStateResult2_1(if InitialFrameAssetId == nil or not IsInitialFrameAvailable then SavedFrameAssetId or ConstantsModule.ProfileFrameNoneId else InitialFrameAssetId)
			
			return
		end
	end, {
		InitialFrameAssetId, InitialFrameSelectionRequestId,
		IsInitialFrameSelectionLoading, IsInitialFrameAvailable, SavedFrameAssetId,
		IsSavedConfigLoading, ShowFrames
	})
	
	return {
		selectedEmoteId = UseStateResult,
		selectedFrameId = UseStateResult1,
		yRotDeg = UseStateResult3,
		distanceScale = UseStateResult4,
		onSelectEmote = ReactModule.useCallback(function(p2) --[[ Line: 128 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(function(p3) --[[ Line: 129 ]]
				-- upvalues: p2 (copy)
				return if p3 == p2 then nil else p2
			end)
		end, {}),
		onSelectFrame = ReactModule.useCallback(function(p2) --[[ Line: 140 ]]
			-- upvalues: UseStateResult2_1 (copy), ConstantsModule (upval)
			UseStateResult2_1(function(p3) --[[ Line: 141 ]]
				-- upvalues: p2 (copy), ConstantsModule (upval)
				return if p3 == p2 then ConstantsModule.ProfileFrameNoneId else p2
			end)
		end, {}),
		onYRotDegChanged = UseStateResult2_2,
		onDistanceScaleChanged = UseStateResult2_3,
		clearSelectedEmote = ReactModule.useCallback(function() --[[ Line: 149 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(nil)
		end, {}),
		resetFromSavedConfig = UseResult
	}
end