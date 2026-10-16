local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local ChatCardEmphasisContextModule = require(script.Parent.ChatCardEmphasisContext)
local ChatCardEmphasisPositionContextModule = require(script.Parent.ChatCardEmphasisPositionContext)

return function(p1, p2) --[[ Line: 13 | Named "useChatCardEmphasis" ]]
	-- upvalues: ReactModule (copy), ChatCardEmphasisContextModule (copy), ChatCardEmphasisPositionContextModule (copy), SignalsModule (copy), SignalsReactModule (copy)
	local UseContextResult = ReactModule.useContext(ChatCardEmphasisContextModule)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 15 ]]
		return {}
	end, {})
	local UseContextResult1 = ReactModule.useContext(ChatCardEmphasisPositionContextModule)
	ReactModule.useLayoutEffect(function() --[[ Line: 22 ]]
		-- upvalues: UseContextResult (copy), p1 (copy), UseMemoResult (copy), p2 (copy), UseContextResult1 (copy)
		if UseContextResult == nil or p1 == nil then
			return nil
		else
			UseContextResult.register(UseMemoResult, p1, p2 or 0, UseContextResult1)
			
			return function() --[[ Line: 27 ]]
				-- upvalues: UseContextResult (upval), UseMemoResult (upval)
				UseContextResult.unregister(UseMemoResult)
			end
		end
	end, {
		UseContextResult,
		UseMemoResult,
		p1,
		p2,
		UseContextResult1
	})
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 32 ]]
		-- upvalues: SignalsModule (upval), UseContextResult (copy), UseMemoResult (copy)
		return SignalsModule.createComputed(function(p3): boolean --[[ Line: 33 ]]
			-- upvalues: UseContextResult (upval), UseMemoResult (upval)
			return UseContextResult ~= nil and UseContextResult.getEmphasizedKey(p3) == UseMemoResult
		end)
	end, { UseContextResult, UseMemoResult })))
	
	return if UseContextResult == nil then nil else UseSignalStateResult
end