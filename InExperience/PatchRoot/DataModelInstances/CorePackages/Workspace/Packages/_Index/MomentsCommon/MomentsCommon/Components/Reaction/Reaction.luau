local RunService = game:GetService("RunService")
local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local ReactModule = require(Parent.React)
local Image = require(Parent.Foundation).Image
local _ = require(MomentsCommon.Enums.ReactionSize)
local _ = require(MomentsCommon.Enums.ReactionType)
local AnimationDataModule = require(script.Parent.AnimationData)
local ReactionAnimationModule = require(script.Parent.ReactionAnimation)
local ReactionAssetsModule = require(script.Parent.ReactionAssets)
local t = {}

local function _(Key) --[[ Line: 47 | Named "warnMissingAnimation" ]]
	-- upvalues: t (copy)
	if not t[Key] then
		warn(`Reaction animation missing for {Key}`)
		t[Key] = true
		
		return
	end
end

local function getStaticImageData(ReactionType, Size) --[[ Line: 56 ]]
	-- upvalues: ReactionAssetsModule (copy)
	local StaticImageUri = ReactionAssetsModule.getStaticImageUri(ReactionType, Size)
	
	return if StaticImageUri == nil then nil else {
		Image = StaticImageUri,
		ImageRectSize = Vector2.new(0, 0),
		ImageRectOffset = Vector2.new(0, 0)
	}
end

local _ = function(p1, p2, p3, Callback: (any) -> (), Callback1: (any) -> ()) --[[ Line: 68 | Named "setFrame" ]]
	-- upvalues: ReactionAnimationModule (copy)
	local FrameRect = ReactionAnimationModule.getFrameRect(p1, p2)
	p3.current = FrameRect.frameIndex
	Callback(FrameRect.offset)
	Callback1(FrameRect.size)
end

