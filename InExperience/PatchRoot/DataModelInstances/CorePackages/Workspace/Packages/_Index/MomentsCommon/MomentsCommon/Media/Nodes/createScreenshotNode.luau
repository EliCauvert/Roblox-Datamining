local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local view = foundationModule.View
local _ = require(momentsCommon.Media.MediaTypes)
local _ = require(momentsCommon.Media.mediaNodeRegistry)
local preloadFastIntsModule = require(momentsCommon.Media.Preload.preloadFastInts)

return {
	kind = "screenshot",
	create = function(p1, p2)
		-- upvalues: preloadFastIntsModule (ref), signalsModule (ref), reactModule (ref), view (ref)
		local image = p1.image
		assert(image ~= nil, "createScreenshotNode: spec.image (the screenshot content URI) is required")
		local poster = p1.poster
		local durationSeconds = p1.durationSeconds or preloadFastIntsModule.getScreenshotDurationSeconds()
		local content = Content.fromUri(image)
		local var1 = if poster ~= nil then nil else Content.fromUri(poster)
		local var2, var3 = signalsModule.createSignal(0)
		local var4, var5 = signalsModule.createSignal(false)
		local var6, var7 = signalsModule.createSignal(nil)
		local var8 = false
		local var9 = false
		local heartbeatConnection = p2.runService.Heartbeat:Connect(function(p3)
			-- upvalues: var9 (write), var8 (write), var2 (ref), durationSeconds (ref), var3 (ref)
			if var9 or not var8 then return end
			local var10 = var2(false) + p3
			
			if durationSeconds <= var10 then
				var10 %= durationSeconds
			end
			var3(var10)
		end)
		local var10 = p2.contentProvider:GetAssetFetchStatusChangedSignal(image):Connect(function()
			-- upvalues: p2 (ref), image (ref), var5 (ref), var7 (ref)
			local var11 = p2.contentProvider:GetAssetFetchStatus(image)
			var5(var11 == Enum.AssetFetchStatus.Success)
			var7(if var11 == Enum.AssetFetchStatus.Failure then `screenshot load failed: {var11.Name}` else nil)
		end)
		local var11 = p2.contentProvider:GetAssetFetchStatus(image)
		var5(var11 == Enum.AssetFetchStatus.Success)
		var7(if var11 == Enum.AssetFetchStatus.Failure then `screenshot load failed: {var11.Name}` else nil)
		
		return {
			kind = "screenshot",
			usesDecoder = false,
			zIndex = 0,
			id = p1.id,
			assets = function()
				-- upvalues: var1 (ref), content (ref)
				return if var1 == nil then { content } else { content, var1 }
			end,
			download = function()
				-- upvalues: var9 (write), var1 (ref), content (ref), p2 (ref)
				if var9 then return end
				local list, var12, var13
				local t = {}
				
				if var1 == nil then
					list = { content }
					var12 = nil
					var13 = nil
				else
					list = { content, var1 }
					var12 = nil
					var13 = nil
				end
				for i, v in list, var12, var13 do
					table.insert(t, v.Uri)
				end
				p2.contentProvider:PreloadAsync(t)
			end,
			render = function(p3)
				-- upvalues: reactModule (copy), view (copy), var1 (ref), content (ref)
				return reactModule.createElement(view, { tag = "size-full", ZIndex = 0 }, {
					Poster = if var1 ~= nil then nil else reactModule.createElement("ImageLabel", {
						BackgroundTransparency = 1,
						ZIndex = 1,
						Size = UDim2.fromScale(1, 1),
						ScaleType = p3.scaleType or Enum.ScaleType.Crop,
						ImageContent = var1
					}),
					Base = reactModule.createElement("ImageLabel", {
						BackgroundTransparency = 1,
						ZIndex = 2,
						Size = UDim2.fromScale(1, 1),
						ScaleType = p3.scaleType or Enum.ScaleType.Crop,
						ImageContent = content,
						ref = p3.setSurface
					})
				})
			end,
			play = function()
				-- upvalues: var8 (write)
				var8 = true
			end,
			pause = function()
				-- upvalues: var8 (write)
				var8 = false
			end,
			seek = function(p3)
				-- upvalues: var3 (ref), durationSeconds (ref)
				var3(math.clamp(p3, 0, durationSeconds))
			end,
			dispose = function()
				-- upvalues: var9 (write), var8 (write), heartbeatConnection (ref), var10 (ref)
				if var9 then
					return
				end
				var9 = true
				var8 = false
				heartbeatConnection:Disconnect()
				var10:Disconnect()
			end,
			getPosition = var2,
			getDuration = function()
				-- upvalues: durationSeconds (ref)
				return durationSeconds
			end,
			getIsImageLoaded = var4,
			getFailureReason = var6
		}
	end
}