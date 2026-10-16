local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local GetFFlagEnableAuditSystemModule = require(AuthCommon.Flags.GetFFlagEnableAuditSystem)
local UseStateFunction = ReactModule.useState
local UseMemoFunction = ReactModule.useMemo
local UseContextFunction = ReactModule.useContext
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local Context = ReactModule.createContext({
	capturedAuditContent = {},
	additionalAuditContent = {},
	setCapturedAuditContentItem = function() --[[ Line: 49 ]] end,
	removeCapturedAuditContentItem = function() --[[ Line: 50 ]] end,
	setAdditionalAuditContentItem = function() --[[ Line: 51 ]] end,
	removeAdditionalAuditContentItem = function() --[[ Line: 52 ]] end
})

return {
	Context = Context,
	Provider = function(p1) --[[ Line: 58 ]]
		-- upvalues: UseStateFunction (copy), UseCallbackFunction (copy), CryoModule (copy), UseMemoFunction (copy), ReactModule (copy), Context (copy)
		local UseStateResult, UseStateResult2 = UseStateFunction({})
		local UseStateResult1, UseStateResult2_1 = UseStateFunction({})
		local UseCallbackResult = UseCallbackFunction(function(p2, p3) --[[ Line: 62 ]]
			-- upvalues: UseStateResult2 (copy), CryoModule (upval)
			UseStateResult2(function(p4) --[[ Line: 63 ]]
				-- upvalues: CryoModule (upval), p2 (copy), p3 (copy)
				return (CryoModule.Dictionary.join(p4, { [p2] = p3 }))
			end)
		end, { UseStateResult2 })
		local UseCallbackResult1 = UseCallbackFunction(function(p2) --[[ Line: 71 ]]
			-- upvalues: UseStateResult2 (copy), CryoModule (upval)
			UseStateResult2(function(p3) --[[ Line: 72 ]]
				-- upvalues: CryoModule (upval), p2 (copy)
				return (CryoModule.Dictionary.join(p3, { [p2] = CryoModule.None }))
			end)
		end, { UseStateResult2 })
		local UseCallbackResult2 = UseCallbackFunction(function(p2, p3) --[[ Line: 80 ]]
			-- upvalues: UseStateResult2_1 (copy), CryoModule (upval)
			UseStateResult2_1(function(p4) --[[ Line: 81 ]]
				-- upvalues: CryoModule (upval), p2 (copy), p3 (copy)
				return CryoModule.Dictionary.join(p4, { [p2] = p3 })
			end)
		end, { UseStateResult2_1 })
		local UseCallbackResult3 = UseCallbackFunction(function(p2) --[[ Line: 88 ]]
			-- upvalues: UseStateResult2_1 (copy), CryoModule (upval)
			UseStateResult2_1(function(p3) --[[ Line: 89 ]]
				-- upvalues: CryoModule (upval), p2 (copy)
				return CryoModule.Dictionary.join(p3, { [p2] = CryoModule.None })
			end)
		end, { UseStateResult2_1 })
		
		return ReactModule.createElement(Context.Provider, {
			value = UseMemoFunction(function() --[[ Line: 96 ]]
				-- upvalues: UseStateResult (copy), UseStateResult1 (copy), UseCallbackResult (copy), UseCallbackResult1 (copy), UseCallbackResult2 (copy), UseCallbackResult3 (copy)
				return {
					capturedAuditContent = UseStateResult,
					additionalAuditContent = UseStateResult1,
					setCapturedAuditContentItem = UseCallbackResult,
					removeCapturedAuditContentItem = UseCallbackResult1,
					setAdditionalAuditContentItem = UseCallbackResult2,
					removeAdditionalAuditContentItem = UseCallbackResult3
				}
			end, { UseStateResult, UseStateResult1 })
		}, p1.children)
	end,
	useCapturedAuditContent = function(p1, p2) --[[ Line: 119 ]]
		-- upvalues: UseContextFunction (copy), Context (copy), UseEffectFunction (copy), GetFFlagEnableAuditSystemModule (copy)
		local UseContextResult = UseContextFunction(Context)
		UseEffectFunction(function() --[[ Line: 123 ]]
			-- upvalues: GetFFlagEnableAuditSystemModule (upval), p1 (copy), p2 (copy), UseContextResult (copy)
			if not GetFFlagEnableAuditSystemModule() then return end
			if p1 and p2 then
				UseContextResult.setCapturedAuditContentItem(p1, p2)
				
				return
			end
		end, { p1, p2 })
		UseEffectFunction(function() --[[ Line: 136 ]]
			-- upvalues: GetFFlagEnableAuditSystemModule (upval), p1 (copy), UseContextResult (copy)
			return function() --[[ Line: 137 ]]
				-- upvalues: GetFFlagEnableAuditSystemModule (upval), p1 (upval), UseContextResult (upval)
				if not GetFFlagEnableAuditSystemModule() then return end
				if p1 then
					UseContextResult.removeCapturedAuditContentItem(p1)
				end
			end
		end, { p1 })
	end,
	useAdditionalAuditContent = function(p1, p2) --[[ Line: 156 ]]
		-- upvalues: UseContextFunction (copy), Context (copy), UseEffectFunction (copy), GetFFlagEnableAuditSystemModule (copy)
		local UseContextResult = UseContextFunction(Context)
		UseEffectFunction(function() --[[ Line: 160 ]]
			-- upvalues: GetFFlagEnableAuditSystemModule (upval), p1 (copy), p2 (copy), UseContextResult (copy)
			if not GetFFlagEnableAuditSystemModule() then return end
			if p1 and p2 then
				UseContextResult.setAdditionalAuditContentItem(p1, p2)
				
				return
			end
		end, { p1, p2 })
		UseEffectFunction(function() --[[ Line: 173 ]]
			-- upvalues: GetFFlagEnableAuditSystemModule (upval), p1 (copy), UseContextResult (copy)
			return function() --[[ Line: 174 ]]
				-- upvalues: GetFFlagEnableAuditSystemModule (upval), p1 (upval), UseContextResult (upval)
				if not GetFFlagEnableAuditSystemModule() then return end
				if p1 then
					UseContextResult.removeAdditionalAuditContentItem(p1)
				end
			end
		end, { p1 })
	end,
	useAuditContentContext = function() --[[ Line: 189 ]]
		-- upvalues: UseContextFunction (copy), Context (copy)
		local UseContextResult = UseContextFunction(Context)
		
		return {
			capturedAuditContent = UseContextResult.capturedAuditContent,
			additionalAuditContent = UseContextResult.additionalAuditContent,
			setCapturedAuditContentItem = UseContextResult.setCapturedAuditContentItem,
			removeCapturedAuditContentItem = UseContextResult.removeCapturedAuditContentItem,
			setAdditionalAuditContentItem = UseContextResult.setAdditionalAuditContentItem,
			removeAdditionalAuditContentItem = UseContextResult.removeAdditionalAuditContentItem
		}
	end
}