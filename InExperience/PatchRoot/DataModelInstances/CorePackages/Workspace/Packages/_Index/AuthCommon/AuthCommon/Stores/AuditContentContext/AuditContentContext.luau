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
local var1 = reactModule.createContext({
	capturedAuditContent = {},
	additionalAuditContent = {},
	setCapturedAuditContentItem = function() end,
	removeCapturedAuditContentItem = function() end,
	setAdditionalAuditContentItem = function() end,
	removeAdditionalAuditContentItem = function() end
})

return {
	Context = var1,
	Provider = function(p1)
		-- upvalues: useState (ref), useCallback (ref), cryoModule (ref), useMemo (ref), reactModule (ref), var1 (ref)
		local var2, var3 = useState({})
		local var4, var5 = useState({})
		local var6 = useCallback(function(p2, p3)
			-- upvalues: var3 (ref), cryoModule (copy)
			var3(function(p4)
				-- upvalues: cryoModule (copy), p2 (ref), p3 (ref)
				return cryoModule.Dictionary.join(p4, { [p2] = p3 })
			end)
		end, { var3 })
		local var7 = useCallback(function(p2)
			-- upvalues: var3 (ref), cryoModule (copy)
			var3(function(p3)
				-- upvalues: cryoModule (copy), p2 (ref)
				return cryoModule.Dictionary.join(p3, { [p2] = cryoModule.None })
			end)
		end, { var3 })
		local var8 = useCallback(function(p2, p3)
			-- upvalues: var5 (ref), cryoModule (copy)
			var5(function(p4)
				-- upvalues: cryoModule (copy), p2 (ref), p3 (ref)
				return cryoModule.Dictionary.join(p4, { [p2] = p3 })
			end)
		end, { var5 })
		local var9 = useCallback(function(p2)
			-- upvalues: var5 (ref), cryoModule (copy)
			var5(function(p3)
				-- upvalues: cryoModule (copy), p2 (ref)
				return cryoModule.Dictionary.join(p3, { [p2] = cryoModule.None })
			end)
		end, { var5 })
		
		return reactModule.createElement(var1.Provider, {
			value = useMemo(function()
				-- upvalues: var2 (ref), var4 (ref), var6 (ref), var7 (ref), var8 (ref), var9 (ref)
				return {
					capturedAuditContent = var2,
					additionalAuditContent = var4,
					setCapturedAuditContentItem = var6,
					removeCapturedAuditContentItem = var7,
					setAdditionalAuditContentItem = var8,
					removeAdditionalAuditContentItem = var9
				}
			end, { var2, var4 })
		}, p1.children)
	end,
	useCapturedAuditContent = function(p1, p2)
		-- upvalues: useContext (ref), var1 (ref), useEffect (ref), getFFlagEnableAuditSystemModule (ref)
		local var2 = useContext(var1)
		useEffect(function()
			-- upvalues: getFFlagEnableAuditSystemModule (copy), p1 (ref), p2 (ref), var2 (ref)
			if not getFFlagEnableAuditSystemModule() then return end
			if p1 and p2 then
				var2.setCapturedAuditContentItem(p1, p2)
				
				return
			end
		end, { p1, p2 })
		useEffect(function()
			-- upvalues: getFFlagEnableAuditSystemModule (copy), p1 (ref), var2 (ref)
			return function()
				-- upvalues: getFFlagEnableAuditSystemModule (copy), p1 (copy), var2 (copy)
				if not getFFlagEnableAuditSystemModule() then return end
				if p1 then
					var2.removeCapturedAuditContentItem(p1)
				end
			end
		end, { p1 })
	end,
	useAdditionalAuditContent = function(p1, p2)
		-- upvalues: useContext (ref), var1 (ref), useEffect (ref), getFFlagEnableAuditSystemModule (ref)
		local var2 = useContext(var1)
		useEffect(function()
			-- upvalues: getFFlagEnableAuditSystemModule (copy), p1 (ref), p2 (ref), var2 (ref)
			if not getFFlagEnableAuditSystemModule() then return end
			if p1 and p2 then
				var2.setAdditionalAuditContentItem(p1, p2)
				
				return
			end
		end, { p1, p2 })
		useEffect(function()
			-- upvalues: getFFlagEnableAuditSystemModule (copy), p1 (ref), var2 (ref)
			return function()
				-- upvalues: getFFlagEnableAuditSystemModule (copy), p1 (copy), var2 (copy)
				if not getFFlagEnableAuditSystemModule() then return end
				if p1 then
					var2.removeAdditionalAuditContentItem(p1)
				end
			end
		end, { p1 })
	end,
	useAuditContentContext = function()
		-- upvalues: useContext (ref), var1 (ref)
		local var2 = useContext(var1)
		
		return {
			capturedAuditContent = var2.capturedAuditContent,
			additionalAuditContent = var2.additionalAuditContent,
			setCapturedAuditContentItem = var2.setCapturedAuditContentItem,
			removeCapturedAuditContentItem = var2.removeCapturedAuditContentItem,
			setAdditionalAuditContentItem = var2.setAdditionalAuditContentItem,
			removeAdditionalAuditContentItem = var2.removeAdditionalAuditContentItem
		}
	end
}