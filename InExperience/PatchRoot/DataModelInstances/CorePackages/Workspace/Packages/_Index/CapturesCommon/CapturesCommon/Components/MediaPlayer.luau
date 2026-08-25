local runService = game:GetService("RunService")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local foundationModule = require(parent_1.Foundation)
local reactModule = require(parent_1.React)
local buttonSize = foundationModule.Enums.ButtonSize
local iconButton = foundationModule.IconButton
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local image = foundationModule.Image
local text = foundationModule.Text
local view = foundationModule.View
local loadableVideoModule = require(parent.Components.LoadableVideo)
local progressBarModule = require(parent.Components.ProgressBar)

local function _(p0)
	return if typeof(p0) == "table" and p0.current ~= nil then p0.current else nil
end

return function(p1)
	-- upvalues: reactModule (ref), runService (ref), view (ref), stateLayerAffordance (ref), iconButton (ref), buttonSize (ref), loadableVideoModule (ref), text (ref), progressBarModule (ref), foundationModule (ref), image (ref)
	local var24
	local var5, var6 = reactModule.useState(0)
	local var7, var8 = reactModule.useState(0)
	local var9, var10 = reactModule.useState(false)
	local var11, var12 = reactModule.useState(false)
	local var13, var14 = reactModule.useState(false)
	local var15, var16 = reactModule.useState(true)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var10 (ref), runService (copy), var6 (ref)
		local videoRef = p1.videoRef
		local var28 = if typeof(videoRef) == "table" and videoRef.current ~= nil then videoRef.current else nil
		
		if var28 then
			videoRef = var28.Played:Connect(function()
				-- upvalues: var10 (copy)
				var10(false)
			end)
			local endedConnection = var28.Ended:Connect(function()
				-- upvalues: var10 (copy)
				var10(true)
			end)
			local renderSteppedConnection = runService.RenderStepped:Connect(function()
				-- upvalues: var6 (copy), var28 (ref)
				var6(var28.TimePosition)
			end)
			
			return function()
				-- upvalues: renderSteppedConnection (ref), videoRef (ref), endedConnection (ref)
				renderSteppedConnection:Disconnect()
				videoRef:Disconnect()
				endedConnection:Disconnect()
			end
		end
	end, { p1.videoRef, var15, var9 })
	local var17 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), var8 (ref)
		local videoRef = p1.videoRef
		local var31 = if typeof(videoRef) == "table" and videoRef.current ~= nil then videoRef.current else nil
		
		if var31 then
			var8(var31.TimeLength)
			p1.onLoaded(p2)
			
			return
		end
	end, { p1.onLoaded, p1.videoRef })
	local var18 = reactModule.useCallback(function()
		-- upvalues: var16 (ref), var15 (ref)
		var16(not var15)
	end, { var15 })
	local var19 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var9 (ref), var10 (ref), var5 (ref), var7 (ref)
		local videoRef = p1.videoRef
		local var32 = if typeof(videoRef) == "table" and videoRef.current ~= nil then videoRef.current else nil
		
		if not var32 then return end
		if not var9 then
			var32:Pause()
			var10(true)
			
			return
		elseif math.abs(var5 - var7) <= 0.1 then
			var32.TimePosition = 0
		end
		var32:Play()
		var10(false)
	end, { var9, p1.videoRef, var5, var7 })
	local var20 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var14 (ref), var13 (ref)
		if p1.onExpandCallback then
			p1.onExpandCallback()
		end
		var14(not var13)
	end, { var13, p1.onExpandCallback })
	local var21 = reactModule.useCallback(function(p3)
		-- upvalues: p1 (ref)
		local videoRef = p1.videoRef
		local var33 = if typeof(videoRef) == "table" and videoRef.current ~= nil then videoRef.current else nil
		
		if var33 then
			var33.TimePosition = var33.TimeLength * p3
			
			return
		end
	end, { p1.videoRef })
	local var22 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var11 (ref), var12 (ref)
		if p1.onMuteCallback then
			p1.onMuteCallback()
		end
		local videoRef = p1.videoRef
		local var34 = if typeof(videoRef) == "table" and videoRef.current ~= nil then videoRef.current else nil
		
		if var34 then
			var34.Volume = if var11 then 1 else 0
			var12(not var11)
			
			return
		end
	end, { var11, p1.onMuteCallback, p1.videoRef })
	local var23 = not p1.Playing and (p1.thumbnailImage ~= nil and p1.thumbnailImage ~= "")
	
	if not p1.Video then
		var24 = p1.VideoContent and (if p1.Playing ~= nil then p1.Playing else not p1.thumbnailImage)
	end
	local createElement = reactModule.createElement
	local t = {
		tag = "shrink size-full",
		onActivated = var18,
		stateLayer = { affordance = stateLayerAffordance.None },
		ZIndex = p1.ZIndex
	}
	local t_1 = {}
	local videoRef = p1.videoRef
	local var27 = if typeof(videoRef) == "table" and videoRef.current ~= nil then videoRef.current else nil
	t_1.HeaderBarContainer = if var27 == nil or not p1.onExpandCallback or (p1.isZooming or var15) or p1.isOverlayDisabled then nil else reactModule.createElement(view, {
		tag = "anchor-top-center position-top-center size-full-0 auto-y padding-medium row align-x-right",
		ZIndex = 3
	}, {
		ExpandButton = reactModule.createElement(iconButton, {
			isDisabled = false,
			LayoutOrder = 1,
			icon = if var13 then "icons/actions/previewShrink" else "icons/actions/previewExpand",
			onActivated = var20,
			size = buttonSize.Medium
		})
	})
	t_1.VideoPreview = if var24 then reactModule.createElement(loadableVideoModule, {
		AnchorPoint = p1.AnchorPoint,
		BackgroundTransparency = p1.BackgroundTransparency,
		cornerRadius = p1.cornerRadius,
		Looped = p1.Looped,
		onLoaded = var17,
		Playing = p1.Playing,
		Position = p1.Position,
		renderOnFailed = p1.renderOnFailed,
		scaleType = p1.scaleType,
		Size = p1.Size,
		Video = p1.Video,
		VideoContent = p1.VideoContent,
		videoRef = p1.videoRef
	}) else reactModule.createElement(view, {
		tag = "align-x-center align-y-center auto-xy items-center gap-medium"
	}, {
		Text = reactModule.createElement(text, { Text = "No video to display", tag = "auto-xy" })
	})
	videoRef = p1.videoRef
	var27 = if typeof(videoRef) == "table" and videoRef.current ~= nil then videoRef.current else nil
	t_1.ProgressBarContainer = if var27 == nil or p1.isZooming or (var15 or p1.isOverlayDisabled) then nil else reactModule.createElement(view, {
		tag = "anchor-bottom-center position-bottom-center size-full-0 auto-y",
		ZIndex = 3
	}, {
		ProgressBar = reactModule.createElement(progressBarModule, {
			isMuted = var11,
			isPlaying = not var9,
			isTimeHidden = p1.isTimeHidden,
			onMuteButtonActivated = var22,
			onPlayButtonActivated = var19,
			onProgressBarActivated = var21,
			timePosition = var5,
			timeLength = var7
		})
	})
	t_1.ShadowBlock = if var15 or p1.isOverlayDisabled then nil else reactModule.createElement(view, {
		tag = "size-full-full",
		ZIndex = 2,
		backgroundStyle = { Transparency = 0.4, Color3 = Color3.fromRGB(0, 0, 0) },
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		}
	})
	t_1.ThumbnailImage = if var23 then reactModule.createElement(image, {
		ZIndex = 2,
		Image = p1.thumbnailImage,
		Size = UDim2.fromScale(1, 1)
	}, {
		UICorner = if p1.cornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadius) }) else nil
	}) else nil
	
	return createElement(view, t, t_1)
end