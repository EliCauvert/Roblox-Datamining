local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")
local GetViewportBoundsModule = require(script.Parent.getViewportBounds)
local IsContentImageUriModule = require(script.Parent.isContentImageUri)
local IsImageLoadedModule = require(script.Parent.isImageLoaded)
local IsInstanceVisibleModule = require(script.Parent.isInstanceVisible)
local ImageLoadObserverVisualizerModule = require(script.Parent.ImageLoadObserverVisualizer)
local OBSERVEDIMAGETAG = require(script.Parent.Constants).OBSERVED_IMAGE_TAG
game:DefineFastInt("ImageLoadObserverPollIntervalMs", 100)

local function resolveImages(Object)
	local List = {}
	
	if Object:IsA("ImageLabel") or Object:IsA("ImageButton") then
		table.insert(List, Object)
	end
	for _, descendant in Object:GetDescendants() do
		if descendant:IsA("ImageLabel") or descendant:IsA("ImageButton") then
			table.insert(List, descendant)
		end
	end
	return List
end

return function(Ancestor, p1)
	-- upvalues: ImageLoadObserverVisualizerModule (copy), GetViewportBoundsModule (copy), CollectionService (copy), OBSERVEDIMAGETAG (copy), resolveImages (copy), IsContentImageUriModule (copy), IsImageLoadedModule (copy), IsInstanceVisibleModule (copy), RunService (copy)
	local NewClockTime = os.clock() + (p1.timeoutSeconds or 30)
	local ImageLoadObserverPollIntervalMsFastIntRatio = game:GetFastInt("ImageLoadObserverPollIntervalMs") / 1000
	local Flag = false
	local NewImageLoadObserverVisualizer = if ImageLoadObserverVisualizerModule.isEnabled() then ImageLoadObserverVisualizerModule.new() else nil
	local Connection = nil
	
	local function _()
		-- upvalues: Connection (ref)
		if Connection then
			Connection:Disconnect()
			Connection = nil
		end
	end
	
	local function poll()
		-- upvalues: Flag (ref), NewClockTime (copy), Connection (ref), NewImageLoadObserverVisualizer (copy), p1 (copy), GetViewportBoundsModule (upval), Ancestor (copy), CollectionService (upval), OBSERVEDIMAGETAG (upval), resolveImages (upval), IsContentImageUriModule (upval), IsImageLoadedModule (upval), IsInstanceVisibleModule (upval)
		if Flag then return end
		if NewClockTime <= os.clock() then
			Flag = true
			
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
			if NewImageLoadObserverVisualizer then
				NewImageLoadObserverVisualizer:destroy()
			end
			if p1.onTimeout then
				p1.onTimeout()
			end
			return
		else
			local ViewportBoundsModule, ViewportBoundsModule2 = GetViewportBoundsModule(Ancestor)
			
			for _, value in CollectionService:GetTagged(OBSERVEDIMAGETAG) do
				if value:IsDescendantOf(Ancestor) then
					for _, value1 in resolveImages(value) do
						if IsContentImageUriModule(value1.Image) and IsImageLoadedModule(value1) and IsInstanceVisibleModule(value1, ViewportBoundsModule, ViewportBoundsModule2) then
							Flag = true
							
							if NewImageLoadObserverVisualizer then
								NewImageLoadObserverVisualizer:flashAndDestroy(value1)
							end
							if Connection then
								Connection:Disconnect()
								Connection = nil
							end
							p1.onFirstReport()
							break
						end
					end
				end
			end
		end
	end
	
	local Total = 1e999
	Connection = RunService.Heartbeat:Connect(function(DeltaTime: number)
		-- upvalues: Total (ref), ImageLoadObserverPollIntervalMsFastIntRatio (copy), poll (copy)
		Total += DeltaTime
		
		if Total >= ImageLoadObserverPollIntervalMsFastIntRatio then
			Total = 0
			poll()
			
			return
		end
	end)
	
	return {
		destroy = function()
			-- upvalues: Flag (ref), Connection (ref), NewImageLoadObserverVisualizer (copy)
			if not Flag then
				Flag = true
				
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
			end
			if NewImageLoadObserverVisualizer then
				NewImageLoadObserverVisualizer:destroy()
			end
		end
	}
end