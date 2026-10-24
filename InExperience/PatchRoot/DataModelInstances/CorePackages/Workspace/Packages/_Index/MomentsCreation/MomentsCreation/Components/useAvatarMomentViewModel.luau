local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local ReactModule = require(Parent.React)
local _ = require(script.Parent.AvatarMomentView)
local ConstantsModule = require(MomentsCreation.Constants)
local UseCreationMusicSyncModule = require(MomentsCreation.Hooks.useCreationMusicSync)
local _ = require(MomentsCreation.Types.CreationFlowTypes)

local function _(p1)
	pcall(function()
		-- upvalues: p1 (copy)
		p1.root.Parent = nil
	end)
	pcall(p1.dispose)
end

return function(p1)
	-- upvalues: ReactModule (copy), UseCreationMusicSyncModule (copy), ConstantsModule (copy), Parent (copy)
	local Preview = p1.preview
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(0)
	local UseCreationMusicSyncModuleResult = UseCreationMusicSyncModule(Preview, ConstantsModule.ScreenshotMusicDuration, p1.ttsAudio)
	local Music = UseCreationMusicSyncModuleResult.music
	local Elapsed = UseCreationMusicSyncModuleResult.audio.timeline.elapsed
	ReactModule.useEffect(function()
		-- upvalues: Preview (copy), ConstantsModule (upval), UseRefResult3 (copy), Parent (upval), p1 (copy), UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy)
		Preview.bindEngine(nil)
		Preview.setDuration(ConstantsModule.ScreenshotMusicDuration)
		Preview.setTimeLength(ConstantsModule.ScreenshotMusicDuration)
		Preview.setPosition(0)
		Preview.setReadiness("Loading")
		UseRefResult3.current += 1
		local Current = UseRefResult3.current
		task.spawn(function()
			-- upvalues: Parent (upval), p1 (upval), Current (copy), UseRefResult3 (upval), Preview (upval), UseRefResult (upval), UseRefResult1 (upval), UseRefResult2 (upval)
			local Success, Result = pcall(function()
				-- upvalues: Parent (upval), p1 (upval)
				return require(Parent.MomentScenes).createMomentScene(p1.avatarMoment.SceneSpec)
			end)
			
			if Current == UseRefResult3.current then
				if not Success or Result == nil then
					warn(`Failed to build Avatar Moment scene: {Result}`)
					Preview.setReadiness("Failed")
					
					return
				end
				local Current1 = UseRefResult.current
				local Current2 = UseRefResult1.current
				
				if Current1 == nil or Current2 == nil then
					pcall(function()
						-- upvalues: Result (copy)
						Result.root.Parent = nil
					end)
					pcall(Result.dispose)
					
					return
				else
					UseRefResult2.current = Result
					Result.root.Parent = Current2
					Current1.CurrentCamera = Result.camera
					Result.playhead.play()
					Preview.setReadiness("Ready")
					
					return
				end
			elseif Success and Result ~= nil then
				pcall(function()
					-- upvalues: Result (copy)
					Result.root.Parent = nil
				end)
				pcall(Result.dispose)
			end
		end)
		
		return function()
			-- upvalues: UseRefResult3 (upval), UseRefResult2 (upval)
			UseRefResult3.current += 1
			local Current = UseRefResult2.current
			UseRefResult2.current = nil
			
			if Current ~= nil then
				pcall(function()
					-- upvalues: Current (copy)
					Current.root.Parent = nil
				end)
				pcall(Current.dispose)
			end
		end
	end, { Preview, p1.avatarMoment })
	ReactModule.useEffect(function()
		-- upvalues: Preview (copy), Music (copy), Elapsed (copy), ConstantsModule (upval)
		Preview.setPosition(if Music == nil then 0 else math.clamp(Elapsed, 0, ConstantsModule.ScreenshotMusicDuration))
	end, { Preview, Music, Elapsed })
	
	return {
		viewportFrameRef = UseRefResult,
		worldModelRef = ReactModule.useCallback(function(Current)
			-- upvalues: UseRefResult2 (copy), UseRefResult1 (copy)
			if Current == nil and UseRefResult2.current ~= nil then
				pcall(function()
					-- upvalues: UseRefResult2 (upval)
					UseRefResult2.current.root.Parent = nil
				end)
			end
			UseRefResult1.current = Current
		end, {}),
		onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
			-- upvalues: p1 (copy)
			if p1.onAbsoluteSizeChanged ~= nil then
				p1.onAbsoluteSizeChanged(Frame)
			end
			if p1.onResolutionChanged ~= nil then
				p1.onResolutionChanged(Frame.AbsoluteSize)
			end
		end, { p1.onAbsoluteSizeChanged, p1.onResolutionChanged }),
		children = p1.children
	}
end