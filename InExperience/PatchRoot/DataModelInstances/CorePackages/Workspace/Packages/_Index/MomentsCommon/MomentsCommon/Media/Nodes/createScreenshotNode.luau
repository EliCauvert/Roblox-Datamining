local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local View = require(Parent.Foundation).View
local _ = require(MomentsCommon.Media.MediaTypes)
local _ = require(MomentsCommon.Media.mediaNodeRegistry)
local PreloadFastIntsModule = require(MomentsCommon.Media.Preload.preloadFastInts)
local FFlagMomentsPreloadScreenshotImageLabelModule = require(MomentsCommon.Flags.FFlagMomentsPreloadScreenshotImageLabel)

local function _(CornerRadius) --[[ Line: 73 | Named "renderCorner" ]]
	-- upvalues: ReactModule (copy)
	return if CornerRadius == nil then nil else ReactModule.createElement("UICorner", { CornerRadius = CornerRadius })
end

return {
	kind = "screenshot",
	create = function(p1, p2) --[[ Line: 81 ]]
		-- upvalues: PreloadFastIntsModule (copy), SignalsModule (copy), FFlagMomentsPreloadScreenshotImageLabelModule (copy), ReactModule (copy), View (copy)
		local Image = p1.image
		assert(Image ~= nil or p1.imageContent ~= nil, "createScreenshotNode: screenshot content is required")
		local Poster = p1.poster
		local DurationSeconds = p1.durationSeconds or PreloadFastIntsModule.getScreenshotDurationSeconds()
		local ImageContent = p1.imageContent or Content.fromUri(Image)
		local PosterContent = p1.posterContent or (if Poster == nil then nil else Content.fromUri(Poster))
		local Signal, Signal2 = SignalsModule.createSignal(0)
		local Signal1, Signal2_1 = SignalsModule.createSignal(false)
		local Signal3, Signal2_2 = SignalsModule.createSignal(nil)
		local Flag = false
		local Flag1 = false
		local HeartbeatConnection = p2.runService.Heartbeat:Connect(function(DeltaTime) --[[ Line: 98 ]]
			-- upvalues: Flag1 (ref), Flag (ref), Signal (copy), DurationSeconds (copy), Signal2 (copy)
			if Flag1 or not Flag then return end
			local NewSignalResult = Signal(false) + DeltaTime
			
			if DurationSeconds <= NewSignalResult then
				NewSignalResult %= DurationSeconds
			end
			Signal2(NewSignalResult)
		end)
		
		local function refreshLoaded() --[[ Line: 113 ]]
			-- upvalues: p2 (copy), Image (copy), Signal2_1 (copy), Signal2_2 (copy)
			local AssetFetchStatus = p2.contentProvider:GetAssetFetchStatus(Image)
			Signal2_1(AssetFetchStatus == Enum.AssetFetchStatus.Success)
			Signal2_2(if AssetFetchStatus == Enum.AssetFetchStatus.Failure then `screenshot load failed: {AssetFetchStatus.Name}` else nil)
		end
		
		local Connection = nil
		
		if Image == nil then
			Signal2_1(true)
		else
			Connection = p2.contentProvider:GetAssetFetchStatusChangedSignal(Image):Connect(refreshLoaded)
			local AssetFetchStatus = p2.contentProvider:GetAssetFetchStatus(Image)
			Signal2_1(AssetFetchStatus == Enum.AssetFetchStatus.Success)
			Signal2_2(if AssetFetchStatus == Enum.AssetFetchStatus.Failure then `screenshot load failed: {AssetFetchStatus.Name}` else nil)
		end
		return {
			kind = "screenshot",
			usesDecoder = false,
			zIndex = 0,
			id = p1.id,
			assets = function() --[[ Line: 129 ]]
				-- upvalues: PosterContent (copy), ImageContent (copy)
				return if PosterContent == nil then { ImageContent } else { ImageContent, PosterContent }
			end,
			download = function() --[[ Line: 136 ]]
				-- upvalues: Flag1 (ref), FFlagMomentsPreloadScreenshotImageLabelModule (upval), ImageContent (copy), PosterContent (copy), p2 (copy)
				if Flag1 then return end
				if FFlagMomentsPreloadScreenshotImageLabelModule then
					local List = {}
					local ImageLabel = nil
					
					if ImageContent.Uri ~= nil then
						local Image = Instance.new("ImageLabel")
						Image.Image = ImageContent.Uri
						ImageLabel = Image
						table.insert(List, Image)
					end
					if PosterContent ~= nil and PosterContent.Uri ~= nil then
						table.insert(List, PosterContent.Uri)
					end
					if #List > 0 then
						p2.contentProvider:PreloadAsync(List)
					end
					if ImageLabel ~= nil then
						ImageLabel:Destroy()
					end
					return
				else
					local List1 = {}
					local v1 = nil
					local list = nil
					local v2 = nil
					
					if PosterContent == nil then
						list = { ImageContent }
						v1 = nil
						v2 = nil
					else
						list = { ImageContent, PosterContent }
						v1 = nil
						v2 = nil
					end
					for _, value in list, v1, v2 do
						if value.Uri ~= nil then
							table.insert(List1, value.Uri)
						end
					end
					if #List1 > 0 then
						p2.contentProvider:PreloadAsync(List1)
					end
				end
			end,
			render = function(p3) --[[ Line: 195 ]]
				-- upvalues: ReactModule (upval), View (upval), PosterContent (copy), ImageContent (copy)
				local CreateElementFunction = ReactModule.createElement
				local config = { tag = "size-full", ZIndex = 0 }
				local t = {}
				local ImageLabel = nil
				
				if PosterContent == nil then
					ImageLabel = nil
				else
					local CornerRadius = p3.cornerRadius
					ImageLabel = ReactModule.createElement("ImageLabel", {
						BackgroundTransparency = 1,
						ZIndex = 1,
						Size = UDim2.fromScale(1, 1),
						ScaleType = p3.scaleType or Enum.ScaleType.Crop,
						ImageContent = PosterContent
					}, {
						Corner = if CornerRadius == nil then nil else ReactModule.createElement("UICorner", { CornerRadius = CornerRadius })
					})
				end
				t.Poster = ImageLabel
				local CornerRadius = p3.cornerRadius
				t.Base = ReactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Size = UDim2.fromScale(1, 1),
					ScaleType = p3.scaleType or Enum.ScaleType.Crop,
					ImageContent = ImageContent,
					ref = p3.setSurface
				}, {
					Corner = if CornerRadius == nil then nil else ReactModule.createElement("UICorner", { CornerRadius = CornerRadius })
				})
				
				return CreateElementFunction(View, config, t)
			end,
			play = function() --[[ Line: 178 ]]
				-- upvalues: Flag (ref)
				Flag = true
			end,
			pause = function() --[[ Line: 182 ]]
				-- upvalues: Flag (ref)
				Flag = false
			end,
			seek = function(Value: number) --[[ Line: 187 ]]
				-- upvalues: Signal2 (copy), DurationSeconds (copy)
				Signal2((math.clamp(Value, 0, DurationSeconds)))
			end,
			dispose = function() --[[ Line: 226 ]]
				-- upvalues: Flag1 (ref), Flag (ref), HeartbeatConnection (copy), Connection (ref)
				if Flag1 then return end
				Flag1 = true
				Flag = false
				HeartbeatConnection:Disconnect()
				
				if Connection ~= nil then
					Connection:Disconnect()
				end
			end,
			getPosition = Signal,
			getDuration = function() --[[ Line: 191 ]]
				-- upvalues: DurationSeconds (copy)
				return DurationSeconds
			end,
			getIsImageLoaded = Signal1,
			getFailureReason = Signal3
		}
	end
}