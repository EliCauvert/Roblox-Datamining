local Parent = script:FindFirstAncestor("Moments").Parent
local ReactModule = require(Parent.React)
local VideoPlaybackCoordinator = require(Parent.VideoUtils).VideoPlaybackCoordinator
local ObserveGuiOnScreenModule = require(script.Parent.observeGuiOnScreen)

return function(p1)
	-- upvalues: ReactModule (copy), VideoPlaybackCoordinator (copy), ObserveGuiOnScreenModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: VideoPlaybackCoordinator (upval), p1 (copy), ObserveGuiOnScreenModule (upval)
		local NewVideoPlaybackCoordinator = VideoPlaybackCoordinator.new()
		local Shown = false
		local Current = false
		local Callback = nil
		
		local function setShown(Value)
			-- upvalues: Shown (ref), p1 (upval), Current (ref), NewVideoPlaybackCoordinator (copy)
			Shown = Value
			local Current1 = Shown and p1.current
			
			if Current1 == Current then return end
			Current = Current1
			
			if Current1 then
				NewVideoPlaybackCoordinator:requestPlayback("AvatarMomentScene", false, 0)
				
				return
			else
				NewVideoPlaybackCoordinator:cancelPlayback("AvatarMomentScene", "AvatarMomentSceneStopped")
			end
		end
		
		return {
			setShown = setShown,
			trackPage = function(p2)
				-- upvalues: Callback (ref), Shown (ref), p1 (upval), Current (ref), NewVideoPlaybackCoordinator (copy), ObserveGuiOnScreenModule (upval), setShown (copy)
				if Callback ~= nil then
					Callback()
					Callback = nil
					Shown = false
					local Current1 = Shown and p1.current
					
					if Current1 ~= Current then
						Current = Current1
						
						if Current1 then
							NewVideoPlaybackCoordinator:requestPlayback("AvatarMomentScene", false, 0)
						else
							NewVideoPlaybackCoordinator:cancelPlayback("AvatarMomentScene", "AvatarMomentSceneStopped")
						end
					end
				end
				Callback = ObserveGuiOnScreenModule(p2, setShown)
			end,
			untrackPage = function()
				-- upvalues: Callback (ref), Shown (ref), p1 (upval), Current (ref), NewVideoPlaybackCoordinator (copy)
				if Callback == nil then return end
				Callback()
				Callback = nil
				Shown = false
				local Current1 = Shown and p1.current
				
				if Current1 == Current then return end
				Current = Current1
				
				if Current1 then
					NewVideoPlaybackCoordinator:requestPlayback("AvatarMomentScene", false, 0)
					
					return
				else
					NewVideoPlaybackCoordinator:cancelPlayback("AvatarMomentScene", "AvatarMomentSceneStopped")
				end
			end,
			refresh = function()
				-- upvalues: Shown (ref), p1 (upval), Current (ref), NewVideoPlaybackCoordinator (copy)
				local Current1 = Shown and p1.current
				
				if Current1 == Current then return end
				Current = Current1
				
				if Current1 then
					NewVideoPlaybackCoordinator:requestPlayback("AvatarMomentScene", false, 0)
					
					return
				else
					NewVideoPlaybackCoordinator:cancelPlayback("AvatarMomentScene", "AvatarMomentSceneStopped")
				end
			end
		}
	end, { p1 })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult.untrackPage()
			UseMemoResult.setShown(false)
		end
	end, { UseMemoResult })
	
	return UseMemoResult
end