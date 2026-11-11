local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local ReactModule = require(CorePackages.Packages.React)
local GetIsInstanceVisibleFunction = require(CorePackages.Workspace.Packages.VideoUtils).getIsInstanceVisible
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local FFlagLuaAppEdpMediaGalleryRedesign = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesign
local FFlagLuaAppEdpMediaGalleryRedesignIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignIxp
local FFlagLuaAppEdpMediaGalleryVideoPreview = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local FFlagLuaAppEdpMediaGalleryVideoPreviewIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreviewIxp
local FFlagLuaAppEdpMediaGalleryFullScreen = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local FIntLuaAppEdpMediaGalleryItemVisiblePercent = require(CorePackages.Workspace.Packages.SharedFlags).FIntLuaAppEdpMediaGalleryItemVisiblePercent

return function(p1, p2, p3, p4, Callback1, Callback, p5, p6)
	-- upvalues: FFlagLuaAppEdpMediaGalleryRedesign (copy), FFlagLuaAppEdpMediaGalleryRedesignIxp (copy), FFlagLuaAppEdpMediaGalleryVideoPreview (copy), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy), UseSelectorFunction (copy), ReactModule (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), GetIsInstanceVisibleFunction (copy), FIntLuaAppEdpMediaGalleryItemVisiblePercent (copy), RunService (copy)
	local NoFFlagLuaAppEdpMediaGalleryRedesignIxp = if FFlagLuaAppEdpMediaGalleryRedesign then not FFlagLuaAppEdpMediaGalleryRedesignIxp or p5 else nil
	local NoFFlagLuaAppEdpMediaGalleryVideoPreviewIxp = if FFlagLuaAppEdpMediaGalleryVideoPreview then not FFlagLuaAppEdpMediaGalleryVideoPreviewIxp or p6 else nil
	local UseSelectorResult = UseSelectorFunction(function(p7)
		return p7.ScreenSize
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p7)
		return p7.TopBar.topBarHeight
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p7)
		return p7.GlobalGuiInset
	end)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult1 (copy), UseSelectorResult (copy), UseSelectorResult2 (copy)
		return {
			min = Vector2.new(0, UseSelectorResult1),
			max = Vector2.new(UseSelectorResult.X, UseSelectorResult.Y - UseSelectorResult2.bottom)
		}
	end, {
		UseSelectorResult,
		UseSelectorResult1,
		UseSelectorResult2
	})
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: NoFFlagLuaAppEdpMediaGalleryRedesignIxp (copy), FFlagLuaAppEdpMediaGalleryFullScreen (upval), p1 (copy), p2 (copy), FFlagLuaAppEdpMediaGalleryVideoPreview (upval), NoFFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy), p3 (copy), p4 (copy), GetIsInstanceVisibleFunction (upval), UseMemoResult (copy), FIntLuaAppEdpMediaGalleryItemVisiblePercent (upval), UseRefResult (copy), RunService (upval), Callback1 (copy), Callback (copy), UseRefResult1 (copy)
		if not NoFFlagLuaAppEdpMediaGalleryRedesignIxp or FFlagLuaAppEdpMediaGalleryFullScreen and (p1 or p2) or FFlagLuaAppEdpMediaGalleryVideoPreview and NoFFlagLuaAppEdpMediaGalleryVideoPreviewIxp and p3 then
			return nil
		end
		local Connections = {}
		
		if p4.current ~= nil then
			local Current = p4.current
			local CurrentTime = nil
			local v1 = nil
			
			local function connectRenderStepIfVisible()
				-- upvalues: CurrentTime (ref), GetIsInstanceVisibleFunction (upval), Current (copy), UseMemoResult (upval), FIntLuaAppEdpMediaGalleryItemVisiblePercent (upval), UseRefResult (upval), RunService (upval), Callback1 (upval), Callback (upval)
				CurrentTime = tick()
				
				if GetIsInstanceVisibleFunction(Current, UseMemoResult, FIntLuaAppEdpMediaGalleryItemVisiblePercent) then
					if not UseRefResult.current then
						UseRefResult.current = RunService.RenderStepped:Connect(Callback1)
						
						return
					end
				elseif UseRefResult.current then
					UseRefResult.current:Disconnect()
					UseRefResult.current = nil
					
					if Callback then
						Callback()
					end
				end
			end
			
			local function onScrollingFrameLayoutChange()
				-- upvalues: v1 (ref), CurrentTime (ref), connectRenderStepIfVisible (copy), UseRefResult1 (upval)
				if v1 ~= nil then return end
				local Delay = 0
				
				if CurrentTime ~= nil then
					v1 = CurrentTime + 0.5
					Delay = v1 - tick()
				end
				if Delay > 0 then
					UseRefResult1.current = task.delay(Delay, function()
						-- upvalues: v1 (upval), connectRenderStepIfVisible (upval)
						v1 = nil
						connectRenderStepIfVisible()
					end)
					
					return
				else
					v1 = nil
					connectRenderStepIfVisible()
				end
			end
			
			connectRenderStepIfVisible()
			Connections = {
				Current:GetPropertyChangedSignal("AbsolutePosition"):Connect(onScrollingFrameLayoutChange),
				Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(onScrollingFrameLayoutChange)
			}
		end
		return function()
			-- upvalues: Connections (ref), UseRefResult (upval), Callback (upval), UseRefResult1 (upval)
			for _, connection in Connections do
				connection:Disconnect()
			end
			if UseRefResult.current then
				UseRefResult.current:Disconnect()
				UseRefResult.current = nil
				
				if Callback then
					Callback()
				end
			end
			if UseRefResult1.current then
				task.cancel(UseRefResult1.current)
				UseRefResult1.current = nil
			end
		end
	end, {
		if FFlagLuaAppEdpMediaGalleryFullScreen then p1 else nil,
		if FFlagLuaAppEdpMediaGalleryFullScreen then p2 else nil,
		if FFlagLuaAppEdpMediaGalleryVideoPreview and NoFFlagLuaAppEdpMediaGalleryVideoPreviewIxp then p3 else nil,
		p4, Callback1, Callback,
		if FFlagLuaAppEdpMediaGalleryRedesign then NoFFlagLuaAppEdpMediaGalleryRedesignIxp else nil,
		if FFlagLuaAppEdpMediaGalleryVideoPreview then NoFFlagLuaAppEdpMediaGalleryVideoPreviewIxp else nil,
		UseMemoResult
	})
end