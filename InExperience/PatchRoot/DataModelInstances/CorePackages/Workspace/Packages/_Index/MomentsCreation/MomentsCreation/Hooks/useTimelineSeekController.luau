local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local guiService = game:GetService("GuiService")
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local computeSeekFractionModule = require(momentsCreation.Utils.computeSeekFraction)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local UIDragDetectorFixEventPositionEnabledEngineFeature = game:GetEngineFeature("UIDragDetectorFixEventPositionEnabled")

return function(value, p1, p2, p3)
	-- upvalues: useRef (ref), useDeviceInsets (ref), useCallback (ref), computeSeekFractionModule (ref), UIDragDetectorFixEventPositionEnabledEngineFeature (ref), guiService (ref), useEffect (ref)
	local var1 = useRef(nil)
	local var2 = useRef(nil)
	local var3 = useRef(false)
	local var4 = useRef(false)
	local var5 = useDeviceInsets()
	local var6 = useCallback(function(p4)
		-- upvalues: var1 (ref), computeSeekFractionModule (copy), value (ref), p1 (ref)
		local current = var1.current
		
		if not current then return end
		local var7 = computeSeekFractionModule(p4, current.AbsolutePosition.X, current.AbsoluteSize.X) * value.getDuration(false)
		value.seek(var7)
		
		if p1 then
			p1(var7)
		end
	end, { value, p1 })
	local var7 = useCallback(function(p4)
		-- upvalues: UIDragDetectorFixEventPositionEnabledEngineFeature (copy), guiService (copy), var5 (ref)
		return if UIDragDetectorFixEventPositionEnabledEngineFeature then p4.X else p4.X - (guiService:GetGuiInset().X + var5.left)
	end, { var5 })
	local var8 = useCallback(function()
		-- upvalues: value (ref), var4 (ref)
		if value.getIsPlaying(false) then
			var4.current = true
			value.toggle()
		end
	end, { value })
	local var9 = useCallback(function(p4)
		-- upvalues: var3 (ref), p3 (ref), var8 (ref), var6 (ref), var7 (ref)
		var3.current = true
		
		if p3 then
			return
		end
		var8()
		var6(var7(p4))
	end, { var8, var6, var7, p3 })
	local var10 = useCallback(function(p4)
		-- upvalues: var3 (ref), p3 (ref), var8 (ref), var6 (ref), var7 (ref)
		if not var3.current then return end
		if p3 then
			var8()
		end
		var6(var7(p4))
	end, { var8, var6, var7, p3 })
	local var11 = useCallback(function()
		-- upvalues: var3 (ref), var4 (ref), value (ref)
		if not var3.current then return end
		var3.current = false
		
		if var4.current and not value.getIsPlaying(false) then
			value.toggle()
		end
		var4.current = false
	end, { value })
	useEffect(function()
		-- upvalues: p2 (ref), var2 (ref), var9 (ref), var10 (ref), var11 (ref)
		if not p2 then return end
		local current = var2.current
		
		if current == nil then
			return
		end
		local list = {
			current.DragStart:Connect(var9),
			current.DragContinue:Connect(var10),
			current.DragEnd:Connect(var11)
		}
		
		return function()
			-- upvalues: list (ref)
			for i, v in list do
				v:Disconnect()
			end
		end
	end, { p2, var9, var10, var11 })
	
	return { containerRef = var1, dragDetectorRef = var2 }
end