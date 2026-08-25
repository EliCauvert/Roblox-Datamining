local runService = game:GetService("RunService")
local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local reactModule = require(parent.React)
local image = require(parent.Foundation).Image
local _ = require(momentsCommon.Enums.ReactionSize)
local _ = require(momentsCommon.Enums.ReactionType)
local animationDataModule = require(script.Parent.AnimationData)
local reactionAnimationModule = require(script.Parent.ReactionAnimation)
local reactionAssetsModule = require(script.Parent.ReactionAssets)
local t = {}

local function _(p0)
	-- upvalues: t (ref)
	if t[p0] then
		return
	end
	warn(`Reaction animation missing for {p0}`)
	t[p0] = true
end

local function getStaticImageData(p1, p2)
	-- upvalues: reactionAssetsModule (ref)
	local staticImageUri = reactionAssetsModule.getStaticImageUri(p1, p2)
	
	return if staticImageUri == nil then nil else {
		Image = staticImageUri,
		ImageRectSize = Vector2.new(0, 0),
		ImageRectOffset = Vector2.new(0, 0)
	}
end

local _ = function(value, p3, p4, p5, p6)
	-- upvalues: reactionAnimationModule (ref)
	local frameRect = reactionAnimationModule.getFrameRect(value, p3)
	p4.current = frameRect.frameIndex
	p5(frameRect.offset)
	p6(frameRect.size)
end

return reactModule.memo(reactModule.forwardRef(function(p7, p8)
	-- upvalues: reactionAssetsModule (ref), animationDataModule (ref), reactModule (ref), getStaticImageData (ref), reactionAnimationModule (ref), t (ref), runService (ref), image (ref)
	local assetKey = reactionAssetsModule.getAssetKey(p7.reactionType)
	local var11 = if assetKey ~= nil then nil else animationDataModule(assetKey)
	local var12 = reactModule.useMemo(function()
		-- upvalues: getStaticImageData (copy), p7 (ref)
		return getStaticImageData(p7.reactionType, p7.size)
	end, { p7.reactionType, p7.size })
	local sizePixels = reactionAssetsModule.getSizePixels(p7.size)
	local var14 = assetKey ~= nil and var11 ~= nil
	local var15, var16 = reactModule.useState(false)
	local var17 = if p7.isPlaying ~= nil then var15 else p7.isPlaying
	local var14_1 = var17 and var14
	local var19 = if var12 ~= nil then Vector2.zero else var12.ImageRectSize
	local var20, var21 = reactModule.useBinding(if var12 ~= nil then Vector2.zero else var12.ImageRectOffset)
	local var22, var23 = reactModule.useBinding(var19)
	local var24 = reactModule.useRef(1)
	local var25 = reactModule.useRef(0)
	local var26 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var14_1 (ref), var11 (ref), var25 (ref), var26 (ref), var24 (ref), var21 (ref), var23 (ref), reactionAnimationModule (copy), var12 (ref), var17 (ref), var14 (ref), assetKey (ref), p7 (ref), t (copy)
		if var14_1 and var11 ~= nil then
			var25.current = 0
			var26.current = false
			local var28 = var11
			local var29 = var24
			local var30 = var21
			local var31 = var23
			local frameRect = reactionAnimationModule.getFrameRect(var28, 1)
			var29.current = frameRect.frameIndex
			var30(frameRect.offset)
			var31(frameRect.size)
		elseif var12 ~= nil then
			var25.current = 0
			var26.current = false
			var24.current = 1
			var21(var12.ImageRectOffset)
			var23(var12.ImageRectSize)
		end
		if var17 and not var14 then
			local assetKey_1 = assetKey or tostring(p7.reactionType)
			
			if t[assetKey_1] then return end
			warn(`Reaction animation missing for {assetKey_1}`)
			t[assetKey_1] = true
		end
	end, {
		var14_1, var11, var12, p7.reactionType, var17, p7.loop, var14, assetKey
	})
	reactModule.useEffect(function()
		-- upvalues: var14_1 (ref), var11 (ref), runService (copy), var26 (ref), var25 (ref), p7 (ref), reactionAnimationModule (copy), var24 (ref), var21 (ref), var23 (ref), var16 (ref)
		if var14_1 and var11 ~= nil then
			local heartbeatConnection = runService.Heartbeat:Connect(function(p9)
				-- upvalues: var26 (copy), var25 (copy), p7 (copy), reactionAnimationModule (copy), var11 (copy), var24 (copy), var21 (copy), var23 (copy), var16 (copy)
				if var26.current then return end
				var25.current += p9
				
				if not p7.loop and reactionAnimationModule.getDurationSeconds(var11) <= var25.current then
					local frameCount = var11.frameCount
					local var35 = var24
					local var36 = var21
					local var37 = var23
					local frameRect = reactionAnimationModule.getFrameRect(var11, frameCount)
					var35.current = frameRect.frameIndex
					var36(frameRect.offset)
					var37(frameRect.size)
					var26.current = true
					var16(false)
					
					return
				end
				local frameIndex = reactionAnimationModule.getFrameIndex(var11, var25.current, p7.loop == true)
				
				if frameIndex ~= var24.current then
					local var40 = var11
					local var41 = var24
					local var42 = var21
					local var43 = var23
					local frameRect = reactionAnimationModule.getFrameRect(var40, frameIndex)
					var41.current = frameRect.frameIndex
					var42(frameRect.offset)
					var43(frameRect.size)
				end
			end)
			
			return function()
				-- upvalues: heartbeatConnection (ref)
				heartbeatConnection:Disconnect()
			end
		end
		return nil
	end, { var14_1, var11, p7.loop })
	reactModule.useImperativeHandle(p8, function()
		-- upvalues: p7 (ref), var16 (ref)
		return {
			start = function()
				-- upvalues: p7 (copy), var16 (copy)
				if p7.isPlaying == nil then
					var16(true)
				end
			end,
			stop = function()
				-- upvalues: p7 (copy), var16 (copy)
				if p7.isPlaying == nil then
					var16(false)
				end
			end
		}
	end, { p7.isPlaying })
	local var27 = if var14_1 and assetKey ~= nil then reactionAssetsModule.getAnimatedImageUri(assetKey) elseif var12 ~= nil then nil else var12.Image
	
	return if var27 == nil or sizePixels == nil then nil else reactModule.createElement(image, {
		BackgroundTransparency = 1,
		AnchorPoint = p7.AnchorPoint,
		Image = var27,
		LayoutOrder = p7.LayoutOrder,
		Position = p7.Position,
		ScaleType = Enum.ScaleType.Fit,
		Size = UDim2.fromOffset(sizePixels, sizePixels),
		Visible = p7.Visible,
		ZIndex = p7.ZIndex,
		scale = p7.scale,
		imageRect = { offset = var20, size = var22 },
		imageStyle = p7.imageStyle,
		testId = p7.testId
	})
end))