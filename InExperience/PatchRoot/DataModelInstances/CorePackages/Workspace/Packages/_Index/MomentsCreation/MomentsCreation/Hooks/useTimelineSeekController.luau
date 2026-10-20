local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local GuiService = game:GetService("GuiService")
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseMemoFunction = ReactModule.useMemo
local UseRefFunction = ReactModule.useRef
local UseDeviceInsetsFunction = require(Parent.MomentsCommon).Hooks.useDeviceInsets
local ComputeSeekFractionModule = require(MomentsCreation.Utils.computeSeekFraction)
local FFlagMomentsTTSScrubberDragInOverlayModule = require(MomentsCreation.Flags.FFlagMomentsTTSScrubberDragInOverlay)
local FFlagMomentsScrubberSeekOnReleaseModule = require(MomentsCreation.Flags.FFlagMomentsScrubberSeekOnRelease)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local UIDragDetectorFixEventPositionEnabledEngineFeature = game:GetEngineFeature("UIDragDetectorFixEventPositionEnabled")

return function(p1, Callback, p2, p3)
	-- upvalues: UseRefFunction (copy), FFlagMomentsTTSScrubberDragInOverlayModule (copy), FFlagMomentsScrubberSeekOnReleaseModule (copy), UseMemoFunction (copy), SignalsModule (copy), UseDeviceInsetsFunction (copy), UseCallbackFunction (copy), ComputeSeekFractionModule (copy), UIDragDetectorFixEventPositionEnabledEngineFeature (copy), GuiService (copy), UseEffectFunction (copy)
	local UseRefResult = UseRefFunction(nil)
	local UseRefResult1 = UseRefFunction(nil)
	local UseRefResult2 = if FFlagMomentsTTSScrubberDragInOverlayModule then UseRefFunction(nil) else nil
	local UseRefResult3 = UseRefFunction(false)
	local UseRefResult4 = UseRefFunction(false)
	local v1 = nil
	local Get = nil
	local SetFunction = nil
	
	if FFlagMomentsScrubberSeekOnReleaseModule then
		v1 = UseRefFunction(nil)
		local UseMemoResult = UseMemoFunction(function()
			-- upvalues: SignalsModule (upval)
			local Signal, Signal2 = SignalsModule.createSignal(nil)
			
			return { get = Signal, set = Signal2 }
		end, {})
		Get = UseMemoResult.get
		SetFunction = UseMemoResult.set
	end
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseCallbackResult = UseCallbackFunction(function(p4)
		-- upvalues: UseRefResult (copy), ComputeSeekFractionModule (upval), p1 (copy), FFlagMomentsScrubberSeekOnReleaseModule (upval), SetFunction (ref), v1 (ref), Callback (copy)
		local Current = UseRefResult.current
		
		if not Current then return end
		local SeekFractionModule = ComputeSeekFractionModule(p4, Current.AbsolutePosition.X, Current.AbsoluteSize.X)
		local ScaledSeekFractionModule = SeekFractionModule * p1.getDuration(false)
		
		if FFlagMomentsScrubberSeekOnReleaseModule and SetFunction and v1 then
			SetFunction(SeekFractionModule)
			v1.current = ScaledSeekFractionModule
			
			return
		end
		p1.seek(ScaledSeekFractionModule)
		
		if Callback then
			Callback(ScaledSeekFractionModule)
		end
	end, { p1, Callback, SetFunction })
	local UseCallbackResult1 = UseCallbackFunction(function(Vector)
		-- upvalues: UIDragDetectorFixEventPositionEnabledEngineFeature (upval), GuiService (upval), UseDeviceInsetsResult (copy)
		return if UIDragDetectorFixEventPositionEnabledEngineFeature then Vector.X else Vector.X - (GuiService:GetGuiInset().X + UseDeviceInsetsResult.left)
	end, { UseDeviceInsetsResult })
	local UseCallbackResult2 = UseCallbackFunction(function()
		-- upvalues: p1 (copy), UseRefResult4 (copy)
		if p1.getIsPlaying(false) then
			UseRefResult4.current = true
			p1.toggle()
		end
	end, { p1 })
	local UseCallbackResult3 = UseCallbackFunction(function(p4)
		-- upvalues: UseRefResult3 (copy), p3 (copy), UseCallbackResult2 (copy), UseCallbackResult (copy), UseCallbackResult1 (copy)
		UseRefResult3.current = true
		
		if not p3 then
			UseCallbackResult2()
			UseCallbackResult(UseCallbackResult1(p4))
			
			return
		end
	end, {
		UseCallbackResult2,
		UseCallbackResult,
		UseCallbackResult1,
		p3
	})
	local UseCallbackResult4 = UseCallbackFunction(function(p4)
		-- upvalues: UseRefResult3 (copy), p3 (copy), UseCallbackResult2 (copy), UseCallbackResult (copy), UseCallbackResult1 (copy)
		if not UseRefResult3.current then return end
		if p3 then
			UseCallbackResult2()
		end
		UseCallbackResult(UseCallbackResult1(p4))
	end, {
		UseCallbackResult2,
		UseCallbackResult,
		UseCallbackResult1,
		p3
	})
	local UseCallbackResult5 = UseCallbackFunction(function()
		-- upvalues: UseRefResult3 (copy), FFlagMomentsScrubberSeekOnReleaseModule (upval), v1 (ref), SetFunction (ref), p1 (copy), Callback (copy), UseRefResult4 (copy)
		if not UseRefResult3.current then return end
		UseRefResult3.current = false
		
		if FFlagMomentsScrubberSeekOnReleaseModule and v1 and SetFunction then
			local Current = v1.current
			v1.current = nil
			
			if Current ~= nil then
				p1.seek(Current)
				
				if Callback then
					Callback(Current)
				end
			end
			SetFunction(nil)
		end
		if UseRefResult4.current and not p1.getIsPlaying(false) then
			p1.toggle()
		end
		UseRefResult4.current = false
	end, { p1, Callback, SetFunction })
	UseEffectFunction(function()
		-- upvalues: p2 (copy), UseRefResult1 (copy), UseCallbackResult3 (copy), UseCallbackResult4 (copy), UseCallbackResult5 (copy), FFlagMomentsTTSScrubberDragInOverlayModule (upval), UseRefResult2 (ref)
		if not p2 then return end
		local Current = UseRefResult1.current
		
		if Current == nil then return end
		local List = {
			Current.DragStart:Connect(UseCallbackResult3),
			Current.DragContinue:Connect(UseCallbackResult4),
			Current.DragEnd:Connect(UseCallbackResult5)
		}
		
		if FFlagMomentsTTSScrubberDragInOverlayModule and UseRefResult2 then
			local Current1 = UseRefResult2.current
			
			if Current1 ~= nil then
				table.insert(List, Current1.DragStart:Connect(UseCallbackResult3))
				table.insert(List, Current1.DragContinue:Connect(UseCallbackResult4))
				table.insert(List, Current1.DragEnd:Connect(UseCallbackResult5))
			end
		end
		return function()
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, {
		p2,
		UseCallbackResult3,
		UseCallbackResult4,
		UseCallbackResult5
	})
	
	return {
		containerRef = UseRefResult,
		dragDetectorRef = UseRefResult1,
		playheadDragDetectorRef = UseRefResult2,
		getDragFraction = Get
	}
end