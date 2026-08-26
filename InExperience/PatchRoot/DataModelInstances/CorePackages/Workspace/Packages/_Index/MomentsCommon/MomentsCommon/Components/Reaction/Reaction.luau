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

local function _(p1)
	-- upvalues: t (ref)
	if t[p1] then
		return
	end
	warn(`Reaction animation missing for {p1}`)
	t[p1] = true
end

local function getStaticImageData(p2, p3)
	-- upvalues: reactionAssetsModule (ref)
	local staticImageUri = reactionAssetsModule.getStaticImageUri(p2, p3)
	
	return if staticImageUri == nil then nil else {
		Image = staticImageUri,
		ImageRectSize = Vector2.new(0, 0),
		ImageRectOffset = Vector2.new(0, 0)
	}
end

local _ = function(value, p2, p3, p4, p5)
	-- upvalues: reactionAnimationModule (ref)
	local frameRect = reactionAnimationModule.getFrameRect(value, p2)
	p3.current = frameRect.frameIndex
	p4(frameRect.offset)
	p5(frameRect.size)
end

return reactModule.memo(reactModule.forwardRef(function(p2, p3)
	-- upvalues: reactionAssetsModule (ref), animationDataModule (ref), reactModule (ref), getStaticImageData (ref), reactionAnimationModule (ref), t (ref), runService (ref), image (ref)
	local assetKey = reactionAssetsModule.getAssetKey(p2.reactionType)
	local var1 = if assetKey ~= nil then nil else animationDataModule(assetKey)
	local var2 = reactModule.useMemo(function()
		-- upvalues: getStaticImageData (copy), p2 (ref)
		return getStaticImageData(p2.reactionType, p2.size)
	end, { p2.reactionType, p2.size })
	local sizePixels = reactionAssetsModule.getSizePixels(p2.size)
	local var3 = assetKey ~= nil and var1 ~= nil
	local var4, var5 = reactModule.useState(false)
	local var6 = if p2.isPlaying ~= nil then var4 else p2.isPlaying
	local var7 = var6 and var3
	local var8 = if var2 ~= nil then Vector2.zero else var2.ImageRectSize
	local var9, var10 = reactModule.useBinding(if var2 ~= nil then Vector2.zero else var2.ImageRectOffset)
	local var11, var12 = reactModule.useBinding(var8)
	local var13 = reactModule.useRef(1)
	local var14 = reactModule.useRef(0)
	local var15 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var1 (ref), var14 (ref), var15 (ref), var13 (ref), var10 (ref), var12 (ref), reactionAnimationModule (copy), var2 (ref), var6 (ref), var3 (ref), assetKey (ref), p2 (ref), t (copy)
		if var7 and var1 ~= nil then
			var14.current = 0
			var15.current = false
			local var16 = var1
			local var17 = var13
			local var18 = var10
			local var19 = var12
			local frameRect = reactionAnimationModule.getFrameRect(var16, 1)
			var17.current = frameRect.frameIndex
			var18(frameRect.offset)
			var19(frameRect.size)
		elseif var2 ~= nil then
			var14.current = 0
			var15.current = false
			var13.current = 1
			var10(var2.ImageRectOffset)
			var12(var2.ImageRectSize)
		end
		if var6 and not var3 then
			local assetKey_1 = assetKey or tostring(p2.reactionType)
			
			if t[assetKey_1] then return end
			warn(`Reaction animation missing for {assetKey_1}`)
			t[assetKey_1] = true
		end
	end, {
		var7, var1, var2, p2.reactionType, var6, p2.loop, var3, assetKey
	})
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var1 (ref), runService (copy), var15 (ref), var14 (ref), p2 (ref), reactionAnimationModule (copy), var13 (ref), var10 (ref), var12 (ref), var5 (ref)
		if var7 and var1 ~= nil then
			local heartbeatConnection = runService.Heartbeat:Connect(function(p4)
				-- upvalues: var15 (copy), var14 (copy), p2 (copy), reactionAnimationModule (copy), var1 (copy), var13 (copy), var10 (copy), var12 (copy), var5 (copy)
				if var15.current then return end
				var14.current += p4
				
				if not p2.loop and reactionAnimationModule.getDurationSeconds(var1) <= var14.current then
					local frameCount = var1.frameCount
					local var20 = var13
					local var21 = var10
					local var22 = var12
					local frameRect = reactionAnimationModule.getFrameRect(var1, frameCount)
					var20.current = frameRect.frameIndex
					var21(frameRect.offset)
					var22(frameRect.size)
					var15.current = true
					var5(false)
					
					return
				end
				local frameIndex = reactionAnimationModule.getFrameIndex(var1, var14.current, p2.loop == true)
				
				if frameIndex ~= var13.current then
					local var23 = var1
					local var24 = var13
					local var25 = var10
					local var26 = var12
					local frameRect = reactionAnimationModule.getFrameRect(var23, frameIndex)
					var24.current = frameRect.frameIndex
					var25(frameRect.offset)
					var26(frameRect.size)
				end
			end)
			
			return function()
				-- upvalues: heartbeatConnection (ref)
				heartbeatConnection:Disconnect()
			end
		end
		return nil
	end, { var7, var1, p2.loop })
	reactModule.useImperativeHandle(p3, function()
		-- upvalues: p2 (ref), var5 (ref)
		return {
			start = function()
				-- upvalues: p2 (copy), var5 (copy)
				if p2.isPlaying == nil then
					var5(true)
				end
			end,
			stop = function()
				-- upvalues: p2 (copy), var5 (copy)
				if p2.isPlaying == nil then
					var5(false)
				end
			end
		}
	end, { p2.isPlaying })
	local var20 = if var7 and assetKey ~= nil then reactionAssetsModule.getAnimatedImageUri(assetKey) elseif var2 ~= nil then nil else var2.Image
	
	return if var20 == nil or sizePixels == nil then nil else reactModule.createElement(image, {
		BackgroundTransparency = 1,
		AnchorPoint = p2.AnchorPoint,
		Image = var20,
		LayoutOrder = p2.LayoutOrder,
		Position = p2.Position,
		ScaleType = Enum.ScaleType.Fit,
		Size = UDim2.fromOffset(sizePixels, sizePixels),
		Visible = p2.Visible,
		ZIndex = p2.ZIndex,
		scale = p2.scale,
		imageRect = { offset = var9, size = var11 },
		imageStyle = p2.imageStyle,
		testId = p2.testId
	})
end))