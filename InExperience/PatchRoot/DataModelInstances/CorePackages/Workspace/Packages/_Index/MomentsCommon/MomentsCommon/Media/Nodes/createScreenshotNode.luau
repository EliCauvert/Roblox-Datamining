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
	create = function(p0, p1)
		-- upvalues: preloadFastIntsModule (ref), signalsModule (ref), reactModule (ref), view (ref)
		local image = p0.image
		assert(image ~= nil, "createScreenshotNode: spec.image (the screenshot content URI) is required")
		local poster = p0.poster
		local durationSeconds = p0.durationSeconds or preloadFastIntsModule.getScreenshotDurationSeconds()
		local content = Content.fromUri(image)
		local var7 = if poster ~= nil then nil else Content.fromUri(poster)
		local var8, var9 = signalsModule.createSignal(0)
		local var10, var11 = signalsModule.createSignal(false)
		local var12, var13 = signalsModule.createSignal(nil)
		local var14 = false
		local var15 = false
		local heartbeatConnection = p1.runService.Heartbeat:Connect(function(p2)
			-- upvalues: var15 (write), var14 (write), var8 (ref), durationSeconds (ref), var9 (ref)
			if var15 or not var14 then return end
			local var19 = var8(false) + p2
			
			if durationSeconds <= var19 then
				var19 %= durationSeconds
			end
			var9(var19)
		end)
		local var17 = p1.contentProvider:GetAssetFetchStatusChangedSignal(image):Connect(function()
			-- upvalues: p1 (ref), image (ref), var11 (ref), var13 (ref)
			local var20 = p1.contentProvider:GetAssetFetchStatus(image)
			var11(var20 == Enum.AssetFetchStatus.Success)
			var13(if var20 == Enum.AssetFetchStatus.Failure then `screenshot load failed: {var20.Name}` else nil)
		end)
		local var18 = p1.contentProvider:GetAssetFetchStatus(image)
		var11(var18 == Enum.AssetFetchStatus.Success)
		var13(if var18 == Enum.AssetFetchStatus.Failure then `screenshot load failed: {var18.Name}` else nil)
		
		return {
			kind = "screenshot",
			usesDecoder = false,
			zIndex = 0,
			id = p0.id,
			assets = function()
				-- upvalues: var7 (ref), content (ref)
				return if var7 == nil then { content } else { content, var7 }
			end,
			download = function()
				-- upvalues: var15 (write), var7 (ref), content (ref), p1 (ref)
				if var15 then return end
				local list, var23, var24
				local t = {}
				
				if var7 == nil then
					list = { content }
					var23 = nil
					var24 = nil
				else
					list = { content, var7 }
					var23 = nil
					var24 = nil
				end
				for i, v in list, var23, var24 do
					table.insert(t, v.Uri)
				end
				p1.contentProvider:PreloadAsync(t)
			end,
			render = function(p3)
				-- upvalues: reactModule (copy), view (copy), var7 (ref), content (ref)
				return reactModule.createElement(view, { tag = "size-full", ZIndex = 0 }, {
					Poster = if var7 ~= nil then nil else reactModule.createElement("ImageLabel", {
						BackgroundTransparency = 1,
						ZIndex = 1,
						Size = UDim2.fromScale(1, 1),
						ScaleType = p3.scaleType or Enum.ScaleType.Crop,
						ImageContent = var7
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
				-- upvalues: var14 (write)
				var14 = true
			end,
			pause = function()
				-- upvalues: var14 (write)
				var14 = false
			end,
			seek = function(p4)
				-- upvalues: var9 (ref), durationSeconds (ref)
				var9(math.clamp(p4, 0, durationSeconds))
			end,
			dispose = function()
				-- upvalues: var15 (write), var14 (write), heartbeatConnection (ref), var17 (ref)
				if var15 then
					return
				end
				var15 = true
				var14 = false
				heartbeatConnection:Disconnect()
				var17:Disconnect()
			end,
			getPosition = var8,
			getDuration = function()
				-- upvalues: durationSeconds (ref)
				return durationSeconds
			end,
			getIsImageLoaded = var10,
			getFailureReason = var12
		}
	end
}