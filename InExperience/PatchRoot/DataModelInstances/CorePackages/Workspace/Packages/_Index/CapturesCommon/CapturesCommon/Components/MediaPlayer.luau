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

local function _(p1)
	return if typeof(p1) == "table" and p1.current ~= nil then p1.current else nil
end

return function(p1)
	-- upvalues: reactModule (ref), runService (ref), view (ref), stateLayerAffordance (ref), iconButton (ref), buttonSize (ref), loadableVideoModule (ref), text (ref), progressBarModule (ref), foundationModule (ref), image (ref)
	local var1
	local var2, var3 = reactModule.useState(0)
	local var4, var5 = reactModule.useState(0)
	local var6, var7 = reactModule.useState(false)
	local var8, var9 = reactModule.useState(false)
	local var10, var11 = reactModule.useState(false)
	local var12, var13 = reactModule.useState(true)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var7 (ref), runService (copy), var3 (ref)
		local videoRef = p1.videoRef
		local var14 = if typeof(videoRef) == "table" and videoRef.current ~= nil then videoRef.current else nil
		
		if var14 then
			videoRef = var14.Played:Connect(function()
				-- upvalues: var7 (copy)
				var7(false)
			end)
			local endedConnection = var14.Ended:Connect(function()
				-- upvalues: var7 (copy)
				var7(true)
			end)
			local renderSteppedConnection = runService.RenderStepped:Connect(function()
				-- upvalues: var3 (copy), var14 (ref)
				var3(var14.TimePosition)
			end)
			
			return function()
				-- upvalues: renderSteppedConnection (ref), videoRef (ref), endedConnection (ref)
				renderSteppedConnection:Disconnect()
				videoRef:Disconnect()
				endedConnection:Disconnect()
			end
		end
	end, { p1.videoRef, var12, var6 })
	local var14 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), var5 (ref)
		local videoRef = p1.videoRef
		local var15 = if typeof(videoRef) == "table" and videoRef.current ~= nil then videoRef.current else nil
		
		if var15 then
			var5(var15.TimeLength)
			p1.onLoaded(p2)
			
			return
		end
	end, { p1.onLoaded, p1.videoRef })
	local var15 = reactModule.useCallback(function()
		-- upvalues: var13 (ref), var12 (ref)
		var13(not var12)
	end, { var12 })
	local var16 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var6 (ref), var7 (ref), var2 (ref), var4 (ref)
		local videoRef = p1.videoRef
		local var17 = if typeof(videoRef) == "table" and videoRef.current ~= nil then videoRef.current else nil
		
		if not var17 then return end
		if not var6 then
			var17:Pause()
			var7(true)
			
			return
		elseif math.abs(var2 - var4) <= 0.1 then
			var17.TimePosition = 0
		end
		var17:Play()
		var7(false)
	end, { var6, p1.videoRef, var2, var4 })
	local var17 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var11 (ref), var10 (ref)
		if p1.onExpandCallback then
			p1.onExpandCallback()
		end
		var11(not var10)
	end, { var10, p1.onExpandCallback })
	local var18 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref)
		local videoRef = p1.videoRef
		local var19 = if typeof(videoRef) == "table" and videoRef.current ~= nil then videoRef.current else nil
		
		if var19 then
			var19.TimePosition = var19.TimeLength * p2
			
			return
		end
	end, { p1.videoRef })
	local var19 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var8 (ref), var9 (ref)
		if p1.onMuteCallback then
			p1.onMuteCallback()
		end
		local videoRef = p1.videoRef
		local var20 = if typeof(videoRef) == "table" and videoRef.current ~= nil then videoRef.current else nil
		
		if var20 then
			var20.Volume = if var8 then 1 else 0
			var9(not var8)
			
			return
		end
	end, { var8, p1.onMuteCallback, p1.videoRef })
	local var20 = not p1.Playing and (p1.thumbnailImage ~= nil and p1.thumbnailImage ~= "")
	
	if not p1.Video then
		var1 = p1.VideoContent and (if p1.Playing ~= nil then p1.Playing else not p1.thumbnailImage)
	end
	local createElement = reactModule.createElement
	local t = {
		tag = "shrink size-full",
		onActivated = var15,
		stateLayer = { affordance = stateLayerAffordance.None },
		ZIndex = p1.ZIndex
	}
	local t_1 = {}
	local videoRef = p1.videoRef
	local var21 = if typeof(videoRef) == "table" and videoRef.current ~= nil then videoRef.current else nil
	t_1.HeaderBarContainer = if var21 == nil or not p1.onExpandCallback or (p1.isZooming or var12) or p1.isOverlayDisabled then nil else reactModule.createElement(view, {
		tag = "anchor-top-center position-top-center size-full-0 auto-y padding-medium row align-x-right",
		ZIndex = 3
	}, {
		ExpandButton = reactModule.createElement(iconButton, {
			isDisabled = false,
			LayoutOrder = 1,
			icon = if var10 then "icons/actions/previewShrink" else "icons/actions/previewExpand",
			onActivated = var17,
			size = buttonSize.Medium
		})
	})
	t_1.VideoPreview = if var1 then reactModule.createElement(loadableVideoModule, {
		AnchorPoint = p1.AnchorPoint,
		BackgroundTransparency = p1.BackgroundTransparency,
		cornerRadius = p1.cornerRadius,
		Looped = p1.Looped,
		onLoaded = var14,
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
	var21 = if typeof(videoRef) == "table" and videoRef.current ~= nil then videoRef.current else nil
	t_1.ProgressBarContainer = if var21 == nil or p1.isZooming or (var12 or p1.isOverlayDisabled) then nil else reactModule.createElement(view, {
		tag = "anchor-bottom-center position-bottom-center size-full-0 auto-y",
		ZIndex = 3
	}, {
		ProgressBar = reactModule.createElement(progressBarModule, {
			isMuted = var8,
			isPlaying = not var6,
			isTimeHidden = p1.isTimeHidden,
			onMuteButtonActivated = var19,
			onPlayButtonActivated = var16,
			onProgressBarActivated = var18,
			timePosition = var2,
			timeLength = var4
		})
	})
	t_1.ShadowBlock = if var12 or p1.isOverlayDisabled then nil else reactModule.createElement(view, {
		tag = "size-full-full",
		ZIndex = 2,
		backgroundStyle = { Transparency = 0.4, Color3 = Color3.fromRGB(0, 0, 0) },
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		}
	})
	t_1.ThumbnailImage = if var20 then reactModule.createElement(image, {
		ZIndex = 2,
		Image = p1.thumbnailImage,
		Size = UDim2.fromScale(1, 1)
	}, {
		UICorner = if p1.cornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadius) }) else nil
	}) else nil
	
	return createElement(view, t, t_1)
end