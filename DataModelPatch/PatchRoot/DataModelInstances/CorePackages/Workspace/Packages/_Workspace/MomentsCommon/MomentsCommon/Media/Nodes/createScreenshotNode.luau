local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local View = require(Parent.Foundation).View
local _ = require(MomentsCommon.Media.MediaTypes)
local _ = require(MomentsCommon.Media.mediaNodeRegistry)
local PreloadConstantsModule = require(MomentsCommon.Media.Preload.preloadConstants)

return {
	kind = "screenshot",
	create = function(p1, p2)
		-- upvalues: PreloadConstantsModule (copy), SignalsModule (copy), ReactModule (copy), View (copy)
		local Image = p1.image
		assert(Image ~= nil, "createScreenshotNode: spec.image (the screenshot content URI) is required")
		local Poster = p1.poster
		local DurationSeconds = p1.durationSeconds or PreloadConstantsModule.screenshotDurationSeconds
		local Content1 = Content.fromUri(Image)
		local Content2 = if Poster == nil then nil else Content.fromUri(Poster)
		local Signal, Signal2 = SignalsModule.createSignal(0)
		local Signal1, Signal2_1 = SignalsModule.createSignal(false)
		local Signal3, Signal2_2 = SignalsModule.createSignal(nil)
		local Flag = false
		local Flag1 = false
		local HeartbeatConnection = p2.runService.Heartbeat:Connect(function(DeltaTime)
			-- upvalues: Flag1 (ref), Flag (ref), Signal (copy), DurationSeconds (copy), Signal2 (copy)
			if Flag1 or not Flag then return end
			local NewSignalResult = Signal(false) + DeltaTime
			
			if DurationSeconds <= NewSignalResult then
				NewSignalResult %= DurationSeconds
			end
			Signal2(NewSignalResult)
		end)
		local Connection = p2.contentProvider:GetAssetFetchStatusChangedSignal(Image):Connect(function()
			-- upvalues: p2 (copy), Image (copy), Signal2_1 (copy), Signal2_2 (copy)
			local AssetFetchStatus = p2.contentProvider:GetAssetFetchStatus(Image)
			Signal2_1(AssetFetchStatus == Enum.AssetFetchStatus.Success)
			Signal2_2(if AssetFetchStatus == Enum.AssetFetchStatus.Failure then `screenshot load failed: {AssetFetchStatus.Name}` else nil)
		end)
		local AssetFetchStatus = p2.contentProvider:GetAssetFetchStatus(Image)
		Signal2_1(AssetFetchStatus == Enum.AssetFetchStatus.Success)
		Signal2_2(if AssetFetchStatus == Enum.AssetFetchStatus.Failure then `screenshot load failed: {AssetFetchStatus.Name}` else nil)
		
		return {
			kind = "screenshot",
			usesDecoder = false,
			zIndex = 0,
			id = p1.id,
			assets = function()
				-- upvalues: Content2 (copy), Content1 (copy)
				return if Content2 == nil then { Content1 } else { Content1, Content2 }
			end,
			download = function()
				-- upvalues: Flag1 (ref), Content2 (copy), Content1 (copy), p2 (copy)
				if Flag1 then return end
				local List = {}
				local list = nil
				local v1 = nil
				local v2 = nil
				
				if Content2 == nil then
					list = { Content1 }
					v1 = nil
					v2 = nil
				else
					list = { Content1, Content2 }
					v1 = nil
					v2 = nil
				end
				for _, value in list, v1, v2 do
					table.insert(List, value.Uri)
				end
				p2.contentProvider:PreloadAsync(List)
			end,
			render = function(p3)
				-- upvalues: ReactModule (upval), View (upval), Content2 (copy), Content1 (copy)
				return ReactModule.createElement(View, { tag = "size-full", ZIndex = 0 }, {
					Poster = if Content2 == nil then nil else ReactModule.createElement("ImageLabel", {
						BackgroundTransparency = 1,
						ZIndex = 1,
						Size = UDim2.fromScale(1, 1),
						ScaleType = p3.scaleType or Enum.ScaleType.Crop,
						ImageContent = Content2
					}),
					Base = ReactModule.createElement("ImageLabel", {
						BackgroundTransparency = 1,
						ZIndex = 2,
						Size = UDim2.fromScale(1, 1),
						ScaleType = p3.scaleType or Enum.ScaleType.Crop,
						ImageContent = Content1,
						ref = p3.setSurface
					})
				})
			end,
			play = function()
				-- upvalues: Flag (ref)
				Flag = true
			end,
			pause = function()
				-- upvalues: Flag (ref)
				Flag = false
			end,
			seek = function(Value: number)
				-- upvalues: Signal2 (copy), DurationSeconds (copy)
				Signal2((math.clamp(Value, 0, DurationSeconds)))
			end,
			dispose = function()
				-- upvalues: Flag1 (ref), Flag (ref), HeartbeatConnection (copy), Connection (copy)
				if not Flag1 then
					Flag1 = true
					Flag = false
					HeartbeatConnection:Disconnect()
					Connection:Disconnect()
					
					return
				end
			end,
			getPosition = Signal,
			getDuration = function()
				-- upvalues: DurationSeconds (copy)
				return DurationSeconds
			end,
			getIsImageLoaded = Signal1,
			getFailureReason = Signal3
		}
	end
}