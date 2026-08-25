local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local getFFlagEnableAuditSystemModule = require(authCommon.Flags.GetFFlagEnableAuditSystem)
local useState = reactModule.useState
local useMemo = reactModule.useMemo
local useContext = reactModule.useContext
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local var4 = reactModule.createContext({
	capturedAuditContent = {},
	additionalAuditContent = {},
	setCapturedAuditContentItem = function() end,
	removeCapturedAuditContentItem = function() end,
	setAdditionalAuditContentItem = function() end,
	removeAdditionalAuditContentItem = function() end
})

return {
	Context = var4,
	Provider = function(p0)
		-- upvalues: useState (ref), useCallback (ref), cryoModule (ref), useMemo (ref), reactModule (ref), var4 (ref)
		local var5, var6 = useState({})
		local var7, var8 = useState({})
		local var9 = useCallback(function(p1, p2)
			-- upvalues: var6 (ref), cryoModule (copy)
			var6(function(p3)
				-- upvalues: cryoModule (copy), p1 (ref), p2 (ref)
				return cryoModule.Dictionary.join(p3, { [p1] = p2 })
			end)
		end, { var6 })
		local var10 = useCallback(function(p4)
			-- upvalues: var6 (ref), cryoModule (copy)
			var6(function(p5)
				-- upvalues: cryoModule (copy), p4 (ref)
				return cryoModule.Dictionary.join(p5, { [p4] = cryoModule.None })
			end)
		end, { var6 })
		local var11 = useCallback(function(p6, p7)
			-- upvalues: var8 (ref), cryoModule (copy)
			var8(function(p8)
				-- upvalues: cryoModule (copy), p6 (ref), p7 (ref)
				return cryoModule.Dictionary.join(p8, { [p6] = p7 })
			end)
		end, { var8 })
		local var12 = useCallback(function(p9)
			-- upvalues: var8 (ref), cryoModule (copy)
			var8(function(p10)
				-- upvalues: cryoModule (copy), p9 (ref)
				return cryoModule.Dictionary.join(p10, { [p9] = cryoModule.None })
			end)
		end, { var8 })
		
		return reactModule.createElement(var4.Provider, {
			value = useMemo(function()
				-- upvalues: var5 (ref), var7 (ref), var9 (ref), var10 (ref), var11 (ref), var12 (ref)
				return {
					capturedAuditContent = var5,
					additionalAuditContent = var7,
					setCapturedAuditContentItem = var9,
					removeCapturedAuditContentItem = var10,
					setAdditionalAuditContentItem = var11,
					removeAdditionalAuditContentItem = var12
				}
			end, { var5, var7 })
		}, p0.children)
	end,
	useCapturedAuditContent = function(p11, p12)
		-- upvalues: useContext (ref), var4 (ref), useEffect (ref), getFFlagEnableAuditSystemModule (ref)
		local var13 = useContext(var4)
		useEffect(function()
			-- upvalues: getFFlagEnableAuditSystemModule (copy), p11 (ref), p12 (ref), var13 (ref)
			if not getFFlagEnableAuditSystemModule() then return end
			if p11 and p12 then
				var13.setCapturedAuditContentItem(p11, p12)
				
				return
			end
		end, { p11, p12 })
		useEffect(function()
			-- upvalues: getFFlagEnableAuditSystemModule (copy), p11 (ref), var13 (ref)
			return function()
				-- upvalues: getFFlagEnableAuditSystemModule (copy), p11 (copy), var13 (copy)
				if not getFFlagEnableAuditSystemModule() then return end
				if p11 then
					var13.removeCapturedAuditContentItem(p11)
				end
			end
		end, { p11 })
	end,
	useAdditionalAuditContent = function(p13, p14)
		-- upvalues: useContext (ref), var4 (ref), useEffect (ref), getFFlagEnableAuditSystemModule (ref)
		local var14 = useContext(var4)
		useEffect(function()
			-- upvalues: getFFlagEnableAuditSystemModule (copy), p13 (ref), p14 (ref), var14 (ref)
			if not getFFlagEnableAuditSystemModule() then return end
			if p13 and p14 then
				var14.setAdditionalAuditContentItem(p13, p14)
				
				return
			end
		end, { p13, p14 })
		useEffect(function()
			-- upvalues: getFFlagEnableAuditSystemModule (copy), p13 (ref), var14 (ref)
			return function()
				-- upvalues: getFFlagEnableAuditSystemModule (copy), p13 (copy), var14 (copy)
				if not getFFlagEnableAuditSystemModule() then return end
				if p13 then
					var14.removeAdditionalAuditContentItem(p13)
				end
			end
		end, { p13 })
	end,
	useAuditContentContext = function()
		-- upvalues: useContext (ref), var4 (ref)
		local var15 = useContext(var4)
		
		return {
			capturedAuditContent = var15.capturedAuditContent,
			additionalAuditContent = var15.additionalAuditContent,
			setCapturedAuditContentItem = var15.setCapturedAuditContentItem,
			removeCapturedAuditContentItem = var15.removeCapturedAuditContentItem,
			setAdditionalAuditContentItem = var15.setAdditionalAuditContentItem,
			removeAdditionalAuditContentItem = var15.removeAdditionalAuditContentItem
		}
	end
}