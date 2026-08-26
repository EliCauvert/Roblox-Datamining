local runService = game:GetService("RunService")
local mediaGallery = script:FindFirstAncestor("MediaGallery")
local parent = mediaGallery.Parent
local reactModule = require(parent.React)
local getIsInstanceVisible = require(parent.VideoUtils).getIsInstanceVisible
local mediaGalleryConstantsModule = require(mediaGallery.MediaGalleryConstants)
local VIDEO_VISIBLE_PERCENT = mediaGalleryConstantsModule.VIDEO_VISIBLE_PERCENT
local VISIBILITY_SCAN_DEBOUNCE_SEC = mediaGalleryConstantsModule.VISIBILITY_SCAN_DEBOUNCE_SEC

return function(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), getIsInstanceVisible (ref), VIDEO_VISIBLE_PERCENT (ref), runService (ref), VISIBILITY_SCAN_DEBOUNCE_SEC (ref)
	local var1 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), p1 (ref), getIsInstanceVisible (copy), VIDEO_VISIBLE_PERCENT (copy), var1 (ref), p4 (ref), runService (copy), p3 (ref), VISIBILITY_SCAN_DEBOUNCE_SEC (copy)
		if not p2 or not p1.current then
			return nil
		end
		local current = p1.current
		local t = {}
		local var2 = nil
		local var3 = 0
		
		local function _()
			local currentCamera = workspace.CurrentCamera
			
			return if currentCamera then {
				min = Vector2.new(0, 0),
				max = currentCamera.ViewportSize
			} else nil
		end
		
		local _ = function()
			-- upvalues: getIsInstanceVisible (copy), current (ref), VIDEO_VISIBLE_PERCENT (copy)
			local currentCamera = workspace.CurrentCamera
			local var4 = if not currentCamera then nil else {
				min = Vector2.new(0, 0),
				max = currentCamera.ViewportSize
			}
			
			return if var4 then getIsInstanceVisible(current, var4, VIDEO_VISIBLE_PERCENT) else false
		end
		
		local _ = nil
		local var4 = nil
		
		local _ = function()
			-- upvalues: var1 (copy), p4 (copy)
			if var1.current then
				var1.current:Disconnect()
				var1.current = nil
				
				if p4 then
					p4()
				end
			end
		end
		
		local function disconnectLayoutSignals()
			-- upvalues: t (write), var2 (write)
			for i, v in t do
				v:Disconnect()
			end
			t = {}
			
			if var2 then
				task.cancel(var2)
				var2 = nil
			end
		end
		
		local var5 = function()
			-- upvalues: var1 (copy), disconnectLayoutSignals (ref), runService (copy), getIsInstanceVisible (copy), current (ref), VIDEO_VISIBLE_PERCENT (copy), p3 (copy), p4 (copy), var4 (write)
			if var1.current then
				return
			end
			disconnectLayoutSignals()
			var1.current = runService.RenderStepped:Connect(function(p5)
				-- upvalues: getIsInstanceVisible (copy), current (copy), VIDEO_VISIBLE_PERCENT (copy), p3 (copy), var1 (copy), p4 (copy), var4 (copy)
				local currentCamera = workspace.CurrentCamera
				local var6 = if not currentCamera then nil else {
					min = Vector2.new(0, 0),
					max = currentCamera.ViewportSize
				}
				
				if if not var6 then false else getIsInstanceVisible(current, var6, VIDEO_VISIBLE_PERCENT) then
					if p3 then
						p3(p5)
						
						return
					end
				elseif var1.current then
					var1.current:Disconnect()
					var1.current = nil
					
					if p4 then
						p4()
					end
				end
				var4()
			end)
		end
		
		var4 = function()
			-- upvalues: t (write), var2 (write), var3 (write), VISIBILITY_SCAN_DEBOUNCE_SEC (copy), getIsInstanceVisible (copy), current (ref), VIDEO_VISIBLE_PERCENT (copy), var5 (write)
			if #t > 0 then
				return
			end
			local function onLayoutChange()
				-- upvalues: var2 (copy), var3 (copy), VISIBILITY_SCAN_DEBOUNCE_SEC (copy), getIsInstanceVisible (copy), current (copy), VIDEO_VISIBLE_PERCENT (copy), var5 (copy)
				if var2 then return end
				local maxValue = math.max(0, var3 + VISIBILITY_SCAN_DEBOUNCE_SEC - tick())
				
				if maxValue > 0 then
					var2 = task.delay(maxValue, function()
						-- upvalues: var2 (copy), var3 (copy), getIsInstanceVisible (copy), current (copy), VIDEO_VISIBLE_PERCENT (copy), var5 (copy)
						var2 = nil
						var3 = tick()
						local currentCamera = workspace.CurrentCamera
						local var6 = if not currentCamera then nil else {
							min = Vector2.new(0, 0),
							max = currentCamera.ViewportSize
						}
						
						if if not var6 then false else getIsInstanceVisible(current, var6, VIDEO_VISIBLE_PERCENT) then
							var5()
						end
					end)
					
					return
				end
				var3 = tick()
				local currentCamera = workspace.CurrentCamera
				local var6 = if not currentCamera then nil else {
					min = Vector2.new(0, 0),
					max = currentCamera.ViewportSize
				}
				
				if if not var6 then false else getIsInstanceVisible(current, var6, VIDEO_VISIBLE_PERCENT) then
					var5()
				end
			end
			
			t = {
				current:GetPropertyChangedSignal("AbsolutePosition"):Connect(onLayoutChange),
				current:GetPropertyChangedSignal("AbsoluteSize"):Connect(onLayoutChange)
			}
		end
		
		local currentCamera = workspace.CurrentCamera
		local var6 = if not currentCamera then nil else {
			min = Vector2.new(0, 0),
			max = currentCamera.ViewportSize
		}
		
		if if not var6 then false else getIsInstanceVisible(current, var6, VIDEO_VISIBLE_PERCENT) then
			var5()
		else
			var4()
		end
		return function()
			-- upvalues: disconnectLayoutSignals (ref), var1 (copy), p4 (copy)
			disconnectLayoutSignals()
			
			if var1.current then
				var1.current:Disconnect()
				var1.current = nil
				
				if p4 then
					p4()
				end
			end
		end
	end, { p2, p1, p3, p4 })
end