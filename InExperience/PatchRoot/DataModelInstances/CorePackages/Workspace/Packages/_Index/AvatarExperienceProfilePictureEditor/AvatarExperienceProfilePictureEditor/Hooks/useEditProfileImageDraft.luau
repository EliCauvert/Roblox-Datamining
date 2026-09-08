local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local fFlagEditProfileFramesEnabled = require(parent.SharedFlags).FFlagEditProfileFramesEnabled
local reactModule = require(parent.React)
local _ = require(avatarExperienceProfilePictureEditor.Hooks.useUserAvatarConfigurations)
local constantsModule = require(avatarExperienceProfilePictureEditor.Constants)

return function(p1)
	-- upvalues: reactModule (ref), fFlagEditProfileFramesEnabled (ref), constantsModule (ref)
	local savedCloseupConfig = p1.savedCloseupConfig
	local savedFrameAssetId = p1.savedFrameAssetId
	local isSavedConfigLoading = p1.isSavedConfigLoading
	local showFrames = p1.showFrames
	local initialFrameAssetId = p1.initialFrameAssetId
	local initialFrameSelectionRequestId = p1.initialFrameSelectionRequestId
	local isInitialFrameSelectionLoading = p1.isInitialFrameSelectionLoading
	local isInitialFrameAvailable = p1.isInitialFrameAvailable
	local var1, var2 = reactModule.useState(nil)
	local var3, var4 = reactModule.useState(nil)
	local var5, var6 = reactModule.useState(0)
	local var7, var8 = reactModule.useState(1)
	local var9 = reactModule.useRef(false)
	local var10 = reactModule.useRef(false)
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useCallback(function()
		-- upvalues: isSavedConfigLoading (ref), var2 (ref), savedCloseupConfig (ref), var6 (ref), var8 (ref), fFlagEditProfileFramesEnabled (copy), showFrames (ref), var4 (ref), savedFrameAssetId (ref), constantsModule (copy)
		if isSavedConfigLoading then return end
		var2(savedCloseupConfig.emoteAssetId)
		var6(savedCloseupConfig.yRotDeg)
		var8(savedCloseupConfig.distanceScale)
		
		if fFlagEditProfileFramesEnabled and showFrames then
			var4(savedFrameAssetId or constantsModule.ProfileFrameNoneId)
			
			return
		end
		var4(nil)
	end, {
		savedCloseupConfig,
		savedFrameAssetId,
		isSavedConfigLoading,
		showFrames
	})
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), isSavedConfigLoading (ref), savedCloseupConfig (ref), var2 (ref), var6 (ref), var8 (ref)
		if var9.current or isSavedConfigLoading then return end
		var9.current = true
		
		if savedCloseupConfig.emoteAssetId then
			var2(savedCloseupConfig.emoteAssetId)
		end
		var6(savedCloseupConfig.yRotDeg)
		var8(savedCloseupConfig.distanceScale)
	end, {
		savedCloseupConfig.emoteAssetId,
		savedCloseupConfig.yRotDeg,
		savedCloseupConfig.distanceScale,
		isSavedConfigLoading
	})
	reactModule.useEffect(function()
		-- upvalues: initialFrameSelectionRequestId (ref), var11 (ref), fFlagEditProfileFramesEnabled (copy), showFrames (ref), var10 (ref), isSavedConfigLoading (ref), isInitialFrameSelectionLoading (ref), var4 (ref), initialFrameAssetId (ref), isInitialFrameAvailable (ref), savedFrameAssetId (ref), constantsModule (copy)
		if not fFlagEditProfileFramesEnabled or not showFrames or var10.current and not (initialFrameSelectionRequestId ~= nil and initialFrameSelectionRequestId ~= var11.current) or (isSavedConfigLoading or isInitialFrameSelectionLoading) then return end
		var10.current = true
		var11.current = initialFrameSelectionRequestId
		var4(if initialFrameAssetId == nil or not isInitialFrameAvailable then savedFrameAssetId or constantsModule.ProfileFrameNoneId else initialFrameAssetId)
	end, {
		initialFrameAssetId, initialFrameSelectionRequestId,
		isInitialFrameSelectionLoading, isInitialFrameAvailable, savedFrameAssetId,
		isSavedConfigLoading, showFrames
	})
	
	return {
		selectedEmoteId = var1,
		selectedFrameId = var3,
		yRotDeg = var5,
		distanceScale = var7,
		onSelectEmote = reactModule.useCallback(function(p2)
			-- upvalues: var2 (ref)
			var2(function(p3)
				-- upvalues: p2 (ref)
				return if p3 == p2 then nil else p2
			end)
		end, {}),
		onSelectFrame = reactModule.useCallback(function(p2)
			-- upvalues: var4 (ref), constantsModule (copy)
			var4(function(p3)
				-- upvalues: p2 (ref), constantsModule (copy)
				return if p3 == p2 then constantsModule.ProfileFrameNoneId else p2
			end)
		end, {}),
		onYRotDegChanged = var6,
		onDistanceScaleChanged = var8,
		clearSelectedEmote = reactModule.useCallback(function()
			-- upvalues: var2 (ref)
			var2(nil)
		end, {}),
		resetFromSavedConfig = var12
	}
end