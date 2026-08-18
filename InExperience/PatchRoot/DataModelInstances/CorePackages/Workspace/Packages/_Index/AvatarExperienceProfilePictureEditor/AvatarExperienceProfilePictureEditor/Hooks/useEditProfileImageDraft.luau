local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local fFlagEditProfileFramesEnabled2 = require(parent.SharedFlags).FFlagEditProfileFramesEnabled2
local reactModule = require(parent.React)
local _ = require(avatarExperienceProfilePictureEditor.Hooks.useUserAvatarConfigurations)
local constantsModule = require(avatarExperienceProfilePictureEditor.Constants)

return {
	useEditProfileImageDraft = function(p0) --[[ line: 30 ]]
		-- upvalues: reactModule (ref), fFlagEditProfileFramesEnabled2 (ref), constantsModule (ref)
		local savedCloseupConfig = p0.savedCloseupConfig
		local savedFrameAssetId = p0.savedFrameAssetId
		local isSavedConfigLoading = p0.isSavedConfigLoading
		local showFrames = p0.showFrames
		local var3, var4 = reactModule.useState(nil)
		local var5, var6 = reactModule.useState(nil)
		local var7, var8 = reactModule.useState(0)
		local var9, var10 = reactModule.useState(1)
		local var11 = reactModule.useRef(false)
		local var12 = reactModule.useRef(false)
		local var13 = reactModule.useCallback(function() --[[ line: 44 ]]
			-- upvalues: isSavedConfigLoading (ref), var4 (ref), savedCloseupConfig (ref), var8 (ref), var10 (ref), fFlagEditProfileFramesEnabled2 (copy), showFrames (ref), var6 (ref), savedFrameAssetId (ref), constantsModule (copy)
			if isSavedConfigLoading then return end
			var4(savedCloseupConfig.emoteAssetId)
			var8(savedCloseupConfig.yRotDeg)
			var10(savedCloseupConfig.distanceScale)
			
			if fFlagEditProfileFramesEnabled2 and showFrames then
				var6(savedFrameAssetId or constantsModule.ProfileFrameNoneId)
				
				return
			end
			var6(nil)
		end, {
			savedCloseupConfig,
			savedFrameAssetId,
			isSavedConfigLoading,
			showFrames
		})
		reactModule.useEffect(function() --[[ line: 67 ]]
			-- upvalues: var11 (ref), isSavedConfigLoading (ref), savedCloseupConfig (ref), var4 (ref), var8 (ref), var10 (ref)
			if var11.current or isSavedConfigLoading then return end
			var11.current = true
			
			if savedCloseupConfig.emoteAssetId then
				var4(savedCloseupConfig.emoteAssetId)
			end
			var8(savedCloseupConfig.yRotDeg)
			var10(savedCloseupConfig.distanceScale)
		end, {
			savedCloseupConfig.emoteAssetId,
			savedCloseupConfig.yRotDeg,
			savedCloseupConfig.distanceScale,
			isSavedConfigLoading
		})
		reactModule.useEffect(function() --[[ line: 86 ]]
			-- upvalues: fFlagEditProfileFramesEnabled2 (copy), showFrames (ref), var12 (ref), isSavedConfigLoading (ref), var6 (ref), savedFrameAssetId (ref), constantsModule (copy)
			if fFlagEditProfileFramesEnabled2 and showFrames and (not var12.current and not isSavedConfigLoading) then
				var12.current = true
				var6(savedFrameAssetId or constantsModule.ProfileFrameNoneId)
				
				return
			end
		end, { savedFrameAssetId, isSavedConfigLoading, showFrames })
		
		return {
			selectedEmoteId = var3,
			selectedFrameId = var5,
			yRotDeg = var7,
			distanceScale = var9,
			onSelectEmote = reactModule.useCallback(function(p1) --[[ line: 100 ]]
				-- upvalues: var4 (ref)
				var4(function(p2) --[[ line: 101 ]]
					-- upvalues: p1 (ref)
					return if p2 == p1 then nil else p1
				end)
			end, {}),
			onSelectFrame = reactModule.useCallback(function(p3) --[[ line: 112 ]]
				-- upvalues: var6 (ref), constantsModule (copy)
				var6(function(p4) --[[ line: 113 ]]
					-- upvalues: p3 (ref), constantsModule (copy)
					return if p4 == p3 then constantsModule.ProfileFrameNoneId else p3
				end)
			end, {}),
			onYRotDegChanged = reactModule.useCallback(function(p5) --[[ line: 121 ]]
				-- upvalues: var8 (ref)
				var8(p5)
			end, {}),
			onDistanceScaleChanged = reactModule.useCallback(function(p6) --[[ line: 125 ]]
				-- upvalues: var10 (ref)
				var10(p6)
			end, {}),
			clearSelectedEmote = reactModule.useCallback(function() --[[ line: 129 ]]
				-- upvalues: var4 (ref)
				var4(nil)
			end, {}),
			resetFromSavedConfig = var13
		}
	end
}