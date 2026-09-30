local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local guiService = game:GetService("GuiService")
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useMemo = reactModule.useMemo
local useRef = reactModule.useRef
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local computeSeekFractionModule = require(momentsCreation.Utils.computeSeekFraction)
local fFlagMomentsTTSScrubberDragInOverlayModule = require(momentsCreation.Flags.FFlagMomentsTTSScrubberDragInOverlay)
local fFlagMomentsScrubberSeekOnReleaseModule = require(momentsCreation.Flags.FFlagMomentsScrubberSeekOnRelease)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local UIDragDetectorFixEventPositionEnabledEngineFeature = game:GetEngineFeature("UIDragDetectorFixEventPositionEnabled")

return function(value, p1, p2, p3)
	-- upvalues: useRef (ref), fFlagMomentsTTSScrubberDragInOverlayModule (ref), fFlagMomentsScrubberSeekOnReleaseModule (ref), useMemo (ref), signalsModule (ref), useDeviceInsets (ref), useCallback (ref), computeSeekFractionModule (ref), UIDragDetectorFixEventPositionEnabledEngineFeature (ref), guiService (ref), useEffect (ref)
	local var1 = useRef(nil)
	local var2 = useRef(nil)
	local var3 = if fFlagMomentsTTSScrubberDragInOverlayModule then useRef(nil) else nil
	local var4 = useRef(false)
	local var5 = useRef(false)
	local var6 = nil
	local get = nil
	local set = nil
	
	if fFlagMomentsScrubberSeekOnReleaseModule then
		var6 = useRef(nil)
		local var7 = useMemo(function()
			-- upvalues: signalsModule (copy)
			local var8, var9 = signalsModule.createSignal(nil)
			
			return { get = var8, set = var9 }
		end, {})
		get = var7.get
		set = var7.set
	end
	local var8 = useDeviceInsets()
	local var9 = useCallback(function(p4)
		-- upvalues: var1 (ref), computeSeekFractionModule (copy), value (ref), fFlagMomentsScrubberSeekOnReleaseModule (copy), set (write), var6 (write), p1 (ref)
		local current = var1.current
		
		if not current then return end
		local var10 = computeSeekFractionModule(p4, current.AbsolutePosition.X, current.AbsoluteSize.X)
		local var11 = var10 * value.getDuration(false)
		
		if fFlagMomentsScrubberSeekOnReleaseModule and set and var6 then
			set(var10)
			var6.current = var11
			
			return
		end
		value.seek(var11)
		
		if p1 then
			p1(var11)
		end
	end, { value, p1, set })
	local var10 = useCallback(function(p4)
		-- upvalues: UIDragDetectorFixEventPositionEnabledEngineFeature (copy), guiService (copy), var8 (ref)
		return if UIDragDetectorFixEventPositionEnabledEngineFeature then p4.X else p4.X - (guiService:GetGuiInset().X + var8.left)
	end, { var8 })
	local var11 = useCallback(function()
		-- upvalues: value (ref), var5 (ref)
		if value.getIsPlaying(false) then
			var5.current = true
			value.toggle()
		end
	end, { value })
	local var12 = useCallback(function(p4)
		-- upvalues: var4 (ref), p3 (ref), var11 (ref), var9 (ref), var10 (ref)
		var4.current = true
		
		if p3 then
			return
		end
		var11()
		var9(var10(p4))
	end, { var11, var9, var10, p3 })
	local var13 = useCallback(function(p4)
		-- upvalues: var4 (ref), p3 (ref), var11 (ref), var9 (ref), var10 (ref)
		if not var4.current then return end
		if p3 then
			var11()
		end
		var9(var10(p4))
	end, { var11, var9, var10, p3 })
	local var14 = useCallback(function()
		-- upvalues: var4 (ref), fFlagMomentsScrubberSeekOnReleaseModule (copy), var6 (write), set (write), value (ref), p1 (ref), var5 (ref)
		if not var4.current then return end
		var4.current = false
		
		if fFlagMomentsScrubberSeekOnReleaseModule and var6 and set then
			local current = var6.current
			var6.current = nil
			
			if current ~= nil then
				value.seek(current)
				
				if p1 then
					p1(current)
				end
			end
			set(nil)
		end
		if var5.current and not value.getIsPlaying(false) then
			value.toggle()
		end
		var5.current = false
	end, { value, p1, set })
	useEffect(function()
		-- upvalues: p2 (ref), var2 (ref), var12 (ref), var13 (ref), var14 (ref), fFlagMomentsTTSScrubberDragInOverlayModule (copy), var3 (write)
		if not p2 then return end
		local current = var2.current
		
		if current == nil then return end
		local list = {
			current.DragStart:Connect(var12),
			current.DragContinue:Connect(var13),
			current.DragEnd:Connect(var14)
		}
		
		if fFlagMomentsTTSScrubberDragInOverlayModule and var3 then
			local current_1 = var3.current
			
			if current_1 ~= nil then
				table.insert(list, current_1.DragStart:Connect(var12))
				table.insert(list, current_1.DragContinue:Connect(var13))
				table.insert(list, current_1.DragEnd:Connect(var14))
			end
		end
		return function()
			-- upvalues: list (ref)
			for i, v in list do
				v:Disconnect()
			end
		end
	end, { p2, var12, var13, var14 })
	
	return {
		containerRef = var1,
		dragDetectorRef = var2,
		playheadDragDetectorRef = var3,
		getDragFraction = get
	}
end