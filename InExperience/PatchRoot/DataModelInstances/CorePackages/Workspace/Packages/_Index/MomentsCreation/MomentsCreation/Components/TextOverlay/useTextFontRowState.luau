local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local useCallback = reactModule.useCallback
local useMemo = reactModule.useMemo
local useRef = reactModule.useRef
local useState = reactModule.useState
local useSignalState = signalsReactModule.useSignalState
local useTokens = foundationModule.Hooks.useTokens
local useFormFactor = momentsCommonModule.Hooks.useFormFactor
local formFactor = momentsCommonModule.Enums.FormFactor
local _ = require(momentsCreation.Types.CreationFlowTypes)
local _ = require(parent.MomentsTypes)

return function(value)
	-- upvalues: useTokens (ref), useFormFactor (ref), formFactor (ref), useMemo (ref), signalsModule (ref), useSignalState (ref), useCallback (ref), dashModule (ref), useRef (ref), useState (ref), reactOtterModule (ref)
	local var1 = useTokens()
	local var2 = useFormFactor() == formFactor.Wide
	local var3 = useSignalState(useMemo(function()
		-- upvalues: signalsModule (copy), value (ref)
		return signalsModule.createComputed(function(p1)
			-- upvalues: value (copy)
			local activeSession = value.getActiveSession(p1)
			local var4 = if activeSession ~= nil then nil else activeSession.getDraft(p1)
			local var5 = var4 and var4[1]
			
			return if var5 == nil then Enum.Font.BuilderSansMedium else var5.textOverlayStyle.font
		end)
	end, { value }))
	local var4 = useCallback(function(p1)
		-- upvalues: value (ref), dashModule (copy)
		local activeSession = value.getActiveSession(false)
		
		if activeSession == nil then return end
		local draft = activeSession.getDraft(false)
		local var5 = draft and draft[1]
		
		if var5 == nil then
			return
		end
		activeSession.update({
			dashModule.joinDeep(var5, { textOverlayStyle = { font = p1 } })
		})
	end, { value })
	local var5 = useRef(nil)
	local var6, var7 = useState(false)
	local var8, var9 = useState(false)
	local var10 = useCallback(function(p1)
		-- upvalues: var7 (ref), var9 (ref)
		if p1.AbsoluteWindowSize.X == 0 then
			return
		end
		var7(p1.CanvasPosition.X > 0)
		var9(p1.AbsoluteWindowSize.X + p1.CanvasPosition.X < p1.AbsoluteCanvasSize.X - 1)
	end, {})
	local var11 = reactOtterModule.useMotor(0, function(p1)
		-- upvalues: var5 (ref)
		local current = var5.current
		
		if current == nil then
			return
		end
		current.CanvasPosition = Vector2.new(p1, 0)
	end)
	local var12 = useCallback(function(p1)
		-- upvalues: var5 (ref), var11 (ref), reactOtterModule (copy), var1 (ref)
		local current = var5.current
		
		if current == nil then
			return
		end
		var11(reactOtterModule.ease(math.clamp(current.CanvasPosition.X + p1 * (current.AbsoluteWindowSize.X * 0.8), 0, math.max(current.AbsoluteCanvasSize.X - current.AbsoluteWindowSize.X, 0)), {
			duration = var1.Time.Time_200,
			easingStyle = Enum.EasingStyle.Quad,
			startingValue = current.CanvasPosition.X
		}))
	end, { var1, var11 })
	
	return {
		font = var3,
		onChipActivated = var4,
		scrollingFrameRef = var5,
		onScrollViewportChanged = var10,
		showLeftChevron = var2 and var6,
		showRightChevron = var2 and var8,
		onLeftChevronActivated = useCallback(function()
			-- upvalues: var12 (ref)
			var12(-1)
		end, { var12 }),
		onRightChevronActivated = useCallback(function()
			-- upvalues: var12 (ref)
			var12(1)
		end, { var12 })
	}
end