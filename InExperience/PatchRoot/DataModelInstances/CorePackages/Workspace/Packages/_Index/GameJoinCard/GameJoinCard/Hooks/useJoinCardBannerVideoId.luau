local Parent = script:FindFirstAncestor("GameJoinCard").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetGameMediaStoreFunction = require(Parent.DataHydration).Game.getGameMediaStore
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local GameMediaImageType = DiscoveryTypesModule.GameMediaImageType
local PlayabilityStatusEnum = DiscoveryTypesModule.PlayabilityStatusEnum
local VideoUtilsModule = require(Parent.VideoUtils)
local IsVideoEligibleForPlayabilityFunction = VideoUtilsModule.isVideoEligibleForPlayability
local UseCanDevicePlayVideoPreviewFunction = VideoUtilsModule.useCanDevicePlayVideoPreview
local EdpVideoBlockingConfig = VideoUtilsModule.EdpVideoBlockingConfig

local function _(p1): boolean
	if p1 == nil then
		return false
	else
		local Text = tostring(p1)
		
		return Text ~= "" and Text ~= "0"
	end
end

return function(p1, PlayabilityStatus, p2)
	-- upvalues: GetGameMediaStoreFunction (copy), SignalsReactModule (copy), UseCanDevicePlayVideoPreviewFunction (copy), EdpVideoBlockingConfig (copy), ReactModule (copy), IsVideoEligibleForPlayabilityFunction (copy), PlayabilityStatusEnum (copy), GameMediaImageType (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetGameMediaStoreFunction(false).getAndFetchGameMedia(p1).data)
	local GameJoinCard = UseCanDevicePlayVideoPreviewFunction(EdpVideoBlockingConfig, p1, "GameJoinCard")
	
	return ReactModule.useMemo(function()
		-- upvalues: p2 (copy), p1 (copy), PlayabilityStatus (copy), UseSignalStateResult (copy), IsVideoEligibleForPlayabilityFunction (upval), PlayabilityStatusEnum (upval), GameMediaImageType (upval), GameJoinCard (copy)
		if not p2 or p1 == "" or PlayabilityStatus == nil or UseSignalStateResult == nil then
			return nil
		end
		if not IsVideoEligibleForPlayabilityFunction(true, {
			isPlayable = PlayabilityStatus == PlayabilityStatusEnum.Playable,
			playabilityStatus = PlayabilityStatus
		}) then
			return nil
		end
		local v1: string? = nil
		
		for _, value in UseSignalStateResult do
			if value.assetTypeId ~= GameMediaImageType.YouTubeVideo then
				local VideoId = value.videoId
				local IsNot_0 = nil
				
				if VideoId == nil then
					IsNot_0 = false
				else
					local Text = tostring(VideoId)
					IsNot_0 = Text ~= "" and Text ~= "0"
				end
				if IsNot_0 then
					v1 = tostring(value.videoId)
					break
				end
			end
		end
		return if v1 == nil or not GameJoinCard() then nil else v1
	end, {
		p2,
		p1,
		PlayabilityStatus,
		UseSignalStateResult,
		GameJoinCard
	})
end