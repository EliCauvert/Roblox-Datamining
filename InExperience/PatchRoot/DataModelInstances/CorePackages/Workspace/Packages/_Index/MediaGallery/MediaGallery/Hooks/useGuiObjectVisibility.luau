local runService = game:GetService("RunService")
local mediaGallery = script:FindFirstAncestor("MediaGallery")
local parent = mediaGallery.Parent
local reactModule = require(parent.React)
local getIsInstanceVisible = require(parent.VideoUtils).getIsInstanceVisible
local mediaGalleryConstantsModule = require(mediaGallery.MediaGalleryConstants)
local VIDEO_VISIBLE_PERCENT = mediaGalleryConstantsModule.VIDEO_VISIBLE_PERCENT
local VISIBILITY_SCAN_DEBOUNCE_SEC = mediaGalleryConstantsModule.VISIBILITY_SCAN_DEBOUNCE_SEC

return function(p0, p1, p2, p3) --[[ line: 24 | named "useGuiObjectVisibility" ]]
	-- upvalues: reactModule (ref), getIsInstanceVisible (ref), VIDEO_VISIBLE_PERCENT (ref), runService (ref), VISIBILITY_SCAN_DEBOUNCE_SEC (ref)
	local var4 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 32 ]]
		-- upvalues: p1 (ref), p0 (ref), getIsInstanceVisible (copy), VIDEO_VISIBLE_PERCENT (copy), var4 (ref), p3 (ref), runService (copy), p2 (ref), VISIBILITY_SCAN_DEBOUNCE_SEC (copy)
		if not p1 or not p0.current then
			return nil
		end
		local current = p0.current
		local t = {}
		local var6 = nil
		local var7 = 0
		
		local function _() --[[ line: 43 | named "getViewportBounds" ]]
			local currentCamera = workspace.CurrentCamera
			
			return if currentCamera then {
				min = Vector2.new(0, 0),
				max = currentCamera.ViewportSize
			} else nil
		end
		
		local _ = function() --[[ line: 51 | named "isVisible" ]]
			-- upvalues: getIsInstanceVisible (copy), current (ref), VIDEO_VISIBLE_PERCENT (copy)
			local currentCamera = workspace.CurrentCamera
			local var12 = if not currentCamera then nil else {
				min = Vector2.new(0, 0),
				max = currentCamera.ViewportSize
			}
			
			return if var12 then getIsInstanceVisible(current, var12, VIDEO_VISIBLE_PERCENT) else false
		end
		
		local _ = nil
		local var8 = nil
		
		local _ = function() --[[ line: 62 | named "disconnectRenderStep" ]]
			-- upvalues: var4 (copy), p3 (copy)
			if var4.current then
				var4.current:Disconnect()
				var4.current = nil
				
				if p3 then
					p3()
				end
			end
		end
		
		local function disconnectLayoutSignals() --[[ line: 72 ]]
			-- upvalues: t (write), var6 (write)
			for i, v in t do
				v:Disconnect()
			end
			t = {}
			
			if var6 then
				task.cancel(var6)
				var6 = nil
			end
		end
		
		local var10 = function() --[[ line: 83 ]]
			-- upvalues: var4 (copy), disconnectLayoutSignals (ref), runService (copy), getIsInstanceVisible (copy), current (ref), VIDEO_VISIBLE_PERCENT (copy), p2 (copy), p3 (copy), var8 (write)
			if var4.current then
				return
			end
			disconnectLayoutSignals()
			var4.current = runService.RenderStepped:Connect(function(p4) --[[ line: 90 ]]
				-- upvalues: getIsInstanceVisible (copy), current (copy), VIDEO_VISIBLE_PERCENT (copy), p2 (copy), var4 (copy), p3 (copy), var8 (copy)
				local currentCamera = workspace.CurrentCamera
				local var13 = if not currentCamera then nil else {
					min = Vector2.new(0, 0),
					max = currentCamera.ViewportSize
				}
				
				if if not var13 then false else getIsInstanceVisible(current, var13, VIDEO_VISIBLE_PERCENT) then
					if p2 then
						p2(p4)
						
						return
					end
				elseif var4.current then
					var4.current:Disconnect()
					var4.current = nil
					
					if p3 then
						p3()
					end
				end
				var8()
			end)
		end
		
		var8 = function() --[[ line: 102 ]]
			-- upvalues: t (write), var6 (write), var7 (write), VISIBILITY_SCAN_DEBOUNCE_SEC (copy), getIsInstanceVisible (copy), current (ref), VIDEO_VISIBLE_PERCENT (copy), var10 (write)
			if #t > 0 then
				return
			end
			local function onLayoutChange() --[[ line: 107 ]]
				-- upvalues: var6 (copy), var7 (copy), VISIBILITY_SCAN_DEBOUNCE_SEC (copy), getIsInstanceVisible (copy), current (copy), VIDEO_VISIBLE_PERCENT (copy), var10 (copy)
				if var6 then return end
				local maxValue = math.max(0, var7 + VISIBILITY_SCAN_DEBOUNCE_SEC - tick())
				
				if maxValue > 0 then
					var6 = task.delay(maxValue, function() --[[ line: 113 ]]
						-- upvalues: var6 (copy), var7 (copy), getIsInstanceVisible (copy), current (copy), VIDEO_VISIBLE_PERCENT (copy), var10 (copy)
						var6 = nil
						var7 = tick()
						local currentCamera = workspace.CurrentCamera
						local var17 = if not currentCamera then nil else {
							min = Vector2.new(0, 0),
							max = currentCamera.ViewportSize
						}
						
						if if not var17 then false else getIsInstanceVisible(current, var17, VIDEO_VISIBLE_PERCENT) then
							var10()
						end
					end)
					
					return
				end
				var7 = tick()
				local currentCamera = workspace.CurrentCamera
				local var16 = if not currentCamera then nil else {
					min = Vector2.new(0, 0),
					max = currentCamera.ViewportSize
				}
				
				if if not var16 then false else getIsInstanceVisible(current, var16, VIDEO_VISIBLE_PERCENT) then
					var10()
				end
			end
			
			t = {
				current:GetPropertyChangedSignal("AbsolutePosition"):Connect(onLayoutChange),
				current:GetPropertyChangedSignal("AbsoluteSize"):Connect(onLayoutChange)
			}
		end
		
		local currentCamera = workspace.CurrentCamera
		local var11 = if not currentCamera then nil else {
			min = Vector2.new(0, 0),
			max = currentCamera.ViewportSize
		}
		
		if if not var11 then false else getIsInstanceVisible(current, var11, VIDEO_VISIBLE_PERCENT) then
			var10()
		else
			var8()
		end
		return function() --[[ line: 140 ]]
			-- upvalues: disconnectLayoutSignals (ref), var4 (copy), p3 (copy)
			disconnectLayoutSignals()
			
			if var4.current then
				var4.current:Disconnect()
				var4.current = nil
				
				if p3 then
					p3()
				end
			end
		end
	end, { p1, p0, p2, p3 })
end