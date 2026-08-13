local parent = script:FindFirstAncestor("VideoPlayer").Parent
local reactModule = require(parent.React)
local argCheckModule = require(parent.ArgCheck)
local videoPlayerWrapperModule = require(script.Parent.VideoPlayerWrapper)

return function(p0) --[[ line: 25 | named "VideoDisplay" ]]
	-- upvalues: reactModule (ref), argCheckModule (ref), videoPlayerWrapperModule (ref)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	local var5, var6 = reactModule.useState(false)
	local var7 = reactModule.useRef(nil)
	var7.current = p0.onVideoLoaded
	reactModule.useEffect(function() --[[ line: 33 ]]
		-- upvalues: var6 (ref), p0 (ref), var4 (ref), argCheckModule (copy), var7 (ref)
		var6(false)
		
		if p0.shouldStartPlayback then
			local current = var4.current
			argCheckModule.assert(current ~= nil, "VideoDisplay expects videoPlayer ref to be set before loading")
			local var8 = false
			task.spawn(function() --[[ line: 41 ]]
				-- upvalues: current (ref), var8 (write), var7 (copy), var6 (copy)
				local currentTime = tick()
				local ok, status = pcall(function() --[[ line: 43 ]]
					-- upvalues: current (copy)
					return current:LoadAsync()
				end)
				
				if var8 then return end
				if not ok or status ~= Enum.AssetFetchStatus.Success then return end
				if var7.current then
					var7.current(current.TimeLength, tick() - currentTime)
				end
				var6(true)
			end)
			
			return function() --[[ line: 57 ]]
				-- upvalues: var8 (write)
				var8 = true
			end
		end
	end, { p0.video, p0.shouldStartPlayback })
	reactModule.useEffect(function() --[[ line: 62 ]]
		-- upvalues: var5 (ref), var4 (ref), argCheckModule (copy), p0 (ref)
		if not var5 then return end
		local current = var4.current
		argCheckModule.assert(current ~= nil, "VideoDisplay expects videoPlayer ref to be set before playback")
		
		if p0.shouldStartPlayback then
			current.TimePosition = 0
			current:Play()
			
			return
		end
		current:Pause()
	end, { var5, p0.shouldStartPlayback })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Selectable = false,
		Size = p0.Size,
		ZIndex = p0.ZIndex
	}, {
		Corner = if p0.cornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p0.cornerRadius) }) else nil,
		Thumbnail = if p0.thumbnail and p0.thumbnail ~= "" then reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 1,
			Image = p0.thumbnail,
			Size = UDim2.fromScale(1, 1),
			ScaleType = p0.ScaleType
		}, {
			Corner = if p0.cornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p0.cornerRadius) }) else nil
		}) else nil,
		VideoDisplay = reactModule.createElement("VideoDisplay", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			ScaleType = p0.ScaleType,
			Visible = p0.shouldStartPlayback,
			ref = var3
		}, {
			Corner = if p0.cornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p0.cornerRadius) }) else nil,
			VideoPlayer = reactModule.createElement(videoPlayerWrapperModule, {
				video = p0.video,
				muted = p0.muted,
				looped = p0.looped,
				videoPlayerRef = var4,
				videoDisplayRef = var3,
				onVideoLooped = p0.onVideoLooped
			})
		})
	})
end