return ReactModule.memo(ReactModule.forwardRef(function(Frame: Frame, p1) --[[ Line: 81 | Named "Reaction" ]]
	-- upvalues: ReactionAssetsModule (copy), AnimationDataModule (copy), ReactModule (copy), getStaticImageData (copy), ReactionAnimationModule (copy), t (copy), RunService (copy), Image (copy)
	local AssetKey = ReactionAssetsModule.getAssetKey(Frame.reactionType)
	local AnimationDataModuleResult = if AssetKey == nil then nil else AnimationDataModule(AssetKey)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 84 ]]
		-- upvalues: getStaticImageData (upval), Frame (copy)
		return (getStaticImageData(Frame.reactionType, Frame.size))
	end, { Frame.reactionType, Frame.size })
	local SizePixels = ReactionAssetsModule.getSizePixels(Frame.size)
	local HasAnimationDataModuleResult: boolean = AssetKey ~= nil and AnimationDataModuleResult ~= nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1 = if Frame.isPlaying == nil then UseStateResult else Frame.isPlaying
	local HasAnimationDataModuleResult1: boolean = UseStateResult1 and HasAnimationDataModuleResult
	local ZeroVector = if UseMemoResult == nil then Vector2.zero else UseMemoResult.ImageRectSize
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(if UseMemoResult == nil then Vector2.zero else UseMemoResult.ImageRectOffset)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(ZeroVector)
	local UseRefResult = ReactModule.useRef(1)
	local UseRefResult1 = ReactModule.useRef(0)
	local UseRefResult2 = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 104 ]]
		-- upvalues: HasAnimationDataModuleResult1 (copy), AnimationDataModuleResult (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult (copy), UseBindingResult2 (copy), UseBindingResult2_1 (copy), ReactionAnimationModule (upval), UseMemoResult (copy), UseStateResult1 (copy), HasAnimationDataModuleResult (copy), AssetKey (copy), Frame (copy), t (upval)
		if HasAnimationDataModuleResult1 and AnimationDataModuleResult ~= nil then
			UseRefResult1.current = 0
			UseRefResult2.current = false
			local FrameRect = ReactionAnimationModule.getFrameRect(AnimationDataModuleResult, 1)
			UseRefResult.current = FrameRect.frameIndex
			UseBindingResult2(FrameRect.offset)
			UseBindingResult2_1(FrameRect.size)
		elseif UseMemoResult ~= nil then
			UseRefResult1.current = 0
			UseRefResult2.current = false
			UseRefResult.current = 1
			UseBindingResult2(UseMemoResult.ImageRectOffset)
			UseBindingResult2_1(UseMemoResult.ImageRectSize)
		end
		if UseStateResult1 and not HasAnimationDataModuleResult then
			local AssetKey1 = AssetKey or tostring(Frame.reactionType)
			
			if t[AssetKey1] then return end
			warn(`Reaction animation missing for {AssetKey1}`)
			t[AssetKey1] = true
		end
	end, {
		HasAnimationDataModuleResult1, AnimationDataModuleResult, UseMemoResult,
		Frame.reactionType, UseStateResult1, Frame.loop, HasAnimationDataModuleResult,
		AssetKey
	})
	ReactModule.useEffect(function() --[[ Line: 133 ]]
		-- upvalues: HasAnimationDataModuleResult1 (copy), AnimationDataModuleResult (copy), RunService (upval), UseRefResult2 (copy), UseRefResult1 (copy), Frame (copy), ReactionAnimationModule (upval), UseRefResult (copy), UseBindingResult2 (copy), UseBindingResult2_1 (copy), UseStateResult2 (copy)
		if HasAnimationDataModuleResult1 and AnimationDataModuleResult ~= nil then
			local HeartbeatConnection = RunService.Heartbeat:Connect(function(DeltaTime) --[[ Line: 138 ]]
				-- upvalues: UseRefResult2 (upval), UseRefResult1 (upval), Frame (upval), ReactionAnimationModule (upval), AnimationDataModuleResult (upval), UseRefResult (upval), UseBindingResult2 (upval), UseBindingResult2_1 (upval), UseStateResult2 (upval)
				if UseRefResult2.current then return end
				UseRefResult1.current += DeltaTime
				
				if not Frame.loop and ReactionAnimationModule.getDurationSeconds(AnimationDataModuleResult) <= UseRefResult1.current then
					local FrameRect = ReactionAnimationModule.getFrameRect(AnimationDataModuleResult, AnimationDataModuleResult.frameCount)
					UseRefResult.current = FrameRect.frameIndex
					UseBindingResult2(FrameRect.offset)
					UseBindingResult2_1(FrameRect.size)
					UseRefResult2.current = true
					UseStateResult2(false)
					
					return
				end
				local FrameIndex = ReactionAnimationModule.getFrameIndex(AnimationDataModuleResult, UseRefResult1.current, Frame.loop == true)
				
				if FrameIndex ~= UseRefResult.current then
					local FrameRect = ReactionAnimationModule.getFrameRect(AnimationDataModuleResult, FrameIndex)
					UseRefResult.current = FrameRect.frameIndex
					UseBindingResult2(FrameRect.offset)
					UseBindingResult2_1(FrameRect.size)
				end
			end)
			
			return function() --[[ Line: 159 ]]
				-- upvalues: HeartbeatConnection (copy)
				HeartbeatConnection:Disconnect()
			end
		else
			return nil
		end
	end, {
		HasAnimationDataModuleResult1,
		AnimationDataModuleResult,
		Frame.loop
	})
	ReactModule.useImperativeHandle(p1, function() --[[ Line: 164 ]]
		-- upvalues: Frame (copy), UseStateResult2 (copy)
		return {
			start = function() --[[ Line: 166 ]]
				-- upvalues: Frame (upval), UseStateResult2 (upval)
				if Frame.isPlaying == nil then
					UseStateResult2(true)
				end
			end,
			stop = function() --[[ Line: 171 ]]
				-- upvalues: Frame (upval), UseStateResult2 (upval)
				if Frame.isPlaying == nil then
					UseStateResult2(false)
				end
			end
		}
	end, { Frame.isPlaying })
	local AnimatedImageUri = if HasAnimationDataModuleResult1 and AssetKey ~= nil then ReactionAssetsModule.getAnimatedImageUri(AssetKey) elseif UseMemoResult == nil then nil else UseMemoResult.Image
	
	return if AnimatedImageUri == nil or SizePixels == nil then nil else ReactModule.createElement(Image, {
		BackgroundTransparency = 1,
		AnchorPoint = Frame.AnchorPoint,
		Image = AnimatedImageUri,
		LayoutOrder = Frame.LayoutOrder,
		Position = Frame.Position,
		ScaleType = Enum.ScaleType.Fit,
		Size = UDim2.fromOffset(SizePixels, SizePixels),
		Visible = Frame.Visible,
		ZIndex = Frame.ZIndex,
		scale = Frame.scale,
		imageRect = { offset = UseBindingResult, size = UseBindingResult1 },
		imageStyle = Frame.imageStyle,
		testId = Frame.testId
	})
end))