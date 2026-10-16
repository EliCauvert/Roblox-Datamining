local RunService = game:GetService("RunService")
local MediaGallery = script:FindFirstAncestor("MediaGallery")
local Parent = MediaGallery.Parent
local ReactModule = require(Parent.React)
local GetIsInstanceVisibleFunction = require(Parent.VideoUtils).getIsInstanceVisible
local MediaGalleryConstantsModule = require(MediaGallery.MediaGalleryConstants)
local VIDEOVISIBLEPERCENT = MediaGalleryConstantsModule.VIDEO_VISIBLE_PERCENT
local VISIBILITYSCANDEBOUNCESEC = MediaGalleryConstantsModule.VISIBILITY_SCAN_DEBOUNCE_SEC

return function(p1, p2, Callback1, Callback) --[[ Line: 24 | Named "useGuiObjectVisibility" ]]
	-- upvalues: ReactModule (copy), GetIsInstanceVisibleFunction (copy), VIDEOVISIBLEPERCENT (copy), RunService (copy), VISIBILITYSCANDEBOUNCESEC (copy)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 32 ]]
		-- upvalues: p2 (copy), p1 (copy), GetIsInstanceVisibleFunction (upval), VIDEOVISIBLEPERCENT (upval), UseRefResult (copy), Callback (copy), RunService (upval), Callback1 (copy), VISIBILITYSCANDEBOUNCESEC (upval)
		if not p2 or not p1.current then
			return nil
		end
		local Current = p1.current
		local Connections = {}
		local DelayedThread = nil
		local CurrentTime = 0
		
		local function _() --[[ Line: 43 | Named "getViewportBounds" ]]
			local CurrentCamera = workspace.CurrentCamera
			
			return if CurrentCamera then {
				min = Vector2.new(0, 0),
				max = CurrentCamera.ViewportSize
			} else nil
		end
		
		local _ = function() --[[ Line: 51 | Named "isVisible" ]]
			-- upvalues: GetIsInstanceVisibleFunction (upval), Current (copy), VIDEOVISIBLEPERCENT (upval)
			local CurrentCamera = workspace.CurrentCamera
			local Config = if CurrentCamera then {
				min = Vector2.new(0, 0),
				max = CurrentCamera.ViewportSize
			} else nil
			
			return if Config then GetIsInstanceVisibleFunction(Current, Config, VIDEOVISIBLEPERCENT) else false
		end
		
		local v1 = nil
		local Callback2 = nil
		
		local _ = function() --[[ Line: 62 | Named "disconnectRenderStep" ]]
			-- upvalues: UseRefResult (upval), Callback (upval)
			if UseRefResult.current then
				UseRefResult.current:Disconnect()
				UseRefResult.current = nil
				
				if Callback then
					Callback()
				end
			end
		end
		
		local function disconnectLayoutSignals() --[[ Line: 72 ]]
			-- upvalues: Connections (ref), DelayedThread (ref)
			for _, connection in Connections do
				connection:Disconnect()
			end
			Connections = {}
			
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
		end
		
		v1 = function() --[[ Line: 83 ]]
			-- upvalues: UseRefResult (upval), disconnectLayoutSignals (copy), RunService (upval), GetIsInstanceVisibleFunction (upval), Current (copy), VIDEOVISIBLEPERCENT (upval), Callback1 (upval), Callback (upval), Callback2 (ref)
			if not UseRefResult.current then
				disconnectLayoutSignals()
				UseRefResult.current = RunService.RenderStepped:Connect(function(DeltaTime) --[[ Line: 90 ]]
					-- upvalues: GetIsInstanceVisibleFunction (upval), Current (upval), VIDEOVISIBLEPERCENT (upval), Callback1 (upval), UseRefResult (upval), Callback (upval), Callback2 (upval)
					local CurrentCamera = workspace.CurrentCamera
					local Config = if CurrentCamera then {
						min = Vector2.new(0, 0),
						max = CurrentCamera.ViewportSize
					} else nil
					
					if not (if Config then GetIsInstanceVisibleFunction(Current, Config, VIDEOVISIBLEPERCENT) else false) then
						if UseRefResult.current then
							UseRefResult.current:Disconnect()
							UseRefResult.current = nil
							
							if Callback then
								Callback()
							end
						end
						Callback2()
					elseif Callback1 then
						Callback1(DeltaTime)
						
						return
					end
				end)
				
				return
			end
		end
		
		Callback2 = function() --[[ Line: 102 ]]
			-- upvalues: Connections (ref), DelayedThread (ref), CurrentTime (ref), VISIBILITYSCANDEBOUNCESEC (upval), GetIsInstanceVisibleFunction (upval), Current (copy), VIDEOVISIBLEPERCENT (upval), v1 (ref)
			if #Connections <= 0 then
				local function onLayoutChange() --[[ Line: 107 ]]
					-- upvalues: DelayedThread (upval), CurrentTime (upval), VISIBILITYSCANDEBOUNCESEC (upval), GetIsInstanceVisibleFunction (upval), Current (upval), VIDEOVISIBLEPERCENT (upval), v1 (upval)
					if DelayedThread then return end
					local Largest = math.max(0, CurrentTime + VISIBILITYSCANDEBOUNCESEC - tick())
					
					if Largest > 0 then
						DelayedThread = task.delay(Largest, function() --[[ Line: 113 ]]
							-- upvalues: DelayedThread (upval), CurrentTime (upval), GetIsInstanceVisibleFunction (upval), Current (upval), VIDEOVISIBLEPERCENT (upval), v1 (upval)
							DelayedThread = nil
							CurrentTime = tick()
							local CurrentCamera = workspace.CurrentCamera
							local Config = if CurrentCamera then {
								min = Vector2.new(0, 0),
								max = CurrentCamera.ViewportSize
							} else nil
							
							if if Config then GetIsInstanceVisibleFunction(Current, Config, VIDEOVISIBLEPERCENT) else false then
								v1()
							end
						end)
						
						return
					end
					CurrentTime = tick()
					local CurrentCamera = workspace.CurrentCamera
					local Config = if CurrentCamera then {
						min = Vector2.new(0, 0),
						max = CurrentCamera.ViewportSize
					} else nil
					
					if if Config then GetIsInstanceVisibleFunction(Current, Config, VIDEOVISIBLEPERCENT) else false then
						v1()
					end
				end
				
				Connections = {
					Current:GetPropertyChangedSignal("AbsolutePosition"):Connect(onLayoutChange),
					Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(onLayoutChange)
				}
				
				return
			end
		end
		
		local CurrentCamera = workspace.CurrentCamera
		local Config = if CurrentCamera then {
			min = Vector2.new(0, 0),
			max = CurrentCamera.ViewportSize
		} else nil
		
		if if Config then GetIsInstanceVisibleFunction(Current, Config, VIDEOVISIBLEPERCENT) else false then
			v1()
		else
			Callback2()
		end
		return function() --[[ Line: 140 ]]
			-- upvalues: disconnectLayoutSignals (copy), UseRefResult (upval), Callback (upval)
			disconnectLayoutSignals()
			
			if UseRefResult.current then
				UseRefResult.current:Disconnect()
				UseRefResult.current = nil
				
				if Callback then
					Callback()
				end
			end
		end
	end, { p2, p1, Callback1, Callback })
end