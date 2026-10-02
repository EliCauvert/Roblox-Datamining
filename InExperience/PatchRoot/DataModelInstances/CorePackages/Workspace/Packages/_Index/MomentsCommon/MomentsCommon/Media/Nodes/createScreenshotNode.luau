local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local view = foundationModule.View
local _ = require(momentsCommon.Media.MediaTypes)
local _ = require(momentsCommon.Media.mediaNodeRegistry)
local preloadFastIntsModule = require(momentsCommon.Media.Preload.preloadFastInts)

local function _(p1)
	-- upvalues: reactModule (ref)
	return if p1 == nil then nil else reactModule.createElement("UICorner", { CornerRadius = p1 })
end

return {
	kind = "screenshot",
	create = function(p1, p2)
		-- upvalues: preloadFastIntsModule (ref), signalsModule (ref), reactModule (ref), view (ref)
		local image = p1.image
		assert(if image == nil then p1.imageContent ~= nil else true, "createScreenshotNode: screenshot content is required")
		local poster = p1.poster
		local durationSeconds = p1.durationSeconds or preloadFastIntsModule.getScreenshotDurationSeconds()
		local imageContent = p1.imageContent or Content.fromUri(image)
		local posterContent = p1.posterContent or (if poster ~= nil then nil else Content.fromUri(poster))
		local var1, var2 = signalsModule.createSignal(0)
		local var3, var4 = signalsModule.createSignal(false)
		local var5, var6 = signalsModule.createSignal(nil)
		local var7 = false
		local var8 = false
		local heartbeatConnection = p2.runService.Heartbeat:Connect(function(p3)
			-- upvalues: var8 (write), var7 (write), var1 (ref), durationSeconds (ref), var2 (ref)
			if var8 or not var7 then return end
			local var9 = var1(false) + p3
			
			if durationSeconds <= var9 then
				var9 %= durationSeconds
			end
			var2(var9)
		end)
		
		local function refreshLoaded()
			-- upvalues: p2 (ref), image (ref), var4 (ref), var6 (ref)
			local var9 = p2.contentProvider:GetAssetFetchStatus(image)
			var4(var9 == Enum.AssetFetchStatus.Success)
			var6(if var9 == Enum.AssetFetchStatus.Failure then `screenshot load failed: {var9.Name}` else nil)
		end
		
		local var9 = nil
		
		if image == nil then
			var4(true)
		else
			var9 = p2.contentProvider:GetAssetFetchStatusChangedSignal(image):Connect(refreshLoaded)
			local var10 = p2.contentProvider:GetAssetFetchStatus(image)
			var4(var10 == Enum.AssetFetchStatus.Success)
			var6(if var10 == Enum.AssetFetchStatus.Failure then `screenshot load failed: {var10.Name}` else nil)
		end
		return {
			kind = "screenshot",
			usesDecoder = false,
			zIndex = 0,
			id = p1.id,
			assets = function()
				-- upvalues: posterContent (ref), imageContent (ref)
				return if posterContent == nil then { imageContent } else { imageContent, posterContent }
			end,
			download = function()
				-- upvalues: var8 (write), posterContent (ref), imageContent (ref), p2 (ref)
				if var8 then return end
				local list, var11, var12
				local t = {}
				
				if posterContent == nil then
					list = { imageContent }
					var11 = nil
					var12 = nil
				else
					list = { imageContent, posterContent }
					var11 = nil
					var12 = nil
				end
				for i, v in list, var11, var12 do
					if v.Uri ~= nil then
						table.insert(t, v.Uri)
					end
				end
				if #t > 0 then
					p2.contentProvider:PreloadAsync(t)
				end
			end,
			render = function(p3)
				-- upvalues: reactModule (copy), view (copy), posterContent (ref), imageContent (ref)
				local createElement_1
				local createElement = reactModule.createElement
				local t = { tag = "size-full", ZIndex = 0 }
				local t_1 = {}
				
				if posterContent == nil then
					createElement_1 = nil
				else
					createElement_1 = reactModule.createElement
					local var13 = "ImageLabel"
					local t_2 = {
						BackgroundTransparency = 1,
						ZIndex = 1,
						Size = UDim2.fromScale(1, 1),
						ScaleType = p3.scaleType or Enum.ScaleType.Crop,
						ImageContent = posterContent
					}
					local t_3 = {}
					local cornerRadius = p3.cornerRadius
					t_3.Corner = if cornerRadius ~= nil then nil else reactModule.createElement("UICorner", { CornerRadius = cornerRadius })
					createElement_1 = createElement_1(var13, t_2, t_3)
				end
				t_1.Poster = createElement_1
				local createElement_2 = reactModule.createElement
				local var14 = "ImageLabel"
				local t_2 = {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Size = UDim2.fromScale(1, 1),
					ScaleType = p3.scaleType or Enum.ScaleType.Crop,
					ImageContent = imageContent,
					ref = p3.setSurface
				}
				local t_3 = {}
				local cornerRadius = p3.cornerRadius
				t_3.Corner = if cornerRadius ~= nil then nil else reactModule.createElement("UICorner", { CornerRadius = cornerRadius })
				t_1.Base = createElement_2(var14, t_2, t_3)
				
				return createElement(view, t, t_1)
			end,
			play = function()
				-- upvalues: var7 (write)
				var7 = true
			end,
			pause = function()
				-- upvalues: var7 (write)
				var7 = false
			end,
			seek = function(p3)
				-- upvalues: var2 (ref), durationSeconds (ref)
				var2(math.clamp(p3, 0, durationSeconds))
			end,
			dispose = function()
				-- upvalues: var8 (write), var7 (write), heartbeatConnection (ref), var9 (write)
				if var8 then return end
				var8 = true
				var7 = false
				heartbeatConnection:Disconnect()
				
				if var9 ~= nil then
					var9:Disconnect()
				end
			end,
			getPosition = var1,
			getDuration = function()
				-- upvalues: durationSeconds (ref)
				return durationSeconds
			end,
			getIsImageLoaded = var3,
			getFailureReason = var5
		}
	end
}